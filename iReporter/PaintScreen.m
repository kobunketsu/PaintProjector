//
//  ViewController.m
//  draw2D
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PaintScreen.h"
#import <Social/Social.h>
//#import <Dropbox/Dropbox.h>
#import <DBChooser/DBChooser.h>
//#import "PaintView.h"
#import "ShowPaint.h"
#import "SelectLayerContentViewController.h"
//File
#import "PaintDoc.h"
#import "PaintData.h"
#import "PaintLayer.h"
#import "PaintLayerManager.h"
#import "LayerManagerView.h"
#import "LayerBlendModeTableViewController.h"
#import "LayerTableViewController.h"
#import "LayerBlendModePopoverController.h"
#import "UIImage+ImageEffects.h"
#import <pthread.h>
#import "TransformContentView.h"
#import "TransformContentViewLayer.h"
#import "TransformAnchorView.h"

#define EditBrushSizeConfirmPixels 5
#define ChangeToolBarConfirmPixels 10
#define LayerToolButtonSize 40
#define PopoverOffset 20
#define TwoFingerPanGestureTime 0.016

#pragma mark PaintRefView Assets
int colorPalleteCount = 20;
float colorPalletes[] =
{
    255, 255, 255,
    244, 146, 30,
    133, 133, 133,
    197, 210, 219,
    62,  107, 133,
    
    77,  139, 77,
    252, 194, 64,
    191, 75,  49,
    75,  57,  41,
    206, 214, 180,
    
    199, 183, 115,
    227, 219, 154,
    245, 252, 208,
    177, 194, 179,
    119, 134, 145,
    
    99,  85,  83,
    137, 147, 163,
    81,  83,  86,
    132, 137, 115,
    158, 163, 145,
    
    255, 255, 255,
    244, 146, 30,
    133, 133, 133,
    197, 210, 219,
    62,  107, 133,
};
// Attribute index.
enum
{
    ATTRIB_VERTEX,
    ATTRIB_TEXCOORD,
    NUM_ATTRIBUTES
};
float quadVertexData[] = 
{
    0.5f, 0, -0.5f,          1.0f, 1.0f,
    -0.5f,0, -0.5f,          0.0f, 1.0f,
    0.5f, 0, 0.5f,         1.0f, 0.0f,
    0.5f, 0, 0.5f,        1.0f, 0.0f,
    -0.5f,0, -0.5f,         0.0f, 1.0f,
    -0.5f,0, 0.5f,        0.0f, 0.0f,
};

typedef struct {
    float Position[3];
    float Color[4];
    float TexCoord[2];
} Vertex;

//const Vertex Vertices[] = {
//    {{1, -1, 0}, {1, 1, 1, 1}, {1, 0}},
//    {{1, 1, 0}, {1, 1, 1, 1}, {1, 1}},
//    {{-1, 1, 0}, {1, 1, 1, 1}, {0, 1}},
//    {{-1, -1, 0}, {1, 1, 1, 1}, {0, 0}}
//};

//const GLubyte Indices[] = {
//    0, 1, 2,
//    2, 3, 0
//};
#pragma mark Paint Screen
@interface PaintScreen ()
//绘图工具
@property (assign, nonatomic) PaintScreenViewState state;
@property (assign, nonatomic) BOOL isInterfacePortraitUpsideDown;//用于调整横向时按钮label的方向
@property (assign, nonatomic) UIDeviceOrientation lastDeviceAppOrientation; //用于应用的设备旋转方向
@property (retain, nonatomic) LayerTableViewController *layerTableViewController;
@property (retain, nonatomic) NSDictionary *workspace;
@property (retain, nonatomic) Brush   *curBrush;
@property (retain, nonatomic) EyeDropper *eyeDropper;
@property (retain, nonatomic) InfColorPickerController *infColorPickerController;
@property (weak, nonatomic) ColorButton *colorPickerSrcButton;//记录打开取色器的源按钮
@property (retain, nonatomic) UIPopoverController *blendModePopoverController;  //图层混合弹出控制器

@property (assign, nonatomic) BOOL isPaintFullScreen;
@property (strong, nonatomic) SharedPopoverController *subPopoverController;
@property (retain, nonatomic) SharedPopoverController *sharedPopoverController;
@property (retain, nonatomic) NSDate *twoFingerPanGestureStartTime;   //检测手势的开始时间
@property (assign, nonatomic) float twoFingerPanGestureCurTimeInterval;   //检测手势的当前误差时间
@property (retain, nonatomic) NSMutableArray *colorButtons;//所有颜色槽
@property (weak, nonatomic) ColorButton *colorSaveTargetButton;//吸颜色的目标槽位
@property (retain, nonatomic) ClearGestureRecognizer *clearGestureRecognizer;
@property (assign, nonatomic) CGRect downToolBarFrame;//为移动工具栏记录原始位置
@property (assign, nonatomic) CGRect topToolBarFrame;//为移动工具栏记录原始位置
@property (assign, nonatomic) BOOL hideTopDownUITemp;
@property (assign, nonatomic) CGRect brushButtonTempRect;
@property (retain, nonatomic) UIView *transformContentView;//变换画布时显示的选择外框
@property (assign, nonatomic) CGPoint transformContentViewSrcCenter;//当前变换框的中心
@property (assign, nonatomic) CGFloat transformContentViewSrcRotate;//当前变换框的中心
@property (assign, nonatomic) CGRect transformContentViewSrcBounds;//当前变换框的大小
@property (retain, nonatomic) NSMutableArray *transformAnchorViews;
@property (assign, nonatomic) CGFloat transformAnchorViewSize;
@property (assign, nonatomic) CGPoint curTransformAnchorViewSrcCenter;//当前变换点的中心
@property (assign, nonatomic) CGFloat curTransformDirection;//当前变换点的移动方向
@end


@implementation PaintScreen

