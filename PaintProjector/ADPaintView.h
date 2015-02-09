//
//  PaintingView.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>

#import <GLKit/GLKit.h>
#import "REGLWrapper.h"

#import "ADBrush.h"
#import "ADEyeDropper.h"
#import "ADEraser.h"
#import "ADCommandStack.h"
//#import "CalculateRunTime.h"

@class ADPaintScreen;
#import "ADPaintLayer.h"
#import "ADPaintData.h"
#import "ADPaintDoc.h"

#import "ADCommandManager.h"
#import "ADBrushPreview.h"

#import <JotTouchSDK/JotTouchSDK.h>

#define DEBUG_VIEW_COLORALPHA 0




typedef NS_ENUM(NSInteger, PaintViewState) {
    PaintView_TouchNone,
    PaintView_TouchPaint,
    PaintView_TouchEyeDrop,
    PaintView_TouchTransformImage,
    PaintView_TouchTransformLayer,
    PaintView_TouchTransformCanvas,
    PaintView_TouchQuickTool,
    PaintView_TouchToggleFullScreen,
};

typedef struct {
    CGPoint translate;
    CGFloat rotate;
    CGPoint scale;
} TransformInfo;

typedef struct {
    float Position[3];
    float TexCoord[2];
    float Color[4];
} QuadVertex;

@protocol ADPaintingViewDelegate
- (void) willEnableDirectEyeDropper:(BOOL)enable;

- (void) willEnableUIRedo:(BOOL)enable;
- (void) willEnableUIUndo:(BOOL)enable;

- (void) willFinishUIRedo;
- (void) willFinishUIUndo;
- (void) willFinishUIClear;

- (void) willChangeUIPaintColor:(UIColor*) resultColor;
- (void) willChangeUIBrush:(ADBrush*) brush;
- (void) willChangeFromBrush:(ADBrush*)srcBrush toBrush:(ADBrush*)targetBrush;

- (void) willPaintViewTouchBegan;
- (void) willPaintViewTouchMoving:(CGPoint)point;
- (void) willPaintViewTouchEnd;

- (void) willStartUIEyeDrop;
- (CGPoint) willGetEyeDropLocation;
- (void) willEyeDroppingUI:(CGPoint)point Color:(UIColor*)uiColor;
- (void) willEndUIEyeDrop;

- (void) willLayerDirtyAtIndex:(int)index;

- (void) didOpenPaintDoc;

- (void) willUpdateUITransformTranslate:(CGPoint)translation rotate:(float) angle scale:(float)scale;

- (void) willHideUIPaintArea:(BOOL)hide touchPoint:(CGPoint)touchPoint;
- (void) willUpdateUIToolBars;

- (void)willJotSuggestsToDisableGestures;
- (void)willJotSuggestsToEnableGestures;
@end

//CLASS INTERFACES:
@interface ADPaintView : UIView 
    <
//    ADHeapDelegate,//创建删除undo Image
    ADTransformCommandDelegate,
    ADOpenCommandDelegate,
    ADPaintCommandDelegate,
    ADUndoBaseCommandDelegate,
    ADCommandManagerDelegate,
    ADBrushDelegate,
    ADBrushPreviewDelegate,
    JotPalmRejectionDelegate>//实现描画
{
    //存储最后输出的frame buffer 和depth buffer
    GLuint _finalFramebuffer;    
	GLuint _finalRenderbuffer;
//	GLuint _depthRenderbuffer;
    
    //当前图层索引号
    int _curLayerIndex;
    
    //绘制笔刷用的显卡数据
    GLuint _VAOBrush;
    GLuint _VAOBrushBack;
    GLuint _VBOBrush;
    GLuint _VBOBrushBack;
	size_t	_vertexBrushMaxCount;
	size_t	_vertexBrushUndoMaxCount;

    GLuint _VBOQuad;
    GLuint _VAOQuad;
    GLuint _VBOScreenQuad;
    GLuint _VAOScreenQuad;
    
    GLuint _debugVertexBuffer;
    GLuint _debugVertexArray;
    GLuint _debugVertexBuffer2;
    GLuint _debugVertexArray2;

//    GLuint _programQuad;
//    GLuint _texQuadUniform;
//    GLuint _alphaQuadUniform;
    GLuint _colorQuadUniform;
//    GLuint _tranformImageMatrixUniform;

    GLuint _programQuadBlendBrush;
#if DEBUG_VIEW_COLORALPHA
    GLuint _programQuadDebugAlpha;
    GLuint _programQuadDebugColor;
    GLuint _texQuadDebugUniform;
    GLuint _alphaQuadDebugUniform;
#endif
    
}
//@property (assign, nonatomic) size_t allocVertexCount;//打补丁
@property (retain, nonatomic) EAGLContext *context;
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) size_t	vertexBrushMaxCount;
@property (assign, nonatomic) size_t	curVertexBrushCount;
@property (assign, nonatomic) GLuint VAOBrush;
@property (assign, nonatomic) GLuint VAOBrushBack;
@property (assign, nonatomic) GLuint VBOBrush;
@property (assign, nonatomic) GLuint VBOBrushBack;
@property (assign, nonatomic) GLuint VAOScreenQuad;
@property (assign, nonatomic) GLuint VAOQuad;
@property (assign, nonatomic) GLuint finalRenderbuffer;
@property (assign, nonatomic) GLuint finalFramebuffer;
@property (assign, nonatomic) NSInteger viewGLSize;  //用于创建framebufferTextuer的尺寸
@property (assign, nonatomic) GLuint backgroundTexture;//背景内容
@property (retain, nonatomic) ADPaintData *paintData;//正向绘制数据
@property (retain, nonatomic)NSMutableArray *layerTextures;//用于存储图层的各个texture(用于替换backgroundTexturebuffer)
@property (retain, nonatomic)ADCommandManager *commandManager;
@property (assign, nonatomic, readonly)PaintViewState state;
@property (weak, nonatomic)NSMutableArray *brushTypes;
@property (retain, nonatomic)ADBrush *brush;
@property (weak, nonatomic)ADEyeDropper *eyeDropper;
@property (retain, nonatomic) REMaterial *quadMat;


