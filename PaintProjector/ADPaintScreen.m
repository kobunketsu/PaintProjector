//
//  ViewController.m
//  draw2D
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ADPaintScreen.h"
#import <Social/Social.h>
//#import <Dropbox/Dropbox.h>
#import "AppDelegate.h"
#import <DBChooser/DBChooser.h>
#import "ADSimpleIAPManager.h"
//File
#import "ADPaintFrameManager.h"
#import "ADPaintDoc.h"
#import "ADPaintData.h"
#import "ADPaintLayer.h"
#import "ADPaintLayerManager.h"
#import "ADLayerManagerView.h"
#import "ADLayerBlendModeTableViewController.h"
#import "ADLayerTableViewController.h"
#import "ADLayerBlendModePopoverController.h"
#import "ADLayerTableView.h"
#import <pthread.h>
#import "ADTransformContentView.h"
#import "ADTransformContentViewLayer.h"
#import "ADTransformAnchorView.h"
#import "ADPaintUIKitAnimation.h"
#import "ADPaintUIKitStyle.h"
#import "ADSimpleTutorialManager.h"
#import "ADBrushManager.h"
#import "ADHelpViewController.h"
#import "AppDelegate.h"


#define EditBrushSizeConfirmPixels 5
#define ChangeToolBarConfirmPixels 10
#define LayerToolButtonSize 40
#define PopoverOffset 20
#define PaintScreenIBActionAnimationDuration 0.3

//使用NSUserDefault来存储数据
//#define LayerMaxCount_Pro 8
//#define LayerMaxCount_Free 2

#pragma mark Paint Screen
@interface ADPaintScreen ()
//绘图工具
@property (assign, nonatomic) PaintScreenViewState state;
@property (retain, nonatomic) ADInAppPurchaseTableViewController* iapVC;
@property (assign, nonatomic) BOOL isInterfacePortraitUpsideDown;//用于调整横向时按钮label的方向
@property (assign, nonatomic) UIDeviceOrientation lastDeviceAppOrientation; //用于应用的设备旋转方向
@property (retain, nonatomic) ADLayerTableViewController *layerTableViewController;
@property (retain, nonatomic) ADHelpViewController *helpViewController;

@property (retain, nonatomic) NSDictionary *workspace;
@property (retain, nonatomic) ADEyeDropper *eyeDropper;
@property (retain, nonatomic) InfColorPickerController *infColorPickerController;
@property (weak, nonatomic) ADColorButton *colorPickerSrcButton;//记录打开取色器的源按钮
@property (retain, nonatomic) UIPopoverController *blendModePopoverController;  //图层混合弹出控制器

@property (assign, nonatomic) BOOL isPaintFullScreen;
@property (strong, nonatomic) ADSharedPopoverController *subPopoverController;
@property (retain, nonatomic) ADSharedPopoverController *sharedPopoverController;
@property (retain, nonatomic) NSMutableArray *colorButtons;//所有颜色槽
@property (weak, nonatomic) ADColorButton *colorSaveTargetButton;//吸颜色的目标槽位
@property (retain, nonatomic) ADClearGestureRecognizer *clearGestureRecognizer;
@property (assign, nonatomic) CGRect downToolBarFrame;//为移动工具栏记录原始位置
@property (assign, nonatomic) CGRect topToolBarFrame;//为移动工具栏记录原始位置
@property (assign, nonatomic) CGRect brushButtonTempRect;
@property (retain, nonatomic) UIView *transformContentView;//变换画布时显示的选择外框
@property (assign, nonatomic) CGPoint transformContentViewSrcCenter;//当前变换框的中心
@property (assign, nonatomic) CGFloat transformContentViewSrcRotate;//当前变换框的中心
@property (assign, nonatomic) CGRect transformContentViewSrcBounds;//当前变换框的大小
@property (weak, nonatomic) UIView *transformAnchorViewExclusive;//避免同时两个transformAnchorView一起工作
@property (retain, nonatomic) NSMutableArray *transformAnchorViews;
@property (assign, nonatomic) CGFloat transformAnchorViewSize;
@property (assign, nonatomic) CGPoint curTransformAnchorViewSrcCenter;//当前变换点的中心
@property (assign, nonatomic) CGFloat curTransformDirection;//当前变换点的移动方向
@property (retain, nonatomic) NSTimer *autoShowBrushTimer;
@property (retain, nonatomic) NSMutableArray *helpViews;
@end


@implementation ADPaintScreen

#pragma mark- 视图相关
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)prepareForPresentation{
    self.mainToolBar.hidden = true;
    self.paintToolBar.hidden = true;
}

- (void)afterPresentation{
    //同时更新UI
    [ADPaintUIKitAnimation view:self.view switchTopToolBarToView:self.mainToolBar completion:nil];
    [ADPaintUIKitAnimation view:self.view switchDownToolBarToView:self.paintToolBar completion:^{
        //如果有商店，只在商店结束后显示教程
        if (!self.iapVC) {
            [self tutorialStartCurrentStep];
            [self transitionToTutorial];
        }
    }];
}

- (void)unregisterDeviceRotation{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}
- (void)registerDeviceRotation{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    DebugLog(@"orientationChanged %d", device.orientation);

    for (ADAutoRotateButton* button in self.autoRotateButtons) {
        button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
        button.orientation = device.orientation;
    }

    if (self.layerTableViewController != NULL){
        for (ADAutoRotateButton* button in self.layerTableViewController.autoRotateButtons) {
            button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
            button.orientation = device.orientation;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLogSystem(@"viewWillAppear");
//    [self prepareForPresentation];

    //如果transition target viewController 是一个临时的vc, 为了保证流畅性, 则不创建任何资源
    if(self.swatchManagerVC != nil){
        return;
    }
    if(self.cameraImagePickerVC != nil){
        return;
    }

    //卸载不用的paintDoc占用内存
    [ADPaintFrameManager unloadPaintDocs];
    
    [self.paintView initGL];
    for (ADBrush *brush in self.brushTypeScrollView.brushTypes) {
        [brush initGL];
    }
    
    //指定当前笔刷
    self.paintView.brushTypes = self.brushTypeScrollView.brushTypes;
    NSInteger brushId = [[NSUserDefaults standardUserDefaults] integerForKey:@"UsingBrushId"];
    ADBrush *brush = self.brushTypeScrollView.brushTypes[brushId];
    ADBrush *brushCopy = [brush copy];
    [self.paintView setBrush:brushCopy];
    
    NSInteger backBrushId = [[NSUserDefaults standardUserDefaults] integerForKey:@"BackBrushId"];
    ADBrush *backBrush = self.brushTypeScrollView.brushTypes[backBrushId];
    self.brushBackButton.brush = [backBrush copy];
    
}
- (void)viewDidAppear:(BOOL)animated{
    DebugLogSystem(@"viewDidAppear");

    
}
-(void)viewWillDisappear:(BOOL)animated{
    DebugLogSystem(@"viewWillDisappear");

    //如果transition target viewController 是一个临时的vc, 为了保证流畅性, 则不删除当前任何资源
    if(self.swatchManagerVC != nil){
        return;
    }
    if(self.cameraImagePickerVC != nil){
        return;
    }
    
    [self.paintView tearDownGL];
    for (ADBrush *brush in self.brushTypeScrollView.brushTypes) {
        [brush tearDownGL];
    }
    
    [REGLWrapper destroy];
    
    [self.paintView destroy];
    
    [ADPaintFrameManager loadPaintDocs];
}
-(void)viewDidDisappear:(BOOL)animated{
    DebugLogSystem(@"viewDidDisappear");
}
-(void)viewDidLayoutSubviews{
    DebugLogSystem(@"viewDidLayoutSubviews");
}
-(void)viewWillLayoutSubviews{
    DebugLogSystem(@"viewWillLayoutSubviews");
}

- (void)viewDidLoad
{
    DebugLogSystem(@"viewDidLoad");
    [super viewDidLoad];
    
    //rootCanvasView
    //    UIImage *uiImage = [UIImage imageNamed:@"rootCanvasViewBackground.png"];
    //    self.rootCanvasView.backgroundColor = [UIColor colorWithPatternImage:uiImage];
    
    //Notification
    //通知程序退出到后台保存数据
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(applicationDidEnterBackground:)
     name:UIApplicationDidEnterBackgroundNotification
     object:nil];
    
    //通知程序返回激活状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(applicationWillEnterForeground:)
     name:UIApplicationWillEnterForegroundNotification
     object:nil];
    
    //通知程序退出激活状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationDidBecomeActive:)
     name:UIApplicationDidBecomeActiveNotification
     object:nil];
    

    //通知程序退出激活状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:nil];
    
    //通知程序即将关闭
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillTerminate:)
     name:UIApplicationWillTerminateNotification
     object:nil];

    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(IAPTransactionSucceeded:)
     name:kInAppPurchaseManagerTransactionSucceededNotification
     object:nil];
    
    //paintView 设置
    self.paintView.delegate = self;
    CGPathRef path = [UIBezierPath bezierPathWithRect:self.paintView.bounds].CGPath;
    [self.paintView.layer setShadowPath:path];
    self.paintView.layer.shadowOpacity = 0.5;
    self.paintView.layer.shadowRadius = 10;
    self.paintView.layer.shadowOffset = CGSizeMake(0, 5);
    self.paintView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    //undo redo
    [self willEnableUIRedo:false];
    [self willEnableUIUndo:false];
    