#pragma mark- 视图相关
- (BOOL)prefersStatusBarHidden
{
    return YES;
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

    for (AutoRotateButton* button in self.autoRotateButtons) {
        button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
        button.orientation = device.orientation;
    }

    if (self.layerTableViewController != NULL){
        for (AutoRotateButton* button in self.layerTableViewController.autoRotateButtons) {
            button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
            button.orientation = device.orientation;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLog(@"[ viewWillAppear ]");
}
- (void)viewDidAppear:(BOOL)animated{
    DebugLog(@"[ viewDidAppear ]");
}
-(void)viewWillDisappear:(BOOL)animated{
    DebugLog(@"[ viewWillDisappear ]");
}
-(void)viewDidDisappear:(BOOL)animated{
    DebugLog(@"[ viewDidDisappear ]");
}
-(void)viewDidLayoutSubviews{
    DebugLog(@"[ viewDidLayoutSubviews ]");
}
-(void)viewWillLayoutSubviews{
    DebugLog(@"[ viewWillLayoutSubviews ]");
}
- (void)viewDidLoad
{
    DebugLog(@"[ viewDidLoad ]");
    [super viewDidLoad];
    
    //Notification
    //旋转方向
    [self registerDeviceRotation];
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait) {
        self.isInterfacePortraitUpsideDown = false;
    }
    else if (self.interfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
        self.isInterfacePortraitUpsideDown = true;
    }
    
    self.lastDeviceAppOrientation = UIDeviceOrientationPortrait;

    //rootCanvasView
//    UIImage *uiImage = [UIImage imageNamed:@"rootCanvasViewBackground.png"];
//    self.rootCanvasView.backgroundColor = [UIColor colorWithPatternImage:uiImage];
    
    //paintView 设置
    CGPathRef path = [UIBezierPath bezierPathWithRect:self.paintView.bounds].CGPath;
    [self.paintView.layer setShadowPath:path];
    self.paintView.layer.shadowOpacity = 0.5;
    self.paintView.layer.shadowRadius = 10;
    self.paintView.layer.shadowOffset = CGSizeMake(0, 5);
    self.paintView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    self.paintView.delegate = self;

    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (context == nil) {
        context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if(context == nil){
            DebugLog(@"Failed to create ES context");
        }
    }
    self.paintView.context = context;
//    self.paintView.context = [self.delegate createEAGleContextWithShareGroup];
    [self.paintView.context setDebugLabel:@"PaintView Context"];
    [self.paintView initGLObjects];
    
    //加在工作环境
    [self loadWorkSpace];
    
    [self.paintColorButton setColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    [self.opacitySlider setColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
   
    //工具栏
    //隐藏初始化未显示的ToolBar
    self.paintToolBar.center = CGPointMake(self.paintToolBar.center.x, self.view.bounds.size.height + self.paintToolBar.bounds.size.height * 0.5);
//    self.brushTypeBar.center = CGPointMake(self.brushTypeBar.center.x, self.view.bounds.size.height + self.brushTypeBar.bounds.size.height * 0.5);
    self.mainToolBar.center = CGPointMake( self.mainToolBar.center.x, - self.mainToolBar.bounds.size.height * 0.5);
    self.mainToolBar.delegate = self;
//    self.transformToolBar.center = CGPointMake(self.transformToolBar.center.x, -self.transformToolBar.bounds.size.height * 0.5);
    

    //主要工具

    //初始化各种笔刷
    Pencil *pencil = [[Pencil alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    pencil.delegate = self.paintView;
    
    Eraser *eraser = [[Eraser alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    eraser.delegate = self.paintView;
    
    Pen *pen = [[Pen alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    pen.delegate = self.paintView;
    
    Marker *marker = [[Marker alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    marker.delegate = self.paintView;
    
    Finger *finger = [[Finger alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    finger.delegate = self.paintView;
    
    ChineseBrush *chineseBrush = [[ChineseBrush alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    chineseBrush.delegate = self.paintView;
    
    Crayons *crayons = [[Crayons alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    crayons.delegate = self.paintView;
    
    Bucket *bucket = [[Bucket alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    bucket.delegate = self.paintView;
    
    InkPen *inkPen = [[InkPen alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    inkPen.delegate = self.paintView;
    
    MarkerSquare *markerSquare = [[MarkerSquare alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    markerSquare.delegate = self.paintView;
    
    OilBrush *oilBrush = [[OilBrush alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    oilBrush.delegate = self.paintView;
    
    AirBrush *airBrush = [[AirBrush alloc]initWithPaintView:self.paintView GLWrapper:self.paintView.glWrapper canvasSize:self.paintView.bounds.size];
    airBrush.delegate = self.paintView;
    
    //将笔刷加入笔刷类型视图
    UIScrollView *scrollView = (UIScrollView *)self.brushTypeScrollView;
    scrollView.delegate = self;
    
    [self.brushTypeScrollView addBrushType:pencil];
    [self.brushTypeScrollView addBrushType:eraser];
    [self.brushTypeScrollView addBrushType:pen];
    [self.brushTypeScrollView addBrushType:marker];
    [self.brushTypeScrollView addBrushType:finger];
    [self.brushTypeScrollView addBrushType:chineseBrush];
    [self.brushTypeScrollView addBrushType:crayons];
    [self.brushTypeScrollView addBrushType:bucket];
    [self.brushTypeScrollView addBrushType:inkPen];
    [self.brushTypeScrollView addBrushType:markerSquare];
    [self.brushTypeScrollView addBrushType:oilBrush];
    [self.brushTypeScrollView addBrushType:airBrush];
    
    const NSInteger numOfBrushPerPage = 6;
    [self.brushTypeScrollView initSubviewsWithNumOfBrushPerPage:numOfBrushPerPage];
    
    self.brushTypePageControl.numberOfPages = (NSInteger)ceilf((CGFloat)[self.brushTypeScrollView.brushTypes count] / numOfBrushPerPage);
    
    //指定当前笔刷
    self.paintView.brushTypes = self.brushTypeScrollView.brushTypes;
    [self.paintView setBrush:pencil];
    
    [self.brushButton addGestureRecognizer:self.lpgrBrushButton];
    self.brushBackButton.brush = eraser;
    self.brushBackButton.frame = CGRectMake(self.brushBackButton.frame.origin.x, 40, self.brushBackButton.frame.size.width, self.brushBackButton.frame.size.height);
    [self.brushBackButton setNeedsDisplay];

    //颜色槽
    self.colorSlotsScrollView.isAccessibilityElement = true;
    self.colorSlotsScrollView.accessibilityLabel = @"Pallete";
    //将颜色槽加入颜色槽ScrollView
    self.colorButtons = [[NSMutableArray alloc]init];
    
    //从user document目录workspace.plist中取出保存的颜色，如果是第一次使用无workspace.plist则创建workspace.plist
    NSMutableArray *colorPalleteArray = [self.workspace mutableArrayValueForKey:@"colorPalletes"];
    int emptyPalleteCount = 10 - colorPalleteArray.count % 10;

    for (int i = 0; i < colorPalleteArray.count + emptyPalleteCount; ++i) {
        ColorButton* colorButton = [[ColorButton alloc]initWithFrame:CGRectMake(50 * i, 0, 50, 50)];
        colorButton.isAccessibilityElement = true;
        colorButton.accessibilityLabel = [NSString stringWithFormat:@"PalleteColor_%d",i];
        
        UIColor *colorPallete;
        if (i < colorPalleteArray.count) {
            NSData *colorPalleteData = [colorPalleteArray objectAtIndex:i];            
            colorPallete = [NSKeyedUnarchiver unarchiveObjectWithData:colorPalleteData];
            colorButton.isEmpty = false;
        }
        else{
            colorPallete = [UIColor clearColor];
            colorButton.isEmpty = true;
        }

        colorButton.color = colorPallete;
        
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
    
    self.colorSlotsScrollView.contentSize = CGSizeMake(50*(colorPalleteArray.count + emptyPalleteCount), 44);
    self.colorSlotsScrollView.delegate = self;
    
    //将半径按钮加入半径ScrollView
//    int radiusViewCount = 10;
//    for (int i = 0; i < radiusViewCount; ++i) {
//        RadiusButton* radiusButton = [[RadiusButton alloc]initWithFrame:CGRectMake(50 * i, 0, 50, 50)];
//        radiusButton.radius = 2 + 3 * i;
//        
//        [radiusButton addTarget:self action:@selector(selectBrushRadius:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.radiusScrollView addSubview:radiusButton];
//    }
//    self.radiusScrollView.contentSize = CGSizeMake(50*radiusViewCount, 44);
//    self.radiusScrollView.delegate = self;
    
    
    //初始化吸管
    self.eyeDropper = [[EyeDropper alloc]initWithView:self.paintView];
    self.paintView.eyeDropper =  self.eyeDropper;
    self.eyeDropperIndicatorView.hidden = true;

    _state = PaintScreen_Normal;

    //初始化取色器 InfColorPicker
	self.infColorPickerController = [ InfColorPickerController colorPickerViewController ];
    [self.infColorPickerController initAfterViewDidLoad];
    
    self.lpgrPaintView.delegate=self;
    
    [self.pgrBrushView requireGestureRecognizerToFail:self.lpgrPaintView];
    
    [self.pgrRootCanvasView delaysTouchesBegan];
    [self.pgrRootCanvasView requireGestureRecognizerToFail:self.pgr1TouchesPaintView];

    
    //实现UndoRedo
//    self.undoButton.hidden = true;
//    self.redoButton.hidden = true;
    
    //自定义手势
    self.clearGestureRecognizer = [[ClearGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan3TouchesClearRootCanvasView:)];
    [self.rootCanvasView addGestureRecognizer:self.clearGestureRecognizer];
    [self.pgrRootCanvasView requireGestureRecognizerToFail:self.clearGestureRecognizer];
    [self.pgr3TouchesRootCanvasView requireGestureRecognizerToFail:self.clearGestureRecognizer];
    
    //单击在双击失败之后判断
    [self.tapGR1Touches1TapsPaintView requireGestureRecognizerToFail:self.tapGR1Touches2TapsRootCanvasView];
    [self.tapGR1Touches1TapsPaintView requireGestureRecognizerToFail:self.tapGR3Touches1TapsRootCanvasView];
    
    //多线程,最好的方式是给_uploadDataQueque创建独立的context
    _uploadDataQueque = dispatch_queue_create("com.WenjieHu.ProjectPaint.uploadDataQueue", NULL);
    
    
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
    [self setBrushView:nil];
    [self setPgrRootCanvasView:nil];
    [self setPgrBrushView:nil];
    [self setLblBrushRadius:nil];
    [self setLblBrushOpacity:nil];
    [self setBrushTypeScrollView:nil];
    [self setLpgrColorSlots:nil];
    [self setLpgrBrushView:nil];
    [self setColorButtons:nil];
    [self setPencilBrushToolBar:nil];
    [self setAirBrushToolBar:nil];
    [self setBtnPaint:nil];
    [self setTestOpenGLView:nil];
    [self setActivityIndicator:nil];
    [self setImageView:nil];
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
    [self setDebugView:nil];
    [self setDebugView2:nil];
    [self setColorPickerIndicatorMagnify:nil];
    [self setRadiusSlider:nil];
    [self setEyeDropperButton:nil];
    [self setLayerButton:nil];
    [self setColorSlotsScrollView:nil];
    [self setImportButton:nil];
    [self setProjectButton:nil];
    [self setExportButton:nil];
    [self setCloseButton:nil];
    [self setTransformToolBar:nil];
    [self setMainToolBar:nil];
    [self setTransformToolButtons:nil];
    [self setAnchorView:nil];
    [self setFreeTransformButton:nil];
    [self setMoveTransformButton:nil];
    [self setRotateTransformButton:nil];
    [self setScaleTransformButton:nil];
    [self setTransformDoneButton:nil];
    [self setCancelTransformButton:nil];
    [self setTransformButton:nil];
    [self setOpacitySlider:nil];
    [self setRadiusIndicatorView:nil];
//    [self setBrushTypeBar:nil];
    [self setBrushBackButton:nil];
    [self setEyeDropperIndicatorView:nil];
    [self setClearButton:nil];
    [self setRedoButton:nil];
    [self setUndoButton:nil];
    [self setRootCanvasView:nil];
    [super viewDidUnload];

}

//dealloc调用导致内存增加的问题？
//-(void)dealloc{
//    DebugLog(@"[ dealloc ]");
//}

-(void)didReceiveMemoryWarning{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //    if ([[segue identifier] isEqualToString:@"showPaint"]) {
    //        
    //        UIViewController *viewController = [segue destinationViewController];
    //
    //        ShowPaint *view = (ShowPaint*)viewController.view;
    //        [view setSourcePaintView:paintView];
    //        [viewController.view setNeedsDisplay];
    //    }
    if ([[segue identifier] isEqualToString:@"selectLayerContent"]) {
        SelectLayerContentViewController *viewController = [segue destinationViewController];   
        viewController.delegate = self;
        //        viewController.paintScreen = self;
    }
}
#pragma mark- 手势 Gestures 绘图
- (IBAction)handlePan1TouchesPaintView:(UIPanGestureRecognizer *)sender {
//    DebugLog(@"handlePan1TouchesPaintView");
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            //如果移动手势，重置判断是绘图还是变换的意图
            switch (self.paintView.state) {
                    
                case PaintingView_TouchNone:
                {
                    self.twoFingerPanGestureStartTime = [NSDate date];
                    self.paintView.paintTouch = nil;
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            //需要继续判断是否 双指操作 or 单指操作
            switch (self.paintView.state) {
                case PaintingView_TouchNone:{
                    DebugLog(@"self.paintView.state PaintingView_TouchNone");
                    
                    self.twoFingerPanGestureCurTimeInterval = -[self.twoFingerPanGestureStartTime timeIntervalSinceNow];
                    
                    //                DebugLog(@"self.twoFingerPanGestureCurTimeInterval ti %.2f", self.twoFingerPanGestureCurTimeInterval);
                    
                    //超过双手手势误差时间，状态判定为绘图
                    if (self.twoFingerPanGestureCurTimeInterval >= TwoFingerPanGestureTime){
                        DebugLog(@"self.paintView.state change to PaintingView_TouchPaint");
                        self.twoFingerPanGestureCurTimeInterval = -1;
                        self.paintView.state = PaintingView_TouchPaint;
                    }
                    //未超过误差时间
                    else if (self.twoFingerPanGestureCurTimeInterval > 0 && self.twoFingerPanGestureCurTimeInterval < TwoFingerPanGestureTime){
                        //do nothing
                    }
                    //已经完成状态判定
                    else{
                        //do nothing
                    }
                    break;
                }
                    
                default:
                    break;
            }
        }
        case UIGestureRecognizerStateEnded:
        {
            //绘图模式下，只有参于绘图的Touch End才算绘图结束，在paintView touchEnd中判断
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
- (IBAction)handleLongPressPaintView:(UILongPressGestureRecognizer *)sender{
    DebugLog(@"[handleLongPressPaintView]");
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
            self.paintView.state = PaintingView_TouchEyeDrop;
            CGPoint point = [self willGetEyeDropLocation];
            [self.paintView eyeDropColor:point];
            
            [self willStartUIEyeDrop];
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
    DebugLog(@"handleTap1Touches1TapsPaintView");
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        self.paintView.state = PaintingView_TouchPaint;
        if (self.paintView.paintTouch == NULL) {
            self.paintView.paintTouch = self.paintView.firstTouch;
        }
        CGPoint location = [sender locationInView:sender.view];
        location.y = self.paintView.bounds.size.height - location.y;
        [self.paintView startDraw:location isTapDraw:true];
        [self.paintView draw:true];
    }
}

#pragma mark
- (IBAction)handlePan1TouchesRootCanvasView:(UIPanGestureRecognizer *)sender {
    DebugLog(@"handlePan1TouchesRootCanvasView");
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
                case PaintingView_TouchNone:{
                    self.twoFingerPanGestureCurTimeInterval = -1;
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
                case PaintingView_TouchTransformCanvas:{
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
                case PaintingView_TouchTransformCanvas:{
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
//    DebugLog(@"handlePan2TouchesRootCanvasView");
    if (_state == PaintScreen_Normal) {
        [self handlePan2TouchesRootCanvasViewInStateNormal:sender];
    }
    else if (_state == PaintScreen_Transform) {
        [self handlePan2TouchesRootCanvasViewInStateTransform:sender];
    }
}

- (IBAction)handlePan3TouchesRootCanvasView:(UIPanGestureRecognizer *)sender {
//    DebugLog(@"handlePan3TouchesRootCanvasView");
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
                case PaintingView_TouchNone:{
                    self.twoFingerPanGestureCurTimeInterval = -1;
                    [self handle3TouchesOperationBegan:sender];
                    break;
                }
                case PaintingView_TouchQuickTool:{
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
                case PaintingView_TouchQuickTool:{
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
//        //self.paintView.state = PaintingView_TouchNone until transform done confirmed
//    }
//    else if(sender.state == UIGestureRecognizerStateCancelled){
//    }
//
//}
//
//- (void)handlePinchRootViewInStateNormal:(UIPinchGestureRecognizer *)sender {
//    if(sender.state == UIGestureRecognizerStateBegan){
//        self.paintView.state = PaintingView_TouchTransformCanvas;
//        [self handleTwoFingerTransformCanvasBegan:sender];
//    }
//    else if (sender.state == UIGestureRecognizerStateEnded){
//        DebugLog(@"handlePinchPaintView ended");
//        //变换模式下
//        if (self.paintView.state == PaintingView_TouchTransformCanvas) {
//            //双手都放开，或者单手放开，都结束操作
//            //                if (sender.numberOfTouches != 2) {
//            [self handleTwoFingerTransformCanvasEnd:sender];
//            //                }
//        }
//        //绘图模式下，只有参于绘图的Touch End才算绘图结束，在paintView touchEnd中判断
//        else if (self.paintView.state == PaintingView_TouchPaint){
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


- (IBAction)handlePan3TouchesClearRootCanvasView:(ClearGestureRecognizer *)sender {
    DebugLog(@"handlePan3TouchesClearRootCanvasView");
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
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.clearEffectView.alpha = 0.75;
            } completion:nil];
            
            //工具栏
            self.clearButton.highlighted = true;
            [self.clearButton.layer setNeedsDisplay];
            
            break;
        }
        case UIGestureRecognizerStateRecognized:{
            DebugLog(@"handleClearCanvas Recognized");
            
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.clearEffectView.alpha = 1.0;
            } completion:^(BOOL finished) {
                [self.paintView clearData];
                self.clearEffectView.hidden = true;
                
                //工具栏
                self.clearButton.highlighted = false;
                [self.clearButton.layer setNeedsDisplay];
                [self updateFuzzyTransparentViews];
            }];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            DebugLog(@"handleClearCanvas Failed");
            
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
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
    DebugLog(@"handleLongPress2TouchesRootCanvasView");
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
    DebugLog(@"handleTap1Touches2TapsRootCanvasView");
    if (_state != PaintScreen_Normal) {
        return;
    }
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [self swapBrushType];
    }
}

- (IBAction)handleTap2Touches2TapsRootCanvasView:(UITapGestureRecognizer *)sender {
    DebugLog(@"handleTap2Touches2TapsRootCanvasView");
    if (_state != PaintScreen_Normal) {
        return;
    }
    if (sender.state == UIGestureRecognizerStateRecognized) {
        [self.paintView transformCanvasReset];
    }
}

- (IBAction)handleTap3Touches1TapsRootCanvasView:(UITapGestureRecognizer *)sender {
    DebugLog(@"handleTap3Touches1TapsRootCanvasView");
    if (_state != PaintScreen_Normal) {
        return;
    }
    if(sender.state == UIGestureRecognizerStateRecognized){
        [self togglePaintFullScreen];
    }
}


- (IBAction)handlePanTransformAnchorView:(UIPanGestureRecognizer *)sender {
//    DebugLog(@"handlePanAnchorView %@", sender.view);
    if (_state != PaintScreen_Transform) {
        return;
    }
    NSUInteger index = sender.view.tag;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            CGPoint p0 = sender.view.center;
            p0 = [self.paintView convertPoint:p0 fromView:self.rootCanvasView];
            self.curTransformAnchorViewSrcCenter = p0;
            
            //找到对应的另一处anchorView
            TransformAnchorView *view = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:8 - index];
            CGPoint p1 = view.center;
            p1 = [self.paintView convertPoint:p1 fromView:self.rootCanvasView];
            
            self.curTransformDirection = atan2f(p0.y - p1.y, p0.x - p1.x);
            
            self.transformContentViewSrcCenter = self.transformContentView.center;
            self.transformContentViewSrcBounds = self.transformContentView.bounds;
            
            [self transformImageStartWithPoint0:p0 point1:p1 forceImageCenterAnchor:false];
            
            //UI
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
            
            TransformAnchorView *view = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:8 - index];
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

#pragma mark
- (void)handle2TouchesTransformCanvasBegan:(UIGestureRecognizer *)sender{
    DebugLog(@"handle2TouchesTransformCanvasBegan");
    if (_state != PaintScreen_Normal) {
        return;
    }
    if (sender.numberOfTouches != 2) {
        return;
    }
    
    self.paintView.state = PaintingView_TouchTransformCanvas;
    
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
    [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];
    [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
}

- (void)handle2TouchesTransformCanvasEnded:(UIGestureRecognizer *)sender{
//    DebugLog(@"handle2TouchesTransformCanvasEnd");
    if (_state != PaintScreen_Normal) {
        return;
    }
    self.paintView.state = PaintingView_TouchNone;
    
    CALayer *layer = self.paintView.layer;
    CGFloat x = ((NSNumber*)[layer valueForKeyPath:@"transform.translation.x"]).floatValue;
    CGFloat y = ((NSNumber*)[layer valueForKeyPath:@"transform.translation.y"]).floatValue;
    CGPoint center = CGPointMake(layer.frame.origin.x + layer.frame.size.width * 0.5, layer.frame.origin.y + layer.frame.size.height * 0.5);
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    layer.position = CGPointMake(center.x - x, center.y - y);

    DebugLog(@"final");
    DebugLog(@"start layer frame %@", NSStringFromCGRect(self.paintView.layer.frame));
    DebugLog(@"start layer bounds %@", NSStringFromCGRect(self.paintView.layer.bounds));
    DebugLog(@"middle layer anchor %@", NSStringFromCGPoint(self.paintView.layer.anchorPoint));
    DebugLog(@"start layer position %@", NSStringFromCGPoint(self.paintView.layer.position));
    CGFloat x1 = ((NSNumber*)[self.paintView.layer valueForKeyPath:@"transform.translation.x"]).floatValue;
    CGFloat y1 = ((NSNumber*)[self.paintView.layer valueForKeyPath:@"transform.translation.y"]).floatValue;
    DebugLog(@"start layer translation x:%.1f y:%.1f", x1, y1);
    
    //UI
    [self showRotateCanvasUI:false];
    [self showZoomCanvasUI:false];
    [self showLockRotateCanvasUI:false];
    if (!self.isPaintFullScreen) {
        [self switchTopToolBarFrom:nil completion:nil to:self.mainToolBar completion:nil];
        [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:nil];
    }

}

- (void)handle2TouchesTransformCanvas:(UIGestureRecognizer *)sender{
//    DebugLog(@"handle2TouchesTransformCanvas");
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
    self.paintView.state = PaintingView_TouchQuickTool;
    UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)sender;
    CGPoint translation = [gesture translationInView:self.rootCanvasView];
    
    if (translation.x > 0 && translation.y < 0) {
        [self redoDraw];
    }
    else if (translation.x > 0 && translation.y > 0) {
        //打开取色器快捷方式

//        [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:^{
            [self paintColorButtonTapped:nil];
//        }];
    }
    else if (translation.x < 0 && translation.y < 0 ) {
        //打开图层快捷方式
//        [self switchTopToolBarFrom:nil completion:nil to:self.mainToolBar completion:^{
            [self layerButtonTapped:nil];
//        }];
    }
    else if (translation.x < 0 && translation.y > 0) {
        [self undoDraw];
        

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
    
    self.paintView.state = PaintingView_TouchNone;
    
    if (self.isPaintFullScreen) {
        [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];
        //将layerPanel移到顶端
        [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
    }
}

#pragma mark


//函数可能被多个UITouch触发多次
//- (void)handlePanRootCanvasViewInStateNormal:(UIPanGestureRecognizer *)sender{
//    DebugLog(@"handlePanRootCanvasViewInStateNormal numberOfTouches %d", sender.numberOfTouches);
//    
//    switch (sender.state) {
//            
//        case UIGestureRecognizerStateBegan:{
//            //            DebugLog(@"handlePanPaintViewBegan numberOfTouches %d", sender.numberOfTouches);
//            
//            //如果移动手势，重置判断是绘图还是变换的意图
//            switch (self.paintView.state) {
//
//                case PaintingView_TouchNone:
//                {
//                    self.twoFingerPanGestureStartTime = [NSDate date];
//                    self.paintView.paintTouch = nil;
//                    break;
//                }
//
//                case PaintingView_TouchPaint:
//                {
////                    self.paintView.state = PaintingView_TouchNone;
//                    break;
//                }
//
//                case PaintingView_TouchEyeDrop:
//                case PaintingView_TouchTransformImage:
//                case PaintingView_TouchTransformLayer:
//                case PaintingView_TouchTransformCanvas:
//                case PaintingView_TouchQuickTool:
//                {
//                    break;
//                }
//                default:
//                    break;
//            }
////            if(self.paintView.state != PaintingView_TouchEyeDrop){
////                self.twoFingerPanGestureStartTime = [NSDate date];
////                self.paintView.state = PaintingView_TouchNone;
////                self.paintView.paintTouch = nil;
////            }
//            break;
//        }
//        case UIGestureRecognizerStateChanged:{
//            //            DebugLog(@"handlePanPaintViewChanged numberOfTouches %d", sender.numberOfTouches);
//            //需要继续判断是否 双指操作 or 单指操作
//            if(self.paintView.state == PaintingView_TouchNone){
//                DebugLog(@"self.paintView.state PaintingView_TouchNone");
//                self.twoFingerPanGestureCurTimeInterval = -[self.twoFingerPanGestureStartTime timeIntervalSinceNow];
////                DebugLog(@"self.twoFingerPanGestureCurTimeInterval ti %.2f", self.twoFingerPanGestureCurTimeInterval);
//                //超过双手手势误差时间，状态判定为绘图
//
//                if (self.twoFingerPanGestureCurTimeInterval >= TwoFingerPanGestureTime){
//                    DebugLog(@"self.paintView.state change to PaintingView_TouchPaint");
//                    self.twoFingerPanGestureCurTimeInterval = -1;
//                    self.paintView.state = PaintingView_TouchPaint;
//                }
//                //未超过误差时间
//                else if (self.twoFingerPanGestureCurTimeInterval > 0 && self.twoFingerPanGestureCurTimeInterval < TwoFingerPanGestureTime){
//                    //优先判断如果有三手参与Pan，则状态判定为Undo Redo
//                    if (sender.numberOfTouches == 3) {
//                        DebugLog(@"handleThreeFingerOperationBegan");
//                        self.twoFingerPanGestureCurTimeInterval = -1;
//                        [self handleThreeFingerOperationBegan:sender];
//                    }
//                    //如果有双手参与Pan，则状态判定为TransformCanvas
//                    else if (sender.numberOfTouches == 2) {
//                        DebugLog(@"handleTwoFingerTransformCanvasBegan");
//                        self.twoFingerPanGestureCurTimeInterval = -1;
//                        [self handleTwoFingerTransformCanvasBegan:sender];
//                    }
//                    //如果单手参与Pan，则不进行绘制，不重置计时器
//                    else if (sender.numberOfTouches == 1){
//                        //do nothing
//                    }
//                }
//                //已经完成状态判定
//                else{
//                }
//            }
//            
//            //状态已经判定为Paint
//            else if (self.paintView.state == PaintingView_TouchPaint){
//                DebugLog(@"self.paintView.state PaintingView_TouchPaint");
//                //在touchMoved中进行绘图
//            }
//            
//            //状态已经判定为TransformCanvas
//            else if (self.paintView.state == PaintingView_TouchTransformCanvas){
//                //                DebugLog(@"self.paintView.state PaintingView_TouchTransformCanvas");
//                //双指操作
//                if (sender.numberOfTouches == 2) {
//                    [self handleTwoFingerTransformCanvas:sender];
//                }
//                //操作中单指离开，中断操作
//                else if (sender.numberOfTouches == 1) {
//                    //do nothing
//                }
//            }
//            
//            //状态已经判定为Undo Redo
//            else if (self.paintView.state == PaintingView_TouchQuickTool){
//                [self handleThreeFingerOperation:sender];
//            }
//
//            //            else if (self.paintView.state == PaintingView_TouchEyeDrop){
//            //                DebugLog(@"self.paintView.state PaintingView_TouchEyeDrop");
//            //
//            //            }
//            break;
//        }
//        case UIGestureRecognizerStateEnded:{
//            //变换模式下
//            if (self.paintView.state == PaintingView_TouchTransformCanvas) {
//                //双手都放开，或者单手放开，都结束操作
//                DebugLog(@"handlePanRootView ended sender.numberOfTouches %d", sender.numberOfTouches);
//                //sender.numberOfTouches == 0;
//                [self handleTwoFingerTransformCanvasEnd:sender];
//            }
//            else if (self.paintView.state == PaintingView_TouchQuickTool){
//                DebugLog(@"handlePanRootView Undo ended sender.numberOfTouches %d", sender.numberOfTouches);
//                [self handleThreeFingerOperationEnd:sender];
//            }
//            //绘图模式下，只有参于绘图的Touch End才算绘图结束，在paintView touchEnd中判断
//            else if (self.paintView.state == PaintingView_TouchPaint){
//            }
//            else if (self.paintView.state == PaintingView_TouchNone){
//            }
//            break;
//        }
//        case UIGestureRecognizerStateCancelled:{
//            break;
//        }
//        default:
//            break;
//    }
//}
//
//- (IBAction)handlePanRootView:(UIPanGestureRecognizer *)sender {
////    DebugLog(@"handlePanPaintView");
//  
//    //变换图片
//    if (_state == PaintScreen_Transform) {
//        [self handlePanRootCanvasViewInStateTransform:sender];
//    }
//    else{
//        [self handlePanRootCanvasViewInStateNormal:sender];
//    }
//}





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

#pragma mark- 手势 Gestures 其他(无需判断状态)
- (IBAction)handleLongPressPaintColorButton:(UILongPressGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            //吸出颜色
            self.colorSaveToSlotView.hidden = false;
            self.colorSaveToSlotView.alpha = 1;
            self.colorSaveToSlotView.color = self.paintColorButton.color;
            self.colorSaveToSlotView.bounds = CGRectMake(0, 0, 44, 44);
            [self.colorSaveToSlotView setNeedsDisplay];
            
            self.colorSaveTargetButton = (ColorButton*)sender.view;
            
            CGPoint centerInRootView = [self.rootView convertPoint:self.paintColorButton.center fromView:self.paintColorView];
            self.colorSaveToSlotView.center = centerInRootView;
            
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.colorSaveToSlotView.center = CGPointMake(centerInRootView.x, self.paintToolBar.frame.origin.y - 10);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.colorSaveToSlotView.center = CGPointMake(centerInRootView.x, self.paintToolBar.frame.origin.y);
                }completion:^(BOOL finished) {
                }];
                
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
                for (ColorButton* button in self.colorButtons) {
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
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGPoint targetCenterInRootView = [self.rootView convertPoint:self.colorSaveTargetButton.center fromView:self.colorSaveTargetButton.superview];
                self.colorSaveToSlotView.center = targetCenterInRootView;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    self.colorSaveToSlotView.bounds = self.colorSaveTargetButton.bounds;
                    self.colorSaveToSlotView.alpha = 0;
                    self.colorSaveTargetButton.color = self.colorSaveToSlotView.color;
                    self.colorSaveTargetButton.isEmpty = false;
                }completion:^(BOOL finished) {
                    self.colorSaveToSlotView.hidden = true;
                    //检查所有颜色按钮，如果没有Empty的颜色按钮了，添加10个新的颜色按钮
                    bool colorButtonIsFull = true;
                    for (ColorButton *colorButton in self.colorButtons) {
                        if (colorButton.isEmpty) {
                            colorButtonIsFull = false;
                            break;
                        }
                    }
                    if (colorButtonIsFull) {
                        [self addNewColorButtons];
                    }
                }];
            }];
            break;
        }
        case UIGestureRecognizerStateCancelled:{
            break;
        }
        default:
            break;
    }
}

- (IBAction)handlePanTopDownToolBar:(UIPanGestureRecognizer *)sender {
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
    BrushTypeButton *brushTypeButton = (BrushTypeButton *)sender.view;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            [self editBrush:brushTypeButton.brush];
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
    ColorButton* colorButton = (ColorButton*)sender.view;
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
    ColorButton* colorButton = (ColorButton*)sender.view;
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

            ColorButton* colorButton = (ColorButton*)sender.view;
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

- (IBAction)handlePanBrushView:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            _state = PaintScreen_Normal;
            break;
            
        default:
            break;
    }

    if(_state == PaintScreen_EditingBrushSize){
        CGPoint translation = [sender translationInView:sender.view];
        self.paintView.brush.brushState.radius += translation.x * 0.05;
        self.paintView.brush.brushState.radius = MIN(MAX(self.paintView.brush.brushState.radius, 1), self.brushView.bounds.size.height * 0.5 - 2);
        
        self.lblBrushRadius.text = [NSString stringWithFormat:@"Radius : %.1f", self.paintView.brush.brushState.radius] ;
        
        [self.brushView setNeedsDisplay];
    }
    else if(_state == PaintScreen_EditingBrushOpacity){
        CGPoint translation = [sender translationInView:sender.view];
        self.paintView.brush.brushState.opacity -= translation.y * 0.001;
        self.paintView.brush.brushState.opacity = MIN(MAX(self.paintView.brush.brushState.opacity, 0), 1);
        
        self.lblBrushOpacity.text = [NSString stringWithFormat:@"Opacity : %.2f", self.paintView.brush.brushState.opacity] ;
        
        [self.brushView setNeedsDisplay];
    }
    else {
        CGPoint translation = [sender translationInView:sender.view];
        if((fabsf(translation.x) > fabsf(translation.y)) && (fabsf(translation.x)>EditBrushSizeConfirmPixels))
        {
            _state = PaintScreen_EditingBrushSize;
        }
        else if ((fabsf(translation.y) > fabsf(translation.x)) && (fabsf(translation.y)>EditBrushSizeConfirmPixels)) {
            _state = PaintScreen_EditingBrushOpacity;
        }
    }
}

- (IBAction)handleTapBrushView:(UITapGestureRecognizer *)sender {
    
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //shrink when color button's frame origin is out of contentOffset ~ (contentOffset + scrollview.width)
//    DebugLog(@"count %d", _colorSlotsScrollView.subviews.count);
    
    if ([scrollView isEqual:self.colorSlotsScrollView]) {
        int count = scrollView.subviews.count - 1;//bug?
        for (int i = 0; i < count; ++i) {
            UIButton *button = [scrollView.subviews objectAtIndex:i];
            float newSize;
            float fadeLeftDistance = i*50 + 25 - scrollView.contentOffset.x;
            float fadeRightDistance = scrollView.contentOffset.x + scrollView.frame.size.width - (i*50 + 25);
            //左端缩小
            if(fadeLeftDistance < 25){
                newSize = MAX(0.1, 50 * (fadeLeftDistance / 25.0));
                button.frame = CGRectMake(i*50 + (50 - newSize) * 0.5, (50 - newSize) * 0.5, newSize, newSize);
            }
            //右端缩小
            else if(fadeRightDistance < 25){
                newSize = MAX(0.1, 50 * (fadeRightDistance / 25.0));
                button.frame = CGRectMake(i*50, (50 - newSize) * 0.5, newSize, newSize);
            }
            //正常大小
            else{
                button.frame = CGRectMake(i*50, 0, 50, 50);
            }
        }
    }
}

- (void)setBrushPreview:(bool)enable{
    self.brushView.hidden = !enable;
    _state = enable? PaintScreen_PreviewBrush : PaintScreen_Normal;
}
//- (void)toggleBrushPreview{
//    [self setBrushPreview:!_isPreviewBrush];
//}
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
//        [self switchDownToolBarFrom:self.paintToolBar completion:^{
//        }to:self.brushTypeBar completion:^{
//            _state = PaintScreen_SelectBrush;
//            //笔刷面板禁止绘图
//            self.paintView.userInteractionEnabled = false;
//        }];
//        
//        [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
        
        //切换成横移动画
        [self slideToolBarRightDirection:true out:self.paintToolView in:self.brushTypeView completion:^{
            _state = PaintScreen_SelectBrush;
            //笔刷面板禁止绘图
            self.rootCanvasView.userInteractionEnabled = false;
        }];

    }
}

- (IBAction)brushTypeButtonTouchUp:(UIButton *)sender {
 
    [self brushTypeSelected];
}

- (IBAction)brushTypeButtonTouchDown:(UIButton *)sender {
    self.brushButtonTempRect = sender.frame;
    [UIView animateWithDuration:0.2 animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 20, sender.frame.size.width, sender.frame.size.height);        
    }completion:nil];

}

- (IBAction)brushTypeButtonTouchCancel:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 0, sender.frame.size.width, sender.frame.size.height);
    }completion:nil];
}

- (IBAction)brushTypePageControlValueChanged:(UIPageControl *)sender {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.brushTypeScrollView.contentOffset = CGPointMake(sender.currentPage * self.brushTypeScrollView.frame.size.width, 0);
    } completion:nil];
}

- (IBAction)brushTypeBackButtonTouchUp:(UIButton *)sender {
    BrushTypeButton *tempButton = self.brushBackButton;
    self.brushBackButton = self.brushButton;
    self.brushButton = tempButton;
    [self.paintView setBrush:self.brushButton.brush];
    
    [self.paintToolBar bringSubviewToFront:self.brushButton];
    
    self.brushButton.userInteractionEnabled = false;
    self.brushBackButton.userInteractionEnabled = false;
    
    [UIView animateWithDuration:0.3 animations:^{
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
    [UIView animateWithDuration:0.3 animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 40, sender.frame.size.width, sender.frame.size.height);
        self.brushButton.frame = CGRectMake(self.brushButton.frame.origin.x, 0, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
    }completion:^(BOOL finished) {
    }];
}
- (IBAction)brushTypeBackButtonTouchDown:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        sender.frame = CGRectMake(sender.frame.origin.x, 0, sender.frame.size.width, sender.frame.size.height);
        self.brushButton.frame = CGRectMake(self.brushButton.frame.origin.x, 40, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
    }completion:^(BOOL finished) {
    }];
}
-(void)swapBrushType{
    DebugLog(@"swapBrushType");
    if(_state == PaintScreen_Normal){
        //            [self togglePaintFullScreen];
        //            self.paintView.multiTouchEndCount = sender.numberOfTouchesRequired;
        
        //切换笔刷快捷方式
        [self brushTypeBackButtonTouchDown:self.brushBackButton];
        
        [self brushTypeBackButtonTouchUp:self.brushBackButton];
        
        [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:^{
            
            if (self.isPaintFullScreen) {
                [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];
                //将layerPanel移到顶端
                [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
            }
        }];
        self.paintView.state = PaintingView_TouchNone;
        
    }
}

- (void)addNewColorButtons{
    int srcCount = self.colorButtons.count;
    for (int i = 0; i < 10; ++i) {
        ColorButton* colorButton = [[ColorButton alloc]initWithFrame:CGRectMake(50 * (i + srcCount), 0, 50, 50)];
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


- (IBAction)selectColor:(ColorButton *)sender {
    [sender enableHighlighted:true];
}

- (IBAction)selectColorConfirmed:(ColorButton *)sender {
    [sender enableHighlighted:false];
}
- (IBAction)selectColorToBlend:(ColorButton *)sender {
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

- (IBAction)selectColorCancel:(ColorButton *)sender {
    [sender enableHighlighted:false];
}

- (IBAction)selectBrushRadius:(RadiusButton *)sender {
    self.paintView.brush.brushState.radius = sender.radius;
    self.radiusSlider.value = (float)sender.radius;
    self.lblBrushRadius.text = [NSString stringWithFormat:@"Radius : %.0f", self.paintView.brush.brushState.radius];
    [self.brushView setNeedsDisplay];
}

- (IBAction)slideBrushRadius:(UISlider *)sender {
    self.paintView.brush.brushState.radius = sender.value;
    
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

//    CGRect trackRect = [sender trackRectForBounds:sender.bounds];
//    CGRect thumbRect = [sender thumbRectForBounds:sender.bounds trackRect:trackRect value:sender.value];
    
//    self.radiusIndicatorView.center = CGPointMake(thumbRect.origin.x + sender.frame.origin.x + 10,  sender.frame.origin.y - 80);
//    DebugLog(@"self.radiusIndicatorView center x: %.2f y: %.2f", self.radiusIndicatorView.center.x, self.radiusIndicatorView.center.y);
    self.lblBrushRadius.text = [NSString stringWithFormat:@"Radius : %.0f", self.paintView.brush.brushState.radius];
    [self.brushView setNeedsDisplay];    
}



- (IBAction)radiusSliderTouchDown:(RadiusSlider *)sender {
    self.radiusIndicatorView.hidden = false;
}

- (IBAction)radiusSliderTouchUp:(RadiusSlider *)sender {
    if (!self.radiusIndicatorView.hidden) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.radiusIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            self.radiusIndicatorView.hidden = true;
        }];
    }
}

- (IBAction)radiusSliderTouchUpOutside:(RadiusSlider *)sender {
    if (!self.radiusIndicatorView.hidden) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.radiusIndicatorView.layer setValue:[NSNumber numberWithFloat:0.1] forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            self.radiusIndicatorView.hidden = true;
        }];
    }
}

- (IBAction)slideBrushOpacity:(UISlider *)sender {
    //根据不同的brush，设置不同的参数
    if ([self.paintView.brush isKindOfClass:[Finger class]] ||
        [self.paintView.brush isKindOfClass:[OilBrush class]]) {
        self.paintView.brush.brushState.wet = 1.0 - (float)sender.value;
    }
    else{
        self.paintView.brush.brushState.opacity = (float)sender.value;
    }
}

-(void)setOpacitySliderValueWithBrushState:(BrushState*)brushState{
    //根据不同的brush，设置不同的参数
    if ([self.paintView.brush isKindOfClass:[Finger class]] ||
        [self.paintView.brush isKindOfClass:[OilBrush class]]) {
        self.opacitySlider.value = 1.0 - brushState.wet;
    }
    else{
        self.opacitySlider.value = brushState.opacity;
    }
}
- (IBAction)syncBrushView:(id)sender {
    self.brushView.color = self.infColorPickerController.resultColor;
    [self.brushView setNeedsDisplay];    
}

- (IBAction)showPaint:(id)sender {
//    [paintView testSave];
}


#pragma mark- 文件操作
//主界面MainScreenViewControllerDelegate
- (void)openDoc:(PaintDoc*)paintDoc{
    //DebugLog(@"Open Paint Doc");    
    self.paintDoc = paintDoc;

    [self.paintView setOpenData:[self.paintDoc open]];
   
}

- (void)saveDoc{
    DebugLog(@"self.paintView uploadLayerDatas");
    [self.paintView uploadLayerDatas];
    
    //在paintView完成上传paintData后更新到paintDoc中，并保存paintDoc到磁盘
    //将当前PaintDoc文件保存到.psf
//    DebugLog(@"self.paintDoc saveData");        
    [self.paintDoc save];
    
    //刷新预览文件
//    DebugLog(@"self.paintDoc saveThumbImage");            
    [self.paintDoc saveThumbImage:[self.paintView snapshotScreenToUIImageOutputSize:CGSizeMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5)]];
    
    //保存workspace
    [self saveWorkSpace];
}

-(void)closeDoc{
//    DebugLog(@"self.paintView close");
    [self.paintView destroy];
    [self.paintDoc close];
    
    [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
    [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:^{
        //    DebugLog(@"delegate closePaintDoc");
        [self.delegate closePaintDoc:self.paintDoc];
    }];
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
        NSMutableArray *colorPalleteArray = [self.workspace mutableArrayValueForKey:@"colorPalletes"];
        for (int i = 0; i < colorPalleteCount; ++i) {
            UIColor* colorPallete = [UIColor colorWithRed:colorPalletes[i*3]/255.0 green:colorPalletes[i*3+1]/255.0 blue:colorPalletes[i*3+2]/255.0 alpha:1.0];
            NSData *colorPalleteData = [NSKeyedArchiver archivedDataWithRootObject:colorPallete];
            [colorPalleteArray addObject:colorPalleteData];
        }
        [self.workspace writeToFile:plistFilePath atomically:YES];
    }
}

//保存工作空间文件，工作空间记录包括颜色设置，绘图设置等各种Preference
-(void)saveWorkSpace{
    //保存颜色按钮 到workspace.plist
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistFilePath = [documentsDirectory stringByAppendingPathComponent:@"Workspace.plist"];

    if([[NSFileManager defaultManager] fileExistsAtPath:plistFilePath])
    {//already exits
        NSMutableArray *colorPalleteArray = [self.workspace mutableArrayValueForKey:@"colorPalletes"];
        [colorPalleteArray removeAllObjects];
        for (int i = 0; i < self.colorButtons.count; ++i) {
            ColorButton *colorButton = [self.colorButtons objectAtIndex:i];
            if (!colorButton.isEmpty) {
                NSData *colorPalleteData = [NSKeyedArchiver archivedDataWithRootObject:colorButton.color];
                [colorPalleteArray addObject:colorPalleteData];
            }
        }
        [self.workspace writeToFile:plistFilePath atomically: YES];
    }
    else{
        DebugLog(@"Workspace.plist is missing");
    }
}
#pragma mark- 导出 Export
//TODO:实现代理
- (void)exportToAirPrint{
    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:self.view.frame.size];
    //convert UIImage to NSData to add it as attachment
    NSData *data = UIImagePNGRepresentation(image);
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if  (pic && [UIPrintInteractionController canPrintData: data] ) {
        
        pic.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [NSString stringWithFormat:@"image%lu", (unsigned long)image.hash];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printingItem = data;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
            
            if (!completed && error)
                DebugLog(@"FAILED! due to error in domain %@ with error code %u",error.domain, error.code);
        };
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//            [pic presentFromBarButtonItem:self.printButton animated:YES completionHandler:completionHandler];
            [pic presentFromRect:CGRectMake(0, self.view.frame.size.height - 66, 66, 66) inView:self.view animated:true completionHandler:completionHandler];
        } else {
            [pic presentAnimated:YES completionHandler:completionHandler];
        }
    }
}

- (void)exportToEmail{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    [picker setSubject:@"write your subject here"];
    
    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:self.view.frame.size];
    //convert UIImage to NSData to add it as attachment
    NSData *imageData = UIImagePNGRepresentation(image);
    
    //this is how to attach any data in mail, remember mimeType will be different
    //for other data type attachment.
    
    [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"image.png"];
    
    //showing MFMailComposerView here
    [self presentViewController:picker animated:true completion:^{
        [self.sharedPopoverController dismissPopoverAnimated:true];
    }];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(result == MFMailComposeResultCancelled)
        DebugLog(@"Mail has cancelled");
    if(result == MFMailComposeResultSaved)
        DebugLog(@"Mail has saved");
    
    [self dismissViewControllerAnimated:true completion:nil];
}


#pragma mark- 导入 Import
- (IBAction)importButtonTapped:(UIButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
    
    ImportTableViewController* importTableViewController = [[ImportTableViewController alloc]initWithStyle:UITableViewStylePlain];
    importTableViewController.delegate = self;

    importTableViewController.preferredContentSize = CGSizeMake(320, importTableViewController.tableViewHeight);
    
    self.sharedPopoverController = [[SharedPopoverController alloc]initWithContentViewController:importTableViewController];
    CGRect rect = CGRectMake(self.importButton.bounds.origin.x, self.importButton.bounds.origin.y, self.importButton.bounds.size.width, self.importButton.bounds.size.height);
    [self.sharedPopoverController presentPopoverFromRect:rect inView:self.importButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)takePhotoButtonTapped:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

- (IBAction)pickPhotoButtonTapped:(id)sender {
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}
-(void) didSelectImportPhoto{
    [self.sharedPopoverController dismissPopoverAnimated:true];    
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

-(void) didSelectImportCamera{
    [self.sharedPopoverController dismissPopoverAnimated:true];
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

-(void) didSelectImportDropbox{
    [self.sharedPopoverController dismissPopoverAnimated:true];
    [[DBChooser defaultChooser] openChooserForLinkType:DBChooserLinkTypeDirect
                                    fromViewController:self completion:^(NSArray *results)
     {
         if ([results count]) {
             // Process results from Chooser
             DBChooserResult *result = (DBChooserResult *)[results objectAtIndex:0];
             
             NSData *imageData = [NSData dataWithContentsOfURL:result.link];

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
                 
                 self.transformButton.tag = 1;
                 [self.transformButton.layer setNeedsDisplay];
             }
             else{
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"import invalid images" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    //添加自定义信息层
    //IOS7 cameraOverlayView会overlay retake和usePhoto按钮，需要解决
    //    CameraOverlayViewController* overlayViewController = [[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlayViewController" bundle:nil];
    
//    CameraOverlayViewController* overlayViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"CameraOverlayViewController"];
//    
//    overlayViewController.view.backgroundColor = [UIColor clearColor];//设定透明背景色
//    
//    cameraUI.cameraOverlayView = overlayViewController.view;
    
    cameraUI.delegate = ctrlDelegate;
    //    [self addChildViewController:cameraUI];
    
   [controller presentViewController:cameraUI animated:true completion:nil];
    return YES;
}

#pragma mark- 取图片 UIImagePickerControllerDelegate
// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [self dismissViewControllerAnimated:true completion:nil];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave, *finalImage;
    
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
        
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            //记录照相时的参数
            if (picker.cameraOverlayView!=NULL) {
                CameraOverlayView* camOverlayView = (CameraOverlayView*)picker.cameraOverlayView;
                float camShotPitch = camOverlayView.shotPitch;
                DebugLog(@"Cam Shot Pitch Radian:%.3f", camShotPitch);
                //        [self.delegate stopDetectCameraMotion];
            }
            
            // Save the new image (original or edited) to the Camera Roll
            //            ALAssetsLibrary* library = [[ALAssetsLibrary alloc]init];
            //            [library writeImageToSavedPhotosAlbum:imageToSave.CGImage orientation:ALAssetOrientationUp completionBlock:^(NSURL *assetURL, NSError *error){
            //                if (error) {
            //                    DebugLog(@"error");
            //                }
            //                else {
            //                    NSString* imageURL = [NSString stringWithFormat:@"%@",assetURL];
            //                    DebugLog(@"url %@", imageURL);
            //                }
            //            }];
            //            library = nil;
            
            
            [self dismissViewControllerAnimated:true completion:nil];
            
            //TODO:portrait mode rotate photo 90 degree no work?
//            finalImage = imageToSave;
            finalImage = [[UIImage alloc] initWithCGImage: imageToSave.CGImage scale: 1.0 orientation: UIImageOrientationLeft];
        }
        else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
            finalImage = imageToSave;
            if (self.subPopoverController) {
                [self.subPopoverController dismissPopoverAnimated:true];
            }
        }
        
        //将UIImage转换
        [self.paintView insertUIImageAtCurLayer:finalImage];
        
        //添加编辑Done按钮在导入图片的中心
        CGRect rect = [self.paintView calculateLayerContentRect];
        
        if(CGRectEqualToRect(rect, CGRectZero)){
            return;
        }
        [self enterTransformImageState:rect];
        
        self.transformButton.tag = 1;
        [self.transformButton.layer setNeedsDisplay];
    }
    
    else if ([mediaType isEqualToString:(NSString*)kUTTypeMovie]) {
//        NSURL * url = [info objectForKey:UIImagePickerControllerMediaURL];
//        AVURLAsset* asset = [[AVURLAsset alloc] initWithURL:url options:nil];
//        NSArray* array = [asset tracks];
    }
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
        imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, (NSString *) kUTTypeMovie, nil];
        imagePicker.allowsEditing = NO;
        imagePicker.delegate = self;
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        self.subPopoverController = popover;
        self.subPopoverController.delegate = self;
        
        CGRect rect = CGRectMake(self.importButton.bounds.origin.x, self.importButton.bounds.origin.y, self.importButton.bounds.size.width, self.importButton.bounds.size.height);
        [popover presentPopoverFromRect:rect inView:self.importButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        return YES;
    }else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Error accessing photo library!" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
}
#pragma mark- 导出 Export
- (IBAction)exportButtonTapped:(UIButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
    
    ExportTableViewController* exportTableViewController = [[ExportTableViewController alloc]initWithStyle:UITableViewStylePlain];
    exportTableViewController.delegate = self;
    
    exportTableViewController.preferredContentSize = CGSizeMake(320, exportTableViewController.tableViewHeight);
    
    self.sharedPopoverController = [[SharedPopoverController alloc]initWithContentViewController:exportTableViewController];
    CGRect rect = CGRectMake(self.exportButton.bounds.origin.x, self.exportButton.bounds.origin.y, self.exportButton.bounds.size.width, self.exportButton.bounds.size.height);
    [self.sharedPopoverController presentPopoverFromRect:rect inView:self.exportButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) didSelectExportToEmail{
    [self exportToEmail];
}

- (void) savedPhotoImage:(UIImage*)image didFinishSavingWithError: (NSError *)error contextInfo: (void *)contextInfo{
    if (error) {
        DebugLog(@"Error save image %@", [error localizedDescription]);
    }
    else{
        DebugLog(@"didFinishSaving");
        //更新UI
        [self.sharedPopoverController dismissPopoverAnimated:true];
    }
}

-(void) didSelectExportToPhotoLibrary{
    UIImage *image = [self.paintView snapshotScreenToUIImageOutputSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:), nil);
}

-(void) didSelectExportToDropbox{
//    [self exportToEmail];
}

-(void) didSelectPostToFacebook {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"Paint amazing 3D Street Painting is nothing with ProjectPaint!"];
        UIImage *image = [self paintImageForPostInSocial];

        [controller addImage:image];
        
        [self presentViewController:controller animated:YES completion:^{
            [self.sharedPopoverController dismissPopoverAnimated:true];            
        }];
    }
}
-(void) didSelectPostToTwitter{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *controller = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [controller setInitialText:@"Paint amazing 3D Street Painting is nothing with ProjectPaint!"];
//        UIImage *image = [self paintImageForPostInSocial];
//        [controller addImage:image];
        
        [self presentViewController:controller animated:YES completion:^{
            [self.sharedPopoverController dismissPopoverAnimated:true];
        }];
    }
}
-(void) didSelectPostToSinaWeibo {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        
        [controller setInitialText:@"Paint amazing 3D Street Painting is nothing with ProjectPaint!"];
        UIImage *image = [self paintImageForPostInSocial];
        [controller addImage:image];
        
        [self presentViewController:controller animated:YES completion:^{
            [self.sharedPopoverController dismissPopoverAnimated:true];
        }];
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
//    DebugLog(@"transformImageWith p0 Tx:%.1f Ty:%.1f p1 Tx:%.1f Ty:%.1f", p0.x, p0.y, p1.x, p1.y);
    
    CGFloat rotate = 0;
    CGPoint scale = CGPointMake(1, 1);
    CGPoint translate = CGPointZero;
    CGPoint anchorPoint = CGPointZero;
    
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
        float s = GLKVector2Distance(GLKVector2Make(p0.x, p0.y), GLKVector2Make(p1.x, p1.y)) / _twoFingerDistanceBegan;
        if (scaleMode == ScaleMode_X) {
            scale.x = s;
        }
        else if (scaleMode == ScaleMode_Y) {
            scale.y = s;
        }
        else if (scaleMode == ScaleMode_XX) {
            scale.x = scale.y = s;
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
            scale = CGPointMake(scaleX, scaleY);
        }

    }
    

    
    CGRect bounds = CGRectMake(0, 0, self.transformContentViewSrcBounds.size.width * scale.x, self.transformContentViewSrcBounds.size.height * scale.y);
    self.transformContentView.bounds = bounds;
   
    return [self.paintView freeTransformImageTranslate:translate rotate:rotate scale:scale anchorPoint:CGPointZero];
}

- (void)removeTransformHelperViews{
    [self.transformContentView.layer removeAllAnimations];
    [self.transformContentView removeFromSuperview];
    [self setTransformContentView:nil];

    
    for (TransformAnchorView *view in self.transformAnchorViews) {
        [view removeFromSuperview];
    }
    [self.transformAnchorViews removeAllObjects];
    self.transformAnchorViews = nil;
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
    
    self.transformAnchorViewSize = 30;
    
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
    
    TransformContentView *transformContentView = [[TransformContentView alloc]initWithFrame:rect];
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
    TransformAnchorView *transformAnchorView = [[TransformAnchorView alloc] initWithFrame:frame];
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
    CGFloat size = self.transformAnchorViewSize;
    CGFloat offset = size * 0.5;
    CGAffineTransform transform = self.transformContentView.layer.affineTransform;
    
    TransformAnchorView *leftTopAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:0];
    CGPoint center = CGPointMake(minX, minY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    leftTopAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);
    
    TransformAnchorView *midTopAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:1];
    center = CGPointMake(midX, minY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    midTopAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *rightTopAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:2];
    center = CGPointMake(maxX, minY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    rightTopAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *leftMidAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:3];
    center = CGPointMake(minX, midY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    leftMidAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *midMidAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:4];
    center = CGPointMake(midX, midY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    midMidAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *rightMidpAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:5];
    center = CGPointMake(maxX, midY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    rightMidpAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *leftBottomAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:6];
    center = CGPointMake(minX, maxY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    leftBottomAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *midBottomAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:7];
    center = CGPointMake(midX, maxY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    midBottomAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

    
    TransformAnchorView *rightBottompAnchor = (TransformAnchorView *)[self.transformAnchorViews objectAtIndex:8];
    center = CGPointMake(maxX, maxY);
    center = CGPointApplyAffineTransform(center, transform);
    center.x += self.transformContentView.center.x;
    center.y += self.transformContentView.center.y;
    rightBottompAnchor.frame = CGRectMake(center.x - offset, center.y - offset, size, size);

}
- (void)showAllTransformAnchorViews{
    for (TransformAnchorView *view in self.transformAnchorViews) {
        if (view.tag == 4) {
            view.hidden = true;
            continue;
        }
        view.hidden = false;
    }
    
}
- (void)showTransformAnchorViewExclusiveByIndex:(NSInteger)index{
    for (TransformAnchorView *view in self.transformAnchorViews) {
        if (view.tag == index) {
            view.hidden = false;
            continue;
        }
        view.hidden = true;
    }
    
}

