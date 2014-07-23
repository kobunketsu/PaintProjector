//
//  CylinderProjectViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-21.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

//GPUImage
#import <AVFoundation/AVFoundation.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMotion/CoreMotion.h>
#import "GPUImage.h"

#import "ADPaintScreen.h"
#import "ADShareTableViewController.h"
#import "ADProductInfoTableViewController.h"

#import "REGLWrapper.h"
#import "ADUltility.h"
#import "RETextureManager.h"
#import "REPropertyAnimation.h"
//object
#import "REDisplay.h"
#import "RECamera.h"
#import "ADGrid.h"
#import "ADCylinder.h"
#import "ADCylinderProject.h"
#import "REScene.h"
#import "ADPlaneMesh.h"
#import "ADCylinderMesh.h"

//component
#import "REMeshFilter.h"
#import "REMeshRenderer.h"
#import "REAnimation.h"

#import "ADPlayerView.h"
//#import "ZBarSDK.h"
#import "ADPlayButton.h"
#import "ADPaintButton.h"
#import "ADDownToolBar.h"

#import "ADPaintFrameView.h"
#import "ADPaintFrameManager.h"
#import "ADPaintDoc.h"
#import "ADPaintDocManager.h"

#import "ADPaintScreenTransitionManager.h"
#import "ADCustomPercentDrivenInteractiveTransition.h"

#import "ADCylinderProjectUserInputParams.h"
#import "ADInAppPurchaseManager.h"
#import "ADInAppPurchaseTableViewController.h"
#import "ADCylinderProjectRootView.h"

static const NSString *ItemStatusContext;

typedef NS_ENUM(NSInteger, CylinderProjectViewState) {
    CP_Default,
//    CP_PitchingToTopView,
//    CP_PitchingToBottomView,
//    
//    CP_Projecting,
//    CP_Projected,
//    CP_UnProjecting,
    
    CP_RotateImage,
    CP_RotateViewAxisX,
};

typedef NS_ENUM(NSInteger, PlayState) {
    PS_Playing,
    PS_Stopped,
    PS_Pause,
};

typedef void(^MyCompletionBlock)(void);

@class ADCylinderProjectViewController;
@protocol ADCylinderProjectViewControllerDelegate
- (void) willTransitionToGallery;
- (void) willCompleteLaunchTransitionToCylinderProject;
@end

@interface ADCylinderProjectViewController : UIViewController
<GLKViewControllerDelegate,
GLKViewDelegate,
UIPrintInteractionControllerDelegate,
UIViewControllerTransitioningDelegate,
UIPopoverControllerDelegate,
SKProductsRequestDelegate,
UIAlertViewDelegate,
MFMailComposeViewControllerDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
REDisplayDelegate,
ADPaintScreenTransitionManagerDelegate,
ADPaintScreenDelegate,
REPropertyAnimationDelegate,
ADCustomPercentDrivenInteractiveTransition,
ADShareTableViewControllerDelegate,
ADProductInfoTableViewControllerDelegate,
ADInAppPurchaseTableViewControllerDelegate
//CylinderProjectSetupViewControllerDelegate
>
{
    void * _baseAddress;
}
#pragma mark- 基础Base
@property (retain, nonatomic) GLKViewController* glkViewController;
@property (strong, nonatomic) IBOutlet ADCylinderProjectRootView *rootView;
@property (weak, nonatomic) IBOutlet GLKView *projectView;
@property (weak, nonatomic) ADPaintScreen* paintScreenVC;
@property (retain, nonatomic) ADInAppPurchaseTableViewController* iapVC;
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) CGFloat baseBrightness;
#pragma mark- 主要Main
@property (assign, nonatomic)BOOL paintDirectly;
@property (assign, nonatomic) CylinderProjectViewState state;      //状态
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;
@property (weak, nonatomic) IBOutlet ADPaintButton *paintButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *downTooBarButtons;
- (IBAction)galleryButtonTouchUp:(UIButton *)sender;
- (IBAction)paintButtonTouchUp:(UIButton *)sender;
- (IBAction)shareButtonTouchUp:(UIButton *)sender;
- (IBAction)infoButtonTouchUp:(UIButton *)sender;

#pragma mark- 场景Scene
@property (retain, nonatomic) RETexture *paintTexture;
@property (retain, nonatomic) REScene *curScene;
@property (retain, nonatomic) ADCylinderProject *cylinderProjectCur;
@property (retain, nonatomic) ADCylinderProject *cylinderProjectNext;
@property (retain, nonatomic) ADCylinderProject *cylinderProjectLast;
@property (retain, nonatomic) ADCylinder *cylinder;//圆柱体
@property (retain, nonatomic) REModelEntity *cylinderTopLight;//圆柱体光效
@property (retain, nonatomic) REModelEntity *cylinderInterLight;//圆柱体光效
@property (retain, nonatomic) REModelEntity *cylinderBottom;//圆柱体底部
@property (retain, nonatomic) REModelEntity *cylinderProjectPlane;//反向绘制的内容替代cylinderProject;
@property (assign, nonatomic) CGFloat cylinderProjectDefaultAlphaBlend;
- (CGRect)getCylinderMirrorFrame;
- (CGRect)getCylinderMirrorTopFrame;