//    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
//    if (context == nil) {
//        context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
//        if(context == nil){
//            DebugLog(@"Failed to create ES context");
//        }
//    }
//    self.paintView.context = context;
//    self.paintView.context = [self.delegate createEAGleContextWithShareGroup];
//    [self.paintView.context setDebugLabel:@"PaintView Context"];

  
    [self.paintColorButton setColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    [self.opacitySlider setColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
   
    //工具栏
    //隐藏初始化未显示的ToolBar
    self.paintToolBar.center = CGPointMake(self.paintToolBar.center.x, self.view.bounds.size.height + self.paintToolBar.bounds.size.height * 0.5);
//    self.brushTypeBar.center = CGPointMake(self.brushTypeBar.center.x, self.view.bounds.size.height + self.brushTypeBar.bounds.size.height * 0.5);
    self.mainToolBar.center = CGPointMake( self.mainToolBar.center.x, - self.mainToolBar.bounds.size.height * 0.5);
    self.mainToolBar.delegate = self;
    

    //主要工具

    //初始化各种笔刷
    [ADBrushManager initialize];
    
    ADPencil *pencil = [[ADPencil alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADEraser *eraser = [[ADEraser alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADPen *pen = [[ADPen alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADMarker *marker = [[ADMarker alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADFinger *finger = [[ADFinger alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADChineseBrush *chineseBrush = [[ADChineseBrush alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADCrayons *crayons = [[ADCrayons alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADBucket *bucket = [[ADBucket alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    AdInkPen *inkPen = [[AdInkPen alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADMarkerSquare *markerSquare = [[ADMarkerSquare alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADOilBrush *oilBrush = [[ADOilBrush alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    ADAirBrush *airBrush = [[ADAirBrush alloc]initWithPaintView:self.paintView delegate:self.paintView];
    
    //将笔刷加入笔刷类型视图
    UIScrollView *scrollView = (UIScrollView *)self.brushTypeScrollView;
    scrollView.delegate = self;
    
    [self.brushTypeScrollView addBrushType:pencil];
    [self.brushTypeScrollView addBrushType:eraser];
    [self.brushTypeScrollView addBrushType:pen];
    [self.brushTypeScrollView addBrushType:inkPen];
    [self.brushTypeScrollView addBrushType:marker];
    [self.brushTypeScrollView addBrushType:bucket];
    
    [self.brushTypeScrollView addBrushType:crayons];
    [self.brushTypeScrollView addBrushType:finger];
    [self.brushTypeScrollView addBrushType:markerSquare];
    [self.brushTypeScrollView addBrushType:airBrush];
    [self.brushTypeScrollView addBrushType:chineseBrush];
    [self.brushTypeScrollView addBrushType:oilBrush];

    
    const NSInteger numOfBrushPerPage = 6;
    [self.brushTypeScrollView initSubviewsWithNumOfBrushPerPage:numOfBrushPerPage];
    self.brushTypeScrollView.brushTypePageControl = self.brushTypePageControl;
    self.brushTypePageControl.delegate = self;
    self.brushTypePageControl.numberOfPages = (NSInteger)ceilf((CGFloat)[self.brushTypeScrollView.brushTypes count] / numOfBrushPerPage);
    
    [self.brushButton addGestureRecognizer:self.lpgrBrushButton];
    self.brushBackButton.frame = CGRectMake(self.brushBackButton.frame.origin.x, 40, self.brushBackButton.frame.size.width, self.brushBackButton.frame.size.height);
    [self.brushBackButton setNeedsDisplay];

    //颜色槽
    self.colorSlotsScrollView.delegate = self;
    self.colorSlotsScrollView.isAccessibilityElement = true;
    self.colorSlotsScrollView.accessibilityLabel = @"Swatch";
    
    //加在工作环境
    [self loadWorkSpace];

    //初始化吸管
    self.eyeDropper = [[ADEyeDropper alloc]initWithView:self.paintView];
    self.paintView.eyeDropper =  self.eyeDropper;
    self.eyeDropperIndicatorView.hidden = true;

    _state = PaintScreen_Normal;

    //初始化取色器 InfColorPicker
	self.infColorPickerController = [ InfColorPickerController colorPickerViewController ];
    [self.infColorPickerController initAfterViewDidLoad];
    
    self.lpgrPaintView.delegate=self;
    
    [self.pgrRootCanvasView delaysTouchesBegan];
    [self.pgrRootCanvasView requireGestureRecognizerToFail:self.pgr1TouchesPaintView];


    //自定义手势
    self.clearGestureRecognizer = [[ADClearGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan3TouchesClearRootCanvasView:)];
    [self.rootCanvasView addGestureRecognizer:self.clearGestureRecognizer];
    [self.pgrRootCanvasView requireGestureRecognizerToFail:self.clearGestureRecognizer];
    
    //单击在双击失败之后判断
    [self.tapGR1Touches1TapsPaintView requireGestureRecognizerToFail:self.tapGR1Touches2TapsRootCanvasView];
    [self.tapGR1Touches1TapsPaintView requireGestureRecognizerToFail:self.tapGR3Touches1TapsRootCanvasView];
    
    //多线程,最好的方式是给_uploadDataQueque创建独立的context
    _uploadDataQueque = dispatch_queue_create("com.WenjieHu.ProjectPaint.uploadDataQueue", NULL);
    
    //教程
    [self tutorialSetup];
    
    //从viewController启动主程序测试
//    PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:@"test"];
//    [self openDoc:paintDoc];
    
}

- (void)viewDidUnload
{
    [self setPaintView:nil];
    [self setBtnAction:nil];
    [self setLpgrPaintView:nil];
    [self setBrushButton:nil];
    [self setPgrRootCanvasView:nil];
    [self setBrushTypeScrollView:nil];
    [self setLpgrBrushView:nil];
    [self setColorButtons:nil];
    [self setColorPickerView:nil];
    [self setPaintColorButton:nil];
    [self setBrushOpacityView:nil];
    [self setPaintColorView:nil];
    [self setPaintUISecCollection:nil];
    [self setPaintToolBar:nil];
    [self setPaintUIDefaultCollection:nil];
    [self setPaintUIDefaultCollection:nil];
    [self setBrushDetailView:nil];
    [self setRootView:nil];
    [self setColorPickerIndicatorMagnify:nil];
    [self setRadiusSlider:nil];
    [self setEyeDropperButton:nil];
    [self setLayerButton:nil];
    [self setColorSlotsScrollView:nil];
    [self setHelpButton:nil];
    [self setImportButton:nil];
    [self setExportButton:nil];
    [self setCloseButton:nil];
    [self setMainToolBar:nil];
    [self setAnchorView:nil];
    [self setTransformButton:nil];
    [self setOpacitySlider:nil];
    [self setRadiusIndicatorView:nil];
    [self setBrushBackButton:nil];
    [self setEyeDropperIndicatorView:nil];
    [self setClearButton:nil];
    [self setRedoButton:nil];
    [self setUndoButton:nil];
    [self setRootCanvasView:nil];
    [super viewDidUnload];

}

//dealloc调用导致内存增加的问题？
-(void)dealloc{
    DebugLogSystem(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:kInAppPurchaseManagerTransactionSucceededNotification object:nil];
    
    [ADBrushManager destroy];
    
}

-(void)didReceiveMemoryWarning{
    DebugLogSystem(@"didReceiveMemoryWarning");
}

- (void)applicationDidEnterBackground:(id)sender{
    DebugLogSystem(@"applicationDidEnterBackground");
    
    //TODO:删除一些OpenGL资源,让其他App可以使用OpenGLES资源,使用glFinish 保证直接删除
    [self.paintView applicationDidEnterBackground];
}

- (void)applicationWillEnterForeground:(NSNotification *)note{
    DebugLogSystem(@"applicationWillEnterForeground");
    
    [self.paintView applicationWillEnterForeground];
}

-(void)applicationDidBecomeActive:(id)sender{
    DebugLogSystem(@"applicationDidBecomeActive");
    if (self.iapVC) {
        return;
    }
    [self.paintView applicationDidBecomeActive];
}

-(void)applicationWillResignActive:(id)sender{
    DebugLogSystem(@"applicationWillResignActive");
    //TODO:很多种情况会发生applicationWillResignActive，并不是所有情况都需要autoSave
    if (self.iapVC) {
        return;
    }
    
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    [self prepareForAutoSave];
    
    [self autoSave];
    //TODO:清理干净所有OpenGLES command
    [self.paintView applicationWillResignActive];
}

-(void)applicationWillTerminate:(id)sender{
    DebugLogSystem(@"applicationWillTerminate");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

#pragma mark- 交互控制 UserInteraction
- (void)lockInteraction:(BOOL)lock{
    DebugLogFuncStart(@"lockInteraction %i", lock);
    self.rootView.userInteractionEnabled = !lock;
    self.mainToolBar.userInteractionEnabled = !lock;
    self.paintToolBar.userInteractionEnabled = !lock;
}

#pragma mark- 手势 Gestures 绘图
- (IBAction)handlePan1TouchesPaintView:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePan1TouchesPaintView" identifier:sender];
    
////    DebugLog(@"handlePan1TouchesPaintView");
//    if (_state != PaintScreen_Normal) {
//        return;
//    }
//    
//    switch (sender.state) {
//        case UIGestureRecognizerStateBegan:
//        {
//        }
//        case UIGestureRecognizerStateChanged:
//        {
//        }
//        case UIGestureRecognizerStateEnded:
//        {
//        }
//        case UIGestureRecognizerStateFailed:
//        case UIGestureRecognizerStateCancelled:
//        {
//            break;
//        }
//        default:
//            break;
//    }
}
- (IBAction)handleLongPressPaintView:(UILongPressGestureRecognizer *)sender{
    [RemoteLog logAction:@"PS_handlePan1TouchesPaintView" identifier:sender];
    
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    if (sender.numberOfTouches != 1) {
        return;
    }
    
    if(!IsQuickEyeDropper){
        return;
    }
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            DebugLog(@"EyeDrop Begin");
            if ([self.paintView enterState:PaintView_TouchEyeDrop]) {
                self.eyeDropperIndicatorView.srcColor = [self.paintView.brush.brushState.color copy];
                CGPoint point = [self willGetEyeDropLocation];
                [self.paintView eyeDropColor:point];
                
                [self willStartUIEyeDrop];
            }

            break;
        }
        case UIGestureRecognizerStateEnded: {
            DebugLog(@"EyeDrop End");
            //使用Delayed TouchEnd 来关闭EyeDropper
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed: {
            break;
        }
            
        default:
            break;
    }
}

- (IBAction)handleTap1Touches1TapsPaintView:(UITapGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleTap1Touches1TapsPaintView" identifier:sender];
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        if ([self.paintView enterState:PaintView_TouchPaint]) {
            if (self.paintView.paintTouch == NULL) {
                self.paintView.paintTouch = self.paintView.firstTouch;
            }
            CGPoint location = [sender locationInView:sender.view];
            location.y = self.paintView.bounds.size.height - location.y;
            [self.paintView startDraw:location isTapDraw:true];
            [self.paintView draw:true];
        }
    }
}

#pragma mark
- (IBAction)handlePan1TouchesRootCanvasView:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePan1TouchesRootCanvasView" identifier:sender];
    if (_state != PaintScreen_Transform) {
        return;
    }
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint p0 = [self.rootCanvasView convertPoint:self.transformContentView.center toView:self.paintView];

            [self transformImageStartWithPoint0:p0 point1:p0 forceImageCenterAnchor:false];
            
            self.transformContentViewSrcCenter = self.transformContentView.center;
            self.transformContentViewSrcBounds = self.transformContentView.bounds;
            
            [self showTransformAnchorViewExclusiveByIndex:-1];
            
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translate = [sender translationInView:self.rootCanvasView];
            self.transformContentView.center = CGPointMake(self.transformContentViewSrcCenter.x + translate.x, self.transformContentViewSrcCenter.y + translate.y);
            
            CGPoint p0 = [self.rootCanvasView convertPoint:self.transformContentView.center toView:self.paintView];
            
            [self transformImageWithPoint0:p0 point1:p0 enableTranslate:true enableRotate:false enableScale:true scaleMode:ScaleMode_None enableAnchor:false];
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {

            [self updateAllTransformAnchorViews];
            
            [self showAllTransformAnchorViews];
            
            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            break;
        }
        default:
            break;
    }
}

- (void)handlePan2TouchesRootCanvasViewInStateNormal:(UIPanGestureRecognizer *)sender{
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            switch (self.paintView.state) {
                case PaintView_TouchNone:{
                    [self handle2TouchesTransformCanvasBegan:sender];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            switch (self.paintView.state) {
                case PaintView_TouchTransformCanvas:{
                    //双指操作
                    [self handle2TouchesTransformCanvas:sender];
                    //单指中途提起
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            switch (self.paintView.state) {
                case PaintView_TouchTransformCanvas:{
                    //双手都放开，或者单手放开，都结束操作
                    [self handle2TouchesTransformCanvasEnded:sender];
                    break;
                }
                    //绘图模式下，只有参于绘图的Touch End才算绘图结束，在paintView touchEnd中判断
                default:
                    break;
            }
            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            break;
        }
        default:
            break;
    }
    
}

- (void)handlePan2TouchesRootCanvasViewInStateTransform:(UIPanGestureRecognizer *)sender{
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            //self.paintView.state already stated
//            if (sender.numberOfTouches == 1 &&
//                (_transformImageState == TransformImage_Move ||
//                 _transformImageState == TransformImage_Rotate ||
//                 _transformImageState == TransformImage_Scale ))
//            {
//                [self handle1TouchesPanImageStart:sender];
//            }
            if (sender.numberOfTouches == 2 &&
                     _transformImageState == TransformImage_Free)
            {
                [self handle2TouchesTransformImageStart:sender];
                
            }
            break;
        }
        case UIGestureRecognizerStateChanged:{
//            //单指模式
//            if (sender.numberOfTouches == 1 &&
//                (_transformImageState == TransformImage_Move ||
//                 _transformImageState == TransformImage_Rotate ||
//                 _transformImageState == TransformImage_Scale ))
//            {
//                [self handle1TouchesPanImage:sender];
//            }
//            //双指模式
            if (sender.numberOfTouches == 2 &&
                     _transformImageState == TransformImage_Free)
            {
                [self handle2TouchesTransformImage:sender];
            }
            
            break;
        }
        case UIGestureRecognizerStateEnded:{
            
            [self handle2TouchesTransformImageEnded:sender];
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:{
            break;
        }
        default:
            break;
            
    }
}

- (IBAction)handlePan2TouchesRootCanvasView:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePan2TouchesRootCanvasView" identifier:sender];
    if (_state == PaintScreen_Normal) {
        [self handlePan2TouchesRootCanvasViewInStateNormal:sender];
    }
    else if (_state == PaintScreen_Transform) {
        [self handlePan2TouchesRootCanvasViewInStateTransform:sender];
    }
}

- (IBAction)handlePan3TouchesRootCanvasView:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePan3TouchesRootCanvasView" identifier:sender];
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            switch (self.paintView.state) {
                case PaintView_TouchNone:{
                    [self handle3TouchesOperationBegan:sender];
                    break;
                }
                case PaintView_TouchQuickTool:{
                    [self handle3TouchesOperation:sender];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            switch (self.paintView.state) {
                case PaintView_TouchQuickTool:{
                    [self handle3TouchesOperationEnd:sender];
                    break;
                }
                default:
                    break;
            }
            break;
            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            break;
        }
        default:
            break;
    }
}

//pinch的功能在pan总完成
//- (void)handlePinchRootViewInStateTransform:(UIPinchGestureRecognizer *)sender {
//    if(sender.state == UIGestureRecognizerStateBegan){
//        //self.paintView.state already stated
//        if (sender.numberOfTouches == 2 &&
//            _transformImageState == TransformImage_Free)
//        {
//            [self handleTwoFingerTransformImageStart:sender];
//        }
//    }
//    else if(sender.state == UIGestureRecognizerStateChanged){
//        if (sender.numberOfTouches == 2 &&
//            _transformImageState == TransformImage_Free)
//        {
//            [self handleTwoFingerTransformImage:sender];
//        }
//    }
//    else if(sender.state == UIGestureRecognizerStateEnded){
//        //self.paintView.state = PaintView_TouchNone until transform done confirmed
//    }
//    else if(sender.state == UIGestureRecognizerStateCancelled){
//    }
//
//}
//
//- (void)handlePinchRootViewInStateNormal:(UIPinchGestureRecognizer *)sender {
//    if(sender.state == UIGestureRecognizerStateBegan){
//        self.paintView.state = PaintView_TouchTransformCanvas;
//        [self handleTwoFingerTransformCanvasBegan:sender];
//    }
//    else if (sender.state == UIGestureRecognizerStateEnded){
//        DebugLog(@"handlePinchPaintView ended");
//        //变换模式下
//        if (self.paintView.state == PaintView_TouchTransformCanvas) {
//            //双手都放开，或者单手放开，都结束操作
//            //                if (sender.numberOfTouches != 2) {
//            [self handleTwoFingerTransformCanvasEnd:sender];
//            //                }
//        }
//        //绘图模式下，只有参于绘图的Touch End才算绘图结束，在paintView touchEnd中判断
//        else if (self.paintView.state == PaintView_TouchPaint){
//        }
//    }
//    else if (sender.state == UIGestureRecognizerStateChanged){
//        DebugLog(@"handlePinchPaintView changed numberOfTouches: %d", sender.numberOfTouches);
//        if (sender.numberOfTouches == 1) {
//        }
//        else if (sender.numberOfTouches == 2) {
//            [self handleTwoFingerTransformCanvas:sender];
//        }
//        else if (sender.numberOfTouches == 3) {
//        }
//    }
//    else if (sender.state == UIGestureRecognizerStateCancelled){
//
//    }
//
//
//}
//
//- (IBAction)handlePinchRootView:(UIPinchGestureRecognizer *)sender {
//    //sender.numberOfTouches == 2;
//    //变换图片
//    if(_state == PaintScreen_Transform){
//        [self handlePinchRootViewInStateTransform:sender];
//    }
//    //绘画或者变换画布
//    else{
//        [self handlePinchRootViewInStateNormal:sender];
//    }
//}


- (IBAction)handlePan3TouchesClearRootCanvasView:(ADClearGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePan3TouchesClearRootCanvasView" identifier:sender];
    if (_state != PaintScreen_Normal) {
        return;
    }
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            DebugLog(@"handleClearCanvas Began");
            //显示蒙板
            self.clearEffectView.hidden = false;
            self.clearEffectView.backgroundColor = [self.paintView.paintData.backgroundLayer.clearColor copy];
            self.clearEffectView.alpha = 0;
            [UIView animateWithDuration:PaintScreenIBActionAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.clearEffectView.alpha = 0.75;
            } completion:nil];
            
            //工具栏
            self.clearButton.highlighted = true;
            [self.clearButton.layer setNeedsDisplay];
            
            break;
        }
        case UIGestureRecognizerStateRecognized:{
            DebugLog(@"handleClearCanvas Recognized");
            
            [UIView animateWithDuration:PaintScreenIBActionAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.clearEffectView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [self.paintView clearData];
                self.clearEffectView.hidden = true;
                
                //工具栏
                self.clearButton.highlighted = false;
                [self.clearButton.layer setNeedsDisplay];
            }];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            DebugLog(@"handleClearCanvas Failed");
            
            [UIView animateWithDuration:PaintScreenIBActionAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.clearEffectView.alpha = 0.0;
            } completion:^(BOOL finished) {
                self.clearEffectView.hidden = true;
                
                self.clearButton.highlighted = false;
                [self.clearButton.layer setNeedsDisplay];
            }];
            break;
        }
        default:
            break;
    }
    
}



- (IBAction)handleLongPress2TouchesRootCanvasView:(UILongPressGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleLongPress2TouchesRootCanvasView" identifier:sender];
    if (_state != PaintScreen_Normal) {
        return;
    }
    //    switch (sender.state) {
    //        case UIGestureRecognizerStateBegan: {
    //            DebugLog(@"Rotate Canvas Begin");
    //            [self handleTwoFingerTransformCanvasBegan:sender];
    //            break;
    //        }
    //        case UIGestureRecognizerStateEnded: {
    //            DebugLog(@"Rotate Canvas End");
    //            [self handleTwoFingerTransformCanvasEnd:sender];
    //            break;
    //        }
    //        case UIGestureRecognizerStateChanged:{
    //            DebugLog(@"Rotating Canvas");
    //            [self handleTwoFingerTransformCanvas:sender];
    //            break;
    //        }
    //        case UIGestureRecognizerStateCancelled:
    //        case UIGestureRecognizerStateFailed:{
    //            break;
    //        }
    //        default:
    //            break;
    //    }
}


- (IBAction)handleTap1Touches2TapsRootCanvasView:(UITapGestureRecognizer *)sender {
//    [RemoteLog logAction:@"handleTap1Touches2TapsRootCanvasView" identifier:sender];
//    if (_state != PaintScreen_Normal) {
//        return;
//    }
//    
//    if (sender.state == UIGestureRecognizerStateRecognized) {
//        //容易和普通点击绘制冲突
////        [self swapBrushType];
//    }
}

- (IBAction)handleTap2Touches2TapsRootCanvasView:(UITapGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleTap2Touches2TapsRootCanvasView" identifier:sender];
    if (_state != PaintScreen_Normal) {
        return;
    }
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [self.paintView transformCanvasReset];
    }
}

- (IBAction)handleTap3Touches1TapsRootCanvasView:(UITapGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleTap3Touches1TapsRootCanvasView" identifier:sender];
    if (_state != PaintScreen_Normal) {
        return;
    }
    if(sender.state == UIGestureRecognizerStateRecognized){
        [self togglePaintFullScreen];
    }
}



#pragma mark
- (void)handle2TouchesTransformCanvasBegan:(UIGestureRecognizer *)sender{
    DebugLogFuncStart(@"handle2TouchesTransformCanvasBegan");
    if (_state != PaintScreen_Normal) {
        return;
    }
    if (sender.numberOfTouches != 2) {
        return;
    }
    
    if (![self.paintView enterState:PaintView_TouchTransformCanvas]) {
        return;
    }
    
    
    //记录初始双指中点
    CGPoint p0 = [sender locationOfTouch:0 inView:self.rootCanvasView];
    CGPoint p1 = [sender locationOfTouch:1 inView:self.rootCanvasView];
    
    _twoFingerCenterBegan = CGPointMake((p0.x + p1.x) * 0.5, (p0.y + p1.y) * 0.5);
    _twoFingerDistanceBegan = GLKVector2Distance(GLKVector2Make(p0.x, p0.y), GLKVector2Make(p1.x, p1.y));
    _twoFingerVecBegan = _twoFingerVecLast = GLKVector2Make(p1.x - p0.x, p1.y - p0.y);
    
    [self.paintView transformCanvasBegan];
    
    //layer通过变换anchorPoint, position来重新设定layer frame
    CALayer *layer = self.paintView.layer;
    CGFloat x = ((NSNumber*)[layer valueForKeyPath:@"transform.translation.x"]).floatValue;
    CGFloat y = ((NSNumber*)[layer valueForKeyPath:@"transform.translation.y"]).floatValue;
    CGPoint newAnchorPoint = [self.rootCanvasView convertPoint:_twoFingerCenterBegan toView:self.paintView];
    layer.anchorPoint = CGPointMake(newAnchorPoint.x / self.paintView.bounds.size.width, newAnchorPoint.y / self.paintView.bounds.size.height);
    layer.position = CGPointMake(_twoFingerCenterBegan.x - x, _twoFingerCenterBegan.y - y);
    
    //UI
//    [self showZoomCanvasUI:true];
//    [self showRotateCanvasUI:[sender isEqual:self.lpgrTwoTouchesPaintView]];
//    [self showLockRotateCanvasUI:![sender isEqual:self.lpgrTwoTouchesPaintView]];
    

//    [PaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:nil toView:nil completion:nil];
//    [PaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil toView:nil completion:nil];
}

- (void)handle2TouchesTransformCanvasEnded:(UIGestureRecognizer *)sender{
    DebugLogFuncStart(@"handle2TouchesTransformCanvasEnd");
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    if (![self.paintView enterState:PaintView_TouchNone]) {
        return;
    }
    
    CALayer *layer = self.paintView.layer;
    CGFloat x = ((NSNumber*)[layer valueForKeyPath:@"transform.translation.x"]).floatValue;
    CGFloat y = ((NSNumber*)[layer valueForKeyPath:@"transform.translation.y"]).floatValue;
    
    DebugLog(@"start to change layer");
    DebugLog(@"before layer translation x:%.1f y:%.1f", x, y);
    DebugLog(@"before layer frame %@", NSStringFromCGRect(self.paintView.layer.frame));
    DebugLog(@"before layer bounds %@", NSStringFromCGRect(self.paintView.layer.bounds));
    DebugLog(@"before layer anchorPoint %@", NSStringFromCGPoint(self.paintView.layer.anchorPoint));
    DebugLog(@"before layer position %@", NSStringFromCGPoint(self.paintView.layer.position));
    
    CGPoint center = CGPointMake(layer.frame.origin.x + layer.frame.size.width * 0.5, layer.frame.origin.y + layer.frame.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.position = CGPointMake(center.x - x, center.y - y);

#if DEBUG
    CGFloat x1 = ((NSNumber*)[self.paintView.layer valueForKeyPath:@"transform.translation.x"]).floatValue;
    CGFloat y1 = ((NSNumber*)[self.paintView.layer valueForKeyPath:@"transform.translation.y"]).floatValue;
#endif
    DebugLog(@"after layer translation x:%.1f y:%.1f", x1, y1);
    DebugLog(@"after layer frame %@", NSStringFromCGRect(self.paintView.layer.frame));
    DebugLog(@"after layer bounds %@", NSStringFromCGRect(self.paintView.layer.bounds));
    DebugLog(@"after layer anchorPoint %@", NSStringFromCGPoint(self.paintView.layer.anchorPoint));
    DebugLog(@"after layer position %@", NSStringFromCGPoint(self.paintView.layer.position));
    DebugLog(@"after paintView %@", self.paintView);

    
    
    //UI
//    [self showRotateCanvasUI:false];
//    [self showZoomCanvasUI:false];
//    [self showLockRotateCanvasUI:false];
    
//    if (!self.isPaintFullScreen) {
//        //在handle2TouchesTransformCanvasBegan的动画结束之后才开始触发
//        [PaintUIKitAnimation view:self.view switchTopToolBarFromView:nil completion:nil toView:self.mainToolBar completion:nil];
//        [PaintUIKitAnimation view:self.view switchDownToolBarFromView:nil completion:nil toView:self.paintToolBar completion:nil];
//    }
}

- (void)handle2TouchesTransformCanvas:(UIGestureRecognizer *)sender{
    DebugLogFuncUpdate(@"handle2TouchesTransformCanvas");
    if (_state != PaintScreen_Normal) {
        return;
    }
    if (sender.numberOfTouches != 2) {
        return;
    }
    CGPoint p0 = [sender locationOfTouch:0 inView:self.rootCanvasView];
    CGPoint p1 = [sender locationOfTouch:1 inView:self.rootCanvasView];
    //    DebugLog(@"p0 x:%.2f y:%.2f  p1 x:%.2f y:%.2f", p0.x, p0.y, p1.x, p1.y);
    
    //计算 anchor point
    CGPoint center = CGPointMake((p0.x + p1.x) * 0.5, (p0.y + p1.y) * 0.5);
    
    //缩放
    float distance = GLKVector2Distance(GLKVector2Make(p0.x, p0.y), GLKVector2Make(p1.x, p1.y));
    float scale = distance / _twoFingerDistanceBegan;
    //        DebugLog(@"distance %.2f scale %.2f", distance, scale);
    
    //旋转
    float rotateAngle;
    GLKVector2 _twoFingerVec = GLKVector2Make(p1.x - p0.x, p1.y - p0.y);
    //如果前一帧和当前帧两点相反
    if(GLKVector2DotProduct(_twoFingerVec, _twoFingerVecLast) < 0){
        _twoFingerVec = GLKVector2Make(p0.x - p1.x, p0.y - p1.y);
    }
    _twoFingerVecLast = _twoFingerVec;
    rotateAngle = atan2f(_twoFingerVecBegan.y, _twoFingerVecBegan.x) - atan2f(_twoFingerVec.y, _twoFingerVec.x);
    
    //位移
    CGPoint translation = CGPointMake(center.x - _twoFingerCenterBegan.x, center.y - _twoFingerCenterBegan.y);
    
    if ([sender isEqual:self.pgr2TouchesRootCanvasView]) {
        [self.paintView freeTransformCanvasTranslate:translation rotate:rotateAngle scale:scale];
    }
//    else if ([sender isEqual:self.lpgrTwoTouchesPaintView]){
//        [self.paintView freeTransformCanvasTranslate:translation rotate:rotateAngle scale:scale anchorPoint:center];
//    }
   
}

- (void)handle3TouchesOperationBegan:(UIGestureRecognizer *)sender{
    DebugLog(@"handle3TouchesOperationBegan");
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    if (![self.paintView enterState:PaintView_TouchQuickTool]) {
        return;
    }
    
    UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)sender;
    CGPoint translation = [gesture translationInView:self.rootCanvasView];
    
    CGFloat lengthSqrt = translation.x * translation.x + translation.y * translation.y;
    CGFloat recognizePixel = 2;
    if (lengthSqrt < (recognizePixel * recognizePixel)) {
        return;
    }
    
    if (translation.x > 0 && abs(translation.x / translation.y) > 1.0){
        [self beginButtonIBAction:self.redoButton];
        [self redoDraw];
        [self performSelector:@selector(endButtonIBAction:) withObject:self.redoButton afterDelay:PaintScreenIBActionAnimationDuration];
    }
    else if (translation.x < 0 && abs(translation.x / translation.y) > 1.0){
        [self beginButtonIBAction:self.undoButton];
        [self undoDraw];
        [self performSelector:@selector(endButtonIBAction:) withObject:self.undoButton afterDelay:PaintScreenIBActionAnimationDuration];
    }
    else if (translation.y > 0 && abs(translation.x / translation.y) < 1.0){
        //打开取色器快捷方式
        [self beginButtonIBAction:self.paintColorButton];
        [self paintColorButtonTouchUp:nil];
        [self performSelector:@selector(endButtonIBAction:) withObject:self.paintColorButton afterDelay:PaintScreenIBActionAnimationDuration];
    }
    else if (translation.y < 0 && abs(translation.x / translation.y) < 1.0){
        //打开图层快捷方式
        [self beginButtonIBAction:self.layerButton];
        [self layerButtonTouchUp:nil];
        [self performSelector:@selector(endButtonIBAction:) withObject:self.layerButton afterDelay:PaintScreenIBActionAnimationDuration];
        
    }

}

- (void)handle3TouchesOperation:(UIGestureRecognizer *)sender{
//    DebugLog(@"handle3TouchesOperation");
    if (_state != PaintScreen_Normal) {
        return;
    }
}

- (void)handle3TouchesOperationEnd:(UIGestureRecognizer *)sender{
    DebugLog(@"handle3TouchesOperationEnd");
    if (_state != PaintScreen_Normal) {
        return;
    }
//    self.undoButton.highlighted = false;
//    self.redoButton.highlighted = false;
    
    if (![self.paintView enterState:PaintView_TouchNone]) {
        return;
    }
    
    if (self.isPaintFullScreen) {
        [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:nil];
        //将layerPanel移到顶端
        [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil];
    }
}

#pragma mark

- (void)handle1TouchesPanImageStart:(UIPanGestureRecognizer *)sender{
    CGPoint location = CGPointZero;
    GLKVector2 anchorToLocationVec;
    
    _transformAnchor = [self.paintView imageScaleAnchor];
    
    switch (_transformImageState) {
        case TransformImage_Move:
            
            break;
        case TransformImage_Rotate:
            location = [sender locationInView:self.paintView];
            anchorToLocationVec = GLKVector2Make(location.x - _transformAnchor.x, location.y - _transformAnchor.y);
            _transformPointToAnchorArc = atan2f(anchorToLocationVec.y, anchorToLocationVec.x);
            
            break;
        case TransformImage_Scale:
            location = [sender locationInView:self.paintView];
            anchorToLocationVec = GLKVector2Make(location.x - _transformAnchor.x, location.y - _transformAnchor.y);
            _transformPointToAnchorLength = GLKVector2Length(anchorToLocationVec);
            break;
        default:
            break;
    }
}

- (void)handle1TouchesPanImage:(UIPanGestureRecognizer *)sender{
    
    CGPoint translation = CGPointZero;
    CGPoint location = CGPointZero;
    float newTransformPointToAnchorLength = 0;
    float newTransformPointToAnchorArc = 0;
    GLKVector2 anchorToLocationVec;
    
    switch (_transformImageState) {
        case TransformImage_Move:
            translation = [sender translationInView:self.paintView];
            [self.paintView moveImage:translation];
            
            break;
        case TransformImage_Rotate:
            location = [sender locationInView:self.paintView];
            anchorToLocationVec = GLKVector2Make(location.x - _transformAnchor.x, location.y - _transformAnchor.y);
            newTransformPointToAnchorArc = atan2f(anchorToLocationVec.y, anchorToLocationVec.x);
            
            [self.paintView rotateImage:(_transformPointToAnchorArc - newTransformPointToAnchorArc)];
            break;
        case TransformImage_Scale:
            
            location = [sender locationInView:self.paintView];
            anchorToLocationVec = GLKVector2Make(location.x - _transformAnchor.x, location.y - _transformAnchor.y);
            newTransformPointToAnchorLength = GLKVector2Length(anchorToLocationVec);
            if (_transformPointToAnchorLength > 0) {
                CGFloat scale = (newTransformPointToAnchorLength / _transformPointToAnchorLength);
                [self.paintView scaleImage:CGPointMake(scale, scale)];
            }
            
            break;
            
        default:
            break;
    }
    
    [self updateAnchor];
}

//开始两点定位的变换
- (void)handle2TouchesTransformImageStart:(UIGestureRecognizer *)sender{
    //记录初始双指中点
    CGPoint p0 = [sender locationOfTouch:0 inView:self.paintView];
    CGPoint p1 = [sender locationOfTouch:1 inView:self.paintView];

    [self transformImageStartWithPoint0:p0 point1:p1 forceImageCenterAnchor:true];

    //设置transformContentView
    self.transformContentViewSrcCenter = [self.rootCanvasView convertPoint:self.transformContentView.center toView:self.paintView];
    self.transformContentViewSrcBounds = self.transformContentView.bounds;

    //设置transformAnchorView
    [self showTransformAnchorViewExclusiveByIndex:-1];
}

- (void)handle2TouchesTransformImage:(UIGestureRecognizer *)sender{
    
    //    DebugLog(@"handleTwoFingerTransformImage");
    CGPoint p0 = [sender locationOfTouch:0 inView:self.paintView];
    CGPoint p1 = [sender locationOfTouch:1 inView:self.paintView];
    //    DebugLog(@"p0 x:%.2f y:%.2f  p1 x:%.2f y:%.2f", p0.x, p0.y, p1.x, p1.y);
    
    TransformInfo transformInfo = [self transformImageWithPoint0:p0 point1:p1 enableTranslate:false enableRotate:true enableScale:true scaleMode:ScaleMode_XX enableAnchor:false];
    CGFloat rotation = self.transformContentViewSrcRotate - transformInfo.rotate;
    [self.transformContentView.layer setValue:[NSNumber numberWithFloat:rotation] forKeyPath:@"transform.rotation"];
}

- (void)handle2TouchesTransformImageEnded:(UIGestureRecognizer *)sender{
    [self updateAllTransformAnchorViews];
    [self showAllTransformAnchorViews];
}
- (IBAction)handlePanTransformAnchorView:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePanAnchorView" identifier:sender];
    if (_state != PaintScreen_Transform) {
        return;
    }
    
    if(self.transformAnchorViewExclusive && ![self.transformAnchorViewExclusive isEqual:sender.view]){
        return;
    }
    
    NSUInteger index = sender.view.tag;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
//            DebugLogWarn(@"handlePanTransformAnchorView UIGestureRecognizerStateBegan %@", sender);
            CGPoint p0 = sender.view.center;
            p0 = [self.paintView convertPoint:p0 fromView:self.rootCanvasView];
            self.curTransformAnchorViewSrcCenter = p0;
            
            //找到对应的另一处anchorView
            ADTransformAnchorView *view = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:8 - index];
            CGPoint p1 = view.center;
            p1 = [self.paintView convertPoint:p1 fromView:self.rootCanvasView];
            
            self.curTransformDirection = atan2f(p0.y - p1.y, p0.x - p1.x);
            
            self.transformContentViewSrcCenter = self.transformContentView.center;
            self.transformContentViewSrcBounds = self.transformContentView.bounds;
            
            [self transformImageStartWithPoint0:p0 point1:p1 forceImageCenterAnchor:false];
            
            //UI
            self.transformAnchorViewExclusive = sender.view;
            [self showTransformAnchorViewExclusiveByIndex:index];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            //            DebugLog(@"sender center %@", NSStringFromCGPoint(sender.view.center));
            CGPoint translate = [sender translationInView:self.paintView];
            
            //投影移动矢量到当前变换轴线上,得到实际的移动向量
            CGFloat r = sqrtf(translate.x * translate.x + translate.y * translate.y);
            CGFloat r0 = cosf(self.curTransformDirection - atan2f(translate.y, translate.x)) * r;
            CGPoint t = CGPointMake(cosf(self.curTransformDirection) * r0, sinf(self.curTransformDirection) * r0);
            
            //得到两个移动基点(在paintView坐标系下)
            CGPoint p0 = CGPointMake(self.curTransformAnchorViewSrcCenter.x + t.x, self.curTransformAnchorViewSrcCenter.y + t.y);
            sender.view.center = [self.rootCanvasView convertPoint:p0 fromView:self.paintView];
            
            ADTransformAnchorView *view = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:8 - index];
            CGPoint p1 = view.center;
            p1 = [self.paintView convertPoint:p1 fromView:self.rootCanvasView];
//            DebugLog(@"paintView space p0 %@  p1 %@", NSStringFromCGPoint(p0), NSStringFromCGPoint(p1));
            
            //转换到transformContent的坐标系下
            CGPoint p0Canvas = [self.rootCanvasView convertPoint:p0 fromView:self.paintView];
            CGPoint p1Canvas = [self.rootCanvasView convertPoint:p1 fromView:self.paintView];
            CGPoint p0Local = [self.transformContentView convertPoint:p0 fromView:self.paintView];
            CGPoint p1Local = [self.transformContentView convertPoint:p1 fromView:self.paintView];
//            DebugLog(@"transformContentView space p0Local %@  p1Local %@", NSStringFromCGPoint(p0Local), NSStringFromCGPoint(p1Local));
            
            
            CGRect bounds = self.transformContentView.bounds;
            if (index == 0 || index == 2 || index == 6 || index == 8) {
                CGFloat width = fabsf(p1Local.x - p0Local.x);
                CGFloat height = fabsf(p1Local.y - p0Local.y);
                bounds.size = CGSizeMake(width, height);
                //变换transforContentView大小会导致view重分配大小
                self.transformContentView.bounds = bounds;
                self.transformContentView.center = CGPointMake((p0Canvas.x + p1Canvas.x)*0.5, (p0Canvas.y + p1Canvas.y)*0.5);
                
                [self transformImageWithPoint0:p0 point1:p1 enableTranslate:true enableRotate:false enableScale:true scaleMode:ScaleMode_XX enableAnchor:false];
            }
            else if (index == 3 || index == 5){
                bounds.size.width = GLKVector2Distance(GLKVector2Make(p0Canvas.x, p0Canvas.y), GLKVector2Make(p1Canvas.x, p1Canvas.y));
                self.transformContentView.bounds = bounds;
                self.transformContentView.center = CGPointMake((p0Canvas.x + p1Canvas.x)*0.5, (p0Canvas.y + p1Canvas.y)*0.5);
                
                [self transformImageWithPoint0:p0 point1:p1 enableTranslate:true enableRotate:false enableScale:true scaleMode:ScaleMode_X enableAnchor:false];
            }
            else if (index == 1 || index == 7){
                bounds.size.height = GLKVector2Distance(GLKVector2Make(p0Canvas.x, p0Canvas.y), GLKVector2Make(p1Canvas.x, p1Canvas.y));
                self.transformContentView.bounds = bounds;
                self.transformContentView.center = CGPointMake((p0Canvas.x + p1Canvas.x)*0.5, (p0Canvas.y + p1Canvas.y)*0.5);
                
                [self transformImageWithPoint0:p0 point1:p1 enableTranslate:true enableRotate:false enableScale:true scaleMode:ScaleMode_Y enableAnchor:false];
            }
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            [self updateAllTransformAnchorViews];
            [self showAllTransformAnchorViews];
            self.transformAnchorViewExclusive = nil;
            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            break;
        }
        default:
            break;
    }
}
#pragma mark- 手势 Gestures 其他(无需判断状态)
- (IBAction)handleLongPressPaintColorButton:(UILongPressGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleLongPressPaintColorButton" identifier:sender];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            //吸出颜色
            self.colorSaveToSlotView.hidden = false;
            self.colorSaveToSlotView.alpha = 1;
            self.colorSaveToSlotView.color = self.paintColorButton.color;
            self.colorSaveToSlotView.bounds = CGRectMake(0, 0, 44, 44);
            [self.colorSaveToSlotView setNeedsDisplay];
            
            self.colorSaveTargetButton = (ADColorButton*)sender.view;
            
            CGPoint centerInRootView = [self.rootView convertPoint:self.paintColorButton.center fromView:self.paintColorView];
            self.colorSaveToSlotView.center = centerInRootView;
            
            //UI显示动画
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.colorSaveToSlotView.center = CGPointMake(centerInRootView.x, self.paintToolBar.frame.origin.y - 10);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.colorSaveToSlotView.center = CGPointMake(centerInRootView.x, self.paintToolBar.frame.origin.y);
                }completion:^(BOOL finished) {
                }];
                
            }];
            
            //所有颜色槽放缩动画
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat  animations:^{
                for (ADColorButton* button in self.colorButtons) {
                    [button.layer setValue:[NSNumber numberWithFloat:0.9] forKeyPath:@"transform.scale"];
                }
            } completion:^(BOOL finished) {
                for (ADColorButton* button in self.colorButtons) {
                    [button.layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale"];
                }
            }];
            
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //        DebugLog(@"handleLongPressPaintColorButton state UIGestureRecognizerStateChanged");
            
            //paintColorButton
            CGPoint touchPointInColorButton = [sender locationOfTouch:0 inView:self.paintColorButton];
            if (CGRectContainsPoint(self.paintColorButton.bounds, touchPointInColorButton) && (self.colorSaveTargetButton != self.paintColorButton)) {
                self.colorSaveTargetButton = self.paintColorButton;
                CGPoint targetCenterInRootView = [self.rootView convertPoint:self.colorSaveTargetButton.center fromView:self.colorSaveTargetButton.superview];
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.colorSaveToSlotView.center = CGPointMake(targetCenterInRootView.x, self.colorSaveToSlotView.center.y);
                } completion:^(BOOL finished) {
                    
                }];
            }
            //colorSlotsButton
            else{
                CGPoint touchPointInRootView = [sender locationOfTouch:0 inView:self.rootView];
                for (ADColorButton* button in self.colorButtons) {
                    //剔除scrollView可视范围外的颜色按钮
                    CGPoint touchPointInScrollView = [self.colorSlotsScrollView convertPoint:touchPointInRootView fromView:self.rootView];
                    if (CGRectContainsPoint(self.colorSlotsScrollView.bounds, touchPointInScrollView))
                    {
                        //如果手指在颜色按钮内，并且当前颜色槽不是目标颜色按钮，播放移动colorSaveToSlotView动画
                        CGPoint touchPointInColorButton = [button convertPoint:touchPointInRootView fromView:self.rootView];
                        if (CGRectContainsPoint(button.bounds, touchPointInColorButton))
                        {
                            //新颜色按钮
                            if (self.colorSaveTargetButton != button) {
                                //当前颜色按钮指定为保存目标按钮
                                self.colorSaveTargetButton = button;
                                CGPoint targetCenterInRootView = [self.rootView convertPoint:self.colorSaveTargetButton.center fromView:self.colorSaveTargetButton.superview];
                                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                                    self.colorSaveToSlotView.center = CGPointMake(targetCenterInRootView.x, self.colorSaveToSlotView.center.y);
                                } completion:^(BOOL finished) {
                                    //提示动画
                                    [self.colorSaveToSlotView.layer removeAllAnimations];
                                    
                                    self.colorSaveToSlotView.center = CGPointMake(self.colorSaveToSlotView.center.x, self.paintToolBar.frame.origin.y - 10);
                                    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse animations:^{
                                        self.colorSaveToSlotView.center = CGPointMake(self.colorSaveToSlotView.center.x, self.paintToolBar.frame.origin.y);
                                    } completion:^(BOOL finished) {
                                    }];
                                }];
                            }
                        }
                    }
                    
                }
                
            }
            break;
        }
        case UIGestureRecognizerStateEnded: {
            //取消颜色槽提示动画
            for (ADColorButton* button in self.colorButtons) {
                [button.layer removeAllAnimations];
            }
            
            //保存到颜色槽动画
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGPoint targetCenterInRootView = [self.rootView convertPoint:self.colorSaveTargetButton.center fromView:self.colorSaveTargetButton.superview];
                self.colorSaveToSlotView.center = targetCenterInRootView;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:PaintScreenIBActionAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.colorSaveToSlotView.bounds = self.colorSaveTargetButton.bounds;
                    self.colorSaveToSlotView.alpha = 0;
                    self.colorSaveTargetButton.color = self.colorSaveToSlotView.color;
//                    self.colorSaveTargetButton.isEmpty = false;
                }completion:^(BOOL finished) {
                    self.colorSaveToSlotView.hidden = true;
                    //检查所有颜色按钮，如果没有Empty的颜色按钮了，添加10个新的颜色按钮
//                    bool colorButtonIsFull = true;
//                    for (ColorButton *colorButton in self.colorButtons) {
//                        if (colorButton.isEmpty) {
//                            colorButtonIsFull = false;
//                            break;
//                        }
//                    }
//                    if (colorButtonIsFull) {
//                        [self newSwatch];
//                    }
                }];
            }];
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            //取消颜色槽提示动画
            for (ADColorButton* button in self.colorButtons) {
                [button.layer removeAllAnimations];
            }
            break;
        }
        default:
            break;
    }
}

