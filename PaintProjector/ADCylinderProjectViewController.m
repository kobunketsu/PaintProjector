//
//  CylinderProjectViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-21.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCylinderProjectViewController.h"
#import <Social/Social.h>
#import "REResources.h"
#import "ADSharedPopoverController.h"
#import "ADUnitConverter.h"
#import "ADIAPManager.h"
#import "ADPaintUIKitAnimation.h"
#import "REAssetDatabase.h"
#import "ADCylinderProjectVirtualDeviceCollectionViewController.h"
#import "ADSimpleTutorialManager.h"
#import "AppDelegate.h"
#import "ADShaderCylinderProject.h"
#import "ADShaderCylinder.h"
#import "ADShaderNoLitTexture.h"
#import "ADShaderUnlitTransparentAdditive.h"
#import "ADDeviceHardware.h"

//avoid z fighting
#define FarClipDistance 5
#define NearClipDistance 0.005

#define ToSeeCylinderTopPixelOffset 70
#define ToSeeCylinderTopViewportPixelOffsetY -160
#define TransitionToPaintPixelOffsetY -30.5

#define CylinderFadeInOutDuration 0.4
#define CylinderResetParamDuration 0.2
#define CylinderViewChangeDuration 1
#define TempPaintFrameToGalleryFadeInDuration 0.4
#define TempPaintFrameToPaintFadeInDuration 0.4

static float DeviceWidth = 0.154;

@interface ADCylinderProjectViewController ()
//TODO: deprecated
@property (retain, nonatomic) ADSharedPopoverController *sharedPopoverController;
@property (assign, nonatomic)GLKVector2 touchDirectionBegin;
//@property (assign, nonatomic)float translateImageX;//圆柱体中图片横向移动
@property(nonatomic, copy) NSString *userInputParamkeyPath;
@property (retain, nonatomic) REAnimation *resetAnimation;
//VC切换动画效果管理器
@property (nonatomic) ADPaintScreenTransitionManager *transitionManager;
@end

@implementation ADCylinderProjectViewController

//core motion

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initWithCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    DebugLogSystem(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initWithCustom];
    }
    return self;
}

- (void)initWithCustom{

}
- (void)viewWillAppear:(BOOL)animated{
    DebugLogSystem(@"[ viewWillAppear ]");
    ADRootCanvasBackgroundView *backgroundView = [[ADRootCanvasBackgroundView alloc]initWithFrame:self.view.frame];
    self.rootView.backgroundView = backgroundView;
    [self.rootView addSubview:backgroundView];
    [self.rootView sendSubviewToBack:backgroundView];
    
    //用于解决启动闪黑屏的问题
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"launchImage2.png"]];
    [self setupBaseParams];
    
    [self setupInputParams];
    
    [self setupGL];
    
    [self setupScene];
    
    //run completion block
//    [self allViewUserInteractionEnable:true];
    
    [self tutorialSetup];
}

- (void)viewDidAppear:(BOOL)animated{
    DebugLogSystem(@"[ viewDidAppear ]");
    
    [self.delegate willCompleteLaunchTransitionToCylinderProject];
    
    [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:nil completion:nil toView:self.downToolBar completion:nil];
    
    [self tutorialStartFromStepName:@"CylinderProjectNextImage"];
}

-(void)viewWillDisappear:(BOOL)animated{
    DebugLogSystem(@"[ viewWillDisappear ]");
    [self destroyScene];
    
    [self tearDownGL];
    
    [self destroyInputParams];
    
    [self destroyBaseParams];
}

-(void)viewDidDisappear:(BOOL)animated{
    DebugLogSystem(@"[ viewDidDisappear ]");
    [self.rootView.backgroundView removeFromSuperview];
    self.rootView.backgroundView = nil;
}

- (void)viewDidLoad
{
    DebugLogSystem(@"[ viewDidLoad ]");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self registerDeviceRotation];
    
    //通知注册事件对app退到后台进行响应
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(willResignActiveNotification:)
     name:UIApplicationWillResignActiveNotification
     object:nil];
    
    self.projectView.opaque = NO;
    
//    [self allViewUserInteractionEnable:true];
    
    self.transitionManager = [[ADPaintScreenTransitionManager alloc]init];
    self.transitionManager.delegate = self;
    
    //创建glkViewController
    self.glkViewController = [[GLKViewController alloc]init];
    self.glkViewController.view = self.projectView;
    self.glkViewController.delegate = self;
    // then add the glkview as the subview of the parent view
    //    [self.view addSubview:_myGlkViewController.view];
    // add the glkViewController as the child of self
    [self addChildViewController:self.glkViewController];
    [self.glkViewController didMoveToParentViewController:self];
    

    //创建context
//    self.context = [self createBestEAGLContext];
    self.projectView.delegate = self;
    
    self.browseNextAction = [[ADCustomPercentDrivenInteractiveTransition alloc]init];
    self.browseNextAction.delegate = self;
    self.browseNextAction.name = @"browseNext";
    self.browseLastAction = [[ADCustomPercentDrivenInteractiveTransition alloc]init];
    self.browseLastAction.delegate = self;
    self.browseLastAction.name = @"browseLast";
    
    //TODO: 关闭水平监测，查内存持续增长问题
//    [self initMotionDetect];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    ADDeviceHardware *h = [[ADDeviceHardware alloc]init];
    if ([[h platformString] rangeOfString:@"iPad Mini"].location != NSNotFound) {
        //FIXME:调查参数
        DeviceWidth = 0.12;
        [dic setObject:[NSNumber numberWithFloat:0.03] forKey:@"userInputParams.cylinderDiameter"];
        [dic setObject:[NSNumber numberWithFloat:0.055] forKey:@"userInputParams.cylinderHeight"];
        [dic setObject:[NSNumber numberWithFloat:0.03] forKey:@"userInputParams.imageWidth"];
        [dic setObject:[NSNumber numberWithFloat:0.027] forKey:@"userInputParams.imageCenterOnSurfHeight"];
        [dic setObject:[NSNumber numberWithFloat:0.27] forKey:@"userInputParams.eyeHonrizontalDistance"];
        [dic setObject:[NSNumber numberWithFloat:0.31] forKey:@"userInputParams.eyeVerticalHeight"];
        [dic setObject:[NSNumber numberWithFloat:1] forKey:@"userInputParams.unitZoom"];
        [dic setObject:[NSNumber numberWithFloat:0.05] forKey:@"userInputParams.eyeTopZ"];
        
    }
    else{
        DeviceWidth = 0.154;
        [dic setObject:[NSNumber numberWithFloat:0.038] forKey:@"userInputParams.cylinderDiameter"];
        [dic setObject:[NSNumber numberWithFloat:0.07] forKey:@"userInputParams.cylinderHeight"];
        [dic setObject:[NSNumber numberWithFloat:0.038] forKey:@"userInputParams.imageWidth"];
        [dic setObject:[NSNumber numberWithFloat:0.035] forKey:@"userInputParams.imageCenterOnSurfHeight"];
        [dic setObject:[NSNumber numberWithFloat:0.35] forKey:@"userInputParams.eyeHonrizontalDistance"];
        [dic setObject:[NSNumber numberWithFloat:0.4] forKey:@"userInputParams.eyeVerticalHeight"];
        [dic setObject:[NSNumber numberWithFloat:1] forKey:@"userInputParams.unitZoom"];
        [dic setObject:[NSNumber numberWithFloat:0.065] forKey:@"userInputParams.eyeTopZ"];

    }
    self.srcUserInputParams = dic;
}

- (void)viewDidUnload{
    DebugLogSystem(@"[ viewDidUnload ]");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    DebugLogSystem(@"[ dealloc ]");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
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
- (void)orientationChanged:(id)sender{
    DebugLogFuncStart(@"orientationChanged");
//    DebugLogWarn(@"rootView.frame %@", NSStringFromCGRect(self.rootView.frame));
//    DebugLogWarn(@"rootView.bounds %@", NSStringFromCGRect(self.rootView.bounds));
//    self.rootView.frame = self.rootView.bounds;
}
#pragma mark- 主程序
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)willResignActiveNotification:(id)sender{
    DebugLogFuncStart(@"willResignActiveNotification sender:%@", sender);
    self.playTime = [self.player currentTime];
    
    //because cylinderProjectView is subclass of GLKitView, will pauses its animation timer under resign active
}
-(void)didEnterBackgroundNotification{
    DebugLogFuncStart(@"didEnterBackgroundNotification");
}

#pragma mark- 交互控制 UserInteraction
- (void)lockInteraction:(BOOL)lock{
    
    if (self.setupButton.selected) {
        self.projectView.userInteractionEnabled = false;
    }
    else{
        self.projectView.userInteractionEnabled = !lock;
    }

    self.downToolBar.userInteractionEnabled = !lock;
    self.topToolBar.userInteractionEnabled = !lock;
}

#pragma mark- UI动画
- (void)allViewUserInteractionEnable:(BOOL)enable{
    for (UIView* view in self.allViews) {
        view.userInteractionEnabled = enable;
    }
}

#pragma mark- 工具栏

- (IBAction)galleryButtonTouchUp:(UIButton *)sender {
//    DebugLogIBAction(sender, @"galleryButtonTouchUp");
    [RemoteLog logAction:@"galleryButtonTouchUp" identifier:sender];
    
    sender.selected = true;
    [self lockInteraction:true];

    //do some work
    if (self.setupButton.selected) {
        [self setupAnamorphParamsDoneCompletion:nil];
    }
    
    if (self.topPerspectiveView.hidden) {
        self.topPerspectiveView.hidden = false;
        self.eyePerspectiveView.hidden = true;

        REAnimationClip *animClip = [RECamera.mainCamera.animation.clips valueForKey:@"topToBottomAnimClip"];
        REPropertyAnimation *propAnim = animClip.propertyAnimations.firstObject;
        [propAnim setCompletionBlock:^{
            [self transitionToGallery];
        }];
        RECamera.mainCamera.animation.clip = animClip;
        RECamera.mainCamera.animation.target = self;
        [RECamera.mainCamera.animation play];
    }
    else{
        [self transitionToGallery];
    }
}

//- (IBAction)printButtonTouchUp:(UIButton *)sender {
//    //转换到顶视图
//    if (self.sideViewButton.hidden) {
//        self.sideViewButton.hidden = false;
//        self.topViewButton.hidden = true;
//        
//        REAnimationClip *animClip = [RECamera.mainCamera.animation.clips valueForKey:@"bottomToTopAnimClip"];
//        TPPropertyAnimation *propAnim = animClip.propertyAnimations.firstObject;
//        [propAnim setCompletionBlock:^{
//            [self exportToAirPrint];
//        }];
//        RECamera.mainCamera.animation.clip = animClip;
//        RECamera.mainCamera.animation.target = self;
//        [RECamera.mainCamera.animation play];
//    }
//    else{
//        [self exportToAirPrint];
//    }
//}

- (IBAction)setupButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"setupButtonTouchUp" identifier:sender];
    
    [self tutorialStepNextImmediate:false];

    sender.selected = !sender.selected;
    [self lockInteraction:true];
    
    if (sender.selected) {
        [self setupAnamorphParamsCompletion:^{
            [self lockInteraction:false];
            
            if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectSetupCylinderDiameter"]) {
                [self tutorialStartFromStepName:@"CylinderProjectSetupCylinderDiameter"];
            }
        }];
    }
    else{
        [self setupAnamorphParamsDoneCompletion:^{
            [self lockInteraction:false];
            
            if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectPaint"]) {
                [self tutorialStartFromStepName:@"CylinderProjectPaint"];
            }
        }];
    }

}

- (IBAction)shareButtonTouchUp:(UIButton *)sender {
   [RemoteLog logAction:@"shareButtonTouchUp" identifier:sender];
    sender.selected = true;
    
    [self share];
}

- (IBAction)infoButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"infoButtonTouchUp" identifier:sender];
    sender.selected = true;
    
    //TODO:产品名称, 介绍Anamorphosis 展示产品支持主页, 欢迎界面(教程),
    [self productInfo];
}

- (IBAction)paintButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"paintButtonTouchUp" identifier:sender];
    
    [self tutorialStepNextImmediate:false];

    [self lockInteraction:true];
    sender.selected = true;
    self.setupButton.selected = false;
    
    //do some work
    if (self.topPerspectiveView.hidden) {
        self.topPerspectiveView.hidden = false;
        self.eyePerspectiveView.hidden = true;
        
        if (!self.setupButton.selected) {
            [self setupAnamorphParamsDoneCompletion:^{
                REAnimationClip *animClip = [RECamera.mainCamera.animation.clips valueForKey:@"topToBottomAnimClip"];
                REPropertyAnimation *propAnim = animClip.propertyAnimations.firstObject;
                [propAnim setCompletionBlock:^{
                    [self transitionToPaint];
                }];
                RECamera.mainCamera.animation.clip = animClip;
                RECamera.mainCamera.animation.target = self;
                [RECamera.mainCamera.animation play];
            }];
        }
        

    }
    else{
        if (!self.setupButton.selected) {
            [self setupAnamorphParamsDoneCompletion:^{
                [self transitionToPaint];
            }];
        }
    }
}

