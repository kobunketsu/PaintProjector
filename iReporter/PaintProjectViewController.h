//
//  PaintProjectViewController.h
//  iReporter
//
//  Created by 胡 文杰 on 13-3-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称: 投影绘图控制器
//描述: 将图片按照角度投影到Quad上，并从顶部正交显示转换后的图片
//功能: 动态调节角度

#import <GLKit/GLKit.h>
#import <MessageUI/MessageUI.h>

#import "Ultility.h"
#import "ShaderManager.h"
#import "PaintingView.h"
#import "ProjectViewRange.h"

#define EyeHeightMax 2.0
#define FarDistanceMax 20
#define FarClipDistance 100
#define NearClipDistance 0.01

typedef NS_ENUM(NSInteger, PaintProjectViewState) {
    Paint,
    ZoomIn,
    Zoomed,
    ZoomOut,
    Projecting,
    Projected,
    UnProjecting,
};

@class PaintProjectViewController;

@protocol PaintProjectViewControllerDelegate
- (void) createPaintProjectEAGleContext:(PaintProjectViewController*)viewController;
@end



@interface PaintProjectViewController : UIViewController
<
MFMailComposeViewControllerDelegate,
GLKViewControllerDelegate
>
{
    GLKViewController* _glkViewController;
    //显示
    EAGLContext *_context;
    
    //数据
    GLuint _vertexBuffer;
    GLuint _vertexArray;

  
    //存储最后输出的frame buffer 和depth buffer
	GLuint _finalRenderbuffer;
    
    //贴图
    GLuint _paintTexture;
    GLuint _bgTexture;
    
    //Shader相关
    GLuint _programProject;
    GLuint _baseTextureUniform;
    GLuint _baseTexScaleUniform;
    GLuint _paintTextureUniform;
    GLuint _paintTexScaleUniform;
    GLuint _paintMVPMatrixUniform;
    GLuint _modelViewProjMatrixUniform;
    
    //视角
//    float _curViewAngleX;       //当前视角弧度
//    float _curViewAngleY;
//    float _lastViewAngleX;      //上个视角弧度
//    float _lastViewAngleY;
//    float _maxViewAngleX;       //最大视角弧度
//    float _minViewAngleY;       //最小视角弧度
    float _paintViewAngleX;     //绘图视角弧度
    float _paintViewAngleY;
    
    //调节参数
    bool _showBackground;   //是否显示背景
    bool _showGrid;         //是否显示网格
    bool _projDirty;        //是否重新计算
    float _manHeight;       //观察者身高
    GLKVector3 _eye;        //观察者位置
    GLKVector3 _eyeTop;     //顶视位置
    float _eyeTopAspect;    //顶视位置长宽比
    GLKVector3 _eyeZoomInTop;  //顶视放大位置
    float _eyeT;            //当前渲染观察点过渡控制值
    float _projSrcAspect;          //投影长宽比
    float _projHeight;      //实际地面投影长度
    float _projWidth;       //实际地面投影宽度
    GLKVector3 _projNear;   //实际地面最近点
    GLKVector3 _projFar;    //实际地面最远点
    GLKVector3 _projCenter; //实际地面最远点
    GLKVector3 _projFocus;      //实际地面的焦点
    float _kHeightScale;    //尺寸防缩程度 实际地面绘图 / 虚拟pad绘图
    float _kWidthScale;
    float _eyeToPaintViewCenterDistanceZ;   //观察点到绘图视觉焦点的水平距离
    
    //Matrix
    GLKMatrix4 _modelViewProjectionMatrix;  //绘制quad时的矩阵
    GLKMatrix4 _paintMVPMatrix;//用来记录拉伸texture的
    GLKMatrix4 _viewProjInverseMatrix;  //投影触摸点到世界坐标的逆矩阵
    
    //投影动画
    float _lastMediaTime;                   //上个时间点
//    bool _toProjectPaint;                   //投影打开动画
//    bool _toUnprojectPaint;                 //投影打开动画
    float _curProjectPaintAnimationTime;    //投影到地面动画的当前时间
    float _curUnprojectPaintAnimationTime;  //恢复绘画视角动画的当前时间
    float _projectPaintAnimDuration;        //投影到地面动画的持续时间
    float _unprojectPaintAnimDuration;      //恢复绘画视角动画的持续时间
    
    //放大动画
    PaintProjectViewState _state;      //状态
    GLKVector3 _zoomInCenter;              //放大地面局部中心
    float _zoomInT;                        //当前放大地面局部控制值
    float _zoomOutT;                      //返回地面控制值
    float _curZoomInPaintAnimationTime;    //放大地面局部动画的当前时间
    float _zoomInPaintAnimDuration;        //放大地面局部动画的持续时间
    float _curZoomOutPaintAnimationTime;  //返回地面动画的当前时间
    float _zoomOutPaintAnimDuration;      //返回地面动画的持续时间
   
}
@property (retain, nonatomic) TextureManager* texMgr;
@property (assign, nonatomic) bool showGrid;         //是否显示网格
@property (assign, nonatomic) float nearDistance;
@property (assign, nonatomic) float farDistance;
@property (assign, nonatomic) float fovY;
@property (weak, nonatomic) IBOutlet UILabel *projWidthLabel;
@property (weak, nonatomic) IBOutlet UILabel *projHeightLabel;
@property (weak, nonatomic) IBOutlet UIStepper *testRowStepper;
@property (weak, nonatomic) IBOutlet UIStepper *testColStepper;
@property (weak, nonatomic) IBOutlet UILabel *testColLabel;
@property (weak, nonatomic) IBOutlet UILabel *fovYLabel;
@property (strong, nonatomic)EAGLContext *context;
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet GLKView *projectView;
@property (weak, nonatomic) IBOutlet UISlider *projectSlider;
@property (weak, nonatomic) IBOutlet UISlider *farDistanceSlider;
@property (weak, nonatomic) IBOutlet UISlider *nearDistanceSlider;
@property (weak, nonatomic) IBOutlet UIView *heightPanel;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;