- (IBAction)handlePanTopDownToolBar:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePanTopDownToolBar" identifier:sender];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.downToolBarFrame = self.paintToolBar.frame;
            self.topToolBarFrame = self.mainToolBar.frame;
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            CGRect frame = self.downToolBarFrame;
            frame.origin.y -= [sender translationInView:sender.view].y;
            frame.origin.y = MAX(frame.origin.y, self.downToolBarFrame.origin.y);
            self.paintToolBar.frame = frame;
            
            frame = self.topToolBarFrame;
            frame.origin.y += [sender translationInView:sender.view].y;
            frame.origin.y = MIN(frame.origin.y, self.topToolBarFrame.origin.y);
            self.mainToolBar.frame = frame;
        }
            break;
        case UIGestureRecognizerStateEnded:
            
            break;
        case UIGestureRecognizerStateFailed:
            
            break;
        default:
            break;
    }
}
- (IBAction)handleLongPressBrushButton:(UILongPressGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleLongPressBrushButton" identifier:sender];
    ADBrushTypeButton *brushTypeButton = (ADBrushTypeButton *)sender.view;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            //制作时间关系，暂时取消功能，在日后的版本中加入
//            [self editBrush:brushTypeButton.brush];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            [UIView animateWithDuration:0.2 animations:^{
                brushTypeButton.frame = CGRectMake(brushTypeButton.frame.origin.x, 0, brushTypeButton.frame.size.width, brushTypeButton.frame.size.height);
            }completion:nil];
        }
        break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            [UIView animateWithDuration:0.2 animations:^{
                brushTypeButton.frame = CGRectMake(brushTypeButton.frame.origin.x, 0, brushTypeButton.frame.size.width, brushTypeButton.frame.size.height);
            }completion:nil];
        }
        break;
        default:
        break;
    }
}


- (IBAction)handle2TapsColorSlot:(UITapGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handle2TapsColorSlot" identifier:sender];
    ADColorButton* colorButton = (ADColorButton*)sender.view;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            DebugLog(@"DoubleTapGestureRecognizer began");
            break;
        }
        case UIGestureRecognizerStateEnded:{
            DebugLog(@"DoubleTapGestureRecognizer ended");
            
            const CGFloat* srcColors = CGColorGetComponents(colorButton.color.CGColor);
            const CGFloat* dstColors = CGColorGetComponents(self.paintColorButton.color.CGColor);
            float blend = 0.1;
            float r = srcColors[0] * blend + dstColors[0] * (1 - blend);
            float g = srcColors[1] * blend + dstColors[1] * (1 - blend);
            float b = srcColors[2] * blend + dstColors[2] * (1 - blend);
            UIColor *newColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
            [self.paintView.brush setColor:newColor];
            
            [colorButton enableHighlighted:false];
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            DebugLog(@"DoubleTapGestureRecognizer cancelled");
            [colorButton enableHighlighted:false];
            break;
        }
        default:
            break;
    }
}

- (IBAction)handleTapColorSlot:(UITapGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleTapColorSlot" identifier:sender];
    ADColorButton* colorButton = (ADColorButton*)sender.view;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            DebugLog(@"UITapGestureRecognizer began");
            break;
        }
        case UIGestureRecognizerStateEnded:{
            DebugLog(@"UITapGestureRecognizer ended");
            [self.paintView.brush setColor:colorButton.color];
            [colorButton enableHighlighted:false];
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            DebugLog(@"UITapGestureRecognizer cancelled");
            [colorButton enableHighlighted:false];
            break;
        }
        default:
            break;
    }    
}
- (IBAction)handleLongPressColorSlot:(UILongPressGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handleLongPressColorSlot" identifier:sender];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
//            _isEditingColorSlot = true;
            if (_LongPressGRColorSlotCount<1) {
                _LongPressGRColorSlotCount ++;
                DebugLog(@"LongPressGRColorSlotCount: %d", _LongPressGRColorSlotCount);
                
                //单色选色模式
            }
            else{
                //双色渐变选色模式
            }
            
//            [colorPickerView setHidden:false];
//            colorPickerView.sourceView = sender.view;
//            self.infColorPickerController.resultColor = sender.view.backgroundColor;//覆盖当前笔刷色

            ADColorButton* colorButton = (ADColorButton*)sender.view;
            [self openColorPicker:colorButton.color inColorButton:colorButton];
            break;
        }
        case UIGestureRecognizerStateEnded:
            [sender.view setNeedsDisplay];
            break;
        case UIGestureRecognizerStateCancelled:
            [sender.view setNeedsDisplay];
            break;
        default:
            break;
    }    
}

//- (IBAction)handlePanBrushToolBar:(UIPanGestureRecognizer *)sender {
//    UIView* view = sender.view;
//    CGPoint translation = [sender translationInView:sender.view];
//    switch (sender.state) {
//        case UIGestureRecognizerStateBegan:
////            [pencilBrushToolBar setUserInteractionEnabled:false];
////            [airBrushToolBar setUserInteractionEnabled:false];
//            for (BrushToolBar *brushToolBar in _paintUICollection) {
//                [brushToolBar setUserInteractionEnabled:false];
//            }            
//            if(_state != PaintScreen_EditingBrush && !brushView.isHidden){//确认颜色选择，如果不在编辑笔刷状态下 关闭预览窗口 不改当前笔刷颜色
//                [self toggleBrushPreview];
//            }
//            else if (_state == PaintScreen_EditingBrush && !brushView.isHidden) {//在编辑状态下 更新颜色
//                //todo:
////                brushView.color = self.resultColor = sender.backgroundColor;
//            }
//            break;
//        case UIGestureRecognizerStateEnded:
//            [UIView animateWithDuration:0.25
//                             animations:^{
//
//                                 if (translation.x < -ChangeToolBarConfirmPixels && translation.y < ChangeToolBarConfirmPixels && _curBrushToolBarIndex < BrushType_Max - 2) {
//                                     [view setFrame:CGRectMake(view.frame.origin.x-view.frame.size.width*0.5, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
//                                     _curBrushToolBarIndex++;
//                                 }
//                                 else if (translation.x > ChangeToolBarConfirmPixels && translation.y < ChangeToolBarConfirmPixels && _curBrushToolBarIndex > 0){
//                                     [view setFrame:CGRectMake(view.frame.origin.x+view.frame.size.width*0.5, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
//                                     _curBrushToolBarIndex--;
//                                 }
//                                 [self changeBrush];                                 
//                             } 
//                             completion:^(BOOL finished){
//                                 for (BrushToolBar *brushToolBar in _paintUICollection) {
//                                     [brushToolBar setUserInteractionEnabled:true];
//                                 }
//                             }];
//           
//            break;
//    }    
//}

- (IBAction)handlePanPaintColorButton:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"PS_handlePanPaintColorButton" identifier:sender];
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [sender locationInView:sender.view];
        CGPoint locationInRootView = CGPointMake(sender.view.superview.frame.origin.x + location.x, sender.view.superview.frame.origin.y + location.y);
        for (UIButton* colorButton in self.colorButtons) {
            CGRect rectInRootView = CGRectMake(colorButton.superview.frame.origin.x + colorButton.frame.origin.x, colorButton.superview.frame.origin.y + colorButton.frame.origin.y, colorButton.frame.size.width, colorButton.frame.size.height);
            if(CGRectContainsPoint(rectInRootView, locationInRootView)){
                colorButton.backgroundColor = sender.view.backgroundColor;
                //                DebugLog(@"location is %@", NSStringFromCGPoint(locationInRootView));
                //                DebugLog(@"cgrect is %@", NSStringFromCGPoint(rectInRootView.origin));
                break;
            }
        }
    }
}


#pragma mark- 手势代理 Gestures Delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (([gestureRecognizer isEqual:self.clearGestureRecognizer] && [otherGestureRecognizer isEqual:self.pgr3TouchesRootCanvasView]) ||
        ([gestureRecognizer isEqual:self.pgr3TouchesRootCanvasView] && [otherGestureRecognizer isEqual:self.clearGestureRecognizer]))
        return YES;
    
    // if the gesture recognizers's view isn't one of our views, don't allow simultaneous recognition
    if (gestureRecognizer.view != self.paintView)
        return NO;
    
    // if the gesture recognizers are on different views, don't allow simultaneous recognition
    if (gestureRecognizer.view != otherGestureRecognizer.view)
        return NO;
    
    // if either of the gesture recognizers is the long press, don't allow simultaneous recognition
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
        return NO;
    
    
    //只有Canvas操作 pinch pan可以同时进行
//    if (
//        ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]]) ||
//        ([gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]])
//        )
//        return YES;
    
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    //did in viewDidLoad
//    if (([gestureRecognizer isEqual:self.pgrRootCanvasView])
//        && [otherGestureRecognizer isEqual:self.clearGestureRecognizer]) {
//        return YES;
//    }
    
//    //ColorButton上的单击事件必须在双击事件失败之后识别
//    if([gestureRecognizer.view isKindOfClass:[ColorButton class]] &&
//       [gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] &&
//       ((UITapGestureRecognizer*)gestureRecognizer).numberOfTapsRequired == 1 &&
//       
//       [otherGestureRecognizer.view isKindOfClass:[ColorButton class]] &&
//       [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] &&
//       ((UITapGestureRecognizer*)otherGestureRecognizer).numberOfTapsRequired == 2
//       ){
//        return YES;
//    }
    
    //    if ([gestureRecognizer isEqual:self.lpgrPaintView] && [otherGestureRecognizer isEqual:self.lpgrTwoTouchesPaintView]){
    //
    //        return YES;
    //    }
    //TODDO:LongPressGR RootView需要LongPressGR TwoTouchesRootView 失败后判定
    
    return NO;
}

#pragma mark- 绘图界面 Paint UI Operation
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    self.previousBrushTypePageButton.hidden = self.brushTypePageControl.currentPage == 0;
//    self.nextBrushTypePageButton.hidden = (self.brushTypePageControl.currentPage == self.brushTypePageControl.numberOfPages - 1);
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //shrink when color button's frame origin is out of contentOffset ~ (contentOffset + scrollview.width)
//    DebugLog(@"count %d", _colorSlotsScrollView.subviews.count);
    
    if ([scrollView isEqual:self.colorSlotsScrollView]) {
        int count = scrollView.subviews.count;//bug?
        CGFloat iconSize = 50;
        for (int i = 0; i < count; ++i) {
            UIButton *button = [scrollView.subviews objectAtIndex:i];
            float newSize;
            float fadeLeftDistance = i*iconSize + 25 - scrollView.contentOffset.x;
            float fadeRightDistance = scrollView.contentOffset.x + scrollView.frame.size.width - (i*iconSize + 25);
            //左端缩小
            if(fadeLeftDistance < 25){
                newSize = MAX(0.1, iconSize * (fadeLeftDistance / 25.0));
                button.frame = CGRectMake(i*iconSize + (50 - newSize) * 0.5, (iconSize - newSize) * 0.5, newSize, newSize);
            }
            //右端缩小
            else if(fadeRightDistance < 25){
                newSize = MAX(0.1, 50 * (fadeRightDistance / 25.0));
                button.frame = CGRectMake(i*iconSize, (iconSize - newSize) * 0.5, newSize, newSize);
            }
            //正常大小
            else{
                button.frame = CGRectMake(i*iconSize, 0, iconSize, iconSize);
            }
        }
    }
    else if([scrollView isEqual:self.brushTypeScrollView]){
        [self willBrushTypeScrollViewDidScroll:scrollView];
    }
}

- (void)brushTypeSelected{
    //选定笔刷种类
    //使用popoverController方式
//    BrushTypeViewController* brushTypeViewController = [[BrushTypeViewController alloc]initWithStyle:UITableViewStylePlain];
////    self.brushTypeView.hidden = false;
////    brushTypeViewController.view = self.brushTypeView;
//    brushTypeViewController.delegate = self;
//    
//    brushTypeViewController.contentSizeForViewInPopover = CGSizeMake(130, 320);
//    
//    self.sharedPopoverController = [[PaintScreenPopoverController alloc]initWithContentViewController:brushTypeViewController];
//    CGRect rect = CGRectMake(brushButton.bounds.origin.x, brushButton.bounds.origin.y, brushButton.bounds.size.width, brushButton.bounds.size.height);
//    [self.sharedPopoverController presentPopoverFromRect:rect inView:brushButton permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
    //使用弹出UIView方式
//    if(_state == PaintScreen_Normal){
//        _state = PaintScreen_EditingBrush;
//        brushView.hidden = false;
//        self.brushTypeView.hidden = false;
//    }
//    else if(_state == PaintScreen_EditingBrush){
//        _state = PaintScreen_Normal;
//        brushView.hidden = true;
//        self.brushTypeView.hidden = true;
//    }
    
    //使用切换ToolBar方式
    if(_state == PaintScreen_Normal){
        //笔刷面板禁止绘图
        self.rootCanvasView.userInteractionEnabled = false;
        
        [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil];

        //突出当前选择的笔刷
        for (UIView *brushTypeView in self.brushTypeScrollView.subviews) {
            brushTypeView.frame = CGRectMake(brushTypeView.frame.origin.x, 20, brushTypeView.frame.size.width, brushTypeView.frame.size.height);
        }
        UIView *selBrushTypeView = (UIView *)(self.brushTypeScrollView.subviews[self.paintView.brush.brushState.classId]);
        selBrushTypeView.frame = CGRectMake(selBrushTypeView.frame.origin.x, 0, selBrushTypeView.frame.size.width, selBrushTypeView.frame.size.height);
        
        //切换到相应的page
        self.brushTypePageControl.currentPage = (NSInteger)(floorf((float)self.paintView.brush.brushState.classId / 6.0));
        self.brushTypeScrollView.contentOffset = CGPointMake(self.brushTypePageControl.currentPage * self.brushTypeScrollView.frame.size.width, 0);
        
        //切换成横移动画
        [ADPaintUIKitAnimation view:self.view slideToolBarRightDirection:true outView:self.paintToolView inView:self.brushTypeView completion:^{
            _state = PaintScreen_SelectBrush;
            
//            [self autoShowBrushes:true];
        }];
    }
}

- (IBAction)brushTypeButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushTypeButtonTouchUp" identifier:sender];
    [self brushTypeSelected];
}

- (IBAction)brushTypeButtonTouchDown:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushTypeButtonTouchDown" identifier:sender];
    self.brushButtonTempRect = sender.frame;
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 20, sender.frame.size.width, sender.frame.size.height);        
    }completion:nil];

}

- (IBAction)brushTypeButtonTouchCancel:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushTypeButtonTouchCancel" identifier:sender];
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 0, sender.frame.size.width, sender.frame.size.height);
    }completion:nil];
}

- (IBAction)brushTypePageControlValueChanged:(UIPageControl *)sender {
    [RemoteLog logAction:@"PS_brushTypePageControlValueChanged" identifier:sender];
    [self scrollBrushTypeScrollViewByPage:sender.currentPage];
}