#pragma mark- 转换Transition
- (void)transitionToGallery{
    //打开从paintCollectionVC transition 时添加的view
//    UIImageView *tempView = (UIImageView *)[self.view subViewWithTag:100];
//    if (tempView) {
//        //刷新的当前图片
//        NSString *path = [[Ultility applicationDocumentDirectory]stringByAppendingPathComponent:[[PaintFrameManager curGroup] curPaintDoc].thumbImagePath];
//        tempView.image = [UIImage imageWithContentsOfFile:path];
//        [UIView animateWithDuration:TempPaintFrameToGalleryFadeInDuration animations:^{
//            tempView.alpha = 1;
//        }completion:^(BOOL finished) {
//        }];
//    }
    
    //取消动画
//    REAnimationClip *animClip = [self.cylinderProjectCur.animation.clips valueForKey:@"fadeOutAnimClip"];
//    self.cylinderProjectCur.animation.clip = animClip;
//    [self.cylinderProjectCur.animation play];
    
    [self.delegate willTransitionToGallery];
    
    //ToolBar动画
    [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.topToolBar completion:nil toView:nil completion:nil];
    
    [ADPaintUIKitAnimation view:self.view switchDownToolBarFromView:self.downToolBar completion:nil toView:nil completion:^{
        [self lockInteraction:false];
    }];
}

- (void)transitionToPaint{
    REAnimationClip *animClip = [self.cylinder.animation.clips valueForKey:@"reflectionFadeInOutAnimClip"];
    REPropertyAnimation *propAnim = animClip.propertyAnimations.firstObject;
    propAnim.duration = 0.5;
    propAnim.fromValue = [NSNumber numberWithFloat:1];
    propAnim.toValue = [NSNumber numberWithFloat:0];
    [self.cylinder.animation play];
    
    //变换动画
    //更新临时view
    NSString *path = [[ADPaintFrameManager curGroup] curPaintDoc].thumbImagePath;
    path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:path];
    UIImageView *transitionImageView = (UIImageView *)[self.view subViewWithTag:100];
    transitionImageView.image = nil;
    transitionImageView.image = [UIImage imageWithContentsOfFile:path];
    transitionImageView.alpha = 0;
    
    //确定fromView的锚点，和放大缩小的尺寸
    CGRect rect = [self willGetCylinderMirrorFrame];
    CGFloat scale = self.view.frame.size.width / rect.size.width;
    CGPoint rectCenter = CGPointMake(rect.origin.x + rect.size.width * 0.5, rect.origin.y + rect.size.height * 0.5);
    rectCenter = CGPointMake(rectCenter.x, rectCenter.y + TransitionToPaintPixelOffsetY);
    UIView *fromView = self.view;
    fromView.layer.anchorPoint = CGPointMake(rectCenter.x / fromView.frame.size.width, rectCenter.y / fromView.frame.size.height);
    
    fromView.layer.position = rectCenter;
//    DebugLogWarn(@"fromView anchorPoint %@", NSStringFromCGPoint(fromView.layer.anchorPoint));
    [UIView animateWithDuration:TempPaintFrameToPaintFadeInDuration animations:^{
        transitionImageView.alpha = 1;
        [fromView.layer setValue:[NSNumber numberWithFloat:scale] forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [self openPaintDoc:[[ADPaintFrameManager curGroup] curPaintDoc]];
    }];
}
#pragma mark- 分享Share
- (void)share{
    ADShareTableViewController* shareTableViewController = [[ADShareTableViewController alloc]initWithStyle:UITableViewStylePlain];
    shareTableViewController.delegate = self;
    
    shareTableViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width * 0.5, shareTableViewController.tableViewHeight);
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:shareTableViewController];
    self.sharedPopoverController.delegate = self;
    [self.sharedPopoverController presentPopoverFromRect:self.shareButton.bounds inView:self.shareButton permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}
#pragma mark- 分享 share Delegate
-(void) didSelectPostToFacebook {
    [RemoteLog logAction:@"didSelectPostToFacebook" identifier:nil];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        NSString *postText = NSLocalizedString(@"ShareMessageBody", nil);
        [controller setInitialText:postText];
        UIImage *image = [self.projectView snapshot];
        [controller addImage:image];
        
        NSURL *appURL = [NSURL URLWithString:PRODUCT_INFO_INTRODUCTION];
        [controller addURL:appURL];

        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.shareButton.selected = false;
        [self presentViewController:controller animated:YES completion:^{
        }];
    }
    else{
        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.shareButton.selected = false;
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"FacebookNotInstalled", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
}

-(void) didSelectPostToTwitter{
    [RemoteLog logAction:@"didSelectPostToTwitter" identifier:nil];
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *controller = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        NSString *postText = NSLocalizedString(@"ShareMessageBody", nil);
        [controller setInitialText:postText];
        UIImage *image = [self.projectView snapshot];
        [controller addImage:image];
        
        NSURL *appURL = [NSURL URLWithString:PRODUCT_INFO_INTRODUCTION];
        [controller addURL:appURL];
        
        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.shareButton.selected = false;
        [self presentViewController:controller animated:YES completion:^{
        }];
    }
    else{
        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.shareButton.selected = false;
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"TwitterNotInstalled", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
}

-(void) didSelectPostToSinaWeibo {
    [RemoteLog logAction:@"didSelectPostToSinaWeibo" identifier:nil];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        NSString *postText = NSLocalizedString(@"ShareMessageBody", nil);
        [controller setInitialText:postText];
        
        UIImage *image = [self.projectView snapshot];
        [controller addImage:image];
        
        NSURL *appURL = [NSURL URLWithString:PRODUCT_INFO_INTRODUCTION];
        [controller addURL:appURL];
        
        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.shareButton.selected = false;
        [self presentViewController:controller animated:YES completion:^{
            
        }];
    }
    else{
        [self.sharedPopoverController dismissPopoverAnimated:true];
        self.shareButton.selected = false;
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"SinaWeiboNotInstalled", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
}

-(void) didSelectPostToEmail {
    [RemoteLog logAction:@"didSelectPostToEmail" identifier:nil];
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    NSString *postText = NSLocalizedString(@"EmailMessageSubject", nil);
    [picker setSubject:postText];
    NSString *messageBody = NSLocalizedString(@"EmailMessageBody", nil);
    
    //在顶视图状态下加入图片实际尺寸，方便于打印
    if (self.topPerspectiveView.hidden) {
        NSString *realWidth = [NSString unitStringFromFloat:DeviceWidth / self.userInputParams.unitZoom];
        NSString *realHeight = [NSString unitStringFromFloat:(DeviceWidth / self.eyeTopAspect) / self.userInputParams.unitZoom];
        NSString *messageDetail = [NSString stringWithFormat:@"\n%@: %@\n %@: %@",
                                   NSLocalizedString(@"RealWidth", nil), realWidth, NSLocalizedString(@"RealHeight", nil), realHeight];
        
        messageBody = [messageBody stringByAppendingString:messageDetail];
    }

    [picker setMessageBody:messageBody isHTML:YES];
    
    UIImage *image = [self.projectView snapshot];
    //convert UIImage to NSData to add it as attachment
    NSData *imageData = UIImagePNGRepresentation(image);
    
    //this is how to attach any data in mail, remember mimeType will be different
    //for other data type attachment.
    
    [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"image.png"];
    
    //showing MFMailComposerView here
    [self.sharedPopoverController dismissPopoverAnimated:true];
    self.shareButton.selected = false;
    [self presentViewController:picker animated:true completion:^{
    }];
}
#pragma mark- 邮件代理 Email Delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(result == MFMailComposeResultCancelled)
        DebugLog(@"Mail has cancelled");
    if(result == MFMailComposeResultSaved)
        DebugLog(@"Mail has saved");
    
    [self dismissViewControllerAnimated:true completion:nil];
}
#pragma mark- 设置Setup

- (void)setupAnamorphParamsCompletion: (void (^) (void)) block{
    [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:nil completion:nil toView:self.topToolBar completion:^{
        if (block != nil) {
            block();
        }
        
    }];
    
//    [self openVirtualDevice];
}

- (void)setupAnamorphParamsDoneCompletion: (void (^) (void)) block{
    //恢复到初始状态
    [self resetInputParams];
    
    [ADPaintUIKitAnimation view:self.view switchTopToolBarFromView:self.topToolBar completion:nil toView:nil completion:^{
        if (block != nil) {
            block();
        }

    }];
}

- (void)openUserInputParamValueSlider:(NSString*)keyPath minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue{
    self.valueSlider.hidden = false;
    self.valueSlider.minimumValue = minValue;
    self.valueSlider.maximumValue = maxValue;
    NSNumber *num = [self valueForKeyPath:keyPath];
    self.valueSlider.value = num.floatValue;
    self.userInputParamkeyPath = keyPath;
}

- (void)deselectUserInputParams{
    for (UIButton *button in self.allUserInputParamButtons) {
        button.selected = false;
    }
    self.valueSlider.hidden = true;
}
- (void)closeUserInputParamValueSlider{
    self.valueSlider.hidden = true;
}

- (IBAction)userInputParamButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"userInputParamButtonTouchUp" identifier:sender];
    
    for (UIButton *button in self.allUserInputParamButtons) {
        if (![button isEqual:sender]) {
            button.selected = false;
        }
    }
    sender.selected = !sender.selected;
    //    DebugLog(@"sender.selected %i", sender.selected);
    
    NSString *userInputParamKey = nil;
    CGFloat minValue = 0;
    CGFloat maxValue = 1;
    if ([sender isEqual:self.cylinderDiameterButton]) {
        userInputParamKey = @"userInputParams.cylinderDiameter";
        minValue = 0.038;
        maxValue = 0.38;
    }
    else if ([sender isEqual:self.cylinderHeightButton]) {
        userInputParamKey = @"userInputParams.cylinderHeight";
        minValue = 0.07;
        maxValue = 0.7;
    }
    else if ([sender isEqual:self.imageWidthButton]) {
        userInputParamKey = @"userInputParams.imageWidth";
        minValue = 0.038;
        maxValue = 0.38;
    }
    else if ([sender isEqual:self.imageHeightButton]) {
        userInputParamKey = @"userInputParams.imageCenterOnSurfHeight";
        minValue = 0.035;
        maxValue = 0.35;
    }
    else if ([sender isEqual:self.eyeDistanceButton]) {
        userInputParamKey = @"userInputParams.eyeHonrizontalDistance";
        minValue = 0.35;
        maxValue = 3.5;
    }
    else if ([sender isEqual:self.eyeHeightButton]) {
        userInputParamKey = @"userInputParams.eyeVerticalHeight";
        minValue = 0.35;
        maxValue = 3.5;
    }
    else if ([sender isEqual:self.projectZoomButton]) {
        userInputParamKey = @"userInputParams.unitZoom";
        minValue = 0.01;
        maxValue = 1;
    }
    
    if (sender.selected) {
        [self openUserInputParamValueSlider:userInputParamKey minValue:minValue maxValue:maxValue];
    }
    else{
        [self closeUserInputParamValueSlider];
    }
    
    //在确定排版之后确定教程
    [self tutorialStepNextImmediate:true];

}

- (IBAction)userInputParamSliderValueChanged:(UISlider *)sender {
    [RemoteLog logAction:@"userInputParamSliderValueChanged" identifier:sender];

    
    [self setValue:[NSNumber numberWithFloat:sender.value] forKeyPath:self.userInputParamkeyPath];
    [self flushUIUserInputParams];
}

- (IBAction)userInputParamSliderTouchUp:(UISlider *)sender {
    [RemoteLog logAction:@"userInputParamSliderTouchUp" identifier:sender];
    [self tutorialStartCurrentStep];
}

- (IBAction)userInputParamSliderTouchUpOutside:(UISlider *)sender {
    [RemoteLog logAction:@"userInputParamSliderTouchUpOutside" identifier:sender];
    [self tutorialStartCurrentStep];
}

- (IBAction)userInputParamSliderTouchCancel:(UISlider *)sender {
    [RemoteLog logAction:@"userInputParamSliderTouchCancel" identifier:sender];
    [self tutorialStartCurrentStep];
}