#pragma mark- 交互UE
@property (retain, nonatomic) ADCustomPercentDrivenInteractiveTransition *browseNextAction;
@property (retain, nonatomic) ADCustomPercentDrivenInteractiveTransition *browseLastAction;
- (IBAction)handlePanCylinderProjectView:(UIPanGestureRecognizer *)sender;
- (void)lockInteraction:(BOOL)lock;

#pragma mark- 界面UI
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allViews;
@property (weak, nonatomic) IBOutlet ADDownToolBar *downToolBar;
@property (weak, nonatomic) IBOutlet ADTopToolBar *topToolBar;

#pragma mark- 输入User Input
@property (retain, nonatomic) ADCylinderProjectUserInputParams *userInputParams;
@property (retain, nonatomic) NSMutableDictionary *srcUserInputParams;

#pragma mark- 视角ViewMode
@property (assign, nonatomic) BOOL isTopViewMode;
@property (weak, nonatomic) IBOutlet UIView *eyePerspectiveView;
@property (weak, nonatomic) IBOutlet UIView *topPerspectiveView;
@property (retain, nonatomic) RECamera *topCamera;
@property (assign, nonatomic) GLKMatrix4 bottomCameraProjMatrix;
@property (assign, nonatomic) GLKVector3 eyeTop;//视角顶部
@property (assign, nonatomic) GLKVector3 eyeBottom;//视角底部
@property (assign, nonatomic) float eyeTopAspect;//顶视图长宽比
@property (assign, nonatomic) float eyeBottomTopBlend;
@property (assign, nonatomic) float toEyeBottomTopBlend;

- (IBAction)sideViewButtonTouchUp:(UIButton *)sender;
- (IBAction)topViewButtonTouchUp:(UIButton *)sender;

#pragma mark- 设置Setup
@property (assign, nonatomic) BOOL isSetupMode;
@property (weak, nonatomic) IBOutlet UIButton *setupButton;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allUserInputParamButtons;
@property (weak, nonatomic) IBOutlet UIView *eyeParams;
@property (weak, nonatomic) IBOutlet UIView *eyeDistanceParam;
@property (weak, nonatomic) IBOutlet UIView *eyeHeightParam;
@property (weak, nonatomic) IBOutlet UIView *projectParams;
@property (weak, nonatomic) IBOutlet UIButton *cylinderDiameterButton;
@property (weak, nonatomic) IBOutlet UIButton *cylinderHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *imageWidthButton;
@property (weak, nonatomic) IBOutlet UIButton *imageHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *eyeDistanceButton;
@property (weak, nonatomic) IBOutlet UIButton *eyeHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *eyeZoomButton;
@property (weak, nonatomic) IBOutlet UIButton *projectWidthButton;
@property (weak, nonatomic) IBOutlet UIButton *projectHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *projectZoomButton;
- (IBAction)setupButtonTouchUp:(UIButton *)sender;
- (IBAction)userInputParamButtonTouchUp:(UIButton *)sender;
- (IBAction)userInputParamSliderValueChanged:(UISlider *)sender;
- (IBAction)userInputParamSliderTouchUp:(UISlider *)sender;
- (IBAction)userInputParamSliderTouchUpOutside:(UISlider *)sender;
- (IBAction)userInputParamSliderTouchCancel:(UISlider *)sender;
- (IBAction)userInputParamSliderTouchDown:(UISlider *)sender;
- (void)resetInputParams;

#pragma mark- 虚拟设备VirtualDevice
@property (weak, nonatomic) IBOutlet UIButton *virtualDeviceButton;
- (IBAction)virtualDeviceButtonTouchUp:(UIButton *)sender;


#pragma mark- 绘制Paint
//@property (weak, nonatomic) PaintDoc *curPaintDoc;
-(void)viewPaintDoc:(ADPaintDoc*)paintDoc;
- (void)openPaintDoc:(ADPaintDoc*)paintDoc;
- (void)transitionToPaint:(ADPaintDoc*)paintDoc;

#pragma mark- 反向绘制Reverse Paint
@property (assign, nonatomic) BOOL isReversePaint;

#pragma mark- 运动CoreMotion
@property (retain, nonatomic)CMMotionManager *motionManager;
@property (assign, nonatomic)float lastPitch;

#pragma mark- 视频Video
@property (weak, nonatomic) IBOutlet ADPlayButton *playButton;
@property (assign, nonatomic) PlayState playState;//播放状态
@property (retain, nonatomic)AVAsset *asset;
@property (retain, nonatomic)AVAssetReader *assetReader;
@property (retain, nonatomic) AVPlayer *player;
@property (retain, nonatomic) AVPlayerItem *playerItem;
@property (assign, nonatomic) CMTime playTime;//播放到的时刻

- (void)syncPlayUI;
- (IBAction)playButtonTouchUp:(UIButton *)sender;
- (IBAction)playbackButtonTouchUp:(UIButton *)sender;

#pragma mark- 帮助物体Helper
@property (assign, nonatomic) BOOL showGrid;//是否显示网格
@property (retain, nonatomic) ADGrid *grid;//网格

#pragma mark- 测试Debug
- (IBAction)debugSliderValueChanged:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *debugSlider;
@property (weak, nonatomic) IBOutlet UIView *debugView;
@end