- (IBAction)previousBrushTypePageButtonTouchUp:(UIButton *)sender{
    [RemoteLog logAction:@"PS_previousBrushTypePageButtonTouchUp" identifier:sender];
    if (self.brushTypePageControl.currentPage == 0) {
        return;
    }
    
    self.brushTypePageControl.currentPage --;
    [self scrollBrushTypeScrollViewByPage:self.brushTypePageControl.currentPage];
}
- (IBAction)nextBrushTypePageButtonTouchUp:(UIButton *)sender{
    [RemoteLog logAction:@"PS_nextBrushTypePageButtonTouchUp" identifier:sender];
    if (self.brushTypePageControl.currentPage >= self.brushTypePageControl.numberOfPages) {
        return;
    }
    
    self.brushTypePageControl.currentPage ++;
    [self scrollBrushTypeScrollViewByPage:self.brushTypePageControl.currentPage];
}

- (void)scrollBrushTypeScrollViewByPage:(NSInteger)pageIndex{
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.brushTypeScrollView.contentOffset = CGPointMake(pageIndex * self.brushTypeScrollView.frame.size.width, 0);
    } completion:^(BOOL finished) {
//        self.previousBrushTypePageButton.hidden = pageIndex == 0;
//        self.nextBrushTypePageButton.hidden = (pageIndex == self.brushTypePageControl.numberOfPages - 1);
    }];
}


- (IBAction)brushTypeBackButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushTypeBackButtonTouchUp" identifier:sender];
    ADBrushTypeButton *tempButton = self.brushBackButton;
    self.brushBackButton = self.brushButton;
    self.brushButton = tempButton;
    [self.paintView setBrush:self.brushButton.brush];
    
    [self.paintToolBar bringSubviewToFront:self.brushButton];
    
    self.brushButton.userInteractionEnabled = false;
    self.brushBackButton.userInteractionEnabled = false;
    
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        //更新位置
        float newPosX = self.brushBackButton.frame.origin.x;
        float newBackPosX = self.brushButton.frame.origin.x;
        self.brushButton.frame = CGRectMake(newPosX, self.brushButton.frame.origin.y, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
        self.brushBackButton.frame = CGRectMake(newBackPosX, self.brushBackButton.frame.origin.y, self.brushBackButton.frame.size.width, self.brushBackButton.frame.size.height);
    
    }completion:^(BOOL finished) {
        [self.brushButton removeTarget:self action:@selector(brushTypeBackButtonTouchDown:) forControlEvents:UIControlEventTouchDown];        
        [self.brushButton removeTarget:self action:@selector(brushTypeBackButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [self.brushButton removeTarget:self action:@selector(brushTypeBackButtonTouchCancel:) forControlEvents:UIControlEventTouchUpOutside];

        [self.brushButton addTarget:self action:@selector(brushTypeButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self.brushButton addTarget:self action:@selector(brushTypeButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [self.brushButton addTarget:self action:@selector(brushTypeButtonTouchCancel:) forControlEvents:UIControlEventTouchUpOutside];
        
        [self.brushBackButton removeTarget:self action:@selector(brushTypeButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self.brushBackButton removeTarget:self action:@selector(brushTypeButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [self.brushBackButton removeTarget:self action:@selector(brushTypeButtonTouchCancel:) forControlEvents:UIControlEventTouchUpOutside];
        
        [self.brushBackButton addTarget:self action:@selector(brushTypeBackButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self.brushBackButton addTarget:self action:@selector(brushTypeBackButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [self.brushBackButton addTarget:self action:@selector(brushTypeBackButtonTouchCancel:) forControlEvents:UIControlEventTouchUpOutside];
        
        [self.brushButton addGestureRecognizer:self.lpgrBrushButton];
        [self.brushBackButton removeGestureRecognizer:self.lpgrBrushButton];
        
        self.brushButton.userInteractionEnabled = true;
        self.brushBackButton.userInteractionEnabled = true;
        
//        self.brushButton.isAccessibilityElement = true;
//        self.brushButton.accessibilityIdentifier = @"Using Brush";
//        self.brushBackButton.isAccessibilityElement = true;
//        self.brushBackButton.accessibilityIdentifier = @"Backup Brush";
        
        //更新颜色
        [self willChangeUIPaintColor:self.brushButton.brush.brushState.color];
    }];
}

- (IBAction)brushTypeBackButtonTouchCancel:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushTypeBackButtonTouchCancel" identifier:sender];
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 40, sender.frame.size.width, sender.frame.size.height);
        self.brushButton.frame = CGRectMake(self.brushButton.frame.origin.x, 0, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
    }completion:^(BOOL finished) {
    }];
}
- (IBAction)brushTypeBackButtonTouchDown:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushTypeBackButtonTouchDown" identifier:sender];
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 0, sender.frame.size.width, sender.frame.size.height);
        self.brushButton.frame = CGRectMake(self.brushButton.frame.origin.x, 40, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
    }completion:^(BOOL finished) {
    }];
}
-(void)swapBrushType{
    DebugLogFuncStart(@"swapBrushType");
    if(_state != PaintScreen_Normal){
        return;
    }
    
    if (![self.paintView enterState:PaintView_TouchNone]) {
        return;
    }
    
    //            [self togglePaintFullScreen];
    //            self.paintView.multiTouchEndCount = sender.numberOfTouchesRequired;
    
    //切换笔刷快捷方式
    [self brushTypeBackButtonTouchDown:self.brushBackButton];
    
    [self brushTypeBackButtonTouchUp:self.brushBackButton];
    
    [ADPaintUIKitAnimation view:self.view switchDownToolBarToView:self.paintToolBar completion:^{
        
        if (self.isPaintFullScreen) {
            [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:nil];
            //将layerPanel移到顶端
            [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil];
        }
    }];
}

- (void)autoShowBrushes:(BOOL)on{
    DebugLogFuncStart(@"autoShowBrushes %i", on);
    if (on) {
//        self.autoShowBrushTimer = [NSTimer  timerWithTimeInterval:10.0 target:self.brushTypeScrollView selector:@selector(autoShowBrushesTimerFired:)userInfo:nil repeats:NO];
//        [[NSRunLoop  currentRunLoop] addTimer:self.autoShowBrushTimer forMode:NSDefaultRunLoopMode];
//
//        [self.autoShowBrushTimer performSelector:@selector(fire) withObject:nil afterDelay:10.0];
        [self.brushTypeScrollView performSelector:@selector(autoShowBrushesTimerFired:) withObject:nil afterDelay:10.0];
    }
    else{
        [NSRunLoop cancelPreviousPerformRequestsWithTarget:self.brushTypeScrollView selector:@selector(autoShowBrushesTimerFired:) object:nil];
//        [self.autoShowBrushTimer invalidate];
//        self.autoShowBrushTimer = nil;
    }

}

- (void)willBrushTypeCurrentPageChanged:(NSInteger)page{
    self.previousBrushTypePageButton.hidden = (page <= 0);
    self.nextBrushTypePageButton.hidden = (page >= self.brushTypePageControl.numberOfPages - 1);
}

#pragma mark- 调色板代理SwatchManagerViewControllerDelegate
- (void)willSetSwatchFile:(NSURL *)url{
    if (url) {
        [self setSwatchFile:url];
    }

    [self.swatchManagerVC dismissViewControllerAnimated:YES completion:^{
        self.swatchManagerVC = nil;
    }];
}
#pragma mark-
//- (void)SaveAsSwatchFile:(NSURL *)url{
//    [self.swatchManagerButton.swatchColorDatas writeToURL:url atomically:YES];
//}

- (void)saveUserSwatch{
    NSMutableArray *colorDatas = [[NSMutableArray alloc]init];
    for (ADColorButton *colorButton in self.colorButtons) {
        NSString *colorData = [colorButton.color colorString];
        [colorDatas addObject:colorData];
    }
    [[NSUserDefaults standardUserDefaults] setObject:colorDatas forKey:@"defaultSwatch"];
}

-(void)loadUserSwatch{
    NSArray *defaultSwatch = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultSwatch"];
    if (!defaultSwatch) {
        //如果user default里没有默认调色板信息，从bundle中的Default.swatch中提取调色板
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"Default" withExtension:@"swatch"];
        if (url) {
            [self setSwatchFile:url];
        }
    }
    else{
        [self setSwatchData:defaultSwatch];
    }
    
    
}
- (void)newSwatch{
    int srcCount = self.colorButtons.count;
    for (int i = 0; i < 10; ++i) {
        ADColorButton* colorButton = [[ADColorButton alloc]initWithFrame:CGRectMake(50 * (i + srcCount), 0, 50, 50)];
        DebugLog(@"colorButton frame origin x:%.2f y:%.2f", colorButton.frame.origin.x, colorButton.frame.origin.y);
        colorButton.isEmpty = true;
        colorButton.color = [UIColor clearColor];
        [colorButton addTarget:self action:@selector(selectColor:) forControlEvents:UIControlEventTouchDown];
        [colorButton addTarget:self action:@selector(selectColorConfirmed:) forControlEvents:UIControlEventTouchUpInside];
        [colorButton addTarget:self action:@selector(selectColorCancel:) forControlEvents:UIControlEventTouchUpOutside];
        
        //创建颜色长按编辑手势
        UILongPressGestureRecognizer *longPressGRColorSlot = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressColorSlot:)];
        longPressGRColorSlot.delegate = self;
        longPressGRColorSlot.cancelsTouchesInView = true;
        longPressGRColorSlot.numberOfTouchesRequired = 1;
        [colorButton addGestureRecognizer:longPressGRColorSlot];
        
        [self.colorButtons addObject:colorButton];
        [self.colorSlotsScrollView addSubview:colorButton];
    }
    self.colorSlotsScrollView.contentSize = CGSizeMake(50*(srcCount + 10), 44);
    [self.colorSlotsScrollView setNeedsDisplay];
}


//创建调色板UI,设置调色板数据
- (void)setSwatchData:(NSArray*)colorDatas{
    //清理调色板
    if (self.colorButtons) {
        for (ADColorButton *button in self.colorButtons) {
            [button removeFromSuperview];
        }
        [self.colorButtons removeAllObjects];
    }
    else{
        self.colorButtons = [[NSMutableArray alloc]init];
    }
    self.colorSlotsScrollView.contentSize = CGSizeZero;
    
    //创建调色板
    NSUInteger size = 50;
    for (int i = 0; i < colorDatas.count; ++i) {
        ADColorButton* colorButton = [[ADColorButton alloc]initWithFrame:CGRectMake(size * i, 0, size, size)];
        colorButton.isAccessibilityElement = true;
        colorButton.accessibilityLabel = [NSString stringWithFormat:@"SwatchColor_%d",i];
        
        //// Color Declarations
        UIColor *color;
        if (i < colorDatas.count) {
            color = [UIColor colorWithString:colorDatas[i]];
            colorButton.isEmpty = false;
        }
        else{
            color = [UIColor clearColor];
            colorButton.isEmpty = true;
        }
        
        colorButton.color = color;
        
        [colorButton addTarget:self action:@selector(selectColor:) forControlEvents:UIControlEventTouchDown];
        [colorButton addTarget:self action:@selector(selectColorConfirmed:) forControlEvents:UIControlEventTouchUpInside];
        [colorButton addTarget:self action:@selector(selectColorCancel:) forControlEvents:UIControlEventTouchCancel];
        [colorButton addTarget:self action:@selector(selectColorToBlend:) forControlEvents:UIControlEventTouchUpOutside];
        
        //创建单击颜色进行混合手势
        UITapGestureRecognizer *tapGRColorSlot = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapColorSlot:)];
        tapGRColorSlot.delegate = self;
        tapGRColorSlot.cancelsTouchesInView = true;
        tapGRColorSlot.numberOfTouchesRequired = 1;
        tapGRColorSlot.numberOfTapsRequired = 1;
        [colorButton addGestureRecognizer:tapGRColorSlot];
        
        //        //创建双击颜色进行混合手势
        //        UITapGestureRecognizer *doubleTapGRColorSlot = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTapColorSlot:)];
        //        doubleTapGRColorSlot.delegate = self;
        //        doubleTapGRColorSlot.cancelsTouchesInView = true;
        //        doubleTapGRColorSlot.numberOfTouchesRequired = 1;
        //        doubleTapGRColorSlot.numberOfTapsRequired = 2;
        //        [colorButton addGestureRecognizer:doubleTapGRColorSlot];
        //        [tapGRColorSlot requireGestureRecognizerToFail:doubleTapGRColorSlot];
        
        //创建颜色长按编辑手势
        UILongPressGestureRecognizer *longPressGRColorSlot = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressColorSlot:)];
        longPressGRColorSlot.delegate = self;
        longPressGRColorSlot.cancelsTouchesInView = true;
        longPressGRColorSlot.numberOfTouchesRequired = 1;
        [colorButton addGestureRecognizer:longPressGRColorSlot];
        
        [self.colorButtons addObject:colorButton];
        [self.colorSlotsScrollView addSubview:colorButton];
    }
    
    self.colorSlotsScrollView.contentSize = CGSizeMake(size*ceilf((float)colorDatas.count / 10.0)*10, 44);
}

- (void)setSwatchFile:(NSURL*)url{
    //将颜色槽加入颜色槽ScrollView
    NSArray *colorDatas = [NSArray arrayWithContentsOfURL:url];
    
    //对colorDatas按照百分比进行排序
    NSArray *sortedColorDatas = [[[colorDatas sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id obj1, id obj2) {
        CGFloat percent1 = [[[(NSString*)obj1 componentsSeparatedByString:@"%"]lastObject]floatValue];
        CGFloat percent2 = [[[(NSString*)obj2 componentsSeparatedByString:@"%"]lastObject]floatValue];
        NSNumber *p1 = [NSNumber numberWithFloat:percent1];
        NSNumber *p2 = [NSNumber numberWithFloat:percent2];
        return [p1 compare:p2];
    }] reverseObjectEnumerator]allObjects];
    
    [self setSwatchData:sortedColorDatas];
    
    //更新调色板管理按钮
//    self.swatchManagerButton.swatchColorDatas = sortedColorDatas;
}

- (IBAction)swatchManagerButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_swatchManagerButtonTouchUp" identifier:sender];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"ExpandedSwatchManagerAvailable"]) {
        //调色板管理功能可用
        self.swatchManagerVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"SwatchManagerViewController"];
        self.swatchManagerVC.delegate = self;
        [self presentViewController:self.swatchManagerVC animated:YES completion:^{
        }];
    }
    else{
        [self openIAPWithProductFeatureIndex:7];
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"SwatchIAP", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"Pro Version", nil), nil];
//        alertView.tag = 1;
//        [alertView show];
    }
}

#pragma mark- 笔刷颜色Color
- (IBAction)selectColor:(ADColorButton *)sender {
    [RemoteLog logAction:@"PS_selectColor" identifier:sender];
    [sender enableHighlighted:true];
}

- (IBAction)selectColorConfirmed:(ADColorButton *)sender {
    [RemoteLog logAction:@"PS_selectColorConfirmed" identifier:sender];
    [sender enableHighlighted:false];
}
- (IBAction)selectColorToBlend:(ADColorButton *)sender {
    [RemoteLog logAction:@"PS_selectColorToBlend" identifier:sender];
    const CGFloat* srcColors = CGColorGetComponents(sender.color.CGColor);
    const CGFloat* dstColors = CGColorGetComponents(self.paintColorButton.color.CGColor);
    float blend = 0.1;
    float r = srcColors[0] * blend + dstColors[0] * (1 - blend);
    float g = srcColors[1] * blend + dstColors[1] * (1 - blend);
    float b = srcColors[2] * blend + dstColors[2] * (1 - blend);
    UIColor *newColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [self.paintView.brush setColor:newColor];
    
    [sender enableHighlighted:false];
    
}

- (IBAction)selectColorCancel:(ADColorButton *)sender {
    [RemoteLog logAction:@"PS_selectColorCancel" identifier:sender];
    [sender enableHighlighted:false];
}
#pragma mark- 笔刷半径Radius
- (IBAction)selectBrushRadius:(ADRadiusButton *)sender {
    [RemoteLog logAction:@"PS_selectBrushRadius" identifier:sender];
    self.paintView.brush.brushState.radius = sender.radius;
    [self.radiusSlider setValueByRadius:(float)sender.radius];
}

- (IBAction)slideBrushRadius:(ADRadiusSlider *)sender {
    [RemoteLog logAction:@"PS_slideBrushRadius" identifier:sender];
    self.paintView.brush.brushState.radius = [sender radiusByValue];
    
    //UI
    if (self.radiusIndicatorView.hidden) {
        self.radiusIndicatorView.hidden = false;
        
        [self.radiusIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.radiusIndicatorView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
        }];
    }

    [self.radiusIndicatorView setRadius:self.paintView.brush.brushState.radius];
}



- (IBAction)radiusSliderTouchDown:(ADRadiusSlider *)sender {
    [RemoteLog logAction:@"PS_radiusSliderTouchDown" identifier:sender];
    self.radiusIndicatorView.hidden = false;
}

- (IBAction)radiusSliderTouchUp:(ADRadiusSlider *)sender {
    [RemoteLog logAction:@"PS_radiusSliderTouchUp" identifier:sender];
    if (!self.radiusIndicatorView.hidden) {
        [self.radiusIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        self.radiusIndicatorView.hidden = true;
    }
}

- (IBAction)radiusSliderTouchUpOutside:(ADRadiusSlider *)sender {
    [RemoteLog logAction:@"PS_radiusSliderTouchUpOutside" identifier:sender];
    if (!self.radiusIndicatorView.hidden) {
        [self.radiusIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        self.radiusIndicatorView.hidden = true;
    }
}
#pragma mark- 笔刷透明Opacity
- (IBAction)slideBrushOpacity:(UISlider *)sender {
    [RemoteLog logAction:@"PS_slideBrushOpacity" identifier:sender];
    //根据不同的brush，设置不同的参数
    if ([self.paintView.brush isKindOfClass:[ADFinger class]] ||
        [self.paintView.brush isKindOfClass:[ADOilBrush class]]) {
//        DebugLogWarn(@"brushState.wet %.1f", 1.0 - powf((float)sender.value, 2));
        self.paintView.brush.brushState.wet =  MAX(1.0 - powf((float)sender.value, 3), 0.01);
    }
    else{
        self.paintView.brush.brushState.opacity = (float)sender.value;
    }
    
    //UI
    if (self.opacityIndicatorView.hidden) {
        self.opacityIndicatorView.hidden = false;
        
        [self.opacityIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.opacityIndicatorView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
        }];
    }
  
    [self.opacityIndicatorView setOpacity:sender.value];

}

- (IBAction)opacitySliderTouchDown:(ADOpacitySlider *)sender {
    [RemoteLog logAction:@"PS_opacitySliderTouchDown" identifier:sender];
    self.opacityIndicatorView.hidden = false;
}

- (IBAction)opacitySliderTouchUp:(ADOpacitySlider *)sender {
    [RemoteLog logAction:@"PS_opacitySliderTouchUp" identifier:sender];
    if (!self.opacityIndicatorView.hidden) {
        [self.opacityIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        self.opacityIndicatorView.hidden = true;
    }
}

- (IBAction)opacitySliderTouchUpOutside:(ADOpacitySlider *)sender {
    [RemoteLog logAction:@"PS_opacitySliderTouchUpOutside" identifier:sender];
    if (!self.opacityIndicatorView.hidden) {
        [self.opacityIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        self.opacityIndicatorView.hidden = true;
    }
}

-(void)setOpacitySliderValueWithBrushState:(ADBrushState*)brushState{
    //根据不同的brush，设置不同的参数
    if ([self.paintView.brush isKindOfClass:[ADFinger class]] ||
        [self.paintView.brush isKindOfClass:[ADOilBrush class]]) {
//        DebugLogWarn(@"opacityValue %.1f", 1.0 - sqrtf(brushState.wet));
        self.opacitySlider.value = 1.0 - powf(brushState.wet, 1.0/3.0);
    }
    else{
        self.opacitySlider.value = brushState.opacity;
    }
}
#pragma mark- 笔刷属性Property
//编辑笔刷属性
-(void)editBrush:(ADBrush *)brush{
    if (!brush.isEditable) {
        return;
    }
    
    if([self.sharedPopoverController isPopoverVisible]) return; //已经打开
    
    self.brushPropertyViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BrushPropertyViewController"];
    self.brushPropertyViewController.delegate = self;
    self.brushPropertyViewController.brushPreviewDelegate = self.paintView;
    CGFloat height = self.view.bounds.size.height - 90 * 2;
    self.brushPropertyViewController.preferredContentSize = CGSizeMake(256, height);
    self.brushPropertyViewController.brush = brush;
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:self.brushPropertyViewController];
    self.sharedPopoverController.delegate = self;
    CGRect frame = self.brushButtonTempRect;
    frame.origin.x += 3;
    frame.origin.y += 10;
    [self.sharedPopoverController presentPopoverFromRect:frame inView:self.paintToolView permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
    //    FuzzyTransparentView *rootView = (FuzzyTransparentView *)self.brushPropertyViewController.rootView;
    //    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];
    
}
#pragma mark- 笔刷属性代理 BrushPropertyViewController Delegate (Refresh UI)
-(void)willDismissBrushPropertyViewController{
    [self.sharedPopoverController dismissPopoverAnimated:true];
    
    UIView *brushButton = self.brushButton;
    [self.radiusSlider setValueByRadius:self.brushButton.brush.brushState.radius];
    [self setOpacitySliderValueWithBrushState:self.brushButton.brush.brushState];
    
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        brushButton.frame = CGRectMake(brushButton.frame.origin.x, 0, brushButton.frame.size.width, brushButton.frame.size.height);
    }completion:nil];
    
    //    [self.paintView.brush setCanvas:self.paintView]; //do in startDraw
}

//-(EAGLContext*)willGetBrushPreviewContext{
//    return self.paintView.context;
//}

-(void)willBrushShaderChanged:(ADBrushState*)brushState{

}

-(void)willBrushPropertyValueChanged:(ADBrushState*)brushState{
    //UI
    [self.radiusSlider setValueByRadius:brushState.radius];
    
    [self setOpacitySliderValueWithBrushState:brushState];
}

#pragma mark- 笔刷种类代理 BrushTypeScrollView Delegate (Refresh UI)
-(void)willBrushTypeScrollViewDidScroll:(UIScrollView *)scrollView{
    //    DebugLog(@"willBrushTypeScrollViewDidScroll");
    
    self.brushTypePageControl.currentPage = floorf(scrollView.contentOffset.x / scrollView.frame.size.width);
}

-(void)willSelectBrush:(id)sender{
    DebugLogFuncStart(@"willSelectBrush");
    
    ADBrushTypeButton* selButton = (ADBrushTypeButton*)sender;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (ADBrushTypeButton* button in self.brushTypeScrollView.subviews) {
            button.frame = CGRectMake(button.frame.origin.x, 20, button.frame.size.width, button.frame.size.height);
        }
        
        selButton.frame = CGRectMake(selButton.frame.origin.x, 0, selButton.frame.size.width, selButton.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)willSelectBrushDone:(id)sender{
    DebugLogFuncStart(@"willSelectBrushDone");
    
    ADBrushTypeButton* button = (ADBrushTypeButton*)sender;
    NSString *string = [NSString stringWithFormat:@"PS_selectBrushDone BrushId %d", button.brush.brushState.classId];
    [RemoteLog logAction:string identifier:sender];
    
    ADBrush *brushTemplate = button.brush;
    
    //检查笔刷是否可用
    if (!brushTemplate.available) {
        [self willSelectBrushCanceled:sender];
        
        //TODO:BrushPreview中有修改了brush的内容
//        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"ExpandedBrushPackageAvailable"];
        [self openIAPWithProductFeatureIndex:brushTemplate.iapProductFeatureId];
        
        return;
    }
    
    
    //UI
    ADBrush *brushCopy = [brushTemplate copy];
    //得到上一个记录的同类型的brushState
    ADBrushState *brushState =[[brushTemplate class] brushStateTemplate];
    if (brushState) {
        brushCopy.brushState = [brushState copy];
    }
    
    [self.paintView setBrush:brushCopy];
    [self.paintView.brush setColor:self.paintColorButton.color];
    //笔刷大小取自相同笔刷

    //取消自动展示
//    [self autoShowBrushes:false];
    
    [ADPaintUIKitAnimation view:self.view switchTopToolBarToView:self.mainToolBar completion:nil];
    [ADPaintUIKitAnimation view:self.view slideToolBarRightDirection:false outView:self.brushTypeView inView:self.paintToolView completion:^{
        _state = PaintScreen_Normal;
        //笔刷面板打开绘图
        self.rootCanvasView.userInteractionEnabled = true;
    }];
}

-(void)willSelectBrushCanceled:(id)sender{
    DebugLogFuncStart(@"willSelectBrushCanceled");
//    [self autoShowBrushes:false];
    
    //UI
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (ADBrushTypeButton* button in self.brushTypeScrollView.subviews) {
            button.frame = CGRectMake(button.frame.origin.x, 20, button.frame.size.width, button.frame.size.height);
        }
    } completion:^(BOOL finished) {
    }];
}
#pragma mark-
- (IBAction)syncBrushView:(id)sender {
    [RemoteLog logAction:@"PS_syncBrushView" identifier:sender];
}