- (IBAction)userInputParamSliderTouchDown:(UISlider *)sender {
    [RemoteLog logAction:@"userInputParamSliderTouchDown" identifier:sender];
    [self tutorialStepNextImmediate:false];
}

-(void)resetInputParams{
    REAnimationClip *animClip = [[REAnimationClip alloc]init];
    animClip.name = @"userInputParamsResetAnimClip";
    NSEnumerator *enumeratorKey = [self.srcUserInputParams keyEnumerator];
    for (NSObject *key in enumeratorKey) {
        NSNumber *num = [self.srcUserInputParams objectForKey:key];
        
        REPropertyAnimation *propAnim = [REPropertyAnimation propertyAnimationWithKeyPath:(NSString*)key];
        propAnim.fromValue = [self valueForKeyPath:(NSString*)key];
        propAnim.toValue = num;
        propAnim.duration = CylinderResetParamDuration;
        propAnim.target = self;
        propAnim.timing = REPropertyAnimationTimingEaseOut;
        [animClip addPropertyAnimation:propAnim];
    }
    
    REPropertyAnimation* propAnim = animClip.propertyAnimations.firstObject;
    propAnim.delegate = self.parentViewController;
    [propAnim setCompletionBlock:^{
        for (UIButton *button in self.allUserInputParamButtons) {
            button.selected = false;
        }
        [self closeUserInputParamValueSlider];
        
        [self flushUIUserInputParams];
    }];
    
    self.resetAnimation = [REAnimation animationWithAnimClip:animClip];
    self.resetAnimation.target = self;
    [self.resetAnimation play];
}
//- (void)willCylinderProjectParamsChange{
//}
//
//- (void)willCylinderProjectParamsReset{
//}
#pragma mark- 产品信息ProductInfo
- (void)productInfo{
    ADProductInfoTableViewController* productInfoTableViewController = [[ADProductInfoTableViewController alloc]initWithStyle:UITableViewStylePlain];
    productInfoTableViewController.delegate = self;
    
    productInfoTableViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width * 0.5, productInfoTableViewController.tableViewHeight);
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:productInfoTableViewController];
    self.sharedPopoverController.delegate = self;
    [self.sharedPopoverController presentPopoverFromRect:self.infoButton.bounds inView:self.infoButton permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

#pragma mark- 产品信息代理 info Delegate

- (void) willOpenWelcomGuideURL{
    [RemoteLog logAction:@"willOpenWelcomGuideURL" identifier:nil];
    NSURL *url = [NSURL URLWithString:PRODUCT_INFO_INTRODUCTION];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (void) willOpenUserManualURL{
    [RemoteLog logAction:@"willOpenUserManualURL" identifier:nil];
    NSURL *url = [NSURL URLWithString:PRODUCT_INFO_USERMANUAL];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void) willOpenSupportURL{
    [RemoteLog logAction:@"willOpenSupportURL" identifier:nil];
    NSURL *url = [NSURL URLWithString:PRODUCT_INFO_COMMUNITY];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (void) willOpenGalleryURL{
    [RemoteLog logAction:@"willOpenGalleryURL" identifier:nil];
    NSURL *url = [NSURL URLWithString:PRODUCT_INFO_GALLERY];
    if([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
}
- (void)willOpenTutorial{
    [RemoteLog logAction:@"willOpenTutorial" identifier:nil];

    [self.sharedPopoverController dismissPopoverAnimated:true];
    AppDelegate *appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    [appDelegate initTutorial];
    
    //测试
//#if DEBUG
//    [self tutorialSetup];
//    [[AnaDrawTutorialManager current].curTutorial startFromStepName:@"CylinderProjectPaint"];
//#else
    [self galleryButtonTouchUp:self.galleryButton];
//#endif
    
}
#pragma mark- 内容CylinderProject View

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    
    if (context == &ItemStatusContext) {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [self syncPlayUI];
                       });
        return;
    }

    if ([keyPath isEqualToString:@"userInputParams.cylinderDiameter"]) {
        if (self.cylinder) {
            self.cylinder.transform.scale = GLKVector3Make(self.userInputParams.cylinderDiameter, self.userInputParams.cylinderHeight, self.userInputParams.cylinderDiameter);
        }
        if (self.cylinderProjectCur) {
            self.cylinderProjectCur.radius = self.userInputParams.cylinderDiameter * 0.5;
        }
    }
    else if ([keyPath isEqualToString:@"userInputParams.cylinderHeight"]) {
        if (self.cylinder) {
            self.cylinder.transform.scale = GLKVector3Make(self.userInputParams.cylinderDiameter, self.userInputParams.cylinderHeight, self.userInputParams.cylinderDiameter);
        }
    }
    else if ([keyPath isEqualToString:@"userInputParams.imageWidth"]) {
        if (self.cylinderProjectCur) {
            self.cylinderProjectCur.imageWidth = self.userInputParams.imageWidth;
        }
    }
    else if ([keyPath isEqualToString:@"userInputParams.imageCenterOnSurfHeight"]) {
        if (self.cylinderProjectCur) {
            self.cylinderProjectCur.imageCenterOnSurfHeight = self.userInputParams.imageCenterOnSurfHeight;
        }
    }
    else if ([keyPath isEqualToString:@"userInputParams.eyeHonrizontalDistance"] ||
             [keyPath isEqualToString:@"userInputParams.eyeVerticalHeight"]) {
        GLKVector3 eyeBottom = GLKVector3Make(0, self.userInputParams.eyeVerticalHeight, -self.userInputParams.eyeHonrizontalDistance);
        GLKVector3 eyeTop = GLKVector3Make(0, self.userInputParams.eyeHonrizontalDistance, -self.userInputParams.eyeTopZ);
        self.topCamera.position = eyeTop;
        RECamera.mainCamera.position = GLKVector3Lerp(eyeBottom, eyeTop, self.eyeBottomTopBlend);
        if (self.cylinder) {
            self.cylinder.reflectionTexUVSpace = GLKVector4Make(self.topCamera.focus.x - self.topCamera.orthoWidth * 0.5,
                                                                self.topCamera.focus.y - self.topCamera.orthoHeight * 0.5 + self.topCamera.position.z,
                                                                self.topCamera.orthoWidth,
                                                                self.topCamera.orthoHeight);
        }
    }
    else if ([keyPath isEqualToString:@"userInputParams.unitZoom"]) {
        if (self.topCamera) {
            self.topCamera.orthoWidth = DeviceWidth / self.userInputParams.unitZoom;
            self.topCamera.orthoHeight = (DeviceWidth / self.eyeTopAspect) / self.userInputParams.unitZoom;
            [self.topCamera updateProjMatrix];
            
            if (self.cylinder) {
                self.cylinder.reflectionTexUVSpace = GLKVector4Make(self.topCamera.focus.x - self.topCamera.orthoWidth * 0.5,
                                                               self.topCamera.focus.y - self.topCamera.orthoHeight * 0.5 + self.topCamera.position.z,
                                                               self.topCamera.orthoWidth,
                                                               self.topCamera.orthoHeight);
            }

        }
    }
    else{
//        [super observeValueForKeyPath:keyPath
//                             ofObject:object
//                               change:change
//                              context:context];
    }
    
    return;
}



- (void)setupBaseParams{
    DebugLogFuncStart(@"setupBaseParams");
    //顶视图视口比例
    self.eyeTopAspect = fabsf(self.projectView.bounds.size.width / (self.projectView.bounds.size.height + ToSeeCylinderTopPixelOffset));
    
    [self addObserver:self forKeyPath:@"eyeTop" options:NSKeyValueObservingOptionOld context:nil];
}
- (void)destroyBaseParams{
    [self removeObserver:self forKeyPath:@"eyeTop"];
}

- (void)setupInputParams{
    DebugLogFuncStart(@"setupInputParams");
    //根据ipad2的尺寸进行设定
    self.userInputParams = [[ADCylinderProjectUserInputParams alloc]init];
     NSEnumerator *enumeratorKey = [self.srcUserInputParams keyEnumerator];
    for (NSObject *key in enumeratorKey) {
        NSNumber *num = [self.srcUserInputParams objectForKey:key];
        [self setValue:num forKeyPath:(NSString*)key];
    }
    
    [self addObserver:self forKeyPath:@"userInputParams.cylinderDiameter" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.cylinderHeight" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.imageWidth" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.imageCenterOnSurfHeight" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.eyeHonrizontalDistance" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.eyeVerticalHeight" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.unitZoom" options:NSKeyValueObservingOptionOld context:nil];
    [self addObserver:self forKeyPath:@"userInputParams.eyeTopZ" options:NSKeyValueObservingOptionOld context:nil];

    //setup panel
    [self flushUIUserInputParams];
}
- (void)destroyInputParams{
    [self removeObserver:self forKeyPath:@"userInputParams.cylinderDiameter"];
    [self removeObserver:self forKeyPath:@"userInputParams.cylinderHeight"];
    [self removeObserver:self forKeyPath:@"userInputParams.imageWidth"];
    [self removeObserver:self forKeyPath:@"userInputParams.imageCenterOnSurfHeight"];
    [self removeObserver:self forKeyPath:@"userInputParams.eyeHonrizontalDistance"];
    [self removeObserver:self forKeyPath:@"userInputParams.eyeVerticalHeight"];
    [self removeObserver:self forKeyPath:@"userInputParams.unitZoom"];
    [self removeObserver:self forKeyPath:@"userInputParams.eyeTopZ"];
}

-(void)flushUIUserInputParams{
    [self.cylinderDiameterButton setTitle:[NSString unitStringFromFloat:self.userInputParams.cylinderDiameter] forState:UIControlStateNormal];
    [self.cylinderDiameterButton setTitle:[NSString unitStringFromFloat:self.userInputParams.cylinderDiameter] forState:UIControlStateSelected];
    
    [self.cylinderHeightButton setTitle:[NSString unitStringFromFloat:self.userInputParams.cylinderHeight] forState:UIControlStateNormal];
    [self.cylinderHeightButton setTitle:[NSString unitStringFromFloat:self.userInputParams.cylinderHeight] forState:UIControlStateSelected];

    [self.imageWidthButton setTitle:[NSString unitStringFromFloat:self.userInputParams.imageWidth] forState:UIControlStateNormal];
    [self.imageWidthButton setTitle:[NSString unitStringFromFloat:self.userInputParams.imageWidth] forState:UIControlStateSelected];
    
    [self.imageHeightButton setTitle:[NSString unitStringFromFloat:self.userInputParams.imageCenterOnSurfHeight] forState:UIControlStateNormal];
    [self.imageHeightButton setTitle:[NSString unitStringFromFloat:self.userInputParams.imageCenterOnSurfHeight] forState:UIControlStateSelected];
    
    [self.eyeDistanceButton setTitle:[NSString unitStringFromFloat:self.userInputParams.eyeHonrizontalDistance] forState:UIControlStateNormal];
    [self.eyeDistanceButton setTitle:[NSString unitStringFromFloat:self.userInputParams.eyeHonrizontalDistance] forState:UIControlStateSelected];
    
    [self.eyeHeightButton setTitle:[NSString unitStringFromFloat:self.userInputParams.eyeVerticalHeight] forState:UIControlStateNormal];
    [self.eyeHeightButton setTitle:[NSString unitStringFromFloat:self.userInputParams.eyeVerticalHeight] forState:UIControlStateSelected];

    [self.projectZoomButton setTitle:[NSString stringWithFormat:@"%.0f%%", self.userInputParams.unitZoom * 100] forState:UIControlStateNormal];
    [self.projectZoomButton setTitle:[NSString stringWithFormat:@"%.0f%%", self.userInputParams.unitZoom * 100] forState:UIControlStateSelected];
    
    [self.projectWidthButton setTitle:[NSString unitStringFromFloat:DeviceWidth / self.userInputParams.unitZoom] forState:UIControlStateNormal];
    [self.projectWidthButton setTitle:[NSString unitStringFromFloat:DeviceWidth / self.userInputParams.unitZoom] forState:UIControlStateSelected];
    
    [self.projectHeightButton setTitle:[NSString unitStringFromFloat:(DeviceWidth / self.eyeTopAspect) / self.userInputParams.unitZoom] forState:UIControlStateNormal];
    [self.projectHeightButton setTitle:[NSString unitStringFromFloat:(DeviceWidth / self.eyeTopAspect) / self.userInputParams.unitZoom] forState:UIControlStateSelected];
}

-(void)destroySceneCameras{
    DebugLogFuncStart(@"destroySceneCameras");
    [RECamera.mainCamera destroy];
    RECamera.mainCamera = nil;
    RECamera.current = nil;
    
    [self.topCamera destroy];
    self.topCamera = nil;
}
-(void)initSceneCameras{
    DebugLogFuncStart(@"initSceneCameras");
    //eyeBottom should be output of userInputParams
    
    RECamera.mainCamera.name = @"mainCamera";
    RECamera.mainCamera.position = GLKVector3Make(0, self.userInputParams.eyeVerticalHeight, -self.userInputParams.eyeHonrizontalDistance);
    RECamera.mainCamera.focus = GLKVector3Make(0, 0, -self.userInputParams.eyeTopZ);
    
    //如果中心点反向，则up向量反向
    if (RECamera.mainCamera.focus.z >= 0) {
        RECamera.mainCamera.up = GLKVector3Make(0, 0, -1);
    }
    else{
        RECamera.mainCamera.up = GLKVector3Make(0, 0, 1);
    }
    RECamera.mainCamera.nearClip = NearClipDistance;
    RECamera.mainCamera.farClip = FarClipDistance;
    RECamera.mainCamera.aspect = self.eyeTopAspect;
    RECamera.mainCamera.fov = GLKMathDegreesToRadians(29);
//    RECamera.mainCamera.backgroundColor = GLKVector4Make(90.0/255.0, 230.0/255.0, 71.0 / 255.0, 1);
    RECamera.mainCamera.backgroundColor = GLKVector4Make(0/255.0, 0/255.0, 0/255.0, 0);
    RECamera.mainCamera.cullingMask = Culling_Everything;
    self.bottomCameraProjMatrix = RECamera.mainCamera.projMatrix;
    
    float orthoWidth = DeviceWidth * self.userInputParams.unitZoom;
    float orthoHeight = DeviceWidth / self.eyeTopAspect * self.userInputParams.unitZoom;
    
    self.topCamera = [[RECamera alloc]initOrthorWithPosition:GLKVector3Make(0, self.userInputParams.eyeHonrizontalDistance, -self.userInputParams.eyeTopZ)
                                                     focus:GLKVector3Make(0, 0, -self.userInputParams.eyeTopZ)
                                                        up:GLKVector3Make(0, 0, 1)
                                                orthoWidth:orthoWidth
                                               orthoHeight:orthoHeight
                                                  nearClip:NearClipDistance
                                                   farClip:FarClipDistance];
    
    self.topCamera.name = @"topCamera";
//    RenderTexture *renderTex = [[RenderTexture alloc]initWithWidth:1024 height:1024];
//    [renderTex create];
    RERenderTexture *renderTex = [RERenderTexture textureWithWidth:1024 height:1024 mipmap:Interpolation_Linear wrapMode:WrapMode_Clamp];
    self.topCamera.targetTexture = renderTex;
    self.topCamera.cullingMask = Culling_Reflection;
    
    //add camera by rendering sequence
    [self.curScene addCamera:self.topCamera];
    [self.curScene addCamera:RECamera.mainCamera];
    
    self.eyeBottomTopBlend = 0.0;
    
    REPropertyAnimation *topToBottomPropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"eyeBottomTopBlend"];
    topToBottomPropAnim.delegate = self;
    topToBottomPropAnim.fromValue = [NSNumber numberWithFloat:1];
    topToBottomPropAnim.toValue = [NSNumber numberWithFloat:0];
    topToBottomPropAnim.duration = CylinderViewChangeDuration;
    topToBottomPropAnim.timing = REPropertyAnimationTimingEaseOut;
    [topToBottomPropAnim setCompletionBlock:^{
        
        [self lockInteraction:false];
        
        if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectSetupEyeDistance"]) {
            [self tutorialStartFromStepName:@"CylinderProjectSetupEyeDistance"];
        }
        else if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectSetup"]) {
            [self tutorialStartFromStepName:@"CylinderProjectSetup"];
        }
    }];
    REAnimationClip *animClip = [REAnimationClip animationClipWithPropertyAnimation:topToBottomPropAnim];
    animClip.name = @"topToBottomAnimClip";
    RECamera.mainCamera.animation = [REAnimation animationWithAnimClip:animClip];
    
    REPropertyAnimation *bottomToTopPropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"eyeBottomTopBlend"];
    bottomToTopPropAnim.delegate = self;
    bottomToTopPropAnim.fromValue = [NSNumber numberWithFloat:0];
    bottomToTopPropAnim.toValue = [NSNumber numberWithFloat:1];
    bottomToTopPropAnim.duration = CylinderViewChangeDuration;
    bottomToTopPropAnim.timing = REPropertyAnimationTimingEaseOut;
    [bottomToTopPropAnim setCompletionBlock:^{
        
        [self lockInteraction:false];
        
        if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectSetupZoom"]) {
            [self tutorialStartFromStepName:@"CylinderProjectSetupZoom"];
        }
        else if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectViewDevice"]) {
            [self tutorialStartFromStepName:@"CylinderProjectViewDevice"];
        }
    }];
    animClip = [REAnimationClip animationClipWithPropertyAnimation:bottomToTopPropAnim];
    animClip.name = @"bottomToTopAnimClip";
    [RECamera.mainCamera.animation addClip:animClip];
}