- (void)setTransformContentViewAnimRecursive{
    [CATransaction begin];
    [CATransaction setAnimationDuration:10.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [CATransaction setCompletionBlock:^{
        //TODO:循环调用导致无法释放transformContentView
        if (self.transformContentView != nil) {
            [self setTransformContentViewAnimRecursive];
        }
    }];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"phase"];
    
    //    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat:120];
    
    [self.transformContentView.layer removeAnimationForKey:@"phase"];
    [self.transformContentView.layer addAnimation:anim forKey:@"phase"];
    
    ((TransformContentViewLayer*)self.transformContentView.layer).phase = 120;
    
    [CATransaction commit];
}

- (void)enterTransformLayerState:(CGRect)rect{
    _state = PaintScreen_Transform;
    
    //UI
    [self createTransformHelperViews:rect];
    
    //UI
    //    //隐藏MainToolBar PaintToolBar
    //    [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:^{
    ////        self.anchorView.hidden = false;
    ////
    ////        [self freeTransformButtonTapped:_freeTransformButton];
    ////
    ////        [self updateAnchor];
    //    }];
    //
    
    [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];

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
    [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];

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
    
    //UI
//    for (UIButton* button in _transformToolButtons) {
        //        button.backgroundColor = [UIColor lightGrayColor];
//    }
    //    sender.backgroundColor = [UIColor greenColor];
    
    //隐藏TransformBar
//    [self switchTopToolBarFrom:self.transformToolBar completion:nil to:self.mainToolBar completion:^{
//        self.anchorView.hidden = true;
//        _state = PaintScreen_Normal;
//    }];
    
   
    [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:nil];
    
    [self removeTransformHelperViews];
    
    //交互
    UIView* mainToolView = [self.mainToolBar.subviews objectAtIndex:0];
    for (UIView* view in mainToolView.subviews) {
        view.userInteractionEnabled = true;
    }
    self.pgr1TouchesPaintView.enabled = true;
}