- (IBAction)showPaint:(id)sender {
    [RemoteLog logAction:@"PS_showPaint" identifier:sender];
//    [paintView testSave];
}


#pragma mark- 文件操作
- (void)openDoc:(ADPaintDoc*)paintDoc{
    //DebugLog(@"openDoc");
    self.paintDoc = paintDoc;

    //制定绘制的paintData
    if (self.isReversePaint) {
        [self.paintView setOpenData:self.paintDoc.reverseData];
        self.reversePaint = [[ADReversePaint alloc]initWithPaintView:self.paintView srcPaintData:[self.paintDoc openData]];
    }
    else{
        [self.paintView setOpenData:[self.paintDoc openData]];
    }
    
    self.paintView.paintData.backgroundLayer.delegate = self;
    
    if (self.paintView.paintData.backgroundLayer.visible) {
        [self willClearColorChanged:[self.paintView.paintData.backgroundLayer.clearColor copy]];
    }
    else{
        [self willClearColorChanged:[UIColor blackColor]];
    }
    
}

-(void)updateDoc{
    [self.paintView uploadLayerDatas];
}

//保存文档和截图
- (void)saveDoc{
    //在paintView完成上传paintData后更新到paintDoc中，并保存paintDoc到磁盘,
    //将当前PaintDoc文件保存到.psf
    [self.paintDoc saveInfo];
    
    [self.paintDoc saveData];
    
    //刷新预览文件
    [self.paintDoc saveThumbImage:[self.paintView snapshotScreenToUIImageOutputSize:CGSizeMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5)]];
}

//自动保存工作环境和当前工作内容
- (void)prepareForAutoSave{
    //关闭打开的layePanel面板
    if (self.isReversePaint) {
//        if(self.sharedPopoverController && [self.sharedPopoverController.contentViewController isKindOfClass:[ADLayerTableViewController class]]){
//            [self.sharedPopoverController dismissPopoverAnimated:false];
//        }
    }
}

- (void)autoSave{
    DebugLogFuncStart(@"autoSave");
    DebugLogMem(@"will autoSave");
    
    [self saveWorkSpace];DebugLogMem(@"did saveWorkSpace");
    
    [self updateDoc];DebugLogMem(@"did updateDoc");

    //反向绘制转换并合成paintDoc
    if (self.isReversePaint) {
        //reversePaintData.layer-->texture
        self.paintDoc.data = [self.reversePaint combineReversePaintData];DebugLogMem(@"did combineReversePaintDataWithSrcPaintData");
        [self saveDoc];DebugLogMem(@"did saveDoc");
//        self.paintDoc.data = nil;
    }
    else{
        [self saveDoc];
    }
}

//关闭界面
-(void)close{
    DebugLogFuncStart(@"close");
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:NSLocalizedString(@"Save", nil) otherButtonTitles:NSLocalizedString(@"Cancel", nil), NSLocalizedString(@"DontSave", nil), nil];
    alertView.tag = 6;
    [alertView show];
    
    [self saveWorkSpace];
}

//关闭界面和文档
- (void)closeDoc{
    DebugLogFuncStart(@"closeDoc");
    [self.paintView transformCanvasReset];
    [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil];
    [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:^{
        //blocked by paintDoc close;
        
        [self.delegate willPaintScreenDissmissWithPaintDoc:self.paintDoc];
        DebugLog(@"dismissViewControllerAnimated");
        [self dismissViewControllerAnimated:true completion:^{
            DebugLog(@"dismissViewControllerAnimated done");//0.3s
            [self lockInteraction:false];
            [self.delegate willPaintScreenDissmissDoneWithPaintDoc:self.paintDoc];
            if (self.isReversePaint) {
                self.reversePaint = nil;
            }
        }];
    }];
}

- (void)closeDocCanceled{
    [self lockInteraction:false];
}
//不保存直接关闭文档
- (void)closeDocWithoutSave{
    [self closeDoc];
}

//保存并关闭文档
- (void)closeDocWithSave{
    
    [self updateDoc];
  
    //反向绘制转换并合成paintDoc
    if (self.isReversePaint) {
        self.paintDoc.data = [self.reversePaint combineReversePaintData];
        [self saveDoc];
//        self.paintDoc.data = nil;
    }
    else{
        [self saveDoc];
    }
    
    
    [self closeDoc];
}

#pragma mark- 工作环境
-(void)loadWorkSpace{
    //保存颜色按钮 到workspace.plist
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistFilePath = [documentsDirectory stringByAppendingPathComponent:@"Workspace.plist"];
    if([[NSFileManager defaultManager] fileExistsAtPath:plistFilePath]){
        self.workspace = [NSMutableDictionary dictionaryWithContentsOfFile:plistFilePath]; 
    }
    else{
        //createWorkSpace
        //取出Workspace模版，添加内容
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Workspace" ofType:@"plist"];
        self.workspace = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
//        NSMutableArray *swatchArray = [self.workspace mutableArrayValueForKey:@"swatchs"];
//        for (int i = 0; i < swatchCount; ++i) {
//            UIColor* swatch = [UIColor colorWithRed:swatchs[i*3]/255.0 green:swatchs[i*3+1]/255.0 blue:swatchs[i*3+2]/255.0 alpha:1.0];
//            NSData *swatchData = [NSKeyedArchiver archivedDataWithRootObject:swatch];
//            [swatchArray addObject:swatchData];
//        }
        [self.workspace writeToFile:plistFilePath atomically:YES];
    }
    
    //从user document目录workspace.plist中取出保存的颜色，如果是第一次使用无workspace.plist则创建workspace.plist
    [self loadUserSwatch];
}

//保存工作空间文件，工作空间记录包括颜色设置，绘图设置等各种Preference
-(void)saveWorkSpace{
    //保存颜色按钮 到workspace.plist
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistFilePath = [documentsDirectory stringByAppendingPathComponent:@"Workspace.plist"];

    if([[NSFileManager defaultManager] fileExistsAtPath:plistFilePath])
    {
        //already exits
//        NSMutableArray *swatchArray = [self.workspace mutableArrayValueForKey:@"swatchs"];
//        [swatchArray removeAllObjects];
//        for (int i = 0; i < self.colorButtons.count; ++i) {
//            ColorButton *colorButton = [self.colorButtons objectAtIndex:i];
//            if (!colorButton.isEmpty) {
//                NSData *swatchData = [NSKeyedArchiver archivedDataWithRootObject:colorButton.color];
//                [swatchArray addObject:swatchData];
//            }
//        }
        
        [self.workspace writeToFile:plistFilePath atomically: YES];
    }
    else{
        DebugLog(@"Workspace.plist is missing");
    }
    
    //保存当前调色板到默认调色板
    [self saveUserSwatch];
    
    //保存当前笔刷
    [[NSUserDefaults standardUserDefaults] setInteger:self.paintView.brush.brushState.classId forKey:@"UsingBrushId"];
    
//    NSMutableData *data = [[NSMutableData alloc] init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    [archiver encodeObject:self.paintView.brush.brushState forKey:@"UsingBrushStateKey"];
//    [[NSUserDefaults standardUserDefaults] setObject:archiver forKey:@"UsingBrushState"];
    
    //保存备用笔刷
    [[NSUserDefaults standardUserDefaults] setInteger:self.brushBackButton.brush.brushState.classId forKey:@"BackBrushId"];
}

//TODO:实现代理
//- (void)exportToAirPrint{
//    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:self.view.frame.size];
//    //convert UIImage to NSData to add it as attachment
//    NSData *data = UIImagePNGRepresentation(image);
//    
//    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
//    
//    if  (pic && [UIPrintInteractionController canPrintData: data] ) {
//        
//        pic.delegate = self;
//        
//        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
//        printInfo.outputType = UIPrintInfoOutputGeneral;
//        printInfo.jobName = [NSString stringWithFormat:@"image%lu", (unsigned long)image.hash];
//        printInfo.duplex = UIPrintInfoDuplexLongEdge;
//        pic.printInfo = printInfo;
//        pic.showsPageRange = YES;
//        pic.printingItem = data;
//        
//        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
//            
//            if (!completed && error)
//                DebugLog(@"FAILED! due to error in domain %@ with error code %u",error.domain, error.code);
//        };
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
////            [pic presentFromBarButtonItem:self.printButton animated:YES completionHandler:completionHandler];
//            [pic presentFromRect:CGRectMake(0, self.view.frame.size.height - 66, 66, 66) inView:self.view animated:true completionHandler:completionHandler];
//        } else {
//            [pic presentAnimated:YES completionHandler:completionHandler];
//        }
//    }
//}



#pragma mark- 通用交互 Common UX
- (IBAction)customLayerButtonTouchCancel:(ADAutoRotateButton *)sender {
    //    [RemoteLog logAction:@"customLayerButtonTouchCancel" identifier:sender];
    //    [(AutoRotateButton*)sender setHighlighted:false];
}
- (IBAction)customLayerButtonTouchUpOutside:(ADAutoRotateButton *)sender {
    //    [RemoteLog logAction:@"customLayerButtonTouchUpOutside" identifier:sender];
    //    [(AutoRotateButton*)sender setHighlighted:false];
}
- (IBAction)customLayerButtonTouchDown:(ADAutoRotateButton *)sender {
    //    [RemoteLog logAction:@"customLayerButtonTouchDown" identifier:sender];
    //    [(AutoRotateButton*)sender setHighlighted:true];
}

#pragma mark- 导入 Import
- (IBAction)importButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_importButtonTouchUp" identifier:sender];
    
    if (![self checkInsertAvailable]) {
        return;
    }
    
    sender.selected = true;
    
    ADImportTableViewController* importTableViewController = [[ADImportTableViewController alloc]initWithStyle:UITableViewStylePlain];
    importTableViewController.delegate = self;
    importTableViewController.tableView.scrollEnabled = false;

    importTableViewController.preferredContentSize = CGSizeMake(320, importTableViewController.tableViewHeight);
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:importTableViewController];
    self.sharedPopoverController.delegate = self;
    [self.sharedPopoverController presentPopoverFromRect:self.importButton.bounds inView:self.importButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void) didSelectImportPhoto{
    [RemoteLog logAction:@"PS_didSelectImportPhoto" identifier:nil];
    [self.sharedPopoverController dismissPopoverAnimated:true];    
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

-(void) didSelectImportCamera{
    [RemoteLog logAction:@"PS_didSelectImportCamera" identifier:nil];
    [self.sharedPopoverController dismissPopoverAnimated:true];
    self.importButton.selected = false;
    [self.importButton.layer setNeedsDisplay];
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

-(void) didSelectImportDropbox{
    [RemoteLog logAction:@"PS_didSelectImportDropbox" identifier:nil];
    [self.sharedPopoverController dismissPopoverAnimated:true];
    self.importButton.selected = false;
    [self.importButton.layer setNeedsDisplay];
    [[DBChooser defaultChooser] openChooserForLinkType:DBChooserLinkTypePreview
                                    fromViewController:self completion:^(NSArray *results)
     {
         if ([results count]) {
             // Process results from Chooser
             DBChooserResult *result = (DBChooserResult *)[results objectAtIndex:0];
             
             NSError *error = nil;
             NSData *imageData = [NSData dataWithContentsOfURL:result.link options:NSDataReadingMapped error:&error];
             if (imageData == nil) {
                 DebugLog(@"Error loading file: %@", [error localizedDescription]);
             }
             
//             NSData *imageData = [NSData dataWithContentsOfURL:result.link];

             UIImage *image = [UIImage imageWithData:imageData];

             if (image != nil) {
                 //将UIImage转换
                 [self.paintView insertUIImageAtCurLayer:image];
                 
                 //添加编辑Done按钮在导入图片的中心
                 CGRect rect = [self.paintView calculateLayerContentRect];
                 
                 if(CGRectEqualToRect(rect, CGRectZero)){
                     return;
                 }
                 [self enterTransformImageState:rect];
             }
             else{
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"InvalidImageWarning", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil, nil];
                 alertView.tag = 2;
                 [alertView show];
             }
             
         } else {
             // User canceled the action
         }
     }];
    
}

#pragma mark- 拍照 Take Photo
- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) ctrlDelegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (ctrlDelegate == nil)
        || (controller == nil))
        return NO;
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    self.cameraImagePickerVC = cameraUI;
    cameraUI.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
    //    cameraUI.mediaTypes =
    //    [UIImagePickerController availableMediaTypesForSourceType:
    //     UIImagePickerControllerSourceTypeCamera];
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
    
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.showsCameraControls = YES;
    
    cameraUI.delegate = ctrlDelegate;
    //    [self addChildViewController:cameraUI];
    
   [controller presentViewController:cameraUI animated:true completion:nil];
    return YES;
}

#pragma mark- 取图片 UIImagePickerControllerDelegate
// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [RemoteLog logAction:@"PS_imagePickerControllerDidCancel" identifier:picker];
    [self dismissViewControllerAnimated:true completion:^{
        self.cameraImagePickerVC = nil;
    }];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    self.importButton.selected = false;
    [self.importButton.layer setNeedsDisplay];
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    __block UIImage *finalImage;
    
    // Handle a still image capture
    
    if ([mediaType isEqualToString:(NSString*)kUTTypeImage]) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        //获得图像
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
//        CGFloat w = CGImageGetWidth(imageToSave.CGImage);
//        CGFloat h = CGImageGetHeight(imageToSave.CGImage);
//        DebugLog(@"camera image w %f h %f", w, h);
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            [RemoteLog logAction:@"PS_imagePickerControllerDidFinishPickingImageFromCamera" identifier:picker];
            // Save the new image (original or edited) to the Camera Roll
            ALAssetsLibrary* library = [[ALAssetsLibrary alloc]init];
            [library writeImageToSavedPhotosAlbum:imageToSave.CGImage orientation:ALAssetOrientationRight completionBlock:^(NSURL *assetURL, NSError *error){
                if (error) {
                    DebugLogError(@"writeImageToSavedPhotosAlbum error");
                }
                else {
                    DebugLogWriteSuccess(@"writeImageToSavedPhotosAlbum url %@", assetURL);
                    [library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
                        ALAssetRepresentation *assetRep = [asset defaultRepresentation];
                        finalImage = [UIImage imageWithCGImage:[assetRep fullResolutionImage]];
                        finalImage = [[UIImage alloc] initWithCGImage: finalImage.CGImage scale: 1.0 orientation: UIImageOrientationRight];
                        finalImage = [finalImage resizedImage:finalImage.size interpolationQuality:kCGInterpolationDefault];
                        [self importEditImage:finalImage];
                        
                    } failureBlock:^(NSError *error) {
                        DebugLogError(@"readImageFromPhotosAlbum error %@", [error localizedDescription]);
                    }];
                }
            }];
            library = nil;
            [self dismissViewControllerAnimated:true completion:^{
                self.cameraImagePickerVC = nil;
            }];
        }
        else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
            [RemoteLog logAction:@"PS_imagePickerControllerDidFinishPickingImageFromPhotoLibrary" identifier:picker];
            finalImage = imageToSave;
            if (self.subPopoverController) {
                [self.subPopoverController dismissPopoverAnimated:true];
            }
            
            [self importEditImage:finalImage];
        }
    }
}

- (void)importEditImage:(UIImage *)image{
    DebugLogFuncStart(@"importEditImage");
    
    //将UIImage转换
    [self.paintView insertUIImageAtCurLayer:image];
    
    
    //添加编辑Done按钮在导入图片的中心
    CGRect rect = [self.paintView calculateLayerContentRect];
    
    if(CGRectEqualToRect(rect, CGRectZero)){
        return;
    }
    [self enterTransformImageState:rect];
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) ctrlDelegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (ctrlDelegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
        imagePicker.allowsEditing = NO;
        imagePicker.delegate = self;
        ADSharedPopoverController *popover = [[ADSharedPopoverController alloc] initWithContentViewController:imagePicker];
        self.subPopoverController = popover;
        self.subPopoverController.delegate = self;
        
        [popover presentPopoverFromRect:self.importButton.bounds inView:self.importButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        return YES;
    }else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"NoAccessPhotoLibrary", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Close", nil) otherButtonTitles:nil];
        [alert show];
        return NO;
    }
}

#pragma NavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}
#pragma mark- 导出 Export
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(result == MFMailComposeResultCancelled)
        [RemoteLog logAction:@"PS_Mail cancelled" identifier:controller];
    else if(result == MFMailComposeResultSaved)
        [RemoteLog logAction:@"PS_Mail saved" identifier:controller];
    else if(result == MFMailComposeResultSent)
        [RemoteLog logAction:@"PS_Mail sent" identifier:controller];
    else if(result == MFMailComposeResultFailed)
        [RemoteLog logAction:@"PS_Mail failed" identifier:controller];
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)exportButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_exportButtonTouchUp" identifier:sender];
    sender.selected = true;
    
    ADExportTableViewController* exportTableViewController = [[ADExportTableViewController alloc]initWithStyle:UITableViewStylePlain];
    exportTableViewController.tableView.scrollEnabled = false;
    exportTableViewController.delegate = self;
    
    exportTableViewController.preferredContentSize = CGSizeMake(320, exportTableViewController.tableViewHeight);
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:exportTableViewController];
    self.sharedPopoverController.delegate = self;
    [self.sharedPopoverController presentPopoverFromRect:self.exportButton.bounds inView:self.exportButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void) didSelectExportToEmail{
    [RemoteLog logAction:@"PS_didSelectExportToEmail" identifier:nil];
    if (![MFMailComposeViewController canSendMail]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"MailAccountNotAvailabel", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    self.exportButton.selected = false;
    [self.exportButton.layer setNeedsDisplay];
    
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    NSString *postText = NSLocalizedString(@"EmailMessageSubject", nil);
    [picker setSubject:postText];
    [picker setMessageBody:NSLocalizedString(@"EmailMessageBody", nil) isHTML:YES];
    
    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:self.view.frame.size];
    //convert UIImage to NSData to add it as attachment
    NSData *imageData = UIImagePNGRepresentation(image);
    
    //this is how to attach any data in mail, remember mimeType will be different
    //for other data type attachment.
    
    [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"image.png"];
    
    //showing MFMailComposerView here
    [self.sharedPopoverController dismissPopoverAnimated:true];
    [self presentViewController:picker animated:true completion:^{
    }];
}

- (void) savedPhotoImage:(UIImage*)image didFinishSavingWithError: (NSError *)error contextInfo: (void *)contextInfo{
    if (error) {
        DebugLogError(@"Error save image %@", [error localizedDescription]);
    }
    else{
        DebugLogWriteSuccess(@"didFinishSaving");
        //更新UI
        [self.sharedPopoverController dismissPopoverAnimated:true];
    }
}

-(void) didSelectExportToPhotoLibrary{
    [RemoteLog logAction:@"PS_didSelectExportToPhotoLibrary" identifier:nil];
    self.exportButton.selected = false;
    [self.exportButton.layer setNeedsDisplay];
    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:), nil);
}

-(void) didSelectExportToDropbox{
    [RemoteLog logAction:@"PS_didSelectExportToDropbox" identifier:nil];
    self.exportButton.selected = false;
    [self.exportButton.layer setNeedsDisplay];
//    [self exportToEmail];
}

- (void)didSelectExportToSocialName:(NSString*)socialName{
    [RemoteLog logAction:[NSString stringWithFormat:@"PS_didSelectPostTo%@", socialName] identifier:nil];
    self.exportButton.selected = false;
    [self.exportButton.layer setNeedsDisplay];
    
    NSString *socialType = nil;
    if ([socialName isEqualToString:@"Facebook"]) {
        socialType = SLServiceTypeFacebook;
    }
    else if ([socialName isEqualToString:@"Twitter"]) {
        socialType = SLServiceTypeTwitter;
    }
    else if ([socialName isEqualToString:@"SinaWeibo"]) {
        socialType = SLServiceTypeSinaWeibo;
    }
    else if ([socialName isEqualToString:@"TencentWeibo"]) {
        socialType = SLServiceTypeTencentWeibo;
    }
    
    if([SLComposeViewController isAvailableForServiceType:socialType]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:socialType];
        
        NSString *postText = NSLocalizedString(@"ShareMessageBody", nil);
        [controller setInitialText:postText];
        
        UIImage *image = [self paintImageForPostInSocial];
        [controller addImage:image];
        
        NSURL *appURL = [NSURL URLWithString:PRODUCT_INFO_INTRODUCTION];
        [controller addURL:appURL];
        
        [controller setCompletionHandler:^(SLComposeViewControllerResult result){
            [RemoteLog logAction:[NSString stringWithFormat:@"PS_exported to %@", socialName] identifier:nil];
        }];
        [self.sharedPopoverController dismissPopoverAnimated:true];
        [self presentViewController:controller animated:YES completion:^{
        }];
    }
    else{
        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.exportButton.selected = false;
        NSString *messageKey = [NSString stringWithFormat:@"%@NotInstalled", socialName];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(messageKey, nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
}

-(UIImage*)paintImageForPostInSocial{
    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:self.view.frame.size];
    //resize image to fit display in facebook
    return image;
}
#pragma mark- 变换 Transform
- (void)transformImageStartWithPoint0:(CGPoint)p0 point1:(CGPoint)p1 forceImageCenterAnchor:(BOOL)forceImageCenterAnchor{
   
    _twoFingerCenterBegan = CGPointMake((p0.x + p1.x) * 0.5, (p0.y + p1.y) * 0.5);
    _twoFingerDistanceBegan = GLKVector2Distance(GLKVector2Make(p0.x, p0.y), GLKVector2Make(p1.x, p1.y));
    _twoFingerVecBegan = _twoFingerVecLast = GLKVector2Make(p1.x - p0.x, p1.y - p0.y);
    
    //强制以图片中心作为变换点
    CGPoint twoPointCenter = _twoFingerCenterBegan;
    if (forceImageCenterAnchor) {
        twoPointCenter = [self.paintView convertPoint:self.transformContentView.center fromView:self.rootCanvasView];
    }
    
    //center设置成paintView.center会导致错误
    CGPoint center = CGPointMake(self.paintView.bounds.size.width * 0.5, self.paintView.bounds.size.height * 0.5);
    CGPoint anchorPoint = CGPointMake(twoPointCenter.x - center.x, twoPointCenter.y - center.y);
    
    [self.paintView transformImageBeganAnchorPoint:anchorPoint];
}