- (void)createCylinderBackup{
    
}

- (void)createCylinder{
    //create cylinder
    ADShaderCylinder *shaderCylinder = [[ADShaderCylinder alloc]init];
    REMaterial *matMain = [[REMaterial alloc]initWithShader:shaderCylinder];
    RETexture *texMain = [[RETexture alloc]init];
    texMain.texID = [RETextureManager textureInfoFromImageName:@"cylinderMain.png" reload:false].name;
    matMain.mainTexture = texMain;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Models/cylinder" ofType:@"obj"];
    ADCylinder *cylinder = (ADCylinder *)[REAssetDatabase LoadAssetAtPath:path ofType:[ADCylinder class]];
    

    cylinder.name = @"cylinder";
    cylinder.renderer.sharedMaterial = matMain;
    cylinder.layerMask = Layer_Default;
    cylinder.eye = RECamera.mainCamera.position;
    cylinder.reflectionTex = self.topCamera.targetTexture;
    cylinder.transform.scale = GLKVector3Make(self.userInputParams.cylinderDiameter, self.userInputParams.cylinderHeight, self.userInputParams.cylinderDiameter);
    cylinder.reflectionTexUVSpace = GLKVector4Make(self.topCamera.focus.x - self.topCamera.orthoWidth * 0.5,
                                                   self.topCamera.focus.y - self.topCamera.orthoHeight * 0.5 + self.topCamera.position.z,
                                                   self.topCamera.orthoWidth,
                                                   self.topCamera.orthoHeight);
    
    REPropertyAnimation *propAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"reflectionStrength"];
    propAnim.delegate = self;
    propAnim.timing = REPropertyAnimationTimingEaseInEaseOut;
    propAnim.target = cylinder;
    REAnimationClip *animClip = [REAnimationClip animationClipWithPropertyAnimation:propAnim];
    animClip.name = @"reflectionFadeInOutAnimClip";
    REAnimation *anim = [REAnimation animationWithAnimClip:animClip];
    cylinder.animation = anim;
    self.cylinder = cylinder;
    [self.curScene addEntity:cylinder];
    

    [self createCylinderTopLight];
    [self createCylinderBottom];
    [self createCylinderInterLight];
}

- (void)destroyCylinder{
    REPropertyAnimation* propAnim = (REPropertyAnimation*)(self.cylinderTopLight.animation.clip.propertyAnimations[0]);
    [propAnim cancel];
    
    propAnim = (REPropertyAnimation*)(self.cylinderInterLight.animation.clip.propertyAnimations[0]);
    [propAnim cancel];
    
    self.cylinder = nil;
    self.cylinderTopLight = nil;
    self.cylinderInterLight = nil;
}

- (void)createCylinderTopLight{
    //加入圆柱体的顶部光效
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Models/cylinderTopLight" ofType:@"obj"];
    REModelEntity *cylinderTopLight = [REAssetDatabase LoadAssetAtPath:path ofType:[REModelEntity class]];
    cylinderTopLight.transform.parent = self.cylinder.transform;
    
    ADShaderUnlitTransparentAdditive *shader = [[ADShaderUnlitTransparentAdditive alloc]init];
    REMaterial *mat = [[REMaterial alloc]initWithShader:shader];
    mat.transparent = true;
    RETexture *texMain = [[RETexture alloc]init];
    texMain.texID = [RETextureManager textureInfoFromImageName:@"cylinderTopLight.png" reload:false].name;
    mat.mainTexture = texMain;
    cylinderTopLight.renderer.material = mat;
    
    REPropertyAnimation *propAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"transform.eulerAngles.y"];
    propAnim.delegate = self;
    propAnim.timing = REPropertyAnimationTimingLinear | TPPropertyAnimationOptionRepeat;
    propAnim.fromValue = [NSNumber numberWithFloat:0];
    propAnim.toValue = [NSNumber numberWithFloat:360];
    propAnim.duration = 5;
    propAnim.target = cylinderTopLight;
    REAnimationClip *animClip = [REAnimationClip animationClipWithPropertyAnimation:propAnim];
    animClip.name = @"cylinderTopLightRotation";
    REAnimation *anim = [REAnimation animationWithAnimClip:animClip];
    cylinderTopLight.animation = anim;
    [cylinderTopLight.animation play];
    self.cylinderTopLight = cylinderTopLight;
    [self.curScene addEntity:cylinderTopLight];
}
- (void)createCylinderBottom{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Models/cylinderBottom" ofType:@"obj"];
    REModelEntity *cylinderBottom = [REAssetDatabase LoadAssetAtPath:path ofType:[REModelEntity class]];
    cylinderBottom.transform.parent = self.cylinder.transform;
    ADShaderNoLitTexture *shader = [[ADShaderNoLitTexture alloc]init];
    REMaterial *mat = [[REMaterial alloc]initWithShader:shader];
    RETexture *texMain = [[RETexture alloc]init];
    texMain.texID = [RETextureManager textureInfoFromImageName:@"cylinderBottom.png" reload:false].name;
    mat.mainTexture = texMain;
    cylinderBottom.renderer.material = mat;
    
    [self.curScene addEntity:cylinderBottom];
}

