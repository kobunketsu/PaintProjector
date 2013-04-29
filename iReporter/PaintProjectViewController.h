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
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <MessageUI/MessageUI.h>

#import "Ultility.h"
#import "ShaderUltility.h"
#import "PaintingView.h"

#define FarDistanceMax 20
#define FarClipDistance 100
#define NearClipDistance 0.01

typedef NS_ENUM(NSInteger, PaintProjectViewState) {
    Normal,
    Magnifying,
    Magnified,
    UnMagnifying,
    Projecting,
    Projected,
    UnProjecting,
};

@class PaintProjectViewController;

@protocol PaintProjectViewControllerDelegate
- (void) createPaintProjectEAGleContext:(PaintProjectViewController*)viewController;
@end

typedef struct {
    float Position[3];
    //    float Color[4];
} LineVertex;

@interface PaintProjectViewController : GLKViewController
<
MFMailComposeViewControllerDelegate
>
{
    //显示
    EAGLContext *_context;
    
    //数据
    GLuint _vertexBuffer;
    GLuint _vertexArray;

    //参考线
    GLuint _vertexLineArray;
    GLuint  _vertexLineBuffer;    
    LineVertex*  _vertexLineData;
    int _widthCount;
    int _heightCount;
    int _count;
    
    //存储最后输出的frame buffer 和depth buffer
    GLuint _finalFramebuffer;
	GLuint _finalRenderbuffer;
//	GLuint _depthRenderbuffer;
    
    //贴图
    GLuint _paintTexture;
    GLuint _bgTexture;
    
    //Shader相关
    GLuint _programLine;
    GLuint _programProject;
    GLuint _modelViewProjMatrixUniform;
    GLuint _baseTextureUniform;
    GLuint _baseTexScaleUniform;
    GLuint _paintTextureUniform;
    GLuint _paintTexScaleUniform;
    GLuint _paintMVPMatrixUniform;
    
    //地板长宽(根据视角变化)
    float _farDistance;
    
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
    GLKVector3 _eyeMagTop;  //顶视位置
    float _eyeT;            //当前渲染观察点过渡控制值
    float _aspect;          //投影长宽比
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
//    GLKMatrix4 _lineMVPMatrix;  //绘制line时的矩阵
    
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
//    bool _isMagnified;                      //放大状态
//    bool _toMagnifyPaint;                   //开始放大地面局部
//    bool _toUnMagnifyPaint;                 //开始返回地面全局
    GLKVector3 _magnifyCenter;              //放大地面局部中心
    float _magnifyT;                        //当前放大地面局部控制值
    float _unMagnifyT;                      //返回地面控制值
    float _curMagnifyPaintAnimationTime;    //放大地面局部动画的当前时间
    float _magnifyPaintAnimDuration;        //放大地面局部动画的持续时间
    float _curUnMagnifyPaintAnimationTime;  //返回地面动画的当前时间
    float _unMagnifyPaintAnimDuration;      //返回地面动画的持续时间
}
- (IBAction)close:(UIButton *)sender;
@property (nonatomic, strong)EAGLContext *context;
@property (nonatomic, assign) id delegate;
@property (strong, nonatomic) IBOutlet UISlider *projectSlider;
@property (strong, nonatomic) IBOutlet UISlider *farDistanceSlider;
@property (strong, nonatomic) IBOutlet UISlider *heightSlider;
@property (strong, nonatomic) GLKBaseEffect *effect;
@property (strong, nonatomic) IBOutlet UILabel *farDistanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
- (IBAction)adjustEyeSliderSlide:(UISlider *)sender;
- (IBAction)farDistanceSliderSlide:(UISlider *)sender;
- (IBAction)heightSliderSlide:(UISlider *)sender;
- (IBAction)showBackgroundButtonTapped:(UIButton *)sender;
- (IBAction)showGridButtonTapped:(UIButton *)sender;
- (IBAction)exportButtonTapped:(UIButton *)sender;
- (IBAction)handleTapPaintProjectViewGesture:(UITapGestureRecognizer *)sender;

- (void)initPaint:(PaintingView*)paintView viewAngle:(float)angle;
@end