- (TransformInfo)transformImageWithPoint0:(CGPoint)p0 point1:(CGPoint)p1 enableTranslate:(BOOL)enableTranslate enableRotate:(BOOL)enableRotate enableScale:(BOOL)enableScale scaleMode:(ScaleMode)scaleMode enableAnchor:(BOOL)enableAnchor{
    DebugLog(@"transformImageWith p0 Tx:%.1f Ty:%.1f p1 Tx:%.1f Ty:%.1f", p0.x, p0.y, p1.x, p1.y);
    
    CGFloat rotate = 0;
    CGPoint scale = CGPointMake(1, 1);
    CGPoint translate = CGPointZero;
//    CGPoint anchorPoint = CGPointZero;
    
    
    if (enableTranslate) {
        CGPoint center = CGPointMake((p0.x + p1.x) * 0.5, (p0.y + p1.y) * 0.5);
        translate = CGPointMake(center.x - _twoFingerCenterBegan.x, center.y - _twoFingerCenterBegan.y);
    }
    
    if (enableRotate) {
        //rotation
        GLKVector2 twoFingerVec = GLKVector2Make(p1.x - p0.x, p1.y - p0.y);
        //如果前一帧和当前帧两点相反
        if(GLKVector2DotProduct(twoFingerVec, _twoFingerVecLast) < 0){
            twoFingerVec = GLKVector2Make(p0.x - p1.x, p0.y - p1.y);
        }
        _twoFingerVecLast = twoFingerVec;
        rotate = atan2f(_twoFingerVecBegan.y, _twoFingerVecBegan.x) - atan2f(twoFingerVec.y, twoFingerVec.x);
    }
    
    if (enableScale) {
        CGFloat reverseX = (p1.x - p0.x) * _twoFingerVecLast.x < 0 ? -1 : 1;
        CGFloat reverseY = (p1.y - p0.y) * _twoFingerVecLast.y < 0 ? -1 : 1;
        
        float s = GLKVector2Distance(GLKVector2Make(p0.x, p0.y), GLKVector2Make(p1.x, p1.y)) / _twoFingerDistanceBegan;
        if (scaleMode == ScaleMode_X) {
            scale.x = s * reverseX;

        }
        else if (scaleMode == ScaleMode_Y) {
            scale.y = s * reverseY;
        }
        else if (scaleMode == ScaleMode_XX) {
            scale.x = s * reverseX;
            scale.y = s * reverseY;
        }
        else if (scaleMode == ScaleMode_XY) {
            //no rotation and free scale
            CGPoint twoFingerVec = CGPointMake(p1.x - p0.x, p1.y - p0.y);
            CGFloat scaleX,scaleY;
            if(fabs(_twoFingerVecBegan.x) < 0.0001){
                scaleX = 1.0;
            }
            else{
                scaleX = twoFingerVec.x / _twoFingerVecBegan.x;
            }
            
            if(fabs(_twoFingerVecBegan.y) < 0.0001){
                scaleY = 1.0;
            }
            else{
                scaleY = twoFingerVec.y / _twoFingerVecBegan.y;
            }
            scale = CGPointMake(scaleX * reverseX, scaleY * reverseY);
        }

    }

    CGRect bounds = CGRectMake(0, 0, self.transformContentViewSrcBounds.size.width * scale.x, self.transformContentViewSrcBounds.size.height * scale.y);
    self.transformContentView.bounds = bounds;
    [self.transformContentView.layer setNeedsLayout];
    [self.transformContentView.layer setNeedsDisplay];
   
    return [self.paintView freeTransformImageTranslate:translate rotate:rotate scale:scale anchorPoint:CGPointZero];
}

- (void)removeTransformHelperViews{
    [self.transformContentView.layer removeAllAnimations];
    [self.transformContentView removeFromSuperview];
    [self setTransformContentView:nil];

    
    for (ADTransformAnchorView *view in self.transformAnchorViews) {
        [view removeFromSuperview];
    }
    [self.transformAnchorViews removeAllObjects];
    self.transformAnchorViews = nil;
}

//根据transform的内容在屏幕上的大小更新矛点的大小
- (void)updateTransformAnchorViewSize:(CGRect)rect{
    CGRect rectInCanvas = [self.rootCanvasView convertRect:rect fromView:self.paintView];
    CGFloat minSize = MIN(rectInCanvas.size.width, rectInCanvas.size.height) * 0.2;
    self.transformAnchorViewSize = MAX(10, MIN(minSize, 30));
}
- (void)createTransformHelperViews:(CGRect)rect{
   
    [self createTransformContentViewWithRect:rect];

    //创建九个锚点用于变换
    CGFloat minX = CGRectGetMinX(rect);
    CGFloat midX = CGRectGetMidX(rect);
    CGFloat maxX = CGRectGetMaxX(rect);
    CGFloat minY = CGRectGetMinY(rect);
    CGFloat midY = CGRectGetMidY(rect);
    CGFloat maxY = CGRectGetMaxY(rect);
    
    [self updateTransformAnchorViewSize:rect];

    self.transformAnchorViews = [[NSMutableArray alloc]init];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(minX, minY) tag:0];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(midX, minY) tag:1];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(maxX, minY) tag:2];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(minX, midY) tag:3];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(midX, midY) tag:4];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(maxX, midY) tag:5];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(minX, maxY) tag:6];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(midX, maxY) tag:7];
    
    [self createTransformAnchorViewWithOrigin:CGPointMake(maxX, maxY) tag:8];
    
    UIView *view = [self.transformAnchorViews objectAtIndex:4];
    view.hidden = true;

}

- (void)createTransformContentViewWithRect:(CGRect)rect{
    //创建一个UIView 作为layerContentRect的显示外框 确保RootCanvasView不勾选ClipSubviews
    NSNumber *R = [self.paintView.layer valueForKeyPath:@"transform.rotation"];
    NSNumber *Sx = [self.paintView.layer valueForKeyPath:@"transform.scale.x"];
    NSNumber *Sy = [self.paintView.layer valueForKeyPath:@"transform.scale.y"];
//    NSNumber *Tx = [self.paintView.layer valueForKeyPath:@"transform.translation.x"];
//    NSNumber *Ty = [self.paintView.layer valueForKeyPath:@"transform.translation.y"];
//    DebugLog(@"paintView layer translate %.1f %.1f", Tx.floatValue, Ty.floatValue);
//    DebugLog(@"paintView layer frame under rootCanvas %@", NSStringFromCGRect(self.paintView.layer.frame));
    
    CGPoint center = CGPointMake(rect.origin.x + rect.size.width * 0.5, rect.origin.y + rect.size.height * 0.5);
    center = [self.rootCanvasView convertPoint:center fromView:self.paintView];
    rect.size.width *= Sx.floatValue;
    rect.size.height *= Sy.floatValue;
    rect.origin = CGPointMake(center.x - rect.size.width * 0.5, center.y - rect.size.height * 0.5);
//    DebugLog(@"frame under rootCanvas %@", NSStringFromCGRect(rect));
    
    ADTransformContentView *transformContentView = [[ADTransformContentView alloc]initWithFrame:rect];
    [self.rootCanvasView addSubview:transformContentView];
    
//    Tx = [self.paintView.layer valueForKeyPath:@"transform.translation.x"];
//    Ty = [self.paintView.layer valueForKeyPath:@"transform.translation.y"];
//    DebugLog(@"new paintView layer translate %.1f %.1f", Tx.floatValue, Ty.floatValue);
//    DebugLog(@"paintView layer frame under rootCanvas %@", NSStringFromCGRect(self.paintView.layer.frame));
    
    self.transformContentView = transformContentView;
    [self.transformContentView.layer setValue:R forKeyPath:@"transform.rotation"];
    
    self.transformContentViewSrcRotate = R.floatValue;
    
    [self setTransformContentViewAnimRecursive];
}

- (void)createTransformAnchorViewWithOrigin:(CGPoint)origin tag:(NSUInteger)tag{
    CGFloat size = self.transformAnchorViewSize;
    CGFloat offset = size * 0.5;
    CGPoint newOrigin = [self.rootCanvasView convertPoint:origin fromView:self.paintView];
    CGRect frame = CGRectMake(newOrigin.x - offset, newOrigin.y - offset, size, size);
    ADTransformAnchorView *transformAnchorView = [[ADTransformAnchorView alloc] initWithFrame:frame];
    transformAnchorView.tag = tag;
    UIPanGestureRecognizer *pgrTransformAnchorView = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanTransformAnchorView:)];
    pgrTransformAnchorView.delegate = self;
    pgrTransformAnchorView.cancelsTouchesInView = true;
    pgrTransformAnchorView.minimumNumberOfTouches = pgrTransformAnchorView.maximumNumberOfTouches = 1;
    [transformAnchorView addGestureRecognizer:pgrTransformAnchorView];
    
    [self.rootCanvasView addSubview:transformAnchorView];
    [self.transformAnchorViews addObject:transformAnchorView];
}

- (void)updateTransformContentViews{
    
}

- (void)updateAllTransformAnchorViews{
    CGRect layerContentRect = self.transformContentView.bounds;
    layerContentRect.origin = CGPointMake(-self.transformContentView.bounds.size.width * 0.5, -self.transformContentView.bounds.size.height * 0.5);

    //创建九个锚点用于变换
    CGFloat minX = CGRectGetMinX(layerContentRect);
    CGFloat midX = CGRectGetMidX(layerContentRect);
    CGFloat maxX = CGRectGetMaxX(layerContentRect);
    CGFloat minY = CGRectGetMinY(layerContentRect);
    CGFloat midY = CGRectGetMidY(layerContentRect);
    CGFloat maxY = CGRectGetMaxY(layerContentRect);
    
    [self updateTransformAnchorViewSize:layerContentRect];
    CGFloat size = self.transformAnchorViewSize;
    CGFloat offset = size * 0.5;
    CGAffineTransform transform = self.transformContentView.layer.affineTransform;
    
    ADTransformAnchorView *leftTopAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:0];
    CGPoint center = CGPointMake(minX, minY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    leftTopAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);
    
    ADTransformAnchorView *midTopAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:1];
    center = CGPointMake(midX, minY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    midTopAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *rightTopAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:2];
    center = CGPointMake(maxX, minY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    rightTopAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *leftMidAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:3];
    center = CGPointMake(minX, midY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    leftMidAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *midMidAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:4];
    center = CGPointMake(midX, midY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    midMidAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *rightMidpAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:5];
    center = CGPointMake(maxX, midY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    rightMidpAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *leftBottomAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:6];
    center = CGPointMake(minX, maxY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    leftBottomAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *midBottomAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:7];
    center = CGPointMake(midX, maxY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    midBottomAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    ADTransformAnchorView *rightBottompAnchor = (ADTransformAnchorView *)[self.transformAnchorViews objectAtIndex:8];
    center = CGPointMake(maxX, maxY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    rightBottompAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

}
- (void)showAllTransformAnchorViews{
    for (ADTransformAnchorView *view in self.transformAnchorViews) {
        if (view.tag == 4) {
            view.hidden = true;
            continue;
        }
        view.hidden = false;
    }
    
}
- (void)showTransformAnchorViewExclusiveByIndex:(NSInteger)index{
    DebugLogWarn(@"showTransformAnchorViewExclusiveByIndex %d", index);
    for (ADTransformAnchorView *view in self.transformAnchorViews) {
        if (view.tag == index) {
            view.hidden = false;
            continue;
        }
        view.hidden = true;

    }
    
}

- (void)setTransformContentViewAnimRecursive{
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:10.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    [CATransaction setCompletionBlock:^{
//        //TODO:循环调用导致无法释放transformContentView
////        if (self.transformContentView != nil) {
////            [self setTransformContentViewAnimRecursive];
////        }
//    }];
//    
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"phase"];
//    
//    //    anim.fromValue = [NSNumber numberWithFloat:0];
//    anim.toValue = [NSNumber numberWithFloat:120];
//    
//    [self.transformContentView.layer removeAnimationForKey:@"phase"];
//    [self.transformContentView.layer addAnimation:anim forKey:@"phase"];
//    
//    ((ADTransformContentViewLayer*)self.transformContentView.layer).phase = 120;
//    
//    [CATransaction commit];
    
    ((ADTransformContentViewLayer*)self.transformContentView.layer).phase = 120;
    [self.transformContentView.layer setNeedsDisplay];
}

//- (void)startChangeTransformState:(BOOL)enter{
//    self.mainToolBar.userInteractionEnabled = true;
//}
//- (void)endChangeTransformState{
//    self.mainToolBar.userInteractionEnabled = true;
//}

- (void)enterTransformLayerState:(CGRect)rect{
    _state = PaintScreen_Transform;
    
    //UI
    [self createTransformHelperViews:rect];
    
    self.transformButton.selected = true;
    [self.transformButton.layer setNeedsDisplay];
    
    [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:^{
        [self lockInteraction:false];
    }];

    //交互
    UIView* mainToolView = [self.mainToolBar.subviews objectAtIndex:0];
    for (UIView* view in mainToolView.subviews) {
        if ([view isEqual:self.transformButton]) {
            continue;
        }
        view.userInteractionEnabled = false;
    }
    
    self.pgr1TouchesPaintView.enabled = false;
}

//TODO: not confirmed function
- (void)enterTransformImageState:(CGRect)rect{
    _state = PaintScreen_Transform;

    //UI
    [self createTransformHelperViews:rect];
    
    //隐藏MainToolBar PaintToolBar
    self.transformButton.selected = true;
    [self.transformButton.layer setNeedsDisplay];
    [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:^{
        self.mainToolBar.userInteractionEnabled = true;
    }];

    //交互
    UIView* mainToolView = [self.mainToolBar.subviews objectAtIndex:0];
    for (UIView* view in mainToolView.subviews) {
        if ([view isEqual:self.transformButton]) {
            continue;
        }
        view.userInteractionEnabled = false;
    }
    self.pgr1TouchesPaintView.enabled = false;
}
- (void)leaveTransformState{
    _state = PaintScreen_Normal;
    
    self.transformButton.selected = false;
    [self.transformButton.layer setNeedsDisplay];
    [ADPaintUIKitAnimation view:self.view switchDownToolBarToView:self.paintToolBar completion:^{
        [self lockInteraction:false];
    }];
    
    [self removeTransformHelperViews];
    
    //交互
    UIView* mainToolView = [self.mainToolBar.subviews objectAtIndex:0];
    for (UIView* view in mainToolView.subviews) {
        view.userInteractionEnabled = true;
    }
    self.pgr1TouchesPaintView.enabled = true;
}

- (IBAction)transformButtonTouchUp:(id)sender {
    [RemoteLog logAction:@"PS_transformButtonTouchUp" identifier:sender];
    
    if (_state == PaintScreen_Normal) {
        //计算当前层的bounding box,并根据bounding box大小创建transform外框
        CGRect rect = [self.paintView calculateLayerContentRect];

        if(CGSizeEqualToSize(rect.size, CGSizeZero)){
            return;
        }

        [self lockInteraction:true];
        
        //UI
        [self.paintView beforeTransformLayer];

        //UI
        //TODO:禁止除TransformButton以外的按钮的交互
        [self enterTransformLayerState:rect];
    }
    else if (_state == PaintScreen_Transform){
        [self lockInteraction:true];

        PaintingViewState paintViewState = self.paintView.state;
        [self.paintView transformImageLayerDone];
        if (paintViewState == PaintView_TouchTransformImage) {
            [self.paintView resetUndoRedo];
        }

        //UI
        [self leaveTransformState];
    }

}

//deprecated
- (void)updateAnchor{
    //中心点
    _transformAnchor = [self.paintView imageScaleAnchor];
    CGPoint anchorInRootView = [self.rootCanvasView convertPoint:_transformAnchor fromView:self.paintView];
    self.anchorView.frame = CGRectMake(anchorInRootView.x - self.anchorView.frame.size.width * 0.5, anchorInRootView.y -  self.anchorView.frame.size.height * 0.5, self.anchorView.frame.size.width, self.anchorView.frame.size.height);
}


- (void)showZoomCanvasUI:(BOOL)enable{
    self.zoomCanvasView.hidden = !enable;
    self.zoomCanvasLabel.hidden = !enable;
}

- (void)updateZoomLabel:(float)scale{
    NSString *text = [NSString stringWithFormat:@"%.0f%%",scale * 100.0f];
    self.zoomCanvasLabel.text = text;
}
- (void)showRotateCanvasUI:(BOOL)enable{
    self.rotateCanvasView.hidden = !enable;
    self.rotateCanvasLabel.hidden = !enable;
}

- (void)updateRotateCanvasLabel:(float)radian{
    NSString *text = [NSString stringWithFormat:@"%.0f",RADIANS_TO_DEGREES(radian)];
    self.rotateCanvasLabel.text = text;
}

- (void)showLockRotateCanvasUI:(BOOL)enable{
    self.lockCanvasRotationView.hidden = !enable;
}
#pragma marl- 清楚 Clear
- (void)requestClearData{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"ClearAllLayersWarning", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel", nil) otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
    alertView.tag = 3;
    [alertView show];
}
#pragma mark- 图层 Layer

- (IBAction)layerButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_layerButtonTouchUp" identifier:sender];
    sender.selected = true;
    
    self.layerTableViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LayerTableViewController"];
    self.layerTableViewController.delegate = self;
    self.layerTableViewController.layers = self.paintView.paintData.layers;
    self.layerTableViewController.backgroundLayer = self.paintView.paintData.backgroundLayer;
    
    
    //可编辑状态
    self.layerTableViewController.tableView.editing = true;
    
    //屏幕尺寸减上下工具栏高度
    if (self.isPaintFullScreen) {
        self.layerTableViewController.tableViewHeightMax = self.view.bounds.size.height;
    }
    else{
        self.layerTableViewController.tableViewHeightMax = self.view.bounds.size.height - self.mainToolBar.bounds.size.height - self.paintToolBar.bounds.size.height;
    }

    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:self.layerTableViewController];
    self.sharedPopoverController.delegate = self;

    [self.sharedPopoverController presentPopoverFromRect:self.layerButton.bounds inView:_layerButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    //半透明
//    FuzzyTransparentView *rootView = (FuzzyTransparentView *)self.layerTableViewController.view;
//    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];

//    for (AutoRotateButton* button in self.layerTableViewController.autoRotateButtons) {
//        button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
//        button.orientation = [UIDevice currentDevice].orientation;
//    }
    
    //在并行线程更新数据(需要保证其他线程也在使用opengles context进行操作)
    dispatch_async(_uploadDataQueque, ^{
//        BNRTimeBlock (^{//测试运行速度
            [self.paintView uploadLayerDatas];
//        });
        dispatch_async(dispatch_get_main_queue(), ^{
            DebugLog(@"update tableView on main thread");
            //载入层缩略图
            [self.layerTableViewController.tableView reloadData];

            //选择当前row
            [self.layerTableViewController selectRowForCurLayer];
        });
    });
}


- (IBAction)createLayerButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_createLayerButtonTouchUp" identifier:sender];
    [self insertLayerAtIndex:[self curLayerIndex]];
}

//- (void) willSelectLayerBlendMode:(LayerBlendMode)blendMode{
//    [self.paintView setCurLayerBlendMode:blendMode];    
//}
//- (void)willFinishSelectLayerBlendMode:(LayerBlendMode)blendMode{
//    
//    [self.paintView setCurLayerBlendMode:blendMode];
//    [self.blendModePopoverController dismissPopoverAnimated:true];
//}

- (int)curLayerIndex {
    return self.paintView.curLayerIndex;
}

- (void)setCurLayerIndex:(int)newValue {
    DebugLog(@"setCurLayerIndex %d", newValue);    
    self.paintView.curLayerIndex = newValue;
}

- (void) reloadLayerViews{
//数据
    [self.paintView uploadLayerDatas];
}

- (void)setBackgroundLayerVisible:(bool)visible {
    ADBackgroundLayer *layer = self.paintView.paintData.backgroundLayer;
    if(layer.visible != visible){
        layer.visible = visible;
        DebugLog(@"backgroundLayerVisible changed! UpdateRender");
        [self.paintView updateRender];
    }
    
    DebugLog(@"backgroundLayerVisible is %i", layer.visible);
}

- (void)setLayerAtIndex:(int)index visible:(bool)visible {
    ADPaintLayer* layer = [self.paintView.paintData.layers objectAtIndex:index];
    if(layer.visible != visible){
        layer.visible = visible;
        DebugLog(@"curLayerVisible changed! UpdateRender");
        [self.paintView updateRender];
    }

    DebugLog(@"_curLayerVisible is %i", layer.visible);
}

- (void)deleteLayerAtIndex:(int)index{
    [self.paintView deleteLayerAtIndex:index immediate:true];
    
    //UI
    [self reloadLayerViews];
}

- (void)insertLayerAtIndex:(int)index{
    [self.paintView insertBlankLayerAtIndex:index transparent:true immediate:true];

    //UI
    [self reloadLayerViews];
}

- (void) willLayerDirtyAtIndex:(int)index{
//    DebugLog(@"layerDirtyAtIndex %d", index);
    ADPaintLayer* layer = [self.paintView.paintData.layers objectAtIndex:index];
    layer.dirty = true;
    
}

#pragma mark- 图层代理 LayerTableViewControllerDelegate
-(BOOL)checkIndexAvailable:(int)index{
    if(index >= self.paintView.paintData.layers.count){
        return false;
    }
    if(index < 0){
        return false;
    }
    return true;
}

-(BOOL)checkInsertAvailable{
    NSUInteger layerMaxCount = [[NSUserDefaults standardUserDefaults]integerForKey:@"LayerQuantityLimitation"];

    if(self.isReversePaint){
        if (self.paintDoc.data.layers.count + self.paintDoc.reverseData.layers.count >= layerMaxCount) {
            NSString *message = [NSString stringWithFormat:@"%@ %d %@",NSLocalizedString(@"Maximum", nil), layerMaxCount, NSLocalizedString(@"ReverseLayersAvailable", nil)];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:message delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
            alertView.tag = 5;
            [alertView show];
            return false;
        }
    }
    else{
        if (self.paintDoc.data.layers.count >= layerMaxCount) {
            NSString *message = [NSString stringWithFormat:@"%@ %d %@",NSLocalizedString(@"Maximum", nil), layerMaxCount, NSLocalizedString(@"LayersAvailable", nil)];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:message delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
            alertView.tag = 5;
            [alertView show];
            return false;
        }
    }
    
    return  true;
}

- (int) willGetCurLayerIndex{
    return self.paintView.curLayerIndex;
}
- (BOOL) willSetCurLayerDataAtIndex:(int)index{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    //串行排列放入线程，保证在uploadLayerData之后更新，避免多线程操作context冲突
    dispatch_sync(_uploadDataQueque, ^{
        [self setCurLayerIndex: index];
        
        //命令 如果点击了图层面板，则Undo Redo重置
        [self.paintView resetUndoRedo];
    });
    return true;
}

-(BOOL)willInsertLayerDataAtIndex:(int)index{
    if (![self checkInsertAvailable]) {
        return false;
    }

    //数据 & 显示
    [self.paintView insertBlankLayerAtIndex:index transparent:true immediate:true];
    [self.paintView uploadLayerDatas];
    return true;
}
- (BOOL) willInsertCopyLayerDataAtIndex:(int)index{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    if (![self checkInsertAvailable]) {
        return false;
    }
    
    [self.paintView insertCopyLayerAtIndex:index immediate:true];
    return true;
}

- (BOOL)willClearLayerDataAtIndex:(int)index{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    
    [self.paintView eraseLayerAtIndex:index];
    [self.paintView uploadLayerDataAtIndex:index];
    return true;
}

