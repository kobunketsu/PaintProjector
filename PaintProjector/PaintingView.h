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
#import "GLWrapper.h"

#import "Brush.h"
#import "EyeDropper.h"
#import "Eraser.h"
#import "CommandStack.h"
//#import "CalculateRunTime.h"

#import "PaintFrame.h"
@class PaintScreen;
#import "PaintLayer.h"
#import "PaintData.h"

#import "CommandManager.h"
#import "PaintCommand.h"
#import "OpenCommand.h"
#import "UndoBaseCommand.h"

#import "BrushPreview.h"

#define DEBUG_VIEW_COLORALPHA 0

typedef NS_ENUM(NSInteger, PaintingViewState) {
    PaintingView_TouchNone,
    PaintingView_TouchPaint,
    PaintingView_TouchEyeDrop,
    PaintingView_TouchTransformImage,
    PaintingView_TouchTransformLayer,
    PaintingView_TouchTransformCanvas,
    PaintingView_TouchQuickTool,
    PaintingView_TouchToggleFullScreen,
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

@protocol PaintingViewDelegate
- (void) willEnableDirectEyeDropper:(BOOL)enable;

- (void) willEnableUIRedo:(BOOL)enable;
- (void) willEnableUIUndo:(BOOL)enable;

- (void) willChangeUIPaintColor:(UIColor*) resultColor;
- (void) willChangeUIBrush:(Brush*) brush;

- (void) willPaintViewTouchBegan;
- (void) willTouchMoving:(CGPoint)point;

- (void) willStartUIEyeDrop;
- (CGPoint) willGetEyeDropLocation;
- (void) willEyeDroppingUI:(CGPoint)point Color:(UIColor*)uiColor;
- (void) willEndUIEyeDrop;

- (void) willLayerDirtyAtIndex:(int)index;

- (void) didOpenPaintDoc;

- (void) willUpdateUITransformTranslate:(CGPoint)translation rotate:(float) angle scale:(float)scale;

- (void) willHideUIPaintArea:(BOOL)hide touchPoint:(CGPoint)touchPoint;
- (void) willUpdateUIToolBars;

@end

//CLASS INTERFACES:
@interface PaintingView : UIView 
    <HeapDelegate,//创建删除undo Image
    OpenCommandDelegate,
    PaintCommandDelegate,
    UndoBaseCommandDelegate,
    CommandManagerDelegate,
    BrushDelegate,
    BrushPreviewDelegate>//实现描画
{
	CGPoint	location;
	CGPoint	previousLocation;
    
    //存储最后输出的frame buffer 和depth buffer
    GLuint _finalFramebuffer;    
	GLuint _finalRenderbuffer;
//	GLuint _depthRenderbuffer;
    
   
    //用于存储临时renderTexture, 用于和当前图层的Texture交换绘制
    GLuint _curPaintedLayerFramebuffer;
    GLuint _curPaintedLayerTexture;

    //当前图层索引号
    int _curLayerIndex;
    GLuint _curLayerFramebuffer;
    GLuint _curLayerTexture;
    
    //用于存储导入的图片
//    GLKTextureInfo *_toTransformImageTex;
    GLuint _toTransformImageTex;
    
    //存储当前笔刷的renderTexture
    GLuint _brushFramebuffer;
    GLuint _brushTexture;
    
    //绘制笔刷用的显卡数据
    GLuint _VAOBrush;
    GLuint _VAOBrushBack;
    GLuint _VBOBrush;
    GLuint _VBOBrushBack;
	size_t	_vertexBrushMaxCount;
	size_t	_vertexBrushUndoMaxCount;
    
    GLuint _undoBaseFramebuffer;
    GLuint _undoBaseTexture;
    
    GLuint _VBOQuad;
    GLuint _VAOQuad;
    GLuint _VBOScreenQuad;
    GLuint _VAOScreenQuad;
    
    GLuint _debugVertexBuffer;
    GLuint _debugVertexArray;
    GLuint _debugVertexBuffer2;
    GLuint _debugVertexArray2;

    GLuint _programQuad;
    GLuint _texQuadUniform;
    GLuint _alphaQuadUniform;
    GLuint _colorQuadUniform;
    GLuint _tranformImageMatrixUniform;
    
    GLKMatrix4 _transformedImageMatrix;
    
//    GLuint _programBackgroundLayer;
    GLuint _programPaintLayerBlendModeNormal;
    GLuint _programPaintLayerBlendModeMultiply;
    GLuint _programPaintLayerBlendModeScreen;
    GLuint _programPaintLayerBlendModeOverlay;
    GLuint _programPaintLayerBlendModeDarken;
    GLuint _programPaintLayerBlendModeLighten;
    GLuint _programPaintLayerBlendModeColorDodge;
    GLuint _programPaintLayerBlendModeColorBurn;
    GLuint _programPaintLayerBlendModeSoftLight;
    GLuint _programPaintLayerBlendModeHardLight;
    GLuint _programPaintLayerBlendModeDifference;
    GLuint _programPaintLayerBlendModeExclusion;
    GLuint _programPaintLayerBlendModeHue;
    GLuint _programPaintLayerBlendModeSaturation;
    GLuint _programPaintLayerBlendModeColor;
    GLuint _programPaintLayerBlendModeLuminosity;
    
//    BOOL _lastProgramLayerNormalTransformIdentity;

#if DEBUG_VIEW_COLORALPHA
    GLuint _programQuadDebugAlpha;
    GLuint _programQuadDebugColor;
    GLuint _texQuadDebugUniform;
    GLuint _alphaQuadDebugUniform;
#endif
    
}
@property (retain, nonatomic) EAGLContext *context;
@property (retain, nonatomic) GLWrapper *glWrapper;
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) size_t	vertexBrushMaxCount;
@property (assign, nonatomic) GLuint VAOBrush;
@property (assign, nonatomic) GLuint VAOBrushBack;
@property (assign, nonatomic) GLuint VBOBrush;
@property (assign, nonatomic) GLuint VBOBrushBack;
@property (retain, nonatomic)CommandManager *commandManager;
@property (weak, nonatomic)NSMutableArray *brushTypes;
@property (weak, nonatomic)EyeDropper *eyeDropper;
@property (assign, nonatomic)PaintingViewState state;
@property (weak, nonatomic) UITouch *paintTouch;     //记录当前绘图Touch
@property (weak, nonatomic) UITouch *firstTouch;     //记录当前取色Touch
@property (assign, nonatomic) GLuint finalRenderbuffer;
@property (assign, nonatomic) GLuint backgroundTexture;//背景内容
@property (weak, nonatomic) PaintData *paintData;
@property (weak, nonatomic)Brush *brush;
@property (retain, nonatomic) UIImage *paintingImage;//纪录当前的绘图内容
@property (retain, nonatomic) UIImage *brushingImage;//纪录当前的绘图内容
@property (retain, nonatomic) UIImage *paintRefImage;//纪录当前的绘图内容

- (void)swapVBO;
- (void)initGLObjects;
- (UIImage*)snapshotScreenToUIImageOutputSize:(CGSize)size;
//取色
- (void)eyeDropColor:(CGPoint)point;
#pragma mark 绘图Draw
- (void)prepareDrawEnv;
- (void)startDraw:(CGPoint)startPoint isTapDraw:(BOOL)isTapDraw;
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

#pragma mark 变换图片TransformImage
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
//- (void)transformImageBegan;

- (void)transformImageDone;
- (void)transformImageCancelled;
- (void)destroy;

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
- (void)setCurLayerBlendMode:(LayerBlendMode)blendMode;
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
#pragma mark 文件系统FileSystem
- (void)setOpenData:(PaintData*)data;
- (void)uploadLayerDatas;
#pragma mark UndoRedo
- (void)undoDraw;
- (void)redoDraw;
@end