- (void)createCylinderInterLight{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Models/cylinderInterLight" ofType:@"obj"];
    REModelEntity *cylinderInterLight = [REAssetDatabase LoadAssetAtPath:path ofType:[REModelEntity class]];
    cylinderInterLight.transform.parent = self.cylinder.transform;
    ADShaderUnlitTransparentAdditive *shader = [[ADShaderUnlitTransparentAdditive alloc]init];
    REMaterial *mat = [[REMaterial alloc]initWithShader:shader];
    RETexture *texMain = [[RETexture alloc]init];
    texMain.texID = [RETextureManager textureInfoFromImageName:@"cylinderInterLight.png" reload:false].name;
    mat.mainTexture = texMain;
    cylinderInterLight.renderer.material = mat;
    
    REPropertyAnimation *propAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"transform.eulerAngles.y"];
    propAnim.delegate = self;
    propAnim.timing = REPropertyAnimationTimingLinear | TPPropertyAnimationOptionRepeat;
    propAnim.fromValue = [NSNumber numberWithFloat:0];
    propAnim.toValue = [NSNumber numberWithFloat:360];
    propAnim.duration = 5;
    propAnim.target = cylinderInterLight;
    REAnimationClip *animClip = [REAnimationClip animationClipWithPropertyAnimation:propAnim];
    animClip.name = @"cylinderInterLightRotation";
    REAnimation *anim = [REAnimation animationWithAnimClip:animClip];
    cylinderInterLight.animation = anim;
    [cylinderInterLight.animation play];
    self.cylinderInterLight = cylinderInterLight;
    [self.curScene addEntity:cylinderInterLight];
}
- (void)destroyCylinderProject{
    self.cylinderProjectCur = nil;
}
- (void)createCylinderProject{
    
    ADShaderCylinderProject *shaderCylinderProject = [[ADShaderCylinderProject alloc]init];
    REMaterial *matCylinderProject = [[REMaterial alloc]initWithShader:shaderCylinderProject];
    
    NSString *path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:[[ADPaintFrameManager curGroup] curPaintDoc].thumbImagePath];
    matCylinderProject.mainTexture = [RETexture textureFromImagePath:path reload:true];
    ADPlaneMesh *planeMesh = [[ADPlaneMesh alloc]initWithRow:100 column:100];
    [planeMesh create];
    REMeshFilter *meshFilter = [[REMeshFilter alloc]initWithMesh:planeMesh];
    REMeshRenderer *meshRenderer = [[REMeshRenderer alloc]initWithMeshFilter:meshFilter];
    meshRenderer.sharedMaterial = matCylinderProject;
    
    ADCylinderProject *cylinderProject = [[ADCylinderProject alloc]init];
    cylinderProject.name = @"cylinderProject";
    cylinderProject.renderer = meshRenderer;
    cylinderProject.radius = self.userInputParams.cylinderDiameter * 0.5;
    cylinderProject.eye = RECamera.mainCamera.position;
    cylinderProject.imageWidth = self.userInputParams.imageWidth;
    cylinderProject.imageCenterOnSurfHeight = self.userInputParams.imageCenterOnSurfHeight;
    cylinderProject.imageRatio = self.view.bounds.size.height / self.view.bounds.size.width;
    cylinderProject.layerMask = Layer_Reflection;
    cylinderProject.alphaBlend = self.cylinderProjectDefaultAlphaBlend;
    
    REPropertyAnimation *fadeInPropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"alphaBlend"];
    fadeInPropAnim.delegate = self;
    fadeInPropAnim.toValue = [NSNumber numberWithFloat:1];
    fadeInPropAnim.fromValue = [NSNumber numberWithFloat:0];
    fadeInPropAnim.duration = CylinderFadeInOutDuration;
    fadeInPropAnim.timing = REPropertyAnimationTimingEaseOut;

    REAnimationClip *fadeInAnimClip = [REAnimationClip animationClipWithPropertyAnimation:fadeInPropAnim];
    fadeInAnimClip.name = @"fadeInAnimClip";
    REAnimation *anim = [REAnimation animationWithAnimClip:fadeInAnimClip];
    cylinderProject.animation = anim;
    
    
    REPropertyAnimation *fadeOutPropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"alphaBlend"];
    fadeOutPropAnim.delegate = self;
    fadeOutPropAnim.toValue = [NSNumber numberWithFloat:0];
    fadeOutPropAnim.fromValue = [NSNumber numberWithFloat:1];
    fadeOutPropAnim.duration = CylinderFadeInOutDuration;
    fadeOutPropAnim.timing = REPropertyAnimationTimingEaseOut;
    [fadeOutPropAnim setCompletionBlock:^{
        [self.delegate willTransitionToGallery];
    }];
    REAnimationClip *fadeOutAnimClip = [REAnimationClip animationClipWithPropertyAnimation:fadeOutPropAnim];
    fadeOutAnimClip.name = @"fadeOutAnimClip";
    [anim addClip:fadeOutAnimClip];
    
    
    REPropertyAnimation *browsePropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"transform.translate.x"];
    browsePropAnim.name = @"browseAnimClipKeyPathTx";
    browsePropAnim.delegate = self;
    browsePropAnim.timing = REPropertyAnimationTimingEaseOut;
    REAnimationClip *browseAnimClip = [REAnimationClip animationClipWithPropertyAnimation:browsePropAnim];
    browseAnimClip.name = @"browseAnimClip";
    [anim addClip:browseAnimClip];
  
    
    meshRenderer.delegate = cylinderProject;
    self.cylinderProjectCur = cylinderProject;
    [self.curScene addEntity:cylinderProject];
    
}

- (void)createTestObj{
//    CylinderMesh *mesh = [[CylinderMesh alloc]initWithRadius:0.5 sides:60 height:1];
//    [mesh create];
//    MeshFilter *meshFilter = [[MeshFilter alloc]initWithMesh:mesh];
//    MeshRenderer *meshRenderer = [[MeshRenderer alloc]initWithMeshFilter:meshFilter];
//    meshRenderer.sharedMaterial = matMain;
//    
//    //cap
//    BaseEffect *effect = [[BaseEffect alloc]init];
//    ShaderNoLitTexture *shaderNoLitTex = [[ShaderNoLitTexture alloc]init];
//    Material *matCap = [[Material alloc]initWithShader:shaderNoLitTex];
//    Texture *texCap = [[Texture alloc]init];
//    texCap.texID = [TextureManager textureInfoFromImageName:@"cylinderCap.png" reload:false].name;
//    matCap.mainTexture = texCap;
//    [meshRenderer.sharedMaterials addObject:matCap];
//    Cylinder *cylinder = [[Cylinder alloc]init];
//    cylinder.renderer = meshRenderer;

}

- (void)setupScene {
    DebugLogFuncStart(@"setupScene");
    REScene *scene = [[REScene alloc]init];
    self.curScene = scene;
    
    [self initSceneCameras];
    
    //设定输入图片参数
//    if ([PaintFrameManager curGroup] curPaintDoc != nil) {
//        NSString *path = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:[PaintFrameManager curGroup] curPaintDoc.thumbImagePath];
//        self.paintTexture = [Texture textureFromImagePath:path reload:true];
//    }
    
    DebugLog(@"init Scene Entities ");
    [self createCylinderProject];
    
    [self createCylinder];
    
    [self initOtherParams];
    
    [self.curScene flushAll];
    DebugLog(@"init Scene finished");
    
    [self updateRenderViewParams];
}

- (void)destroyScene{
    DebugLogFuncStart(@"destroyScene");
    [self.curScene destroy];
    self.curScene = nil;
    
    [self destroySceneCameras];
    
    [self destroyCylinderProject];
    
    [self destroyCylinder];

}
-(void)initOtherParams{

}

#pragma mark- 更换虚拟设备显示VirtualDevice
- (void)openVirtualDevice{
    
}

- (void)closeVirtualDevice{
    
}

#pragma mark- 操作主屏幕CylinderProject View
- (void)rotateViewInAxisX:(float)percent{
    self.eyeBottomTopBlend = MIN(1, MAX(0, self.toEyeBottomTopBlend + percent));
}

#if DEBUG
- (CGFloat)getPercent:(UIPanGestureRecognizer *)sender{
    CGPoint center = self.view.center;
    CGPoint touchPoint =  [sender locationInView:self.view];
    GLKVector2 touchDirection = GLKVector2Make(touchPoint.x - center.x, touchPoint.y - center.y);
    touchDirection = GLKVector2Normalize(touchDirection);
    
    //    float dir = touchDirection.x - self.touchDirectionBegin.x;
    //    DebugLog(@"dir %.2f", dir);
    
    CGFloat angle = acosf(GLKVector2DotProduct(touchDirection, self.touchDirectionBegin));
    //移动速度过快情况下，会造成无法得到angle=0的情况
    
    CGFloat percent = MAX(0, MIN(angle / (M_PI) , 1));
    
    return percent;
}
#else
- (CGFloat)getPercent:(UIPanGestureRecognizer *)sender{
    CGPoint translation = [sender translationInView:sender.view];
    CGFloat fullTranslation = 200;
    float percent = fabsf(translation.x) / fullTranslation;
    percent = MAX(0, MIN(percent, 1));
    return percent;
}
#endif

- (IBAction)handlePanCylinderProjectView:(UIPanGestureRecognizer *)sender {
    [RemoteLog logAction:@"handlePanCylinderProjectView" identifier:sender];
    
    //顶视图模式下忽略圆柱体区域的触摸手势
    if (!self.eyePerspectiveView.hidden) {
        //ignoreCylinderRectTouch
        CGPoint location = [sender locationInView:sender.view];
        CGRect cylinderTopRect = [self getCylinderMirrorTopFrame];
        if(CGRectContainsPoint(cylinderTopRect, location)){
            return;
        }
    }
    
    CGPoint touchPoint = CGPointZero;
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:{
            touchPoint = [sender locationInView:self.view];
            //根据区域判断
//            if ( touchPoint.y < self.view.bounds.size.height * 0.5) {
//                sender.state = UIGestureRecognizerStateFailed;
//                return;
//            }
            
            self.touchDirectionBegin = GLKVector2Make(touchPoint.x - self.view.center.x, touchPoint.y - self.view.center.y);
            self.touchDirectionBegin = GLKVector2Normalize(self.touchDirectionBegin);
        }
            break;
        case UIGestureRecognizerStateChanged:{
            CGPoint translation = [sender translationInView:sender.view];
            CGFloat percent = 0.0;
            if (translation.x > 0){
                if (self.browseNextAction.interactionEnable) {
                    [self.browseNextAction updateInteractiveTransition:0];
                }
                if (self.browseLastAction.interactionEnable) {
//                    DebugLog(@"browse last");
                    //FIXME:保证pecent能走到％0
                    percent = [self getPercent:sender];
                    [self.browseLastAction updateInteractiveTransition:percent];
                }
 
            }
            else if(translation.x < 0){
                if (self.browseLastAction.interactionEnable) {
                    [self.browseLastAction updateInteractiveTransition:0];
                }
                if (self.browseNextAction.interactionEnable) {
                    //                    DebugLog(@"browse next");
                    //FIXME:保证pecent能走到％0
                    percent = [self getPercent:sender];
                    [self.browseNextAction updateInteractiveTransition:percent];
                }
            }
        }
            break;
        case UIGestureRecognizerStateEnded:{
            CGFloat percent;
            CGPoint translation = [sender translationInView:sender.view];
            if (translation.x > 0) {
//                DebugLog(@"end browse last");
                percent = [self getPercent:sender];
                if (percent > self.browseLastAction.completeThresold) {
                    if ([[ADPaintFrameManager curGroup] lastPaintDoc]) {
                        [self.browseLastAction finishInteractiveTransition];
                    }
                    else{
                        [self.browseLastAction cancelInteractiveTransition];
                    }
                }
                else{
                    [self.browseLastAction cancelInteractiveTransition];
                }
            }
            else if (translation.x < 0) {
//                DebugLog(@"end browse next");
                percent = [self getPercent:sender];
                if (percent > self.browseNextAction.completeThresold) {
                    if ([[ADPaintFrameManager curGroup] nextPaintDoc]) {
                        [self.browseNextAction finishInteractiveTransition];
                    }
                    else{
                        [self.browseNextAction cancelInteractiveTransition];
                    }
                }
                else{
                    [self.browseNextAction cancelInteractiveTransition];
                }
            }
        }
            break;
        case UIGestureRecognizerStateCancelled:{
        }
            break;
        default:
            break;
    }
}


#pragma mark- 绘图设置
- (void)updateRenderViewParams{
//    DebugLogFuncUpdate(@"updateRenderViewParams");
    GLKVector3 eyeBottom = GLKVector3Make(0, self.userInputParams.eyeVerticalHeight, -self.userInputParams.eyeHonrizontalDistance);
    GLKVector3 eyeTop = GLKVector3Make(0, self.userInputParams.eyeHonrizontalDistance, -self.userInputParams.eyeTopZ);
    RECamera.mainCamera.position = GLKVector3Lerp(eyeBottom, eyeTop, self.eyeBottomTopBlend);
    GLKMatrix4 matrix = [ADUltility MatrixLerpFrom:self.bottomCameraProjMatrix to:self.topCamera.projMatrix blend:self.eyeBottomTopBlend];
    RECamera.mainCamera.projMatrix = matrix;
}

#pragma mark- 显示代理DisplayDelegate
- (CGRect)willGetViewport{
//    struct { GLint x, y, w, h; } rect;
//    glGetIntegerv(GL_VIEWPORT, (GLint*)&rect);
//    printf("%s %d %d\n", __FUNCTION__, rect.w, rect.h);
    CGFloat scale = self.projectView.contentScaleFactor;

    return CGRectMake(0, ToSeeCylinderTopViewportPixelOffsetY * scale, self.view.bounds.size.width * scale, (self.view.bounds.size.height + ToSeeCylinderTopPixelOffset) * scale);
}

#pragma mark- 更新
- (void)glkViewControllerUpdate:(GLKViewController *)controller{
//    DebugLog(@"glkViewControllerUpdate");

    //重新设置投影地面的参数
    [self updateRenderViewParams];
    
    [self.curScene update];
}


- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
//    DebugLog(@"drawInRect");
    [self.curScene render];
}

#pragma mark- Opengles Shader相关
-(EAGLContext *)createBestEAGLContext{
    DebugLogFuncStart(@"createBestEAGLContext");
    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    if(context == nil){
        DebugLogError(@"Failed to create ES context");
    }
    else{
        DebugLogSuccess(@"create kEAGLRenderingAPIOpenGLES2 context success");
    }
    return context;
}

- (void)initGLState{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_BLEND);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    
    [[REGLWrapper current] blendFunc:BlendFuncAlphaBlendPremultiplied];
}

- (void)setupGL {
    DebugLogFuncStart(@"setupGL");
    
//    [GLWrapper destroy];
    [REGLWrapper initialize];
    [[REGLWrapper current].context setDebugLabel:@"CylinderProjectView Context"];
    self.projectView.context = [REGLWrapper current].context;
    [self initGLState];
    
    [REResources initialize];
    
    [RETextureManager initialize];

    REDisplay.main = [[REDisplay alloc]initWithGLKView:self.projectView];
    REDisplay.main.delegate = self;
}

