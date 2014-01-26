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
#define DeviceWidth 0.15



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
@property (nonatomic, weak) PaintScreen* paintScreenViewController;
@property(nonatomic, retain) GLKViewController* glkViewController;
@property (weak, nonatomic) IBOutlet GLKView *projectView;
@property (nonatomic, assign) id delegate;

@property(nonatomic, retain) GLWrapper *glWrapper;
@property(nonatomic, retain) TextureManager* texMgr;
@property(nonatomic, retain) EAGLContext *context;
@property(nonatomic, assign) GLuint reflectionFramebuffer;
@property(nonatomic, assign) GLuint reflectionTex;//renderToTex, 用于反射采样的贴图

@property(nonatomic, assign) GLuint programProject;
@property(nonatomic, assign) GLuint vertexBuffer;
@property(nonatomic, assign) GLuint vertexArray;
@property(nonatomic, assign) GLuint indexBuffer;
@property(nonatomic, assign) GLuint paintTexture;

//shader uniforms
@property(nonatomic, assign) GLuint wvpMatrixUniform;
@property(nonatomic, assign) GLuint viewProjMatrixUniform;
@property(nonatomic, assign) GLuint worldMatrixUniform;
@property(nonatomic, assign) GLuint paintTextureUniform;
@property(nonatomic, assign) GLuint radiusUniform;
@property(nonatomic, assign) GLuint eyeUniform;
@property(nonatomic, assign) GLuint morphBlendUniform;
@property(nonatomic, assign) GLuint alphaBlendUniform;
//uniform values
@property(nonatomic, assign) GLKMatrix4 wvpMatrix;  //绘制quad时的矩阵
@property(nonatomic, assign) GLKMatrix4 viewProjMatrix;  //绘制quad时的矩阵
@property(nonatomic, assign) GLKMatrix4 viewProjOrthoMatrix;  //绘制quad时的矩阵(正交，用于顶视图)
@property(nonatomic, assign) float perspectiveToOrthoBlend;    //正交和透视的混合
@property(nonatomic, assign) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵
@property(nonatomic, assign) GLKMatrix4 reflViewProjMatrix;  //绘制反射texture时的矩阵

@property(nonatomic, assign) GLKVector3 eye;
@property(nonatomic, assign) GLKVector3 eyeTop;//视角顶部
@property(nonatomic, assign) GLKVector3 eyeBottom;//视角底部
@property(nonatomic, assign) GLKVector3 eyeZoomInTop;
@property(nonatomic, assign) float eyeBottomTopBlend;
@property(nonatomic, assign) float toEyeBottomTopBlend;
//投影动画
@property(nonatomic, assign) float morphBlend;
@property(nonatomic, assign) float alphaBlend;
@property(nonatomic, assign) float lastMediaTime;//上个时间点
@property(nonatomic, assign) float curProjectAnimationTime;    //投影到地面动画的当前时间
@property(nonatomic, assign) float curUnprojectAnimationTime;  //恢复绘画视角动画的当前时间
@property(nonatomic, assign) float projectAnimDuration;        //投影到地面动画的持续时间
@property(nonatomic, assign) float unprojectAnimDuration;      //恢复绘画视角动画的持续时间
@property (nonatomic, copy) MyCompletionBlock unprojectCompletionBlock;
//视角动画
@property(nonatomic, assign) float curViewTopAnimationTime;
@property(nonatomic, assign) float curViewBottomAnimationTime;  
@property(nonatomic, assign) float viewTopAnimDuration;
@property(nonatomic, assign) float viewBottomAnimDuration;      

@property(nonatomic, assign) float projSrcAspect;//投影长宽比
//@property(nonatomic, assign) float viewAspect;//投影长宽比
@property(nonatomic, assign) float eyeTopAspect;//顶视图长宽比
@property(nonatomic, assign) float projHeight;//实际地面投影长度
@property(nonatomic, assign) float projWidth;//实际地面投影宽度
@property(nonatomic, assign) GLKVector3 projFar;//实际地面远点
@property(nonatomic, assign) GLKVector3 projNear;//实际地面远点
@property(nonatomic, assign) GLKVector3 projCenter;//实际地面中心位置
//圆柱体中Image的参数
@property(nonatomic, assign) float radius;
@property(nonatomic, assign) float imageWidth;//圆柱体中图片的宽 < 圆柱半径*2
@property(nonatomic, assign) float imageHeight;//圆柱体中图片的高
@property(nonatomic, assign) float imageRatio;//圆柱体中图片的宽高比率
@property(nonatomic, assign) GLKVector3 imageCenterOnSurf;//圆柱体中图片中心位置
@property(nonatomic, assign) float imageCenterOnSurfHeight;//圆柱体中图片中心高度
@property(nonatomic, assign) int meshRow;//投影模型网格参数
@property(nonatomic, assign) int meshColumn;//投影模型网格参数
//helper
@property(nonatomic, assign) BOOL showGrid;//是否显示网格
@property(nonatomic, retain) Grid *grid;//网格
@property(nonatomic, retain) Cylinder *cylinder;//圆柱体

@property(nonatomic, assign) CylinderProjectViewState state;      //状态
@property(nonatomic, assign) PlayState playState;//播放状态
@property(nonatomic, assign) BOOL dirty;//是否重新计算

//gesture
@property(nonatomic, assign)float rotationImageAxisY;//圆柱体中图片绕局部轴Y转向
@property(nonatomic, assign)float toRotateImageAxisY;//圆柱体中图片绕局部轴Y转向
@property (weak, nonatomic) IBOutlet PlayButton *playButton;
@property (weak, nonatomic) IBOutlet PaintButton *paintButton;

#pragma mark- main category
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *allViews;
@property (weak, nonatomic) IBOutlet UIImageView *screenMask;
@property (weak, nonatomic) IBOutlet DownToolBar *toolBar;


#pragma mark- viewMode
@property (assign, nonatomic) BOOL isTopViewMode;
@property (weak, nonatomic) IBOutlet UIButton *sideViewButton;
@property (weak, nonatomic) IBOutlet UIButton *topViewButton;

- (IBAction)handlePanCylinderProjectView:(UIPanGestureRecognizer *)sender;
- (IBAction)sideViewButtonTouchUp:(UIButton *)sender;
- (IBAction)topViewButtonTouchUp:(UIButton *)sender;

#pragma mark- FirstScreenViewController
@property (nonatomic, weak) PaintDoc *paintDoc;
-(void)viewPaintDoc:(PaintDoc*)paintDoc;


#pragma mark- file
- (IBAction)galleryButtonTouchUp:(id)sender;
- (IBAction)paintButtonTouchUp:(UIButton *)sender;
- (IBAction)printButtonTouchUp:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *printButton;

#pragma mark-  CoreMotion
@property (retain, nonatomic)CMMotionManager *motionManager;
@property (assign, nonatomic)float lastPitch;

#pragma mark- video
@property(nonatomic, retain)AVAsset *asset;
@property(nonatomic, retain)AVAssetReader *assetReader;
@property (nonatomic, retain) AVPlayer *player;
@property (nonatomic, retain) AVPlayerItem *playerItem;
@property (nonatomic, assign) CMTime playTime;//播放到的时刻

- (void)syncPlayUI;
- (IBAction)playButtonTouchUp:(UIButton *)sender;
- (IBAction)playbackButtonTouchUp:(UIButton *)sender;
@end