-(BOOL)willDeleteLayerDataAtIndex:(int)index{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    
    //数据 & 显示
    [self.paintView deleteLayerAtIndex:index immediate:true];
    [self.paintView uploadLayerDatas];
    return true;
}

- (BOOL)willMoveLayerFromIndex:(int)fromIndex toIndex:(int)toIndex{
    if(![self checkIndexAvailable:fromIndex]){
        return false;
    }
    if(![self checkIndexAvailable:toIndex]){
        return false;
    }
    
    //数据 & 显示    
    if (toIndex > fromIndex) {
        [self.paintView moveLayerDownFromIndex:fromIndex ToIndex:toIndex immediate:true];
    }
    else if (toIndex < fromIndex){
        [self.paintView moveLayerUpFromIndex:fromIndex ToIndex:toIndex immediate:true];
    }
    else{
    }
    
    [self.paintView uploadLayerDatas];
    return true;
}

- (BOOL)willMergeLayerDataAtIndex:(int)index{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    //最底层不合并
    if (index == 0) {
        return false;
    }
    
//    DebugLogGLSnapshotStart
    [self.paintView mergeLayerAtIndex:index];
    [self.paintView uploadLayerDataAtIndex:index - 1];
//    DebugLogGLSnapshotEnd
    
    return true;
}

#pragma mark-

- (BOOL) willSetLayerAtIndex:(int)index visible:(BOOL)visible{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    
    [self setLayerAtIndex:index visible:visible];
    return true;
}
- (BOOL)willSetLayerAtIndex:(int)index opacity:(float)opacity{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    
    [self.paintView setLayerAtIndex:index opacity:opacity];
    return true;
}

- (BOOL)willSetLayerAtIndex:(int)index opacityLock:(BOOL)opacityLock{
    if(![self checkIndexAvailable:index]){
        return false;
    }
    
    [self.paintView setLayerAtIndex:index opacityLock:opacityLock];
    return true;
}

- (BOOL) willSetLayerBlendMode:(LayerBlendMode)blendMode atIndex:(int)index {
    if(![self checkIndexAvailable:index]){
        return false;
    }
    
    [self.paintView setLayerAtIndex:index blendMode:blendMode];
    return true;
}

- (void)willSetBackgroundLayerVisible:(bool)visible {
    [self setBackgroundLayerVisible:visible];
}
- (void) willUpdateRender{
    [self.paintView updateRender];
}

- (void) willSetBackgroundLayerClearColor:(UIButton*)button colorPickerControllerDelegate:(ADLayerTableViewController*)controllerDelegate{
    if(self.subPopoverController != nil && [self.subPopoverController isPopoverVisible]) return; //已经打开
    
    self.infColorPickerController.delegate = controllerDelegate;
    self.infColorPickerController.sourceColor = button.backgroundColor;//覆盖当前笔刷色
    self.subPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:self.infColorPickerController];
    [self.subPopoverController presentPopoverFromRect:button.bounds inView:button permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
//    FuzzyTransparentView* rootView = (FuzzyTransparentView*)self.infColorPickerController.view;
//    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];
}

- (void) willSetBackgroundLayerClearColorChanged:(UIColor*)clearColor{
    self.paintView.paintData.backgroundLayer.clearColor = [clearColor copy];
    //串行排列放入线程，保证在uploadLayerData之后更新，避免多线程操作context冲突
    dispatch_sync(_uploadDataQueque, ^{
        [self.paintView updateRender];
    });

    //UI
}
- (void) willSetBackgroundLayerClearColorFinished:(UIColor*)clearColor{
    self.paintView.paintData.backgroundLayer.clearColor = [clearColor copy];
    [self.paintView updateRender];
    [self.subPopoverController dismissPopoverAnimated:true];
}

- (UIView*) willGetFuzzyTransparentSourceView{
    return  self.rootCanvasView;
}

#pragma mark- 投影 Project
//平面投影
//- (void)projectPlane
//{
//    //显示新的view controller
//    PaintProjectViewController* viewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintProjectViewController"];
//    viewController.delegate = self;
//    float curViewAngleY = 1;
//    [viewController initPaint:self.paintView viewAngle:curViewAngleY];
//    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:viewController animated:true completion:^{
//        
//    }];
//}

//平面投影
//- (void)projectCylinder
//{
//    //显示新的view controller
//    CylinderProjectViewController* viewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"CylinderProjectViewController"];
//    viewController.delegate = self;
////    [viewController initWithPaintView:self.paintView];
//    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    [self presentViewController:viewController animated:true completion:^{
//        
//    }];
//}

- (IBAction)fullScreenButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_fullScreenButtonTouchUp" identifier:sender];
//    [(AutoRotateButton*)sender setHighlighted:false];
    
    if (_state == PaintScreen_Normal) {
        [self togglePaintFullScreen];
    }
}

- (IBAction)brushSwapButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_brushSwapButtonTouchUp" identifier:sender];
    [self swapBrushType];
}

#pragma mark- 退出 SaveClose
- (IBAction)saveAndCloseButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_saveAndCloseButtonTouchUp" identifier:sender];
    
    //禁止所有屏幕上的操作
    [self lockInteraction:true];
    
    [self close];
}

#pragma mark- 取消操作 Undo Redo

- (void)undoDraw{
    //如果功能禁用, return
    if (!self.undoButton.enabled) {
        return;
    }
    
    //在undoDraw未结束之前，关闭所有UI交互
    [self lockInteraction:true];
    
    [self.paintView undoDraw];
    
    //在最后一个undoDraw glFinished之后恢复UI交互
    [self lockInteraction:false];
}

- (void)playUndoDrawAnim{
    //UI bounce animation
    CGRect frame = self.undoButton.frame;
    CGRect target = frame;
    target.origin.x -= 20;
    //动画即使播放，保证尽早提示用户目前的状态
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                           self.undoButton.frame = target;
                       } completion:^(BOOL finished) {
                           [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                               self.undoButton.frame = frame;
                           } completion:nil];
                       }];
                   });
}

- (void)redoDraw{
    if (!self.redoButton.enabled) {
        return;
    }
    
    [self lockInteraction:true];

    [self.paintView redoDraw];
    
    //在最后一个undoDraw glFinished之后恢复UI响应
    [self lockInteraction:false];
}


- (void)beginButtonIBAction:(UIButton*)button{
    button.highlighted = true;
    [button.layer setNeedsDisplay];
}
- (void)endButtonIBAction:(UIButton*)button{
    button.highlighted = false;
    [button.layer setNeedsDisplay];
}

- (void)playRedoDrawAnim{
    //UI bounce animation
    CGRect frame = self.redoButton.frame;
    CGRect target = frame;
    target.origin.x += 20;
    //动画即使播放，保证尽早提示用户目前的状态
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                           self.redoButton.frame = target;
                       } completion:^(BOOL finished) {
                           [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                               self.redoButton.frame = frame;
                           } completion:nil];
                       }];
                   });
}

- (IBAction)undoButtonTouchUp:(ADUndoButton *)sender{
    [RemoteLog logAction:@"PS_undoButtonTouchUp" identifier:sender];
    [self undoDraw];
}

- (IBAction)redoButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_redoButtonTouchUp" identifier:sender];
    [self redoDraw];
}

#pragma mark- 绘图界面代理 PaintingView Delegate (Refresh UI)
- (void) willEnableDirectEyeDropper:(BOOL)enable{
    self.lpgrPaintView.enabled = enable;
}

-(void)willEnableUIRedo:(BOOL)enable{
    self.redoButton.alpha = enable ? 1 : 0;
    self.redoButton.enabled = enable;
}

-(void)willEnableUIUndo:(BOOL)enable{
    self.undoButton.alpha = enable ? 1 : 0;
    self.undoButton.enabled = enable;
}

-(void)willChangeUIPaintColor:(UIColor*) resultColor{
    DebugLogFuncStart(@"willChangeUIPaintColor %@", resultColor);
    [self.paintColorButton setColor:resultColor];
    [self.opacitySlider setColor:resultColor];
}

- (void) willChangeFromBrush:(ADBrush*)srcBrush toBrush:(ADBrush*)targetBrush{
    DebugLogFuncStart(@"willChangeFromBrush %d to brush %d", srcBrush.brushState.classId, targetBrush.brushState.classId);
    //保存srcBrush对应的类的模版brushState
    [[srcBrush class]setBrushStateTemplate:srcBrush.brushState];
}

- (void) willChangeUIBrush:(ADBrush*) brush{
    //更新半径UI
    self.radiusSlider.minimumValue = brush.radiusSliderMinValue;
    self.radiusSlider.maximumValue = brush.radiusSliderMaxValue;
    [self.radiusSlider setValueByRadius:brush.radius];
    
    [self setOpacitySliderValueWithBrushState:brush.brushState];
    
    CGFloat boundWidth = self.paintColorButton.frame.size.width;
    CGFloat radius = MIN(brush.radiusSliderMaxValue + 2, boundWidth * 0.5 - 4);
    self.radiusIndicatorView.frame = CGRectMake(boundWidth * 0.5 - radius, boundWidth * 0.5 - radius, radius*2, radius*2);
    [self.radiusIndicatorView setNeedsDisplay];
    
    //更新笔刷UI
    self.brushButton.brush = brush;
    self.brushButton.frame = CGRectMake(self.brushButton.frame.origin.x, 0, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
    [self.brushButton setNeedsDisplay];
}

- (void) willPaintViewTouchBegan{
    //关闭所有打开的UI    
    if (![self.colorPickerView isHidden]) {
        [self.paintView.brush setColor:self.infColorPickerController.resultColor];
        if (!self.colorPickerView.locked) {
            [self.colorPickerView setHidden:true];
            [_paintColorView setHidden:false];
            if (!_colorSlotsViewHidden) {
                [_brushOpacityView setHidden:false];
                _colorSlotsViewHidden = false;
            }
        }
    }
    
//    if (!colorPickerView.locked) {
//    _brushDetailView.hidden = true;
//    self.brushTypeView.hidden = true;
//    }
    _state = PaintScreen_Normal;
}

- (void) willTouchMoving:(CGPoint)point{
}

- (void) willStartUIEyeDrop{
    self.eyeDropperIndicatorView.hidden = false;

    [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil];
    [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:nil];
}

//not used
- (CGPoint)eyeDropLocation:(CGPoint)locationInRootView byOffset:(CGFloat)offset{
    CGPoint eyeDropLocationInRootView = CGPointZero;
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (!UIDeviceOrientationIsValidInterfaceOrientation(deviceOrientation)) {
        deviceOrientation = self.lastDeviceAppOrientation;
    }
    
    if (UIDeviceOrientationIsPortrait(deviceOrientation)){
        eyeDropLocationInRootView = CGPointMake(locationInRootView.x, locationInRootView.y + offset);
    }
    else if (deviceOrientation == UIDeviceOrientationLandscapeLeft) {
        if (self.isInterfacePortraitUpsideDown) {
            eyeDropLocationInRootView = CGPointMake(locationInRootView.x - offset, locationInRootView.y);
        }
        else{
            eyeDropLocationInRootView = CGPointMake(locationInRootView.x + offset, locationInRootView.y);
        }
        
    }
    else if (deviceOrientation == UIDeviceOrientationLandscapeRight) {
        if (self.isInterfacePortraitUpsideDown) {
            eyeDropLocationInRootView = CGPointMake(locationInRootView.x + offset, locationInRootView.y);
        }
        else{
            eyeDropLocationInRootView = CGPointMake(locationInRootView.x - offset, locationInRootView.y);
        }
        
    }
    
    return eyeDropLocationInRootView;
}

- (CGPoint) willGetEyeDropLocation{
    //更新触摸点
    CGPoint locationInRootView = [self.paintView.firstTouch locationInView:self.rootCanvasView];
    CGPoint eyeDropLocation = CGPointZero;
    if (IsOffsetEyeDropper) {
//        DebugLogWarn(@"willGetEyeDropLocation in rootCanvasView %@", NSStringFromCGPoint(locationInRootView));
        CGPoint offset = CGPointMake(0, -40);
        
        locationInRootView = CGPointMake(locationInRootView.x + offset.x, locationInRootView.y + offset.y);
//        DebugLogWarn(@"offseted location in rootCanvasView %@", NSStringFromCGPoint(locationInRootView));
    }
    
    eyeDropLocation = [self.paintView convertPoint:locationInRootView fromView:self.rootCanvasView];
    eyeDropLocation.y = self.paintView.bounds.size.height - eyeDropLocation.y;
    
//    DebugLogWarn(@"willGetEyeDropLocation final in paintView %@", NSStringFromCGPoint(eyeDropLocation));
    return eyeDropLocation;
}

- (void) willEyeDroppingUI:(CGPoint)point Color:(UIColor *)uiColor{
    DebugLogWarn(@"willEyeDroppingUI paintView center x:%.2f y:%.2f", point.x, point.y);
    CGPoint center = [self.rootCanvasView convertPoint:point fromView:self.paintView];
    DebugLogWarn(@"willEyeDroppingUI rootCanvasView center x:%.2f y:%.2f", center.x, center.y);
    _eyeDropperIndicatorView.center = center;
    [_eyeDropperIndicatorView setColor:uiColor];
    [self.eyeDropperButton setColor:uiColor];
}

- (void) willEndUIEyeDrop{
    _eyeDropperIndicatorView.hidden = true;
    
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 30, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
    }completion:nil];
    [self.eyeDropperButton setColor:[UIColor clearColor]];
    
    if (!self.isPaintFullScreen) {
        [ADPaintUIKitAnimation view:self.view switchTopToolBarToView:self.mainToolBar completion:nil];
        [ADPaintUIKitAnimation view:self.view switchDownToolBarToView:self.paintToolBar completion:nil];
    }
}

-(void)didOpenPaintDoc{
    DebugLog(@"didOpenPaintDoc");
    
    //paintView alpha fade in
//    self.paintView.alpha = 0;
//    [UIView animateWithDuration:0.2 animations:^{
//        self.paintView.alpha = 1.0;
//    } completion:nil];
    self.paintView.alpha = 1;
}

-(void)willUpdateUITransformTranslate:(CGPoint)translation rotate:(float)angle scale:(float)scale{
    [self updateZoomLabel:scale];
    [self updateRotateCanvasLabel:angle];
}

- (void) willHideUIPaintArea:(BOOL)hide touchPoint:(CGPoint)touchPoint{
    //TODO:willHidePaintAreaUI
    if (!self.isPaintFullScreen && hide) {
            CGPoint touchPointInRootView = [self.paintView convertPoint:touchPoint toView:self.rootView];
            if (CGRectContainsPoint(self.paintToolBar.frame, touchPointInRootView) ||
                CGRectContainsPoint(self.mainToolBar.frame, touchPointInRootView)) {
                
                [self togglePaintFullScreen];
            }
    }
    else if (self.isPaintFullScreen && !hide){
        [self togglePaintFullScreen];
    }
    //非全屏模式下, 上下UI还可见，但是需要去显示 (UI在隐藏过程中)
}

- (void) willUpdateUIToolBars{

}

//#pragma mark- 绘图投影代理PaintProjectViewControllerDelegate
//- (void) createPaintProjectEAGleContext:(PaintProjectViewController*)viewController{
//    viewController.context = [[EAGLContext alloc]initWithAPI:[self.paintView.context API] sharegroup:[self.paintView.context sharegroup]];
//}

#pragma mark- 选取背景色 SelectLayerContent Delegate

- (void) selectLayerContent:(UIImage*)image{
//    NSString* bgImageName = [NSString stringWithFormat:@"Image_%d.jpg", image.hash];
//    [Ultility saveUIImage:image ToJPGInDocument:bgImageName];    
//    self.paintView.paintFrame.bgImageName = bgImageName;
//    [self.delegate paintBGChanged:bgImageName];
//
//    [self.paintView setBackgroundImage:[Ultility getPathInApp:bgImageName]];
    

}
#pragma mark- 取色界面 Pick Color UI Operation
- (IBAction)colorSlotsSwitchTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_colorSlotsSwitchTouchUp" identifier:sender];
    [self.brushOpacityView setHidden:![self.brushOpacityView isHidden]];
    _colorSlotsViewHidden = [self.brushOpacityView isHidden];
}

- (IBAction)colorPickerSwitchTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_colorPickerSwitchTouchUp" identifier:sender];
    if(self.colorPickerView.sourceView!=NULL){
        self.colorPickerView.sourceView.backgroundColor = self.infColorPickerController.resultColor;
        if(self.colorPickerView.sourceView == _paintColorView){
            [self.paintView.brush setColor:self.infColorPickerController.resultColor];
        }
    }
    
    [self.colorPickerView setHidden:true];
    self.colorPickerView.locked = false;
    [self.paintColorView setHidden:false];
    if (!_colorSlotsViewHidden) {
        [self.brushOpacityView setHidden:false];
    }
}
- (IBAction)colorPickerLockTapped:(UIButton *)sender {
    [RemoteLog logAction:@"PS_colorPickerLockTapped" identifier:sender];
    self.colorPickerView.locked = !self.colorPickerView.locked;
}

//打开颜色取色器
- (void)openColorPicker:(UIColor*)color inColorButton:(ADColorButton*)colorButton{
    if(self.sharedPopoverController != nil && [self.sharedPopoverController isPopoverVisible]) return; //已经打开
    
    self.colorPickerSrcButton = colorButton;
    self.infColorPickerController.delegate = self;
    self.infColorPickerController.sourceColor = color;//覆盖当前笔刷色
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:self.infColorPickerController];
    [self.sharedPopoverController presentPopoverFromRect:colorButton.bounds inView:colorButton permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
//    FuzzyTransparentView* rootView = (FuzzyTransparentView*)self.infColorPickerController.view;
//    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];
}
- (IBAction)paintColorButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_paintColorButtonTouchUp" identifier:sender];
//    if (colorPickerView.hidden) {
//        colorPickerView.hidden = false;
//        colorPickerView.sourceView = _paintColorView;
//        _state = PaintScreen_PickColor;
//    }
//    else{
//        colorPickerView.hidden = true;
//        _state = PaintScreen_Normal;
//    }
    
    [self openColorPicker:self.paintColorButton.color inColorButton:self.paintColorButton];
    
    
}

//------------------------------------------------------------------------------
#pragma mark- 取色器 InfColorPicker IB actions
//------------------------------------------------------------------------------
- (void) colorPickerControllerDidFinish: (InfColorPickerController*) controller
{
    if (self.colorPickerSrcButton == self.paintColorButton) {
        [self.paintView.brush setColor:controller.resultColor];
    }
    else{
        self.colorPickerSrcButton.color = controller.resultColor;
    }

    [self.sharedPopoverController dismissPopoverAnimated:true];
}

- (void) colorPickerControllerDidChangeColor: (InfColorPickerController*) controller{
    if (self.colorPickerSrcButton == self.paintColorButton) {
        [self.paintView.brush setColor:controller.resultColor];
    }
    else{
        self.colorPickerSrcButton.color = controller.resultColor;
    }
}

- (IBAction) takeBarValue: (InfColorBarPicker*) sender
{
    [RemoteLog logAction:@"PS_takeBarValue" identifier:sender];
    [self.infColorPickerController takeBarValue:sender];
}

//-----------------------------------------------------------------------
- (IBAction) takeSquareValue: (InfColorSquarePicker*) sender
{
    [RemoteLog logAction:@"PS_takeSquareValue" identifier:sender];
    [self.infColorPickerController takeSquareValue:sender];
}

#pragma mark- 工具栏

- (IBAction)clearButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_clearButtonTouchUp" identifier:sender];
    
    [self requestClearData];
    [self.clearButton setNeedsDisplay];
    
}

- (IBAction)clearButtonTouchDown:(UIButton *)sender {
    [RemoteLog logAction:@"PS_clearButtonTouchDown" identifier:sender];
    [self.clearButton setNeedsDisplay];
}


- (IBAction)eyeDropperButtonTouchDown:(UIButton *)sender {
    [RemoteLog logAction:@"PS_eyeDropperButtonTouchDown" identifier:sender];
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 0, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
    }completion:nil];
}

//TODO:需要在其他按钮按下时取消取色状态
- (IBAction)eyeDropperButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"PS_eyeDropperButtonTouchUp" identifier:sender];
    if (self.paintView.state != PaintView_TouchEyeDrop) {
        if ([self.paintView enterState:PaintView_TouchEyeDrop]) {
            _state = PaintScreen_PickColor;
            
            [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
                self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 10, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
            }completion:nil];
            [self.eyeDropperButton setColor:self.paintColorButton.color];
        }
    }
    else if(self.paintView.state == PaintView_TouchEyeDrop){
        if ([self.paintView enterState:PaintView_TouchNone]){
            _state = PaintScreen_Normal;
            
            [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
                self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 30, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
            }completion:nil];
            [self.eyeDropperButton setColor:[UIColor clearColor]];
        }

    }

}

- (IBAction)eyeDropperButtonTouchCancel:(UIButton *)sender {
    [RemoteLog logAction:@"PS_eyeDropperButtonTouchCancel" identifier:sender];
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 30, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
    }completion:nil];
    [self.eyeDropperButton setColor:[UIColor clearColor]];
    
}


- (void)togglePaintFullScreen{
    DebugLogFuncStart(@"togglePaintFullScreen");
    if(self.isPaintFullScreen){
        for (UIButton *button in self.fullScreenButtons) {
            button.alpha = 1.0;
        }
        [UIView animateWithDuration:0.2 animations:^{
            for (UIButton *button in self.fullScreenButtons) {
                button.alpha = 0.0;
            }
        }completion:^(BOOL finished) {
            for (UIButton *button in self.fullScreenButtons) {
                button.hidden = false;
            }
            [ADPaintUIKitAnimation view:self.view switchDownToolBarToView:self.paintToolBar completion:nil];
            [ADPaintUIKitAnimation view:self.view switchTopToolBarToView:self.mainToolBar completion:^{
                self.isPaintFullScreen = false;
            }];

        }];
        

    }
    else{
        [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:nil];
        [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:^{
            for (UIButton *button in self.fullScreenButtons) {
                button.hidden = false;
                button.alpha = 0.0;
            }
            [UIView animateWithDuration:0.2 animations:^{
                for (UIButton *button in self.fullScreenButtons) {
                    button.alpha = 1.0;
                }
            }completion:^(BOOL finished) {
                self.isPaintFullScreen = true;
            }];
        }];
        
    }
}

-(void)updateFuzzyTransparentViews{
//    [self.mainToolBar updateFuzzyTransparentFromView:self.rootCanvasView];
//    [self.paintToolBar updateFuzzyTransparentFromView:self.rootCanvasView];
    //TODO: add all fuzzyTranparentViews here
    
}

#pragma mark- 弹出框代理UIPopoverController
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    NSString *logStr = [NSString stringWithFormat:@"popoverControllerDidDismissPopover contentViewController: %@", popoverController.contentViewController];
    [RemoteLog log:logStr];
    
    if ([popoverController.contentViewController isKindOfClass:[ADBrushPropertyViewController class]]) {

        [self.paintView prepareDrawEnv];
    }
    else if ([popoverController.contentViewController isKindOfClass:[ADLayerTableViewController class]]) {
        self.layerButton.selected = false;
        [self.layerButton.layer setNeedsDisplay];

    }
    else if ([popoverController.contentViewController isKindOfClass:[ADImportTableViewController class]] ||
             [popoverController.contentViewController isKindOfClass:[UIImagePickerController class]]) {
        self.importButton.selected = false;
        [self.importButton.layer setNeedsDisplay];
    }
    else if ([popoverController.contentViewController isKindOfClass:[ADExportTableViewController class]]) {
        self.exportButton.selected = false;
        [self.exportButton.layer setNeedsDisplay];
    }
    else if ([popoverController.contentViewController isKindOfClass:[ADHelpViewController class]]) {
        self.helpButton.selected = false;
        [self.helpButton.layer setNeedsDisplay];

        [self closeIndicator];
        
        [self tutorialStartCurrentStep];
        

    }