@property (weak, nonatomic) IBOutlet UILabel *farDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nearDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet ProjectViewRange *projectViewRange;
@property (strong, nonatomic) GLKViewController *glkViewController;

@property (assign, nonatomic) float measureScale;
@property (assign, nonatomic) float gridRealSize;
@property (assign, nonatomic) float gridPointSize;        //网格像素大小
@property (assign, nonatomic) int gridWidthCount;    //网格宽上的数量
@property (assign, nonatomic) int gridHeightCount;   //网格高上的数量
@property (weak, nonatomic) IBOutlet UIStepper *farDistanceStepper;
@property (weak, nonatomic) IBOutlet UIStepper *nearDistanceStepper;
@property (weak, nonatomic) IBOutlet UIStepper *heightStepper;
@property (weak, nonatomic) IBOutlet UIImageView *testUIImage;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UIButton *zoomOutButton;
@property (assign, nonatomic) int curProgressIndex;
@property (assign, nonatomic) int gridImageIndex;
@property (retain, nonatomic) NSMutableArray *gridImageIndices;

- (IBAction)eyeHeightSliderSlide:(UISlider *)sender;
- (IBAction)farDistanceSliderSlide:(UISlider *)sender;
- (IBAction)nearDistanceSliderSlide:(UISlider *)sender;
- (IBAction)heightSliderSlide:(UISlider *)sender;
- (IBAction)showBackgroundButtonTapped:(UIButton *)sender;
- (IBAction)showGridButtonTapped:(UIButton *)sender;
- (IBAction)exportButtonTapped:(UIButton *)sender;
- (IBAction)close:(UIButton *)sender;
- (IBAction)handleTapPaintProjectViewGesture:(UITapGestureRecognizer *)sender;
- (IBAction)farDistanceTextFieldEdited:(UITextField *)sender;
- (IBAction)farDistanceStepperValueChanged:(UIStepper *)sender;
- (IBAction)nearDistanceStepperValueChanged:(UIStepper *)sender;
- (IBAction)viewHeightStepperValueChanged:(UIStepper *)sender;
- (IBAction)zoomOutButtonTouchUp:(UIButton *)sender;

- (IBAction)testButtonTouchUp:(UIButton *)sender;
- (IBAction)testRowStepperValueChanged:(id)sender;
- (IBAction)testColStepperValueChanged:(id)sender;

- (void)initPaint:(PaintingView*)paintView viewAngle:(float)angle;
@end