- (void)tearDownGL {
    DebugLog(@"tearDownGL");
    
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    [REResources unloadAllAsset];
    [REResources destroy];
    
    [RETextureManager destroy];
    
    REDisplay.main = nil;
    
    RECamera.mainCamera = nil;
    
    [REGLWrapper destroy];
}


#pragma mark- 核心变换
//-(void)viewPaintDoc:(PaintDoc*)paintDoc{
//    self.curPaintDoc = paintDoc;
//    //TODO:导致CylinderProject dismiss后不能被release
//    //TODO:当新建图片时thumbImage为nil,而thumbImagePath有数值
//    if (self.paintTexture) {
//        self.paintTexture.texID = [TextureManager textureInfoFromFileInDocument:paintDoc.thumbImagePath reload:true].name;
//    }
//}

//主题Logo
//- (void)loadLogoWithAnimation:(BOOL)anim{
//}

- (void)reloadLogo{
}


//在project plane上生成图片
-(void)closeImage{

}

//在project plane上生成视频影像
-(void)anamorphVideo{
    NSURL *url = [[NSBundle mainBundle]
                  URLForResource: @"Collection/jerryfish1" withExtension:@"mov"];
    
    self.asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    
    [self generateImage];

    self.playState = PS_Stopped;
}
#pragma mark- 视频
//- (IBAction)playbackButtonTouchUp:(UIButton *)sender {
//    [IBActionReport logAction:@"playbackButtonTouchUp" identifier:sender];
//    [self.player play];
//}

- (void)textureFromSampleBuffer:(CMSampleBufferRef)sampleBuffer {
    
//    glBindTexture(GL_TEXTURE_2D, self.paintTexture);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

    CVImageBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
//    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 520, 520, 0, GL_BGRA, GL_UNSIGNED_BYTE, CVPixelBufferGetBaseAddress(pixelBuffer));
    uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    size_t width = CVPixelBufferGetWidth(pixelBuffer);
    size_t height = CVPixelBufferGetHeight(pixelBuffer);

    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef newContext = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef newImage = CGBitmapContextCreateImage(newContext);
    
    /*We release some components*/
    CGContextRelease(newContext);
    CGColorSpaceRelease(colorSpace);
    
//    self.paintTexture.texID = [TextureManager textureInfoFromCGImage:newImage].name;
    
    CGImageRelease(newImage);
}

-(UIImage *)imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer{
    
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer.
    CVPixelBufferLockBaseAddress(imageBuffer,0);
    
    // Get the number of bytes per row for the pixel buffer.
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height.
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // Create a device-dependent RGB color space.
    static CGColorSpaceRef colorSpace = NULL;
    if (colorSpace == NULL) {
        colorSpace = CGColorSpaceCreateDeviceRGB();
        if (colorSpace == NULL) {
            // Handle the error appropriately.
            return nil;
        }
    }
    
    // Get the base address of the pixel buffer.
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    // Get the data size for contiguous planes of the pixel buffer.
    size_t bufferSize = CVPixelBufferGetDataSize(imageBuffer);
    
    // Create a Quartz direct-access data provider that uses data we supply.
    CGDataProviderRef dataProvider =
    CGDataProviderCreateWithData(NULL, baseAddress, bufferSize, NULL);
    // Create a bitmap image from data supplied by the data provider.
    CGImageRef cgImage =
    CGImageCreate(width, height, 8, 32, bytesPerRow,
                  colorSpace, kCGImageAlphaNoneSkipFirst | kCGBitmapByteOrder32Little,
                  dataProvider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    
    // Create and return an image object to represent the Quartz image.
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
    
    return image;
}

- (void) readNextMovieFrame
{
    //readNextMovieFrame
    switch (self.assetReader.status) {
        case AVAssetReaderStatusReading:{
//            DebugLog(@"AVAssetReaderStatusReading");
            AVAssetReaderTrackOutput * output = [self.assetReader.outputs objectAtIndex:0];
            CMSampleBufferRef sampleBuffer = [output copyNextSampleBuffer];
            if (sampleBuffer)
            {
                [self textureFromSampleBuffer:sampleBuffer];
                
                CMSampleBufferInvalidate(sampleBuffer);
                CFRelease(sampleBuffer);
                sampleBuffer = NULL;
            }
            else{
                //退到后台会导致output copyNextSampleBuffer null
                DebugLog(@"no sampleBuffer");
            }
        }
            break;
        case AVAssetReaderStatusCompleted:{
            DebugLog(@"AVAssetReaderStatusCompleted");
            self.assetReader = nil;
            
            //loop循环播放
            dispatch_async(dispatch_get_main_queue(),^{
                [self readMovie];
            });
        }
        case AVAssetReaderStatusFailed:{
            DebugLog(@"AVAssetReaderStatusFailed: %@", [self.assetReader.error description]);
            //退到后台会导致Failed
            self.assetReader = nil;
            
            //loop循环播放
            dispatch_async(dispatch_get_main_queue(),^{
                [self readMovie];
            });
        }
            break;                                    
        case AVAssetReaderStatusCancelled:{
            self.assetReader = nil;
        }
            break;            
        default:
            break;
    }
}

- (void)readMovie{
    NSArray *tracks = [self.asset tracksWithMediaType:AVMediaTypeVideo];
    if (tracks.count == 1) {
        AVAssetTrack *track = [tracks objectAtIndex:0];
        NSMutableDictionary* videoSettings = [[NSMutableDictionary alloc] init];
        [videoSettings setObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        //audio
//        [videoSettings setObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        AVAssetReaderTrackOutput *output = [[AVAssetReaderTrackOutput alloc]initWithTrack:track outputSettings:videoSettings];
        NSError * error = nil;
        self.assetReader = [[AVAssetReader alloc]initWithAsset:self.asset error:&error];
        if (error){
            DebugLog(@"Error loading file: %@", [error localizedDescription]);
        }
        
        [self.assetReader addOutput:output];
        //test
        Float64 durationSeconds = CMTimeGetSeconds([self.asset duration]);
        self.assetReader.timeRange = CMTimeRangeMake(CMTimeMakeWithSeconds(durationSeconds * 0.67, 24), CMTimeMakeWithSeconds((durationSeconds/3.0), 24));
        
        if ([self.assetReader startReading]) {
            self.playState = PS_Playing;
            [self.playButton setIsPlaying:true];
        }
        else{
            DebugLog(@"assetReader startReading failed");
        }
    }
    //audio
    NSError *error;
    
    AVKeyValueStatus status = [self.asset statusOfValueForKey:@"tracks" error:&error];
    
    if (status == AVKeyValueStatusLoaded) {
        self.playerItem = [AVPlayerItem playerItemWithAsset:self.asset];
        [self.playerItem addObserver:self forKeyPath:@"status"
                             options:0 context:&ItemStatusContext];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:self.playerItem];
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        [self.player play];
    }
    else {
        // You should deal with the error appropriately.
        DebugLog(@"The asset's tracks were not loaded:\n%@", [error localizedDescription]);
    }
    
//    NSArray *soundTracks = [self.asset tracksWithMediaType:AVMediaTypeAudio];
//    if (soundTracks.count >=1) {
//        AVAssetTrack *soundTrack = [soundTracks objectAtIndex:0];
//
//    }
}

//截取静态图片
-(void)generateImage{
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:self.asset];
    
//    Float64 durationSeconds = CMTimeGetSeconds([self.asset duration]);
//    CMTime midpoint = CMTimeMakeWithSeconds(durationSeconds/2.0, 600);
    CMTime midpoint = CMTimeMakeWithSeconds( 0.0, 600);
    NSError *error;
    CMTime actualTime;
    
    CGImageRef halfWayImage = [imageGenerator copyCGImageAtTime:midpoint actualTime:&actualTime error:&error];
    
    if (halfWayImage != NULL) {
        
        NSString *actualTimeString = (__bridge NSString *)CMTimeCopyDescription(NULL, actualTime);
        NSString *requestedTimeString = (__bridge NSString *)CMTimeCopyDescription(NULL, midpoint);
        DebugLog(@"Got halfWayImage: Asked for %@, got %@", requestedTimeString, actualTimeString);
        
        // Do something interesting with the image.
        
        CGImageRelease(halfWayImage);
    }
}

- (void)playVideo{
    [self.asset loadValuesAsynchronouslyForKeys:@[@"tracks"] completionHandler:^() {
        dispatch_async(dispatch_get_main_queue(),^{
            [self readMovie];
        });
    }];

}
- (void)stopVideo{
    [self.asset loadValuesAsynchronouslyForKeys:@[@"tracks"] completionHandler:^() {
        dispatch_async(dispatch_get_main_queue(),^{
            [self readMovie];
        });
    }];
    
}

- (void)pauseVideo{
    [self.assetReader cancelReading];
    [self.player pause];
    self.playState = PS_Pause;
    [self.playButton setIsPlaying:false];
}

//- (IBAction)playButtonTouchUp:(UIButton *)sender {
//    [IBActionReport logAction:@"playButtonTouchUp" identifier:sender];
//    if (self.playState == PS_Stopped) {
//        [self playVideo];
//    }
//    else if (self.playState == PS_Playing) {
//        [self pauseVideo];
//    }
//    else if (self.playState == PS_Pause) {
//        [self playVideo];
//    }
//}

- (void)flushAllUI {
    if(self.eyeBottomTopBlend > 0.0){
        self.topPerspectiveView.hidden = true;
        self.eyePerspectiveView.hidden = false;
    }
    else{
        self.topPerspectiveView.hidden = false;
        self.eyePerspectiveView.hidden = true;
    }
//    [self syncPlayUI];
}

- (void)syncPlayUI {
    if ((self.player.currentItem != nil) &&
        ([self.player.currentItem status] == AVPlayerItemStatusReadyToPlay)) {
        self.playButton.enabled = YES;
    }
    else {
        self.playButton.enabled = NO;
    }
}


- (void)playerItemDidReachEnd:(NSNotification *)notification {
    [self.player seekToTime:kCMTimeZero];
}

- (CGRect)getCylinderMirrorFrame{
    return CGRectMake(308, 286, 150, 150 / self.view.bounds.size.width * self.view.bounds.size.height);
}

- (CGRect)getCylinderMirrorTopFrame{
    CGFloat margin = 5;
    return CGRectMake(289 - margin, 220 - margin, 192 + margin * 2, 192 + margin * 2);
}

- (ADCylinderProject*)dequeueReusableCylinderProject{
    for (REEntity *entity in self.curScene.aEntities) {
        if ([entity isKindOfClass:[ADCylinderProject class]]) {
            ADCylinderProject *cylinderProject = (ADCylinderProject *)entity;
            if (!cylinderProject.isActive) {
                cylinderProject.active = true;
                return cylinderProject;
            }
        }
    }
    
    //no inactive cylinderProject, alloc new
    DebugLog(@"no inactive cylinderProject, alloc new");
    ADCylinderProject *cylinderProjectCopy = [self.cylinderProjectCur copy];
    cylinderProjectCopy.name = @"cylinderProjectCopy";
    [self.curScene addEntity:cylinderProjectCopy];
    
    return cylinderProjectCopy;
}