- (IBAction)transformButtonTapped:(id)sender {

    if (_state == PaintScreen_Normal) {
        //计算当前层的bounding box,并根据bounding box大小创建transform外框
        CGRect rect = [self.paintView calculateLayerContentRect];

        if(CGSizeEqualToSize(rect.size, CGSizeZero)){
            return;
        }
        
        [self.paintView beforeTransformLayer];

        //UI
        //TODO:禁止除TransformButton以外的按钮的交互
        [self enterTransformLayerState:rect];
        
        UIView* view = (UIView*)sender;
        view.tag = 1;
        [view.layer setNeedsDisplay];
    }
    else if (_state == PaintScreen_Transform){
        [self.paintView transformImageDone];
        
        //UI
        [self leaveTransformState];
        [self updateFuzzyTransparentViews];
        UIView* view = (UIView*)sender;
        view.tag = 0;
        [view.layer setNeedsDisplay];
    }

}

- (IBAction)transformDoneButtonTapped:(UIButton *)sender {
    [self.paintView transformImageDone];
    
    //UI
    [self leaveTransformState];
    [self updateFuzzyTransparentViews];
}

- (IBAction)tranformCancelButtonTapped:(UIButton *)sender {
    [self.paintView cancelInsertUIImageAtCurLayer];
    
    //UI
    [self leaveTransformState];
}