#pragma mark GL资源
- (void)swapVBO;
//初始化OpenGLES资源
- (void)initGL;
- (void)tearDownGL;
- (void)destroy;
//进入激活
-(void)applicationDidBecomeActive;
//退出激活，停止所有OpenGLES操作
- (void)applicationWillResignActive;
//进入后台，释放OpenGLES资源
- (void)applicationDidEnterBackground;
//进入前台,恢复GL
- (void)applicationWillEnterForeground;

#pragma mark Interaction交互
@property (assign, nonatomic) NSInteger curNumberOfTouch;   //当前Touch个数
@property (weak, nonatomic) UITouch *firstTouch;     //记录当前取色Touch

#pragma mark 绘图Draw
- (BOOL)enterState:(PaintViewState)state;
- (void)prepareDrawEnv;
- (void)startDraw:(PathPoint)startPoint isTapDraw:(BOOL)isTapDraw;
- (void)draw:(BOOL)isTapDraw;
- (void)endDraw;
- (void)clearData;//清空所有图层，留下一个底层空白
- (void)eraseAllLayers;
//绘制
- (void)updateRender;

#pragma mark 变换画布TransformCanvas
- (void)transformCanvasBegan;
- (void)transformCanvasReset;
- (void)freeTransformCanvasTranslate:(CGPoint)translation rotate:(float) angle scale:(float)scale;

#pragma mark 变换图片TransformImageLayer
- (void)transformImageBeganAnchorPoint:(CGPoint)anchorPoint;
- (TransformInfo)freeTransformImageTranslate:(CGPoint)translation rotate:(float) angle scale:(CGPoint)scale anchorPoint:(CGPoint)anchorPoint;
- (CGPoint)imageScaleAnchor;
- (void)moveImage:(CGPoint)translation;
- (void)rotateImage:(CGFloat)angle;
- (void)scaleImage:(CGPoint)scale;
//计算图层像素区域
- (CGRect)calculateLayerContentRect;
//变换当前图层
- (void)beforeTransformLayer;
- (void)beforeTransformImage:(UIImage*)uiImage;
- (void)transformImageLayerDone;
//- (void)transformImageLayerCancelled;

#pragma mark 图层Layer
- (int)curLayerIndex;
- (void)insertUIImageAtCurLayer:(UIImage*)uiImage;
- (void)cancelInsertUIImageAtCurLayer;
//指定位置删除图层
- (void)deleteLayerAtIndex:(int)index immediate:(BOOL)isImmediate;
//指定位置插入空白图层
- (void)insertBlankLayerAtIndex:(int)index transparent:(bool)transparent immediate:(BOOL)isImmediate;

- (void)eraseLayerAtIndex:(int)index;
//移动图层
- (void)moveLayerUpFromIndex:(int)fromIndex ToIndex:(int)toIndex immediate:(BOOL)isImmediate;
- (void)moveLayerDownFromIndex:(int)fromIndex ToIndex:(int)toIndex immediate:(BOOL)isImmediate;
//指定当前图层
- (void)setCurLayerIndex:(int)newValue;
//指定当前图层混合方式
- (void)setLayerAtIndex:(int)index blendMode:(LayerBlendMode)blendMode;
//指定当前图层透明度
- (void)setLayerAtIndex:(int)index opacity:(float)opacity;
//指定当前图层透明度锁定
- (void)setLayerAtIndex:(int)index opacityLock:(BOOL)opacityLock;
//合并当前图层
- (void)mergeLayerAtIndex:(int)index;
//复制当前图层
- (void)insertCopyLayerAtIndex:(int)index immediate:(BOOL)isImmediate;
//指定位置上传图层数据
- (void)uploadLayerDataAtIndex:(int)index;
- (void)uploadLayerDatas:(BOOL)forceUpdate;
- (void)uploadLayerDatas;
#pragma mark 文件系统FileSystem
- (void)setOpenData:(ADPaintData*)data;
#pragma mark 撤销UndoRedo
- (void)undoDraw;
- (void)redoDraw;
- (void)resetUndoRedo;
#pragma ultility
- (void)drawQuad:(GLuint)quad texture2D:(GLuint)texture premultiplied:(BOOL)premultiplied alpha:(GLfloat)alpha;
- (void)drawLayerWithTex:(GLuint)texture blend:(LayerBlendMode)blendMode opacity:(float)opacity;
#pragma mark 其他Misc
- (UIImage*)snapshotScreenToUIImageOutputSize:(CGSize)size;
- (UIImage*)snapshotFramebufferToUIImage:(GLuint)framebuffer;
//取色
- (void)eyeDropColor:(CGPoint)point;

- (void)copyCurLayerToCurPaintedLayer;
- (void)copyCurPaintedLayerToCurLayer;

//测试

@end