//    [EAGLContext setCurrentContext:[REGLWrapper current].context];
}


#pragma mark- 半透明工具栏代理FuzzyTransparentViewDelegate
-(void)willSnapshotUIImageEnd:(UIImage *)image{
    //TODO:目前会导致GetColorSpaceModel BadAccess
    
//    for (ADAutoRotateButton *button in self.topToolBarButtons) {
//
//    }

    //更新顶部按钮颜色
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [CATransaction setCompletionBlock:^{
        //animations are removed automatically
//        for (ADAutoRotateButton *button in self.topToolBarButtons) {
//        }
    }];
    
    for (ADAutoRotateButton *button in self.topToolBarButtons) {
//        DebugLog(@"topToolBarButton %@", button);
        CGPoint point = [self.mainToolBar convertPoint:button.center toView:self.rootView];
        UIColor *toColor = [image pickPixelAtX:(NSUInteger)point.x Y:(NSUInteger)point.y];
        CGFloat colorRGBA[4];
        [toColor getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
        colorRGBA[0] *= 0.675;
        colorRGBA[1] *= 0.675;
        colorRGBA[2] *= 0.675;
        colorRGBA[3] = 1;

        CABasicAnimation *colorRAnim = [CABasicAnimation animationWithKeyPath:@"baseColorR"];
        colorRAnim.fromValue = [NSNumber numberWithFloat:((ADCustomLayer*)button.layer).baseColorR];
        colorRAnim.toValue = [NSNumber numberWithFloat:colorRGBA[0]];
        [button.layer addAnimation:colorRAnim forKey:@"baseColorR"];
        ((ADCustomLayer*)button.layer).baseColorR = colorRGBA[0];
        
        CABasicAnimation *colorGAnim = [CABasicAnimation animationWithKeyPath:@"baseColorG"];
        colorGAnim.fromValue = [NSNumber numberWithFloat:((ADCustomLayer*)button.layer).baseColorG];
        colorGAnim.toValue = [NSNumber numberWithFloat:colorRGBA[1]];
        [button.layer addAnimation:colorGAnim forKey:@"baseColorG"];
        ((ADCustomLayer*)button.layer).baseColorG = colorRGBA[1];
        
        CABasicAnimation *colorBAnim = [CABasicAnimation animationWithKeyPath:@"baseColorB"];
        colorBAnim.fromValue = [NSNumber numberWithFloat:((ADCustomLayer*)button.layer).baseColorB];
        colorBAnim.toValue = [NSNumber numberWithFloat:colorRGBA[2]];
        [button.layer addAnimation:colorBAnim forKey:@"baseColorB"];
        ((ADCustomLayer*)button.layer).baseColorB = colorRGBA[2];
    }
    [CATransaction commit];
}

-(void)willRemoveFuzzyTransparentEnd{
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:0.1];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
//    [CATransaction setCompletionBlock:^{
//        //            DebugLog(@"button baseColor finished");
//    }];
//    
//    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"baseColor"];
//    colorAnim.toValue = (id)[UIColor whiteColor].CGColor;
//    for (AutoRotateButton *button in self.topToolBarButtons) {
//        [button.layer addAnimation:colorAnim forKey:@"baseColor"];
//        CustomLayer* layer = (CustomLayer*)button.layer;
//        layer.baseColor = [UIColor whiteColor].CGColor;
//    }
//    [CATransaction commit];
}
#pragma mark- 旋转 Orientation
//- (NSUInteger)supportedInterfaceOrientations
//{
////    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
//    return UIInterfaceOrientationMaskAll;
//}

- (void)setupDeviceRotation{
    DebugLogFuncStart(@"setupDeviceRotation");
    //旋转方向
    [self registerDeviceRotation];
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
        self.isInterfacePortraitUpsideDown = false;
    }
    else if (self.interfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        self.isInterfacePortraitUpsideDown = true;
    }
    
    self.lastDeviceAppOrientation = UIDeviceOrientationPortrait;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

//使用工程定义转向
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    DebugLog(@"willRotateToInterfaceOrientation");
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.isInterfacePortraitUpsideDown = false;
    }
    else if (toInterfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        self.isInterfacePortraitUpsideDown = true;
    }
    
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if( UIDeviceOrientationIsValidInterfaceOrientation(deviceOrientation)){
        self.lastDeviceAppOrientation = deviceOrientation;
    }

}
//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
//    DebugLog(@"willAnimateRotationToInterfaceOrientation");
//}
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return UIInterfaceOrientationPortrait;
//}
#pragma mark- 内购 IAP
- (void)openIAPWithProductFeatureIndex:(NSInteger)index{
    [RemoteLog logAction:[NSString stringWithFormat:@"PS_openIAPWithProductFeatureIndex %d",index] identifier:nil];
    self.iapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"inAppPurchaseTableViewController"];
    self.iapVC.delegate = self;
    self.iapVC.brushPreviewDelegate = self.paintView;
    self.iapVC.iapProPackageFeature = (IAPProPackageFeature)index;

    [self presentViewController:self.iapVC animated:true completion:^{
//        DebugLog(@"presentViewController:self.iapVC completed");
    }];
}
- (void)IAPTransactionSucceeded:(id)arg{
    DebugLog(@"购买产品成功,刷新产品显示");
    for ( UIView *view in self.brushTypeScrollView.subviews) {
        ADBrushTypeButton *brushTypeView = (ADBrushTypeButton *)view;
        [brushTypeView setNeedsDisplay];
    }
}

#pragma mark- 处理警告 UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 3){
        switch (buttonIndex) {
            case 1:
                [RemoteLog logAction:@"paintView clearData" identifier:nil];
                [self.paintView clearData];
                break;
        }
    }
    else if (alertView.tag == 5) {
        switch (buttonIndex) {
            case 1:
                [self openIAPWithProductFeatureIndex:7];
                break;
                
            default:
                break;
        }
    }
    else if (alertView.tag == 6) {
        switch (buttonIndex) {
            case 0:
                [self tutorialStepNextImmediate:false];
                [self closeDocWithSave];
                
                break;
            case 1:
                [self closeDocCanceled];
                if ([[ADSimpleTutorialManager current] isActive]) {
                    [self willTutorialEnableUserInteraction:false withStep:[ADSimpleTutorialManager current].curTutorial.curStep];
                }

                break;
            case 2:
                [self tutorialStepNextImmediate:false];
                [self closeDocWithoutSave];
                
                break;
            default:
                break;
        }
    }
}

#pragma mark- 购买代理InAppPurchaseTableViewControllerDelegate
- (void)willIAPPurchaseDone{
    DebugLogFuncStart(@"willIAPPurchaseDone");
    [self.iapVC dismissViewControllerAnimated:true completion:^{
        DebugLog(@"self.iapVC dismissViewControllerAnimated release");
        self.iapVC = nil;
        self.iapVC.delegate = nil;
        self.iapVC.brushPreviewDelegate = nil;
        
        //切换到原来的renderbuffer
        [self.paintView prepareDrawEnv];
        
        //在教程的情况下必定会跟着教程退出
        if ([[ADSimpleTutorialManager current] isActive]) {
            [self tutorialStartCurrentStep];
            [self transitionToTutorial];
        }
        else{
            //如果是反向绘制，退出到cylinderProject的sideView
            if (self.isReversePaint && ![[NSUserDefaults standardUserDefaults] boolForKey:@"ReversePaint"]) {
                [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.mainToolBar completion:nil];
                [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.paintToolBar completion:^{
                    [self.delegate willPaintScreenDissmissWithPaintDoc:self.paintDoc];
                    [self dismissViewControllerAnimated:true completion:^{
                        [self lockInteraction:false];
                        [self.delegate willPaintScreenDissmissDoneWithPaintDoc:self.paintDoc];
                        self.reversePaint = nil;
                    }];
                }];
            }
        }
    }];
}

- (ADBrush*)willGetBrushByIAPFeatureIndex:(IAPProPackageFeature)feature{
    DebugLogFuncStart(@"willGetBrushByIAPFeatureIndex %d", feature);
    //创建一个全新的笔刷，然后在关闭IAP使用后释放掉
    ADBrush *brush = nil;
    if (feature == Pro_Crayons) {
        brush = [[ADCrayons alloc]initWithPaintView:self.paintView delegate:nil];
        brush.brushState.classId = 6;
//        brush.brushState.color = [UIColor colorWithRed:126.0/255.0 green:44.0 / 255.0 blue:99.0 / 255.0 alpha:1];
        brush.name = @"brushPreviewCrayons";

    }
    else if (feature == Pro_Finger) {
        brush = [[ADFinger alloc]initWithPaintView:self.paintView delegate:nil];
        brush.brushState.classId = 7;
//        brush.brushState.color = [UIColor colorWithRed:248.0/255.0 green:163.0 / 255.0 blue:138.0 / 255.0 alpha:1];
        brush.name = @"brushPreviewFinger";
    }
    else if (feature == Pro_MarkerSquare) {
        brush = [[ADMarkerSquare alloc]initWithPaintView:self.paintView delegate:nil];
        brush.brushState.classId = 8;
//        brush.brushState.color = [UIColor colorWithRed:216.0/255.0 green:255.0 / 255.0 blue:56.0 / 255.0 alpha:1];
        brush.name = @"brushPreviewMarkerSquare";
    }
    else if (feature == Pro_AirBrush) {
        brush = [[ADAirBrush alloc]initWithPaintView:self.paintView delegate:nil];
        brush.brushState.classId = 9;
        brush.name = @"brushPreviewAirBrush";
    }
    else if (feature == Pro_ChineseBrush) {
        brush = [[ADChineseBrush alloc]initWithPaintView:self.paintView delegate:nil];
        brush.brushState.classId = 10;
//        brush.brushState.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        brush.name = @"brushPreviewChineseBrush";
    }
    else if (feature == Pro_OilBrush) {
        brush = [[ADOilBrush alloc]initWithPaintView:self.paintView delegate:nil];
        brush.brushState.classId = 11;
//        brush.brushState.color = [UIColor colorWithRed:255.0/255.0 green:216.0 / 255.0 blue:120.0 / 255.0 alpha:1];
        brush.name = @"brushPreviewOilBrush";
    }
    else{
        return nil;
    }

    //will duplicate brush shader
    [brush initGL];
    return brush;
}
#pragma mark- 观察对象数值变化
- (void)willClearColorChanged:(UIColor *)color{
//    DebugLog(@"backgroundLayer.clearColor changed");
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    for (ADAutoRotateButton *button in self.topToolBarButtons) {
        ((ADCustomLayer*)button.layer).baseColorR = colorRGBA[0];
        ((ADCustomLayer*)button.layer).baseColorG = colorRGBA[1];
        ((ADCustomLayer*)button.layer).baseColorB = colorRGBA[2];
        
        [button.layer setNeedsDisplay];
    }
    
    if(self.layerTableViewController){
        [self.layerTableViewController updateIconColors];
    }
    
    //calculate reflect color for UI
    CGFloat r = colorRGBA[0] * 0.1 + 0.9 * 0.85;
    CGFloat g = colorRGBA[1] * 0.1 + 0.9 * 0.85;
    CGFloat b = colorRGBA[2] * 0.1 + 0.9 * 0.85;
    [ADPaintUIKitStyle setGlobalRefelectColor:[UIColor colorWithRed:r green:g blue:b alpha:1.0]];
    
    // send out a reflect color changed notification for the uis which use crystalGradient style
//        dispatch_async(dispatch_get_main_queue(),^{
//            [[NSNotificationCenter defaultCenter] postNotificationName:BackgroundLayerClearColorChangedNotification object:self userInfo:nil];
//        });

    return;
}

#pragma mark- 教程 Tutorial
//主教程入口设置
- (void)tutorialLayout:(ADTutorial*)tutorial{
    ADSimpleTutorial *simpleTutorial = (ADSimpleTutorial *)tutorial;
    [simpleTutorial.cancelView removeFromSuperview];
    simpleTutorial.cancelView.center = CGPointMake(TutorialNextButtonHeight*0.5, self.rootView.bounds.size.height - self.paintToolBar.frame.size.height - simpleTutorial.cancelView.frame.size.height);
    simpleTutorial.cancelView.hidden = false;
    [self.rootView addSubview:simpleTutorial.cancelView];
}

- (void)tutorialSetup{
    DebugLogFuncStart(@"tutorialSetup");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    for (ADSimpleTutorial *tutorial in [ADSimpleTutorialManager current].tutorials.objectEnumerator) {
        tutorial.curViewController = self;        
        for (ADTutorialStep *step in tutorial.steps) {
            if ([step.name rangeOfString:@"PaintScreen"].length > 0) {
                step.delegate = self;
            }
        }
    }
    
    [self tutorialLayout:[ADSimpleTutorialManager current].curTutorial];
}

- (void)tutorialStartCurrentStep{
    DebugLogFuncStart(@"tutorialStartCurrentStep");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    [[ADSimpleTutorialManager current].curTutorial startCurrentStep];

}

//在排版等准备完成以后,检查是否需要开始教程
- (void)tutorialStartFromStepName:(NSString *)name{
    DebugLogFuncStart(@"tutorialStartFromStepName %@", name);
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:name]) {
        [[ADSimpleTutorialManager current].curTutorial startFromStepName:name];
    }
}

- (void)tutorialStepNextImmediate:(BOOL)immediate{
    DebugLogFuncStart(@"tutorialStepNext");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    //isCheckTutorialStep
    if (immediate) {
        [[ADSimpleTutorialManager current].curTutorial stepNextImmediate];
    }
    else{
        [[ADSimpleTutorialManager current].curTutorial stepNext:nil];
    }
    
}
- (void)transitionToTutorial{
    DebugLogFuncStart(@"launchTransitionToTutorial");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    TutorialStepAnimationBlock animBlock = [ADSimpleTutorialManager current].curTutorial.curStep.fadeInAnimationBlock;
    if (animBlock) {
        animBlock();
    }
}

#pragma mark- 教程步骤代理 TutorialStepDelegate
- (void)willTutorialEnableUserInteraction:(BOOL)enable withStep:(ADTutorialStep *)step{
    DebugLogFuncStart(@"willTutorialEnableUserInteraction");
    //需要关闭所有其他工具交互
    for (UIButton *button in self.topToolBarButtons) {
        button.userInteractionEnabled = enable;
    }
//    self.mainToolBar.userInteractionEnabled = enable;
    self.paintToolBar.userInteractionEnabled = enable;
    self.rootCanvasView.userInteractionEnabled = enable;
    
    if ([step.name isEqualToString:@"PaintScreenHelpTips"]){
        self.helpButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"PaintScreenCloseDoc"]){
        self.closeButton.userInteractionEnabled = true;
    }

    //打开制定按钮交互
}

- (void)willTutorialLayoutWithStep:(ADTutorialStep *)step{
    DebugLogFuncStart(@"willLayoutWithStep");
    step.contentView.center = CGPointMake(TutorialNextButtonHeight*0.5, self.rootView.bounds.size.height - self.paintToolBar.frame.size.height - step.contentView.frame.size.height);
    
//    if ([step.name isEqualToString:@"PaintScreenTutorialDone"]) {
//        step.contentView.center = CGPointMake(self.view.center.x, self.view.bounds.size.height - self.paintToolBar.frame.size.height - step.contentView.frame.size.height);
//    }
    if ([step.name isEqualToString:@"PaintScreenHelpTips"]){
        [step.indicatorView targetView:self.helpButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"PaintScreenCloseDoc"]){
        [step.indicatorView targetView:self.closeButton inRootView:self.view];
        
        if (step.indicatorViews.count > 1) {
            [step.indicatorViews[1] targetViewFrame:CGRectMake(384, 800, 1, 1) inRootView:self.view];
        }
    }
    [step addToRootView:self.view];
}

#pragma mark- 帮助 Help
- (IBAction)helpButtonTouchUp:(id)sender{
    [RemoteLog logAction:@"PS_helpButtonTouchUp" identifier:sender];
    [self tutorialStepNextImmediate:false];
    
    ((UIButton*)sender).selected = true;
    
    self.helpViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"HelpViewController"];
    self.helpViewController.preferredContentSize = CGSizeMake(768, 260);
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:self.helpViewController];
    self.sharedPopoverController.delegate = self;

    [self showIndicator];
    
    [self.sharedPopoverController presentPopoverFromRect:self.helpButton.bounds inView:self.helpButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)closeIndicator{
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        for (UIView *view in self.helpViews) {
            view.alpha = 0;
        }
    }completion:^(BOOL finished) {
        for (UIView *view in self.helpViews) {
            [view removeFromSuperview];
        }
        self.helpViews = nil;
    }];
}

- (void)showIndicator{
    self.helpViews = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 8; ++i) {
        ADTutorialIndicatorView *indicatorView = [[ADTutorialIndicatorView alloc]initWithFrame:CGRectMake(0, 0, TutorialGrid*2, TutorialGrid*0.7)];
        indicatorView.animated = false;
        indicatorView.alpha = 0;
        indicatorView.arrowDirection = UIPopoverArrowDirectionDown;
        NSString *desc = nil;
        CGRect frame = CGRectZero;
        switch (i) {
            case 0:
                desc = @"PaintScreenHelpMainBrush";
                frame = [self.view convertRect:self.brushButton.bounds fromView:self.brushButton];
                frame.origin.x += 8;
                [indicatorView targetViewFrame:frame inRootView:self.view];
                break;
            case 1:
                desc = @"PaintScreenHelpSecondBrush";
                [indicatorView targetView:self.brushBackButton inRootView:self.view];
                break;
            case 2:
                desc = @"PaintScreenHelpBrushRadius";
                frame = [self.view convertRect:self.radiusSlider.bounds fromView:self.radiusSlider];
                frame.origin.x += 60;
                [indicatorView targetViewFrame:frame inRootView:self.view];
                break;
            case 3:
                desc = @"PaintScreenHelpBrushOpacity";
                
                frame = [self.view convertRect:self.opacitySlider.bounds fromView:self.opacitySlider];
                frame.origin.x -= 60;
                [indicatorView targetViewFrame:frame inRootView:self.view];
                break;
            case 4:
                desc = @"PaintScreenHelpBrushColor";
                indicatorView.arrowDirection = UIPopoverArrowDirectionUp;
                frame = [self.view convertRect:self.paintColorButton.bounds fromView:self.paintColorButton];
                frame.origin.y -= 15;
                [indicatorView targetViewFrame:frame inRootView:self.view];
                break;
            case 5:
                desc = @"PaintScreenHelpPalleteColor";
                [indicatorView targetView:self.colorSlotsScrollView inRootView:self.view];
                break;
            case 6:
                desc = @"PaintScreenHelpPalleteMore";
                frame = [self.view convertRect:self.swatchManagerButton.bounds fromView:self.swatchManagerButton];
                frame.origin.x -= 13;
                [indicatorView targetViewFrame:frame inRootView:self.view];
                break;
            case 7:
                desc = @"PaintScreenHelpFullScreen";
                frame = [self.view convertRect:self.fullScreenButton.bounds fromView:self.fullScreenButton];
                frame.origin.x -= 13;
                [indicatorView targetViewFrame:frame inRootView:self.view];
                
                
//                indicatorView.arrowDirection = UIPopoverArrowDirectionRight;
//                frame = [self.view convertRect:self.fullScreenButton.bounds fromView:self.fullScreenButton];
//                frame.origin.y -= 10;
//                [indicatorView targetViewFrame:frame inRootView:self.view];
                break;
            default:
                break;
        }
        [indicatorView initWithTutorial:nil description:NSLocalizedString(desc, nil) bgImage:nil];
        [self.helpViews addObject:indicatorView];
        [self.rootView addSubview:indicatorView];
    }
    
    [UIView animateWithDuration:PaintScreenIBActionAnimationDuration animations:^{
        for (UIView *view in self.helpViews) {
            view.alpha = 1;
        }
    }];
}

- (void)showHelpTips{
    CGFloat height = 866;
    CGFloat width = 768;
    CGFloat offsetX = 10;
    //背景图层
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, (self.view.bounds.size.height - height) * 0.5, width, height)];
    [self.rootView addSubview:contentView];
    //标题图层
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 80)];
    label.textColor = [UIColor darkGrayColor];
    label.text = NSLocalizedString(@"QuickGestures", nil);
    [label setFont:[UIFont fontWithName: @"HelveticaNeue" size: 30]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [contentView  addSubview:label];
    
    //添加tutorial collection view
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(80, 10, 10, 10);
    flowLayout.itemSize=CGSizeMake(180,230);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    ADTutorialPaintScreenGestureCollectionView *collectionView = [[ADTutorialPaintScreenGestureCollectionView alloc] initWithFrame:CGRectMake(offsetX, 0, width - offsetX * 2, height - 10) collectionViewLayout:flowLayout];
    collectionView.opaque = false;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    [collectionView registerClass:[ADTutorialPaintScreenGestureCollectionViewCell class] forCellWithReuseIdentifier:@"TutorialPaintScreenGestureCollectionViewCell"];
    [contentView addSubview:collectionView];
    
    
    width = 128;
    height = 64;
    CGFloat offset = 25;
    CGFloat x = MAX(contentView.bounds.size.width - width - offset, 0);
    CGFloat y = MAX(contentView.bounds.size.height - height - offset, 0);
    
    UIButton *nextButton = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
    [nextButton setTitle:NSLocalizedString(@"TutorialEnd", nil) forState:UIControlStateNormal];
    [contentView addSubview:nextButton];
}

- (void)willTutorialEndWithStep:(ADTutorialStep*)step{
    if ([step.name isEqualToString:@"PaintScreenTutorialDone"]) {
        self.transitioningDelegate = nil;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
}

//- (void)willTutorialEnd:(ADTutorial *)tutorial{
//    if ([tutorial.name isEqualToString:@"TutorialMain"]) {
//        [ADSimpleTutorialManager destroy];
//    }
//}


#pragma mark- 教程代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ADTutorialPaintScreenGestureCollectionViewCell *cell = (ADTutorialPaintScreenGestureCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"TutorialPaintScreenGestureCollectionViewCell"
                                                                                                                                                       forIndexPath:indexPath];
    
    cell.userInteractionEnabled = false;
    NSString *imageName = nil;
    switch (indexPath.row) {
        case 0:
            imageName = @"tutorial_gesture1FingerDrag";
            break;
        case 1:
            imageName = @"tutorial_gesture1FingerTapHold";
            break;
        case 2:
            imageName = @"tutorial_gesture2FingerDrag";
            break;
        case 3:
            imageName = @"tutorial_gesture2FingerRotate";
            break;
        case 4:
            imageName = @"tutorial_gesture2FingerPinch";
            break;
        case 5:
            imageName = @"tutorial_gesture2FingerSpread";
            break;
        case 6:
            imageName = @"tutorial_gesture2FingerDoubleTap";
            break;
        case 7:
            imageName = @"tutorial_gesture3FingerUp";
            break;
        case 8:
            imageName = @"tutorial_gesture3FingerDown";
            break;
        case 9:
            imageName = @"tutorial_gesture3FingerLeft";
            break;
        case 10:
            imageName = @"tutorial_gesture3FingerRight";
            break;
        case 11:
            imageName = @"tutorial_gesture3FingerZ";
            break;
        default:
            break;
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
    cell.label.text = NSLocalizedString(imageName, nil);
    
    return cell;
}
#pragma mark- 测试
- (void)willShowTestImage:(UIImage*)image{
    self.testImageView.image = image;
}
@end