- (IBAction)freeTransformButtonTapped:(UIButton *)sender {
    for (UIButton* button in _transformToolButtons) {
//        button.backgroundColor = [UIColor lightGrayColor];
    }
//    sender.backgroundColor = [UIColor greenColor];
    _transformImageState = TransformImage_Free;
}

- (IBAction)moveButtonTapped:(UIButton *)sender {
    for (UIButton* button in _transformToolButtons) {
//        button.backgroundColor = [UIColor lightGrayColor];
    }
//    sender.backgroundColor = [UIColor greenColor];
    
    _transformImageState = TransformImage_Move;
}

- (IBAction)rotateButtonTapped:(UIButton *)sender {
    for (UIButton* button in _transformToolButtons) {
//        button.backgroundColor = [UIColor lightGrayColor];
    }
//    sender.backgroundColor = [UIColor greenColor];
    
    _transformImageState = TransformImage_Rotate;
}

- (IBAction)scaleButtonTapped:(UIButton *)sender {
    for (UIButton* button in _transformToolButtons) {
//        button.backgroundColor = [UIColor lightGrayColor];
    }
//    sender.backgroundColor = [UIColor greenColor];
    _transformImageState = TransformImage_Scale;
}

- (IBAction)customLayerButtonTouchCancel:(AutoRotateButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
}
- (IBAction)customLayerButtonTouchUpOutside:(AutoRotateButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
}
- (IBAction)customLayerButtonTouchDown:(AutoRotateButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:true];
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

