//
//  PaintingView.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <GLKit/GLKit.h>

#import "Brush.h"
#import "EyeDropper.h"
#import "Rubber.h"
#import "PaintOperationStack.h"
//#import "CalculateRunTime.h"
#import "Ultility.h"
#import "ShaderUltility.h"
#import "PaintFrame.h"
@class PaintScreen;
#import "PaintLayer.h"
#import "PaintData.h"

#define DEBUG_VIEW_COLORALPHA 0

typedef NS_ENUM(NSInteger, PaintingViewState) {
    PaintingView_Normal,
    PaintingView_Erase,
    PaintingView_Open,
};

@protocol PaintingViewDelegate
- (void) createPaintingViewEAGleContext:(EAGLContext*)context;
- (void) redoDisabled;
- (void) paintColorChanged:(UIColor*) resultColor;
- (void) brushChanged:(Brush*) brush;
- (void) paintViewTouchBegan;
- (void) touchMoving:(CGPoint)point;
- (void) eyeDropStart;
- (void) eyeDropping:(CGPoint)point Color:(UIColor*)uiColor;
- (void) eyeDropEnd;
- (void) layerDirtyAtIndex:(int)index;
@end
//CLASS INTERFACES:
@interface PaintingView : UIView 
    <HeapDelegate,//创建删除undo Image
    PaintOperationDelegate>//实现描画
{
@private
	// The pixel dimensions of the backbuffer
	GLint _backingWidth;
	GLint _backingHeight;
	
	EAGLContext *_context;
	
    //存储最后输出的frame buffer 和depth buffer
    GLuint _finalFramebuffer;    
	GLuint _finalRenderbuffer;
	GLuint _depthRenderbuffer;
    
    //图层
    //用于存储图层的各个texture(用于替换backgroundTexturebuffer)
    NSMutableArray* _layerFramebuffers;
    NSMutableArray* _layerTextureInfos;
    
    //用于存储临时renderTexture, 用于和当前图层的Texture交换绘制
    GLuint _tempLayerFramebuffer;
    GLuint _tempLayerTexture;
#if SIMPLE_LAYER
#else    
    //用于混合图层的临时贴图
    GLuint _blendLayerFramebuffer;
    GLuint _blendLayerTexture;
    
    //用于合成的framebuffer
    GLuint _composedLayerFramebuffer;
    GLuint _composedLayerTexture;
#endif
    //当前图层索引号
    int _curLayerIndex;
    GLuint _curLayerFramebuffer;
    GLuint _curLayerTexture;
    
    //用于存储背景层的texture (to delete)
    GLuint _backgroundTexture;
    
    //用于存储导入的图片
    GLKTextureInfo *_importedImageTex;
    
    //存储当前笔刷的renderTexture
    GLuint _brushFramebuffer;
    GLuint _brushTexture;
    
	CGPoint	location;
	CGPoint	previousLocation;
	Boolean	firstTouch;
	Boolean needsErase;	
    Brush * _brush;
    
    //undo redo
    PaintOperation *_curPaintOperation;
    PaintOperationStack *_undoStack;
    PaintOperationStack *_redoStack;    
    NSInteger _undoCount;
//    GLuint _curUndoTexture;
//    GLubyte * _undoBaseImageData;
//    GLubyte * _undoCheckImageData;    
//    UIImage * _undoBaseImage;
//    UIImage * _undoCheckImage; 
    
    GLuint _undoBaseFramebuffer;    
    GLuint _undoBaseTexture;
    GLuint _undoCheckFramebuffer;
    GLuint _undoCheckTexture; 
    
    //screen quad vertex
    GLuint _vertexBuffer;
    GLuint _vertexArray;     

    GLuint _debugVertexBuffer;
    GLuint _debugVertexArray;
    GLuint _debugVertexBuffer2;
    GLuint _debugVertexArray2;
    //opengles2.0 shader
    GLuint _programQuad;
    GLuint _texQuadUniform;
    GLuint _alphaQuadUniform;
    GLuint _tranformImageMatrixUniform;
    
    GLKMatrix4 _transformedImageMatrix;
    GLKMatrix4 _imageTransformMatrixT;
    GLKMatrix4 _imageToTransformMatrixT;
    GLKQuaternion _imageTransformMatrixR;
    GLKQuaternion _imageToTransformMatrixR;
    GLKMatrix4 _imageTransformMatrixS;    
    GLKMatrix4 _imageToTransformMatrixS;
    
#if SIMPLE_LAYER
#else
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
#endif
    GLuint _srcTexUniform;
    GLuint _dstTexUniform;

#if DEBUG_VIEW_COLORALPHA
    GLuint _programQuadDebugAlpha;
    GLuint _programQuadDebugColor;
    GLuint _texQuadDebugUniform;
    GLuint _alphaQuadDebugUniform;
#endif
    
    PaintData* _paintData;
    
    PaintingViewState _state;
}

