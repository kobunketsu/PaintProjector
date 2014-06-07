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

#import "PaintScreen.h"
#import "ShareTableViewController.h"
#import "ProductInfoTableViewController.h"

#import "Display.h"
#import "GLWrapper.h"
#import "Ultility.h"
#import "TextureManager.h"
#import "ShaderManager.h"
#import "TPPropertyAnimation.h"
//object
#import "Display.h"
#import "Camera.h"
#import "Grid.h"
#import "Cylinder.h"
#import "CylinderProject.h"
#import "ShaderCylinderProject.h"
#import "ShaderCylinder.h"
#import "ShaderNoLitTexture.h"
#import "Scene.h"
#import "PlaneMesh.h"
#import "CylinderMesh.h"
//component
#import "MeshFilter.h"
#import "MeshRenderer.h"
#import "Animation.h"

#import "PlayerView.h"
//#import "ZBarSDK.h"
#import "PlayButton.h"
#import "PaintButton.h"
#import "DownToolBar.h"

#import "PaintFrameView.h"
#import "PaintFrameManager.h"
#import "PaintDoc.h"
#import "PaintDocManager.h"

#import "PaintScreenTransitionManager.h"
#import "CustomPercentDrivenInteractiveTransition.h"

#import "CylinderProjectUserInputParams.h"
#import "InAppPurchaseManager.h"
#import "InAppPurchaseTableViewController.h"

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

@class CylinderProjectViewController;
@protocol CylinderProjectViewControllerDelegate
- (void) willTransitionToGallery;
- (void) willCompleteLaunchTransitionToCylinderProject;
@end

@interface CylinderProjectViewController : UIViewController
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
DisplayDelegate,
PaintScreenTransitionManagerDelegate,
PaintScreenDelegate,
TPPropertyAnimationDelegate,
CustomPercentDrivenInteractiveTransition,
ShareTableViewControllerDelegate,
ProductInfoTableViewControllerDelegate,
InAppPurchaseTableViewControllerDelegate
//CylinderProjectSetupViewControllerDelegate
>
{
    void * _baseAddress;
}
@property (weak, nonatomic) PaintScreen* paintScreenVC;
@property (retain, nonatomic) InAppPurchaseTableViewController* iapVC;
@property (retain, nonatomic) GLKViewController* glkViewController;
@property (weak, nonatomic) IBOutlet GLKView *projectView;
@property (assign, nonatomic) id delegate;

#pragma mark- File

#pragma mark- User Input
@property (retain, nonatomic) CylinderProjectUserInputParams *userInputParams;
#pragma mark- GL
@property (retain, nonatomic) EAGLContext *context;

#pragma mark- Scene
@property (retain, nonatomic) Texture *paintTexture;
@property (retain, nonatomic) Scene *curScene;
@property (retain, nonatomic) CylinderProject *cylinderProjectCur;
@property (retain, nonatomic) CylinderProject *cylinderProjectNext;
@property (retain, nonatomic) CylinderProject *cylinderProjectLast;
@property (retain, nonatomic) Cylinder *cylinder;//圆柱体
@property (assign, nonatomic) CGFloat cylinderProjectDefaultAlphaBlend;

#pragma mark- 交互
@property (retain, nonatomic) CustomPercentDrivenInteractiveTransition *browseNextAction;
@property (retain, nonatomic) CustomPercentDrivenInteractiveTransition *browseLastAction;

#pragma mark- project display helper
@property (assign, nonatomic) BOOL showGrid;//是否显示网格
@property (retain, nonatomic) Grid *grid;//网格

#pragma mark- state
@property (assign, nonatomic) CylinderProjectViewState state;      //状态
@property (assign, nonatomic) PlayState playState;//播放状态
@property (assign, nonatomic) BOOL dirty;//是否重新计算

#pragma mark- interaction
- (IBAction)handlePanCylinderProjectView:(UIPanGestureRecognizer *)sender;

#pragma mark- main category
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allViews;
@property (weak, nonatomic) IBOutlet DownToolBar *downToolBar;
@property (weak, nonatomic) IBOutlet TopToolBar *topToolBar;

#pragma mark- viewMode

@property (assign, nonatomic) BOOL isTopViewMode;
@property (weak, nonatomic) IBOutlet UIView *eyePerspectiveView;
@property (weak, nonatomic) IBOutlet UIView *topPerspectiveView;
@property (retain, nonatomic) Camera *topCamera;
@property (assign, nonatomic) GLKMatrix4 bottomCameraProjMatrix;
@property (assign, nonatomic) GLKVector3 eyeTop;//视角顶部
@property (assign, nonatomic) GLKVector3 eyeBottom;//视角底部
@property (assign, nonatomic) float eyeTopAspect;//顶视图长宽比
@property (assign, nonatomic) float eyeBottomTopBlend;
@property (assign, nonatomic) float toEyeBottomTopBlend;

- (IBAction)sideViewButtonTouchUp:(UIButton *)sender;
- (IBAction)topViewButtonTouchUp:(UIButton *)sender;

#pragma mark- setup
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
@property (weak, nonatomic) IBOutlet UIButton *projectWidthButton;
@property (weak, nonatomic) IBOutlet UIButton *projectHeightButton;
@property (weak, nonatomic) IBOutlet UIButton *projectZoomButton;
- (IBAction)setupButtonTouchUp:(UIButton *)sender;
- (IBAction)userInputParamButtonTouchUp:(UIButton *)sender;
- (IBAction)userInputParamSliderValueChanged:(UISlider *)sender;
- (void)resetInputParams;

#pragma mark- virtualDevice
@property (weak, nonatomic) IBOutlet UIButton *virtualDeviceButton;
- (IBAction)virtualDeviceButtonTouchUp:(UIButton *)sender;

#pragma mark- cylinder coordinate
- (CGRect)getCylinderMirrorFrame;
- (CGRect)getCylinderMirrorTopFrame;

#pragma mark- paintDoc
//@property (weak, nonatomic) PaintDoc *curPaintDoc;
-(void)viewPaintDoc:(PaintDoc*)paintDoc;
- (void)openPaintDoc:(PaintDoc*)paintDoc;
- (void)transitionToPaint;

#pragma mark- file action
@property (weak, nonatomic) IBOutlet UIButton *galleryButton;
@property (weak, nonatomic) IBOutlet PlayButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *paintButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *downTooBarButtons;


- (IBAction)galleryButtonTouchUp:(UIButton *)sender;
- (IBAction)paintButtonTouchUp:(UIButton *)sender;
- (IBAction)shareButtonTouchUp:(UIButton *)sender;
- (IBAction)infoButtonTouchUp:(UIButton *)sender;

#pragma mark-  CoreMotion
@property (retain, nonatomic)CMMotionManager *motionManager;
@property (assign, nonatomic)float lastPitch;

#pragma mark- video
@property (retain, nonatomic)AVAsset *asset;
@property (retain, nonatomic)AVAssetReader *assetReader;
@property (retain, nonatomic) AVPlayer *player;
@property (retain, nonatomic) AVPlayerItem *playerItem;
@property (assign, nonatomic) CMTime playTime;//播放到的时刻

- (void)syncPlayUI;
- (IBAction)playButtonTouchUp:(UIButton *)sender;
- (IBAction)playbackButtonTouchUp:(UIButton *)sender;
@end