#pragma mark- 图层 Layer

- (IBAction)layerButtonTapped:(UIButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
    
    self.layerTableViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LayerTableViewController"];
    self.layerTableViewController.delegate = self;
    self.layerTableViewController.layers = self.paintView.paintData.layers;
    self.layerTableViewController.backgroundLayer = self.paintView.paintData.backgroundLayer;
    
    
    //可编辑状态
    self.layerTableViewController.tableView.editing = true;
    
    //屏幕尺寸减上下工具栏高度
    self.layerTableViewController.tableViewHeightMax = self.view.bounds.size.height - self.mainToolBar.bounds.size.height - self.paintToolBar.bounds.size.height;
    
    self.sharedPopoverController = [[SharedPopoverController alloc]initWithContentViewController:self.layerTableViewController];
    [self.sharedPopoverController presentPopoverFromRect:_layerButton.bounds inView:_layerButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    //半透明
//    FuzzyTransparentView *rootView = (FuzzyTransparentView *)self.layerTableViewController.view;
//    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];

    for (AutoRotateButton* button in self.layerTableViewController.autoRotateButtons) {
        button.isInterfacePortraitUpsideDown = self.isInterfacePortraitUpsideDown;
        button.orientation = [UIDevice currentDevice].orientation;
    }
    
    //在并行线程更新数据(需要保证其他线程也在使用opengles context进行操作)
    dispatch_async(_uploadDataQueque, ^{
        [self.paintView uploadLayerDatas];
        dispatch_async(dispatch_get_main_queue(), ^{
            DebugLog(@"uploadLayerDatas completed!");
            //载入层缩略图
            [self.layerTableViewController.tableView reloadData];

            //选择当前row
            [self.layerTableViewController selectRowForCurLayer];
        });
    });
}


- (IBAction)createLayerButtonTapped:(UIButton *)sender {
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
    BackgroundLayer *layer = self.paintView.paintData.backgroundLayer;
    if(layer.visible != visible){
        layer.visible = visible;
        DebugLog(@"backgroundLayerVisible changed! UpdateRender");
        [self.paintView updateRender];
    }
    
    DebugLog(@"backgroundLayerVisible is %i", layer.visible);
}

- (void)setLayerAtIndex:(int)index visible:(bool)visible {
    PaintLayer* layer = [self.paintView.paintData.layers objectAtIndex:index];
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
    PaintLayer* layer = [self.paintView.paintData.layers objectAtIndex:index];
    layer.dirty = true;
    
    //只有在图层View打开时起作用
//    if(!_layersView.hidden){
//        //更新数据
//        [self.paintView uploadLayerDataAtIndex:index];
//        layer.dirty = false;
//        
//        UIImageView* imageView = [_layerImageViews objectAtIndex:index];
//        UIButton* imageButton = [imageView.subviews objectAtIndex:0];
//        [imageButton setImage:[UIImage imageWithData:layer.data] forState:UIControlStateNormal];
//    }
}

#pragma mark- 图层代理 LayerTableViewControllerDelegate
- (void) willSetCurLayerDataAtIndex:(int)index{
    //串行排列放入线程，保证在uploadLayerData之后更新，避免多线程操作context冲突
    dispatch_sync(_uploadDataQueque, ^{
        [self setCurLayerIndex: index];
        
        //命令 如果点击了图层面板，则Undo Redo重置
//        DebugLog(@"SetCurLayer Reset CommandManager");
        [self.paintView.commandManager clearAllCommands];
    
        [self.paintView willEndWrapUndoBaseCommand];
    });
}

-(void)willInsertLayerDataAtIndex:(int)index{
    //数据 & 显示
    [self.paintView insertBlankLayerAtIndex:index transparent:true immediate:true];
    [self.paintView uploadLayerDatas];
}

-(void)willEraseLayerDataAtIndex:(int)index{
    [self.paintView eraseLayerAtIndex:index];
    [self.paintView uploadLayerDatas];
}

-(void)willDeleteLayerDataAtIndex:(int)index{
    //数据 & 显示
    [self.paintView deleteLayerAtIndex:index immediate:true];
    [self.paintView uploadLayerDatas];
}

- (void)willMoveLayerFromIndex:(int)fromIndex toIndex:(int)toIndex{
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

}

- (void)willSetBackgroundLayerVisible:(bool)visible {
    [self setBackgroundLayerVisible:visible];
}
- (void) willSetLayerAtIndex:(int)index visible:(BOOL)visible{
    [self setLayerAtIndex:index visible:visible];
}

- (void) willSetLayerBlendMode:(LayerBlendMode)blendMode atIndex:(int)index {
    [self.paintView setCurLayerBlendMode:blendMode];    
}

- (void)willSetLayerAtIndex:(int)index opacity:(float)opacity{
    [self.paintView setLayerAtIndex:index opacity:opacity];
}

- (void)willMergeLayerDataAtIndex:(int)index{
    [self.paintView mergeLayerAtIndex:index];
}
- (void)willClearLayerDataAtIndex:(int)index{
    [self.paintView eraseLayerAtIndex:index];
    [self.paintView uploadLayerDataAtIndex:index];
}
- (void) willInsertCopyLayerDataAtIndex:(int)index{
    [self.paintView insertCopyLayerAtIndex:index immediate:true];
}

- (int) willGetLayerIndex{
    return self.paintView.curLayerIndex;
}
- (void) willUpdateRender{
    [self.paintView updateRender];
}

- (void) willSetBackgroundLayerClearColor:(UIButton*)button colorPickerControllerDelegate:(LayerTableViewController*)controllerDelegate{
    if(self.subPopoverController != nil && [self.subPopoverController isPopoverVisible]) return; //已经打开
    
    self.infColorPickerController.delegate = controllerDelegate;
    self.infColorPickerController.sourceColor = button.backgroundColor;//覆盖当前笔刷色
    self.subPopoverController = [[SharedPopoverController alloc]initWithContentViewController:self.infColorPickerController];
    [self.subPopoverController presentPopoverFromRect:button.bounds inView:button permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
    FuzzyTransparentView* rootView = (FuzzyTransparentView*)self.infColorPickerController.view;
    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];
}

- (void) willSetBackgroundLayerClearColorChanged:(UIColor*)clearColor{
    self.paintView.paintData.backgroundLayer.clearColor = [clearColor copy];
    //串行排列放入线程，保证在uploadLayerData之后更新，避免多线程操作context冲突
    dispatch_sync(_uploadDataQueque, ^{
        [self.paintView updateRender];
    });

    //UI
    [self updateFuzzyTransparentViews];
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

//- (IBAction)projectPaintButtonTapped:(UIButton *)sender {
//    [self projectCylinder];
//}

- (IBAction)fullScreenButtonTouchUp:(UIButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
    
    if (_state == PaintScreen_Normal) {
        [self togglePaintFullScreen];
    }
}


#pragma mark- 退出 SaveClose
- (IBAction)saveToDocButtonTapped:(UIButton *)sender {
    [self saveDoc];
}

- (IBAction)saveAndCloseButtonTapped:(UIButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
    
    [self saveDoc];
    [self closeDoc];
}

#pragma mark- 取消操作 Undo Redo
- (void)undoDraw{
    //在undoDraw未结束之前，关闭undoDraw
    self.undoButton.userInteractionEnabled = false;
    
    //UI bounce animation
    CGRect frame = self.undoButton.frame;
    CGRect target = frame;
    target.origin.x -= 20;
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.undoButton.frame = target;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.undoButton.frame = frame;
        } completion:nil];
    }];
    
    [self.paintView undoDraw];
    
    //在最后一个undoDraw glFinished之后恢复UI响应
    self.undoButton.userInteractionEnabled = true;
}

