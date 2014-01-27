//
//  Brush.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-28.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "BrushTypeButton.h"
#import "Ultility.h"
#import "ShaderManager.h"
#import "TextureManager.h"

@class PaintingView;
@class GLWrapper;

#define BUFFER_OFFSET(i) ((char *)NULL + (i))
#define kBrushCurveIntervalScale 1.2
#define kBrushPixelStep		2
@interface BrushState : NSObject
{
}
@property (assign, nonatomic)int classId;
@property (assign, nonatomic)int seed;
@property (retain, nonatomic)UIColor* color; //TODO:changed to CGColor
@property (assign, nonatomic)float radius;
@property (assign, nonatomic)float radiusJitter;
@property (assign, nonatomic)float radiusFade;
@property (assign, nonatomic)float hardness;
@property (assign, nonatomic)float roundness;
@property (assign, nonatomic)float angle;
@property (assign, nonatomic)float angleJitter;
@property (assign, nonatomic)float angleFade;
@property (assign, nonatomic)float opacity;
@property (assign, nonatomic)float flow;
@property (assign, nonatomic)float flowJitter;
@property (assign, nonatomic)float flowFade;
@property (assign, nonatomic)float spacing;
@property (assign, nonatomic)float scattering;
@property (assign, nonatomic)float wet;
@property (assign, nonatomic)bool isShapeTexture;
@property (assign, nonatomic)bool isDissolve;
@property (assign, nonatomic)bool isAirbrush;
@property (assign, nonatomic)bool isVelocitySensor;
@property (assign, nonatomic)bool isRadiusMagnifySensor;


@end

typedef enum
{
    BrushType_Pencil,
    BrushType_Pen,
    BrushType_Marker,
    BrushType_Eraser,
    BrushType_Chalk,
    BrushType_Finger,
    BrushType_Max,
}BrushType;

typedef struct {
    float Position[4];
    float Color[4];
} BrushVertex;

@class Brush;
@protocol BrushDelegate
- (void) willBrushColorChanged:(UIColor*)color;
- (void) willUpdateSmudgeTextureWithBrushState:(BrushState*)brushState location:(CGPoint)point;
- (void) willUpdateSmudgeSubPoint;
//- (void) willUpdateLayerContentCGRectWithPoint:(CGPoint)point radius:(CGFloat)radius;
@end

@interface Brush : NSObject
{
    BrushState* _brushState;    

    CGPoint _lastDrawPoint;
    CGPoint _curDrawPoint; 
    
    //shader        
    GLuint _programBrush;
    GLuint _vertexProgram;
    GLuint _fragmentProgram;
    GLuint _ppo;

    //tex
    GLuint _maskTexture;
    GLuint _shapeTexture;
    GLuint _maskTextureUniform;
    GLuint _noiseTexture;
    GLuint _noiseTextureUniform;
    GLuint _paramsUniform;
    GLuint _params2Uniform;
    GLuint _projectionUniform;
    GLuint _colorUniform;

    GLuint _smudgeTexture;
    GLuint _smudgeBackTexture;
    GLuint _smudgeTextureUniform;
    
    //attr
//    GLuint _attrPosition;
//    GLuint _attrColor;
  
    //temp
    CGFloat _red;
    CGFloat _green;
    CGFloat _blue;
    CGFloat _alpha;
    
    GLfloat _projectionMat[16];
}

@property (retain, nonatomic) NSString *name;
@property (assign, nonatomic) CGSize canvasSize;
@property (weak, nonatomic) TextureManager* texMgr;
@property (assign, nonatomic)BrushVertex* vertexBuffer;
@property (weak, nonatomic) PaintingView* paintView;
@property (weak, nonatomic) GLWrapper* glWrapper;
@property (retain, nonatomic) UIImage* iconImage;
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) GLuint  shapeTexture;
@property (assign, nonatomic) GLuint smudgeTexture;
@property (assign, nonatomic) GLuint smudgeBackTexture;
@property (assign, nonatomic) GLuint smudgeFramebuffer;
@property (assign, nonatomic) GLuint smudgeBackFramebuffer;
@property (assign, nonatomic) NSUInteger lastSmudgeTextureSize;
@property (assign, nonatomic) CGPoint lastDrawPoint;
@property (assign, nonatomic) CGPoint curDrawPoint;
@property (retain, nonatomic) BrushState* brushState;
@property (assign, nonatomic) CGPoint position;
@property (weak, nonatomic) EAGLContext* context;
@property (assign, nonatomic) float radiusSliderMaxValue;
@property (assign, nonatomic) float radiusSliderMinValue;
@property (assign, nonatomic) float curDrawAccumDeltaLength;//当前绘制的长度
@property (assign, nonatomic) float curDrawLength;//当前绘制的总长度
@property (assign, nonatomic) float curDrawFade;//当前绘制结束防缩
@property (assign, nonatomic) float lastDrawFade;//当前绘制结束防缩
@property (assign, nonatomic) size_t allDrawSpriteCount;//当前一次绘制的数量
@property (assign, nonatomic) CGPoint lastDrawSubPoint;
@property (assign, nonatomic, readonly) BOOL isEditable;
@property (retain, nonatomic) NSString *shaderPreDefines;
@property (retain, nonatomic) NSDictionary *vertShaderCaches;
@property (retain, nonatomic) NSDictionary *fragShaderCaches;


- (id)initWithPaintView:(PaintingView*)paintView GLWrapper:(GLWrapper*)glWrapper texMgr:(TextureManager*)texMgr canvasSize:(CGSize)canvasSize;
- (BOOL)loadShader;
- (void)resetDefaultBrushState;
- (BOOL)createSmudgeFramebuffers;
- (void)deleteSmudgeFramebuffers;
- (void)swapSmudgeFramebuffers;

- (CGFloat)radius;
- (void)setRadius:(CGFloat)newValue;
- (void)setBrushCommonTextures;
- (void)setBrushShapeTexture:(NSString*)textureName;
- (void)setPatternTextureWithImage: (NSString*)patterName;
- (UIColor *)color;
- (void)setColor:(UIColor *)newValue;
- (void)setBlendMode;

- (void)startDraw:(CGPoint)startLocation;
- (void)prepareWithBrushState:(BrushState*)brushState lastBrushState:(BrushState*)lastBrushState;
- (size_t)calculateDrawCountFromPoint:(CGPoint)start toPoint:(CGPoint)end brushState:(BrushState*)brushState isTapDraw:(BOOL)isTapDraw;
- (void)fillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end segmentOffset:(int)segmentOffset brushState:(BrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate;
- (void)fillLineBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint)destination Count:(size_t) count segmentOffset:(int)segmentOffset brushState:(BrushState*)brushState isImmediate:(BOOL)isImmediate;
- (void)renderImmediate:(BOOL)isImmediate;



@end