#pragma mark- CustomPercentDrivenInteractiveTransition
- (void)willUpdatingInteractiveTransition:(ADCustomPercentDrivenInteractiveTransition*)transition{
//    DebugLogFuncUpdate(@"willUpdatingInteractiveTransition");
    if ([transition.name isEqualToString:@"browseNext"]) {
//        DebugLog(@"browsing Next");
        CGFloat x = transition.percentComplete * self.cylinderProjectCur.imageWidth;
        [self.cylinderProjectCur setValue:[NSNumber numberWithFloat:x] forKeyPath:@"transform.translate.x"];
        
        
        //查询是否有下一张图片
        if (transition.percentComplete > 0) {
            if ([[ADPaintFrameManager curGroup] nextPaintDoc]) {
                //清空上一张图片资源
                self.cylinderProjectLast.active = false;
                self.cylinderProjectLast = nil;
                
                if (!self.cylinderProjectNext) {
                    self.cylinderProjectNext = [self dequeueReusableCylinderProject];
                    REPropertyAnimation *browsePropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"transform.translate.x"];
                    browsePropAnim.delegate = self;
                    browsePropAnim.timing = REPropertyAnimationTimingEaseOut;
                    REAnimationClip *animclip = [REAnimationClip animationClipWithPropertyAnimation:browsePropAnim];
                    animclip.name = @"browseAnimClip";
                    [self.cylinderProjectNext.animation removeClip:@"browseAnimClip"];
                    [self.cylinderProjectNext.animation addClip:animclip];
                    
                    
                    NSString *path = [[ADPaintFrameManager curGroup] nextPaintDoc].thumbImagePath;
                    path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:path];
                    self.cylinderProjectNext.renderer.material.mainTexture = [RETexture textureFromImagePath:path reload:false];
                }
            }
        }
        
        x = (transition.percentComplete - 1) * self.cylinderProjectCur.imageWidth;
        if (self.cylinderProjectNext) {
            [self.cylinderProjectNext setValue:[NSNumber numberWithFloat:x] forKeyPath:@"transform.translate.x"];
        }
        
    }
    else if ([transition.name isEqualToString:@"browseLast"]) {
//        DebugLog(@"browsing Last");
        CGFloat x = -transition.percentComplete * self.cylinderProjectCur.imageWidth;
        [self.cylinderProjectCur setValue:[NSNumber numberWithFloat:x] forKeyPath:@"transform.translate.x"];
        
        if (transition.percentComplete > 0) {
            //查询是否有上一张图片
            if ([[ADPaintFrameManager curGroup] lastPaintDoc]) {
                //清空下一张图片资源
                self.cylinderProjectNext.active = false;
                self.cylinderProjectNext = nil;
                
                if (!self.cylinderProjectLast) {
                    self.cylinderProjectLast = [self dequeueReusableCylinderProject];
                    REPropertyAnimation *browsePropAnim = [REPropertyAnimation propertyAnimationWithKeyPath:@"transform.translate.x"];
                    browsePropAnim.delegate = self;
                    browsePropAnim.timing = REPropertyAnimationTimingEaseOut;
                    REAnimationClip *animclip = [REAnimationClip animationClipWithPropertyAnimation:browsePropAnim];
                    animclip.name = @"browseAnimClip";
                    [self.cylinderProjectLast.animation removeClip:@"browseAnimClip"];
                    [self.cylinderProjectLast.animation addClip:animclip];

                    
                    NSString *path = [[ADPaintFrameManager curGroup] lastPaintDoc].thumbImagePath;
                    path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:path];
                    self.cylinderProjectLast.renderer.material.mainTexture = [RETexture textureFromImagePath:path reload:false];
                    
                }
            }
        }

        x = -(transition.percentComplete - 1) * self.cylinderProjectCur.imageWidth;
        if (self.cylinderProjectLast) {
            [self.cylinderProjectLast setValue:[NSNumber numberWithFloat:x] forKeyPath:@"transform.translate.x"];
        }
    }
}

- (void)willFinishInteractiveTransition:(ADCustomPercentDrivenInteractiveTransition*)transition completion: (void (^)(void))completion{
    DebugLogFuncStart(@"willFinishInteractiveTransition");
    
    REAnimationClip *curAnimClip = [self.cylinderProjectCur.animation.clips valueForKey:@"browseAnimClip"];
    REPropertyAnimation *curPropAnim = curAnimClip.propertyAnimations.firstObject;

    if ([transition.name isEqualToString:@"browseNext"]) {
        curPropAnim.fromValue = [self.cylinderProjectCur valueForKeyPath:@"transform.translate.x"];
        curPropAnim.toValue = [NSNumber numberWithFloat:self.cylinderProjectCur.imageWidth];
        [curPropAnim setCompletionBlock:^{
            DebugLog(@"browse Next anim finished");
            self.cylinderProjectCur.active = false;
            self.cylinderProjectCur = self.cylinderProjectNext;
            self.cylinderProjectNext = nil;
            self.cylinderProjectLast = nil;
            [ADPaintFrameManager curGroup].curPaintIndex ++;
            
            //结束教程
            if([[ADSimpleTutorialManager current] isActive]){
                if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectNextImage"]) {
                    [self tutorialStepNextImmediate:YES];
                }
            }
            
            completion();
        }];
        self.cylinderProjectCur.animation.clip = curAnimClip;
        [self.cylinderProjectCur.animation play];
        DebugLog(@"playing browse Next anim");
        REAnimationClip *nextAnimClip = [self.cylinderProjectNext.animation.clips valueForKey:@"browseAnimClip"];
        REPropertyAnimation *nextPropAnim = nextAnimClip.propertyAnimations.firstObject;
        nextPropAnim.fromValue = [self.cylinderProjectNext valueForKeyPath:@"transform.translate.x"];
        nextPropAnim.toValue = [NSNumber numberWithFloat:0];
        self.cylinderProjectNext.animation.clip = nextAnimClip;
        [self.cylinderProjectNext.animation play];
        
    }
    else if ([transition.name isEqualToString:@"browseLast"]) {

        curPropAnim.fromValue = [self.cylinderProjectCur valueForKeyPath:@"transform.translate.x"];
        curPropAnim.toValue = [NSNumber numberWithFloat:-self.cylinderProjectCur.imageWidth];
        
        [curPropAnim setCompletionBlock:^{
            DebugLog(@"browse Last anim finished");
            self.cylinderProjectCur.active = false;
            self.cylinderProjectCur = self.cylinderProjectLast;
            self.cylinderProjectNext = nil;
            self.cylinderProjectLast = nil;
            [ADPaintFrameManager curGroup].curPaintIndex --;
            
            //结束教程
            if([[ADSimpleTutorialManager current] isActive]){
                if ([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectPreviousImage"]) {
                    [self tutorialStepNextImmediate:YES];
                }
            }
            
            completion();
        }];
        self.cylinderProjectCur.animation.clip = curAnimClip;
        [self.cylinderProjectCur.animation play];
        DebugLog(@"playing browse Last anim");

        REAnimationClip *lastAnimClip = [self.cylinderProjectLast.animation.clips valueForKey:@"browseAnimClip"];
        REPropertyAnimation *lastPropAnim = lastAnimClip.propertyAnimations.firstObject;
        lastPropAnim.fromValue = [self.cylinderProjectLast valueForKeyPath:@"transform.translate.x"];
        lastPropAnim.toValue = [NSNumber numberWithFloat:0];
        self.cylinderProjectLast.animation.clip = lastAnimClip;
        [self.cylinderProjectLast.animation play];
    }
}

- (void)willCancelInteractiveTransition:(ADCustomPercentDrivenInteractiveTransition *)transition completion: (void (^)(void))completion{
    DebugLogFuncStart(@"willCancelInteractiveTransition");
    
    REAnimationClip *animClip = [self.cylinderProjectCur.animation.clips valueForKey:@"browseAnimClip"];
    REPropertyAnimation *propAnim = animClip.propertyAnimations.firstObject;
    if ([transition.name isEqualToString:@"browseNext"]) {
        DebugLog(@"canceling browse Next");
        propAnim.fromValue = [self.cylinderProjectCur valueForKeyPath:@"transform.translate.x"];
        propAnim.toValue = [NSNumber numberWithFloat:0];
        [propAnim setCompletionBlock:^{
            completion();
        }];
        self.cylinderProjectCur.animation.clip = animClip;
        [self.cylinderProjectCur.animation play];
        
        
        REAnimationClip *nextAnimClip = [self.cylinderProjectNext.animation.clips valueForKey:@"browseAnimClip"];
        REPropertyAnimation *propAnim = nextAnimClip.propertyAnimations.firstObject;
        propAnim.fromValue = [self.cylinderProjectNext valueForKeyPath:@"transform.translate.x"];
        propAnim.toValue = [NSNumber numberWithFloat:-self.cylinderProjectNext.imageWidth];
        self.cylinderProjectNext.animation.clip = nextAnimClip;
        [self.cylinderProjectNext.animation play];
    }
    else if ([transition.name isEqualToString:@"browseLast"]) {
        DebugLog(@"canceling browse Last");
        propAnim.fromValue = [self.cylinderProjectCur valueForKeyPath:@"transform.translate.x"];
        propAnim.toValue = [NSNumber numberWithFloat:0];
        [propAnim setCompletionBlock:^{
            completion();
        }];
        self.cylinderProjectCur.animation.clip = animClip;
        [self.cylinderProjectCur.animation play];
        
        
        REAnimationClip *lastAnimClip = [self.cylinderProjectLast.animation.clips valueForKey:@"browseAnimClip"];
        REPropertyAnimation *propAnim = lastAnimClip.propertyAnimations.firstObject;
        propAnim.fromValue = [self.cylinderProjectLast valueForKeyPath:@"transform.translate.x"];
        propAnim.toValue = [NSNumber numberWithFloat:self.cylinderProjectLast.imageWidth];
        self.cylinderProjectLast.animation.clip = lastAnimClip;
        [self.cylinderProjectLast.animation play];
    }
}

#pragma mark- TPPropertyAnimationDelegate
-(void)willBeginPropertyAnimation:(REPropertyAnimation *)propertyAnimation{
    DebugLogFuncStart(@"willBeginPropertyAnimation keyPath:%@ target:%@", propertyAnimation.keyPath, propertyAnimation.target);
    [self lockInteraction:true];
}

-(void)propertyAnimationDidFinish:(REPropertyAnimation *)propertyAnimation{
    DebugLogFuncStart(@"propertyAnimationDidFinish keyPath:%@ target:%@", propertyAnimation.keyPath, propertyAnimation.target);
    if (self.paintDirectly) {
        [self lockInteraction:true];
        self.paintDirectly = false;
    }
    else if (self.topPerspectiveView.hidden) {
        [self lockInteraction:false];
        self.projectView.userInteractionEnabled = false;
    }
    else{
        [self lockInteraction:false];
    }
    
    //FIXME:教程操作问题打补丁
    if ([[ADSimpleTutorialManager current] isActive]) {
        if(!([[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectPreviousImage"] ||
             [[ADSimpleTutorialManager current].curTutorial.curStep.name isEqualToString:@"CylinderProjectNextImage"])){
            self.projectView.userInteractionEnabled = false;
        }
    }
}

#pragma mark- PaintScreenTransitionManagerDelegate
- (CGRect)willGetCylinderMirrorFrame{
    return [self getCylinderMirrorFrame];
}

#pragma mark- UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.transitionManager.isPresenting = YES;
    return self.transitionManager;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.transitionManager.isPresenting = NO;
    return self.transitionManager;
}

#pragma mark- 购买代理InAppPurchaseTableViewControllerDelegate
- (void)willIAPPurchaseDone{
    [self.iapVC dismissViewControllerAnimated:true completion:^{
        DebugLog(@"willIAPPurchaseDone");
    }];
    
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"AnamorphosisSetup"]){
        self.topToolBar.userInteractionEnabled = true;
    }
    else{
        [self setupAnamorphParamsDoneCompletion:nil];        
    }
}
#pragma mark- 绘画代理PaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup{
    return [self createBestEAGLContext];
}

- (void) closePaintDoc:(ADPaintDoc *)paintDoc completionBlock:(void (^) (void)) block{
    //刷新当前画框内容
    NSString *path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:paintDoc.thumbImagePath];
    
    self.cylinderProjectDefaultAlphaBlend = 1;
    //变换动画
    UIImageView *transitionImageView = (UIImageView *)[self.view subViewWithTag:100];
    transitionImageView.image = [UIImage imageWithContentsOfFile:path];
    transitionImageView.alpha = 1;
    
    [self.paintScreenVC dismissViewControllerAnimated:true completion:^{
        if (block) {
            block();
        }
        
        self.paintButton.selected = false;
        
        self.cylinderProjectCur.renderer.material.mainTexture = [RETexture textureFromImagePath:path reload:true];
        
        self.cylinder.reflectionStrength = 0;
        REAnimationClip *animClip = [self.cylinder.animation.clips valueForKey:@"reflectionFadeInOutAnimClip"];
        REPropertyAnimation *propAnim = animClip.propertyAnimations.firstObject;
        propAnim.duration = CylinderFadeInOutDuration;
        propAnim.fromValue = [NSNumber numberWithFloat:0];
        propAnim.toValue = [NSNumber numberWithFloat:1];
        [self.cylinder.animation play];
        

        [UIView animateWithDuration:CylinderFadeInOutDuration animations:^{
            transitionImageView.alpha = 0;
        }completion:^(BOOL finished) {
        }];
        
        UIView *fromView = self.view;
        CGRect rect = [self willGetCylinderMirrorFrame];
        CGFloat scale = self.view.frame.size.width / rect.size.width;
        [fromView.layer setValue:[NSNumber numberWithFloat:scale] forKeyPath:@"transform.scale"];
        
        [UIView animateWithDuration:CylinderFadeInOutDuration animations:^{
            [fromView.layer setValue:[NSNumber numberWithFloat:1] forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            fromView.layer.anchorPoint = CGPointMake(0.5, 0.5);
            fromView.layer.position = CGPointMake(fromView.bounds.size.width * 0.5, fromView.bounds.size.height * 0.5);
        }];
        
    }];
}