- (void)redoDraw{
    self.redoButton.userInteractionEnabled = false;

    //UI bounce animation
    CGRect frame = self.redoButton.frame;
    CGRect target = frame;
    target.origin.x += 20;
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.redoButton.frame = target;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.redoButton.frame = frame;
        } completion:nil];
    }];
    
    [self.paintView redoDraw];

    self.redoButton.userInteractionEnabled = true;
}

- (IBAction)touchUpInsideUndoButton:(UndoButton *)sender{
    [self undoDraw];
}

- (IBAction)touchUpInsideRedoButton:(UIButton *)sender {
    [self redoDraw];
}

#pragma mark- 笔刷
//编辑笔刷属性
-(void)editBrush:(Brush *)brush{
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
    
    self.sharedPopoverController = [[SharedPopoverController alloc]initWithContentViewController:self.brushPropertyViewController];
    self.sharedPopoverController.delegate = self;
    [self.sharedPopoverController presentPopoverFromRect:self.brushButtonTempRect inView:self.paintToolView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    FuzzyTransparentView *rootView = (FuzzyTransparentView *)self.brushPropertyViewController.rootView;
    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];
    
}

#pragma mark- 笔刷属性代理 BrushPropertyViewController Delegate (Refresh UI)
-(void)willDismissBrushPropertyViewController{
    [self.sharedPopoverController dismissPopoverAnimated:true];
    
    UIView *brushButton = self.brushButton;
    self.radiusSlider.value = self.brushButton.brush.brushState.radius;
    [self setOpacitySliderValueWithBrushState:self.brushButton.brush.brushState];
    
    [UIView animateWithDuration:0.2 animations:^{
        brushButton.frame = CGRectMake(brushButton.frame.origin.x, 0, brushButton.frame.size.width, brushButton.frame.size.height);
    }completion:nil];
    
//    [self.paintView.brush setCanvas:self.paintView]; //do in startDraw
}

-(EAGLContext*)willGetBrushPreviewContext{
//    return [[EAGLContext alloc]initWithAPI:[self.paintView.context API] sharegroup:[self.paintView.context sharegroup]];
    return self.paintView.context;
}

-(void)willBrushShaderChanged:(BrushState*)brushState{
    Brush *brush = [self.paintView.brushTypes objectAtIndex:brushState.classId];
    if([brush loadShader]){
        
    }
}

-(void)willBrushPropertyValueChanged:(BrushState*)brushState{
    //UI
    self.radiusSlider.value = brushState.radius;
    
    [self setOpacitySliderValueWithBrushState:brushState];
}
#pragma mark- 笔刷种类代理 BrushTypeScrollView Delegate (Refresh UI)
-(void)willBrushTypeScrollViewDidScroll:(UIScrollView *)scrollView{
//    DebugLog(@"willBrushTypeScrollViewDidScroll");
    
    self.brushTypePageControl.currentPage = floorf(scrollView.contentOffset.x / scrollView.frame.size.width);
}

-(void)willSelectBrush:(id)sender{
    DebugLog(@"willSelectBrush");
    
    BrushTypeButton* selButton = (BrushTypeButton*)sender;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (BrushTypeButton* button in self.brushTypeScrollView.subviews) {
            button.frame = CGRectMake(button.frame.origin.x, 20, button.frame.size.width, button.frame.size.height);
        }

        selButton.frame = CGRectMake(selButton.frame.origin.x, 0, selButton.frame.size.width, selButton.frame.size.height);
    } completion:^(BOOL finished) {

    }];
}

-(void)willSelectBrushDone:(id)sender{
    BrushTypeButton* button = (BrushTypeButton*)sender;
    DebugLog(@"[ selectBrushDone BrushId %d]", button.brush.brushState.classId);
    //UI
//    [self switchDownToolBar:self.brushTypeBar completion:^(void){
//        BrushTypeButton* button = (BrushTypeButton*)sender;
//        //Draw
//        [self.paintView setBrush:button.brush];
//        [self.paintView.brush setColor:self.paintColorButton.color];
//
//        
//    }toMainToolBarsCompletion:^(BOOL finished){
//        _state = PaintScreen_Normal;
//        //笔刷面板打开绘图
//        self.paintView.userInteractionEnabled = true;
//    }];

    //Draw
    [self.paintView setBrush:button.brush];
    [self.paintView.brush setColor:self.paintColorButton.color];
   
    [self slideToolBarRightDirection:false out:self.brushTypeView in:self.paintToolView completion:^{
        _state = PaintScreen_Normal;
        //笔刷面板打开绘图
        self.rootCanvasView.userInteractionEnabled = true;
    }];
}

-(void)willSelectBrushCanceled:(id)sender{
    DebugLog(@"willSelectBrushCanceled");
    
    //UI
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        for (BrushTypeButton* button in self.brushTypeScrollView.subviews) {
            button.frame = CGRectMake(button.frame.origin.x, 20, button.frame.size.width, button.frame.size.height);
        }
    } completion:^(BOOL finished) {
    }];
}

#pragma mark- 绘图界面代理 PaintingView Delegate (Refresh UI)
- (void) willEnableDirectEyeDropper:(BOOL)enable{
    self.lpgrPaintView.enabled = enable;
}

-(void)willEnableUIRedo:(BOOL)enable{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.redoButton.alpha = enable ? 1 : 0;
    } completion:^(BOOL finished) {
//        self.redoButton.hidden = !enable;
    }];
}

-(void)willEnableUIUndo:(BOOL)enable{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.undoButton.alpha = enable ? 1 : 0;
    } completion:^(BOOL finished) {
//        self.undoButton.hidden = !enable;
    }];
}

-(void)willChangeUIPaintColor:(UIColor*) resultColor{
    [self.paintColorButton setColor:resultColor];
    [_opacitySlider setColor:resultColor];
}
- (void) willChangeUIBrush:(Brush*) brush{
    //更新半径UI
    self.radiusSlider.minimumValue = brush.radiusSliderMinValue;
    self.radiusSlider.maximumValue = brush.radiusSliderMaxValue;
    self.radiusSlider.value = brush.radius;
    
    [self setOpacitySliderValueWithBrushState:brush.brushState];
    
    //更新笔刷UI
    self.brushButton.brush = brush;
    self.brushButton.frame = CGRectMake(self.brushButton.frame.origin.x, 0, self.brushButton.frame.size.width, self.brushButton.frame.size.height);
    [self.brushButton setNeedsDisplay];

    //每次在更换笔刷时会更新该笔刷定制的颜色槽,每种笔刷有一组常用颜色始终放在第一组。
    
//    self.colorSlotsScrollView;
    
    //    brushView.brush = brush;
    //    [brushButton setImage:brush.iconImage forState:UIControlStateNormal];
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
    
    self.brushView.hidden = true;
    
//    if (!colorPickerView.locked) {
//    _brushDetailView.hidden = true;
//    self.brushTypeView.hidden = true;
//    }
    _state = PaintScreen_Normal;
}

- (void) willTouchMoving:(CGPoint)point{
//    brushView.hidden = false;
//    brushView.center = CGPointMake(point.x, self.view.frame.size.height - point.y);
}