@property(nonatomic, retain)EyeDropper *eyeDropper;
@property(nonatomic, retain)Brush* brush;
@property(nonatomic, retain)NSMutableArray *brushTypes;
@property(nonatomic, retain) EAGLContext *context;
@property(nonatomic, assign) BOOL isTransformOperating;
@property(nonatomic, assign) BOOL isEyeDroppering;
@property(nonatomic, readwrite) CGPoint location;
@property(nonatomic, readwrite) CGPoint previousLocation;
@property(nonatomic, assign) id delegate;
@property(atomic, retain) UITouch *curTouch;//用于手势判断undo
@property(nonatomic, retain) UIImage* paintingImage;//纪录当前的绘图内容
@property(nonatomic, retain) UIImage* brushingImage;//纪录当前的绘图内容
@property(nonatomic, retain) UIImage* paintRefImage;//纪录当前的绘图内容

@property(nonatomic, retain) GLKTextureInfo* paintTextureInfo; 
@property(nonatomic, assign) GLuint curPaintedLayerTexture;
@property(nonatomic, assign) GLuint backgroundTexture;//背景内容
@property(nonatomic, assign) GLuint finalRenderbuffer;
@property(nonatomic, retain) PaintData* paintData;

- (BOOL)initCustom;
- (void)destroyBuffers;

- (void)clearData;//清空所有图层，留下一个底层空白
- (void)erase;
- (void)setBrush:(Brush *)brush;
- (GLuint)createBrushWithImage: (NSString*)brushName;
- (void)setBackgroundUIImage:(UIImage*)uiImage;
- (void)setBackgroundImage:(NSString*)imagePath;

//绘图
- (void)startDraw:(CGPoint)startPoint;
- (void)endDraw;
- (void)undoDraw;
- (void)redoDraw;

//绘制
- (void)updateRender;

//图层
- (int)curLayerIndex;
//指定当前图层
- (void)setCurLayerIndex:(int)newValue;
//指定当前图层混合方式
- (void)setCurLayerBlendMode:(LayerBlendMode)blendMode;
- (PaintLayer*)createBlankLayer;
//指定位置插入空白图层
- (void)insertBlankLayerAtIndex:(int)index transparent:(bool)transparent;
//指定位置插入UIImage
- (void)insertUIImageAtCurLayer:(UIImage*)uiImage;
- (void)cancelInsertUIImageAtCurLayer;
- (void)freeTransformImageTranslate:(CGPoint)translation rotate:(float) angle scale:(float)scale;
- (void)moveImage:(CGPoint)translation;
- (void)rotateImage:(float)angle;
- (void)scaleImage:(float)scale;
- (void)transformImageBegan;
- (void)editImageDone;
- (CGPoint)imageScaleAnchor;
//指定位置删除图层
- (void)deleteLayerAtIndex:(int)index;
//移动图层
- (void)moveLayerUpFromIndex:(int)fromIndex ToIndex:(int)toIndex;
- (void)moveLayerDownFromIndex:(int)fromIndex ToIndex:(int)toIndex;
//指定位置上传图层数据
- (void)uploadLayerDataAtIndex:(int)index;


//文件
- (void)close;
- (void)toOpen:(PaintData*)data;
- (void)open;
- (void)uploadLayerDatas;
//工具
- (UIImage*)snapshotScreenToUIImage;
- (UIImage*)snapshotPaintToUIImage;
@end