-(void)openPaintDoc:(ADPaintDoc*)paintDoc {
    //    self.curPaintDoc = paintDoc;
    self.paintScreenVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintScreen"];
    self.paintScreenVC.delegate = self;
    self.paintScreenVC.transitioningDelegate = self;
    
    //prepare for presentation
    
    //打开绘图面板动画，从cylinder的中心放大过度到paintScreenViewController
    [self presentViewController:self.paintScreenVC animated:true completion:^{
        DebugLog(@"presentViewController paintScreenVC completionBlock");
        [self lockInteraction:false];
        [self.paintScreenVC openDoc:paintDoc];
        [self.paintScreenVC afterPresentation];
    }];
}

#pragma mark- 调整视角View
- (BOOL)isTopViewMode{
    return self.topPerspectiveView.hidden;
}

- (IBAction)sideViewButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"sideViewButtonTouchUp" identifier:sender];
    
    [self tutorialStepNextImmediate:false];
    
    [self deselectUserInputParams];
    
    //visibility
    self.eyePerspectiveView.hidden = true;
    self.topPerspectiveView.hidden = false;
    
    //interaction
    [self lockInteraction:true];
    
    //animation
    REAnimationClip *animClip = [RECamera.mainCamera.animation.clips valueForKey:@"topToBottomAnimClip"];
    RECamera.mainCamera.animation.clip = animClip;
    RECamera.mainCamera.animation.target = self;
    [RECamera.mainCamera.animation play];

    //setup
    self.eyeDistanceButton.userInteractionEnabled = self.eyeHeightButton.userInteractionEnabled = true;
    UIColor *color = [UIColor colorWithRed:72/255.0 green:110/255.0 blue:224/255.0 alpha:1];
    [self.eyeDistanceButton setTitleColor:color forState:UIControlStateNormal];
    [self.eyeDistanceButton setTitleColor:color forState:UIControlStateHighlighted];
    [self.eyeHeightButton setTitleColor:color forState:UIControlStateNormal];
    [self.eyeHeightButton setTitleColor:color forState:UIControlStateHighlighted];
}

- (IBAction)topViewButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"topViewButtonTouchUp" identifier:sender];
    
    [self tutorialStepNextImmediate:false];
    
    [self deselectUserInputParams];
    
    //visibility
    self.topPerspectiveView.hidden = true;
    self.eyePerspectiveView.hidden = false;
    
    //interaction
    [self lockInteraction:true];
    
    //animation
    REAnimationClip *animClip = [RECamera.mainCamera.animation.clips valueForKey:@"bottomToTopAnimClip"];
    RECamera.mainCamera.animation.clip = animClip;
    RECamera.mainCamera.animation.target = self;
    [RECamera.mainCamera.animation play];

    //setup
    self.eyeDistanceButton.userInteractionEnabled = self.eyeHeightButton.userInteractionEnabled = false;
    [self.eyeDistanceButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.eyeDistanceButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self.eyeHeightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.eyeHeightButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
}

#pragma mark- 打印Print
//- (void)exportToAirPrint{
//    //TODO:转换到顶视图，在放圆柱体的位置画上圈，并打印
//    UIImage *image = [self.projectView snapshot];
//    
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
//            [pic presentFromRect:self.printButton.bounds inView:self.printButton animated:true completionHandler:completionHandler];
//        } else {
//            [pic presentAnimated:YES completionHandler:completionHandler];
//        }
//    }
//}

#pragma mark- 陀螺仪代理MotionDelegate
- (void)initMotionDetect{
    self.motionManager = [[CMMotionManager alloc]init];
    NSOperationQueue *aQueue=[[NSOperationQueue alloc]init];
    if (!self.motionManager.deviceMotionAvailable) {
        //pop message box
        DebugLog(@"motion manager not available!");
    }
    
    self.motionManager.deviceMotionUpdateInterval = 0.033;
    if (![self.motionManager isDeviceMotionActive]) {
        [self.motionManager startDeviceMotionUpdatesToQueue:aQueue withHandler:
         ^(CMDeviceMotion *motion, NSError *error){
             if (motion) {
//                 DebugLog(@"attitude yaw: %.1f  pitch: %.1f  roll: %.1f", motion.attitude.yaw, motion.attitude.pitch, motion.attitude.roll);
                 
                 //监测未在动画中到角度的变化到固定值
                 //TODO: do with TPPropertyAnimation
//                 if (self.state == CP_Projected){
//                     if (motion.attitude.pitch < 0.1 && self.lastPitch >= 0.1  && self.eyeBottomTopBlend <1.0) {
//                         self.state = CP_PitchingToTopView;
//                     }
//                     else if (motion.attitude.pitch >= 0.1 && self.lastPitch < 0.1 && self.eyeBottomTopBlend > 0.0){
//                         self.state = CP_PitchingToBottomView;
//                     }
//                 }

                 self.lastPitch = motion.attitude.pitch;

//                 UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
//                 DebugLog(@"UIDeviceOrientation %d", deviceOrientation);
//                 dispatch_async(dispatch_get_main_queue(), ^{
//                     self.eyeTopBottomBlend = MIN(MAX(0, 1 - (self.lastPitch / M_PI_2)), 1) ;
//                 });
             }
         }];
        
    }
}

- (void)openIAP{
    DebugLogFuncStart(@"openIAP");
    [RemoteLog logAction:@"Open IAP" identifier:nil];
    self.iapVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"inAppPurchaseTableViewController"];
    self.iapVC.delegate = self;
    [self presentViewController:self.iapVC animated:true completion:^{
    }];
}

#pragma mark- 处理警告 UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 1:
            [self openIAP];
            break;
            
        default:
            break;
    }
}

#pragma mark- 弹出框代理 UIPopoverViewControllerDelegate
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    if([popoverController.contentViewController isKindOfClass:[ADShareTableViewController class]]){
        self.shareButton.selected = false;
    }
    else if([popoverController.contentViewController isKindOfClass:[ADProductInfoTableViewController class]]){
        self.infoButton.selected = false;
    }
}

- (IBAction)virtualDeviceButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"virtualDeviceButtonTouchUp" identifier:sender];
    
    ADCylinderProjectVirtualDeviceCollectionViewController* virtualDeviceCollectionViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"CylinderProjectVirtualDeviceCollectionViewController"];
//    virtualDeviceCollectionViewController.delegate = self;
    
    
    virtualDeviceCollectionViewController.preferredContentSize = CGSizeMake(DefaultScreenWidth, 150);
    
    self.sharedPopoverController = [[ADSharedPopoverController alloc]initWithContentViewController:virtualDeviceCollectionViewController];
    CGRect rect = CGRectMake(self.virtualDeviceButton.bounds.origin.x, self.virtualDeviceButton.bounds.origin.y, self.virtualDeviceButton.bounds.size.width, self.virtualDeviceButton.bounds.size.height);
    [self.sharedPopoverController presentPopoverFromRect:rect inView:self.virtualDeviceButton permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    
}

#pragma mark- 教程 Tutorial
//主教程入口设置
- (void)tutorialSetup{
    DebugLogFuncStart(@"tutorialSetup");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    ADTutorial *tutorial = (ADTutorial *)[[ADSimpleTutorialManager current].tutorials valueForKey:@"TutorialMain"];
    if (tutorial) {
        for (ADTutorialStep *step in tutorial.steps) {
            if ([step.name rangeOfString:@"CylinderProject"].length > 0) {
                step.delegate = self;
            }
        }
    }
}

//在排版等准备完成以后,检查是否需要开始教程
- (void)tutorialStartCurrentStep{
    DebugLogFuncStart(@"tutorialStartCurrentStep");
    if (![[ADSimpleTutorialManager current] isActive]) {
        return;
    }
    
    [[ADSimpleTutorialManager current].curTutorial startCurrentStep];
}

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
#pragma mark- 教程步骤代理 TutorialStepDelegate
- (void)willTutorialEnableUserInteraction:(BOOL)enable withStep:(ADTutorialStep *)step{
    DebugLogFuncStart(@"willTutorialEnableUserInteraction");
    //需要关闭所有其他工具交互
    for (UIButton *button in self.downTooBarButtons) {
        button.userInteractionEnabled = enable;
    }
    for (UIButton *button in self.allUserInputParamButtons) {
        button.userInteractionEnabled = enable;
    }
    self.valueSlider.userInteractionEnabled = enable;
    self.projectView.userInteractionEnabled = enable;
    
    //打开制定按钮交互
    if ([step.name isEqualToString:@"CylinderProjectNextImage"] ||
        [step.name isEqualToString:@"CylinderProjectPreviousImage"]) {
        self.projectView.userInteractionEnabled = true;
    }
    if ([step.name isEqualToString:@"CylinderProjectPutDevice"]) {
        self.topPerspectiveView.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectViewDevice"]) {
        self.eyePerspectiveView.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetup"]) {
        self.setupButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderDiameter"]) {
        self.cylinderDiameterButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderHeight"]) {
        self.cylinderHeightButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupImageWidth"]) {
        self.imageWidthButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupImageCenter"]) {
        self.imageHeightButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupEyeDistance"]) {
        self.eyeDistanceButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupEyeHeight"]) {
        self.eyeHeightButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupZoom"] ||
             [step.name isEqualToString:@"CylinderProjectSetupZoomFixDisplay"]) {
        self.projectZoomButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectTopViewForZoom"]) {
        self.topPerspectiveView.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSideViewForEye"]) {
        self.eyePerspectiveView.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectCloseSetup"]) {
        self.setupButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectPaint"]) {
        self.paintButton.userInteractionEnabled = true;
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderDiameterValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupCylinderHeightValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupImageWidthValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupImageCenterValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupEyeDistanceValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupEyeHeightValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupZoomValue"] ||
             [step.name isEqualToString:@"CylinderProjectSetupZoomFixDisplayValue"])
    {
        self.valueSlider.userInteractionEnabled = true;
    }
}

- (void)willTutorialLayoutWithStep:(ADTutorialStep *)step{
    DebugLogFuncStart(@"willLayoutWithStep");
    if ([step.name isEqualToString:@"CylinderProjectNextImage"] ||
        [step.name isEqualToString:@"CylinderProjectPreviousImage"]) {
        CGRect mirrorRect = [self willGetCylinderMirrorFrame];
//        mirrorRect.origin.y += 200;
        [step.indicatorView targetViewFrame:mirrorRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectPutDevice"]) {
        CGRect rect = step.contentView.frame;
        rect.origin = CGPointMake(500, 672);
        step.contentView.frame = rect;
        
        [step.indicatorView targetView:self.topPerspectiveView inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectViewDevice"]) {
        CGRect rect = step.contentView.frame;
        rect.origin = CGPointMake(500, 728);
        step.contentView.frame = rect;
        [step.indicatorView targetView:self.eyePerspectiveView inRootView:self.view];
        CGRect mirrorRect = [self willGetCylinderMirrorFrame];
        mirrorRect.origin.y += 20;
        [step.indicatorViews[1] targetViewFrame:mirrorRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetup"]) {
        CGRect rect = step.contentView.frame;
        rect.origin = CGPointMake(560, 700);
        step.contentView.frame = rect;
        
        [step.indicatorView targetView:self.setupButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderDiameter"]) {
        [step.indicatorView targetView:self.cylinderDiameterButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderDiameterValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderHeight"]) {
        [step.indicatorView targetView:self.cylinderHeightButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupCylinderHeightValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupImageWidth"]) {
        [step.indicatorView targetView:self.imageWidthButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupImageWidthValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupImageCenter"]) {
        [step.indicatorView targetView:self.imageHeightButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupImageCenterValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupEyeDistance"]) {
        [step.indicatorView targetView:self.eyeDistanceButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupEyeDistanceValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupEyeHeight"]) {
        [step.indicatorView targetView:self.eyeHeightButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupEyeHeightValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupZoom"] ||
             [step.name isEqualToString:@"CylinderProjectSetupZoomFixDisplay"]) {
        [step.indicatorView targetView:self.projectZoomButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSetupZoomValue"] ||
            [step.name isEqualToString:@"CylinderProjectSetupZoomFixDisplayValue"]) {
        CGRect thumbRect = [self.valueSlider convertRect:self.valueSlider.thumbRect toView:self.view];
        [step.indicatorView targetViewFrame:thumbRect inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectSideViewForEye"]) {
        [step.indicatorView targetView:self.eyePerspectiveView inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectTopViewForZoom"]) {
        [step.indicatorView targetView:self.topPerspectiveView inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectCloseSetup"]) {
        [step.indicatorView targetView:self.setupButton inRootView:self.view];
    }
    else if ([step.name isEqualToString:@"CylinderProjectPaint"]) {
        [step.indicatorView targetView:self.paintButton inRootView:self.view];
    }
    
    [step addToRootView:self.view];
}
@end