- (void) willStartUIEyeDrop{
    _eyeDropperIndicatorView.hidden = false;

    [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
    [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];
}

- (CGPoint) willGetEyeDropLocation{
    //更新触摸点
    CGPoint location = [self.paintView.firstTouch locationInView:self.paintView];
    location.y = self.paintView.bounds.size.height - location.y;
    DebugLog(@"willGetEyeDropLocation %@", NSStringFromCGPoint(location));
    CGPoint eyeDropLocation = CGPointZero;
    if (IsOffsetEyeDropper) {
        CGPoint locationInRootView = [self.paintView convertPoint:location toView:self.rootCanvasView];
        
        CGPoint eyeDropLocationInRootView = CGPointZero; float offset = 40;

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
        
        eyeDropLocation = [self.paintView convertPoint:eyeDropLocationInRootView fromView:self.rootCanvasView];
    }
    else{
        eyeDropLocation = location;
    }
    
    DebugLog(@"willGetEyeDropLocation final %@", NSStringFromCGPoint(eyeDropLocation));
    return eyeDropLocation;
}

- (void) willEyeDroppingUI:(CGPoint)point Color:(UIColor *)uiColor{
    DebugLog(@"point x:%.2f y:%.2f", point.x, point.y);
    CGPoint center = [self.rootCanvasView convertPoint:point fromView:self.paintView];
    DebugLog(@"center x:%.2f y:%.2f", center.x, center.y);
    _eyeDropperIndicatorView.center = center;
    [_eyeDropperIndicatorView setColor:uiColor];
    [self.eyeDropperButton setColor:uiColor];
}

- (void) willEndUIEyeDrop{
    _eyeDropperIndicatorView.hidden = true;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 30, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
    }completion:nil];
    [self.eyeDropperButton setColor:[UIColor clearColor]];
    
    if (!self.isPaintFullScreen) {
        [self switchTopToolBarFrom:nil completion:nil to:self.mainToolBar completion:nil];
        [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:nil];
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
    
    [self switchTopToolBarFrom:nil completion:nil to:self.mainToolBar completion:nil];
    [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:nil];
}

-(void)willUpdateUITransformTranslate:(CGPoint)translation rotate:(float)angle scale:(float)scale{
    [self updateZoomLabel:scale];
    [self updateRotateCanvasLabel:angle];
}

- (void) willHideUIPaintArea:(BOOL)hide touchPoint:(CGPoint)touchPoint{
    //TODO:willHidePaintAreaUI
    if (hide && !self.isPaintFullScreen) {
        CGPoint touchPointInRootView = [self.paintView convertPoint:touchPoint toView:self.rootView];
//        CGRect paintToolBarFrame = self.paintToolBar.frame;
//        CGRect mainToolBarFrame = self.mainToolBar.frame;
        if (CGRectContainsPoint(self.paintToolBar.frame, touchPointInRootView) ||
            CGRectContainsPoint(self.mainToolBar.frame, touchPointInRootView)) {
            [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];
            [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:nil];
            self.hideTopDownUITemp = true;
        }
    }
    else if (self.hideTopDownUITemp && !hide && !self.isPaintFullScreen){
        [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:nil];
        [self switchTopToolBarFrom:nil completion:nil to:self.mainToolBar completion:nil];
        self.hideTopDownUITemp = false;
    }

}

- (void) willUpdateUIToolBars{
    [self updateFuzzyTransparentViews];
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
- (IBAction)colorSlotsSwitchTapped:(UIButton *)sender {
    [self.brushOpacityView setHidden:![self.brushOpacityView isHidden]];
    _colorSlotsViewHidden = [self.brushOpacityView isHidden];
}

- (IBAction)colorPickerSwitchTapped:(UIButton *)sender {
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
    self.colorPickerView.locked = !self.colorPickerView.locked;
}

//打开颜色取色器
- (void)openColorPicker:(UIColor*)color inColorButton:(ColorButton*)colorButton{
    if(self.sharedPopoverController != nil && [self.sharedPopoverController isPopoverVisible]) return; //已经打开
    
    self.colorPickerSrcButton = colorButton;
    self.infColorPickerController.delegate = self;
    self.infColorPickerController.sourceColor = color;//覆盖当前笔刷色
    self.sharedPopoverController = [[SharedPopoverController alloc]initWithContentViewController:self.infColorPickerController];
    [self.sharedPopoverController presentPopoverFromRect:colorButton.bounds inView:colorButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    FuzzyTransparentView* rootView = (FuzzyTransparentView*)self.infColorPickerController.view;
    [rootView updateFuzzyTransparentFromView:self.rootCanvasView];
}
- (IBAction)paintColorButtonTapped:(UIButton *)sender {
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
    [self.infColorPickerController takeBarValue:sender];
}

//-----------------------------------------------------------------------
- (IBAction) takeSquareValue: (InfColorSquarePicker*) sender
{
    [self.infColorPickerController takeSquareValue:sender];
}

#pragma mark- 工具栏
- (void)switchTopToolBarFrom:(TopToolBar*)fromView completion: (void (^) (void))block1 to:(TopToolBar*)toView completion: (void (^) (void)) block2{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (fromView != NULL) {
            fromView.center = CGPointMake(fromView.center.x, -fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        if (block1 != NULL) {
            block1();
        }
        [toView removeFuzzyTransparent];
       
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (toView != NULL) {
                toView.center = CGPointMake(toView.center.x, toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            if (block2 != NULL) {
                block2();
            }
            [toView setFuzzyTransparentSourceView:self.rootCanvasView];
        }];

    }];
}

- (void)switchDownToolBarFrom:(DownToolBar*)fromView completion: (void (^) (void))block1 to:(DownToolBar*)toView completion: (void (^) (void)) block2{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (fromView != NULL) {
            fromView.center = CGPointMake(fromView.center.x, self.view.bounds.size.height + fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        if (block1 != NULL) {
            block1();
        }
        [toView removeFuzzyTransparent];
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (toView != NULL) {
                toView.center = CGPointMake(toView.center.x, self.view.bounds.size.height - toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            //设置工具半透明毛玻璃
            if (block2 != NULL) {
                block2();
            }
//            [toView setFuzzyTransparentSourceView:self.rootCanvasView];
        }];
    }];
}

- (void)slideToolBarRightDirection:(BOOL)right out:(UIView*)outView in:(UIView*)inView completion: (void (^) (void)) block1{
    CGRect outFrameTarget = outView.frame;
    if (right) {
        outFrameTarget.origin.x += self.rootView.frame.size.width;
    }
    else{
        outFrameTarget.origin.x -= self.rootView.frame.size.width;
    }
    
    
    CGRect inFrameSrc = outView.frame;
    if (right) {
        inFrameSrc.origin.x -= self.rootView.frame.size.width;
    }
    else{
        inFrameSrc.origin.x += self.rootView.frame.size.width;
    }
    
    CGRect inFrameTarget = outView.frame;
    
    inView.frame = inFrameSrc;
    inView.hidden = false;
    
    [UIView animateWithDuration:0.3 animations:^{
        inView.frame = inFrameTarget;
        outView.frame = outFrameTarget;
    } completion:^(BOOL finished) {
        block1();
    }];
}

- (IBAction)togglePaint:(UIButton *)sender {
}

- (IBAction)selFloorTexButtonTapped:(UIButton *)sender {
}

- (IBAction)saveToDiskButtonTapped:(UIButton *)sender {
}

- (IBAction)savePaintImageButtonTapped:(UIButton *)sender {
}


- (IBAction)debugButtonTapped:(UIButton *)sender {
    [self.debugView layer].contents = (__bridge id)(self.paintView.brushingImage.CGImage);
    [self.debugView2 layer].contents = (__bridge id)(self.paintView.paintingImage.CGImage);
}

- (IBAction)pickImageInApp:(id)sender {
//    self presentModalViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
}

- (IBAction)clearButtonTouchUp:(UIButton *)sender {
    [(AutoRotateButton*)sender setHighlighted:false];
    
    [self.paintView clearData];
    [self updateFuzzyTransparentViews];
    [self.clearButton setNeedsDisplay];
    
}

- (IBAction)clearButtonTouchDown:(UIButton *)sender {
    [self.clearButton setNeedsDisplay];
}


- (IBAction)eyeDropperButtonTouchDown:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 0, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
    }completion:nil];
}

- (IBAction)eyeDropperButtonTouchUp:(UIButton *)sender {
    if (self.paintView.state != PaintingView_TouchEyeDrop) {
        self.paintView.state = PaintingView_TouchEyeDrop;
        _state = PaintScreen_PickColor;
        
        [UIView animateWithDuration:0.2 animations:^{
            self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 10, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
        }completion:nil];
        [self.eyeDropperButton setColor:self.paintColorButton.color];
    }
    else if(self.paintView.state == PaintingView_TouchEyeDrop){
        self.paintView.state = PaintingView_TouchNone;
        
        [UIView animateWithDuration:0.2 animations:^{
            self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 30, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
        }completion:nil];
        [self.eyeDropperButton setColor:[UIColor clearColor]];
    }

}

- (IBAction)eyeDropperButtonTouchCancel:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.eyeDropperButton.frame = CGRectMake(self.eyeDropperButton.frame.origin.x, 30, self.eyeDropperButton.frame.size.width, self.eyeDropperButton.frame.size.height);
    }completion:nil];
    [self.eyeDropperButton setColor:[UIColor clearColor]];
    
}


- (void)togglePaintFullScreen{
    if(self.isPaintFullScreen){
        self.fullScreenReverseButton.alpha = 1.0;
        [UIView animateWithDuration:0.2 animations:^{
            self.fullScreenReverseButton.alpha = 0.0;
        }completion:^(BOOL finished) {
            self.fullScreenReverseButton.hidden = false;
            [self switchDownToolBarFrom:nil completion:nil to:self.paintToolBar completion:nil];
            [self switchTopToolBarFrom:nil completion:nil to:self.mainToolBar completion:nil];
            self.isPaintFullScreen = false;
        }];
        

    }
    else{
        [self switchDownToolBarFrom:self.paintToolBar completion:nil to:nil completion:nil];
        [self switchTopToolBarFrom:self.mainToolBar completion:nil to:nil completion:^{
            self.fullScreenReverseButton.hidden = false;
            self.fullScreenReverseButton.alpha = 0.0;
            [UIView animateWithDuration:0.2 animations:^{
                self.fullScreenReverseButton.alpha = 1.0;
            }completion:^(BOOL finished) {
                self.isPaintFullScreen = true;
            }];
        }];
        
    }
}

-(void)updateFuzzyTransparentViews{
    [self.mainToolBar updateFuzzyTransparentFromView:self.rootCanvasView];
//    [self.paintToolBar updateFuzzyTransparentFromView:self.rootCanvasView];
    //TODO: add all fuzzyTranparentViews here
    
}

#pragma mark- 弹出框代理UIPopoverController
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    DebugLog(@"popoverControllerDidDismissPopover contentViewController: %@", popoverController.contentViewController);
    if ([popoverController.contentViewController isKindOfClass:[BrushPropertyViewController class]]) {

        [self.paintView prepareDrawEnv];
    }
}

#pragma mark- 半透明工具栏代理FuzzyTransparentViewDelegate
-(void)willSnapshotUIImageEnd:(UIImage *)image{
    //TODO:目前会导致GetColorSpaceModel BadAccess
    
    for (AutoRotateButton *button in self.topToolBarButtons) {

    }

    //更新顶部按钮颜色
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [CATransaction setCompletionBlock:^{
        //animations are removed automatically
        for (AutoRotateButton *button in self.topToolBarButtons) {
        }
    }];
    
    for (AutoRotateButton *button in self.topToolBarButtons) {
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
        colorRAnim.fromValue = [NSNumber numberWithFloat:((CustomLayer*)button.layer).baseColorR];
        colorRAnim.toValue = [NSNumber numberWithFloat:colorRGBA[0]];
        [button.layer addAnimation:colorRAnim forKey:@"baseColorR"];
        ((CustomLayer*)button.layer).baseColorR = colorRGBA[0];
        
        CABasicAnimation *colorGAnim = [CABasicAnimation animationWithKeyPath:@"baseColorG"];
        colorGAnim.fromValue = [NSNumber numberWithFloat:((CustomLayer*)button.layer).baseColorG];
        colorGAnim.toValue = [NSNumber numberWithFloat:colorRGBA[1]];
        [button.layer addAnimation:colorGAnim forKey:@"baseColorG"];
        ((CustomLayer*)button.layer).baseColorG = colorRGBA[1];
        
        CABasicAnimation *colorBAnim = [CABasicAnimation animationWithKeyPath:@"baseColorB"];
        colorBAnim.fromValue = [NSNumber numberWithFloat:((CustomLayer*)button.layer).baseColorB];
        colorBAnim.toValue = [NSNumber numberWithFloat:colorRGBA[2]];
        [button.layer addAnimation:colorBAnim forKey:@"baseColorB"];
        ((CustomLayer*)button.layer).baseColorB = colorRGBA[2];
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
@end
