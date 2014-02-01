//
//  CylinderProjectViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-21.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMotion/CoreMotion.h>

#import "PaintScreen.h"

#import "Ultility.h"
#import "ShaderManager.h"
#import "Grid.h"
#import "Cylinder.h"
#import "PlayerView.h"
//#import "ZBarSDK.h"
#import "PlayButton.h"
#import "PaintButton.h"

//FirstScreenViewController
#import "PaintFrameView.h"
#import "PaintFrameViewGroup.h"
#import "PaintDoc.h"
#import "PaintDocManager.h"

#import "DownToolBar.h"
#import "GLWrapper.h"

#define FarClipDistance 10
#define NearClipDistance 0.0001
#define DeviceWidth 0.154



static const NSString *ItemStatusContext;

typedef NS_ENUM(NSInteger, CylinderProjectViewState) {
    CP_Paint,
    CP_PitchingToTopView,
    CP_PitchingToBottomView,
    
    CP_Projecting,
    CP_Projected,
    CP_UnProjecting,
    
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
@end

@interface CylinderProjectViewController : UIViewController
<GLKViewControllerDelegate,
GLKViewDelegate,
UIPrintInteractionControllerDelegate,
//ZBarReaderDelegate,
UIViewControllerTransitioningDelegate,
PaintScreenDelegate>
{
    void * _baseAddress;
    size_t _width;
    size_t _height;
}
@property (weak, nonatomic) PaintScreen* paintScreenVC;
@property (retain, nonatomic) GLKViewController* glkViewController;
@property (weak, nonatomic) IBOutlet GLKView *projectView;
@property (assign, nonatomic) id delegate;
#pragma mark- GL
@property (retain, nonatomic) GLWrapper *glWrapper;
@property (retain, nonatomic) TextureManager* texMgr;
@property (retain, nonatomic) EAGLContext *context;
@property (assign, nonatomic) GLuint reflectionFramebuffer;
@property (assign, nonatomic) GLuint reflectionTex;//renderToTex, 用于反射采样的贴图
@property (assign, nonatomic) GLuint reflectionTexSize;

@property (assign, nonatomic) GLuint programProject;
@property (assign, nonatomic) GLuint vertexBuffer;
@property (assign, nonatomic) GLuint vertexArray;
@property (assign, nonatomic) GLuint indexBuffer;
@property (assign, nonatomic) GLuint paintTexture;

@property (assign, nonatomic) GLuint wvpMatrixUniform;
@property (assign, nonatomic) GLuint viewProjMatrixUniform;
@property (assign, nonatomic) GLuint worldMatrixUniform;
@property (assign, nonatomic) GLuint paintTextureUniform;
@property (assign, nonatomic) GLuint radiusUniform;
@property (assign, nonatomic) GLuint eyeUniform;
@property (assign, nonatomic) GLuint morphBlendUniform;
@property (assign, nonatomic) GLuint alphaBlendUniform;

#pragma mark- project internal param
@property (assign, nonatomic) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵
@property (assign, nonatomic) GLKMatrix4 viewProjMatrix;  //绘制quad时的矩阵
@property (assign, nonatomic) GLKMatrix4 viewProjOrthoMatrix;  //绘制quad时的矩阵(正交，用于顶视图)
@property (assign, nonatomic) GLKMatrix4 reflViewProjMatrix;  //绘制反射texture时的矩阵

#pragma mark- 投影动画
@property (assign, nonatomic) float morphBlend;
@property (assign, nonatomic) float alphaBlend;
@property (assign, nonatomic) float lastMediaTime;//上个时间点
@property (assign, nonatomic) float curProjectAnimationTime;    //投影到地面动画的当前时间
@property (assign, nonatomic) float curUnprojectAnimationTime;  //恢复绘画视角动画的当前时间
@property (assign, nonatomic) float projectAnimDuration;        //投影到地面动画的持续时间
@property (assign, nonatomic) float unprojectAnimDuration;      //恢复绘画视角动画的持续时间
@property (copy, nonatomic) MyCompletionBlock unprojectCompletionBlock;

#pragma mark- 视角变换
@property (assign, nonatomic) GLKVector3 eye;
@property (assign, nonatomic) GLKVector3 eyeTop;//视角顶部
@property (assign, nonatomic) GLKVector3 eyeBottom;//视角底部
@property (assign, nonatomic) float eyeTopAspect;//顶视图长宽比
@property (assign, nonatomic) float eyeBottomTopBlend;
@property (assign, nonatomic) float toEyeBottomTopBlend;
@property (assign, nonatomic) float perspectiveToOrthoBlend;    //正交和透视的混合
#pragma mark- 视角变换动画
@property (assign, nonatomic) float curViewTopAnimationTime;
@property (assign, nonatomic) float curViewBottomAnimationTime;  
@property (assign, nonatomic) float viewTopAnimDuration;
@property (assign, nonatomic) float viewBottomAnimDuration;      

//@property (assign, nonatomic) float projSrcAspect;//投影长宽比
//@property (assign, nonatomic) float viewAspect;//投影长宽比
//@property (assign, nonatomic) float projHeight;//实际地面投影长度
//@property (assign, nonatomic) float projWidth;//实际地面投影宽度
//@property (assign, nonatomic) GLKVector3 projFar;//实际地面远点
//@property (assign, nonatomic) GLKVector3 projNear;//实际地面远点
//@property (assign, nonatomic) GLKVector3 projCenter;//实际地面中心位置
//@property (assign, nonatomic) GLKVector3 eyeZoomInTop;

#pragma mark- project param
//圆柱体中Image的参数
@property (assign, nonatomic) float radius;//圆柱体半径
@property (assign, nonatomic) float imageWidth;//圆柱体中图片的宽 < 圆柱半径*2
@property (assign, nonatomic) float imageHeight;//圆柱体中图片的高
@property (assign, nonatomic) float imageRatio;//圆柱体中图片的宽高比率
@property (assign, nonatomic) GLKVector3 imageCenterOnSurf;//圆柱体中图片中心位置
@property (assign, nonatomic) float imageCenterOnSurfHeight;//圆柱体中图片中心高度

#pragma mark- project display helper
@property (retain, nonatomic) Cylinder *cylinder;//圆柱体
@property (assign, nonatomic) int meshRow;//投影模型网格参数
@property (assign, nonatomic) int meshColumn;//投影模型网格参数
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
@property (weak, nonatomic) IBOutlet UIImageView *screenMask;
@property (weak, nonatomic) IBOutlet DownToolBar *toolBar;


#pragma mark- viewMode
@property (assign, nonatomic) BOOL isTopViewMode;
@property (weak, nonatomic) IBOutlet UIButton *sideViewButton;
@property (weak, nonatomic) IBOutlet UIButton *topViewButton;

//- (void)transitionIn;
- (IBAction)sideViewButtonTouchUp:(UIButton *)sender;
- (IBAction)topViewButtonTouchUp:(UIButton *)sender;

#pragma mark- paintDoc
@property (weak, nonatomic) PaintDoc *paintDoc;
-(void)viewPaintDoc:(PaintDoc*)paintDoc;
- (void)openPaintDoc:(PaintDoc*)paintDoc;

#pragma mark- file action
@property (weak, nonatomic) IBOutlet PlayButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *paintButton;
@property (weak, nonatomic) IBOutlet UIButton *printButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

- (IBAction)galleryButtonTouchUp:(id)sender;
- (IBAction)paintButtonTouchUp:(UIButton *)sender;
- (IBAction)printButtonTouchUp:(UIButton *)sender;
- (IBAction)shareButtonTouchUp:(UIButton *)sender;

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
