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
@property(nonatomic, assign)int classId;
@property(nonatomic, assign)int seed;
@property(nonatomic, retain)UIColor* color; //TODO:changed to CGColor
@property(nonatomic, assign)float radius;
@property(nonatomic, assign)float radiusJitter;
@property(nonatomic, assign)float radiusFade;
@property(nonatomic, assign)float hardness;
@property(nonatomic, assign)float roundness;
@property(nonatomic, assign)float angle;
@property(nonatomic, assign)float angleJitter;
@property(nonatomic, assign)float angleFade;
@property(nonatomic, assign)float opacity;
@property(nonatomic, assign)float flow;
@property(nonatomic, assign)float flowJitter;
@property(nonatomic, assign)float flowFade;
@property(nonatomic, assign)float spacing;
@property(nonatomic, assign)float scattering;
@property(nonatomic, assign)float wet;
@property(nonatomic, assign)bool isShapeTexture;
@property(nonatomic, assign)bool isDissolve;
@property(nonatomic, assign)bool isAirbrush;
@property(nonatomic, assign)bool isVelocitySensor;
@property(nonatomic, assign)bool isRadiusMagnifySensor;


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

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) CGSize canvasSize;
@property (nonatomic, weak) TextureManager* texMgr;
@property (nonatomic, assign)BrushVertex* vertexBuffer;
@property (nonatomic, weak) PaintingView* paintView;
@property (nonatomic, weak) GLWrapper* glWrapper;
@property (nonatomic, retain) UIImage* iconImage;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) GLuint  shapeTexture;
@property (nonatomic, assign) GLuint smudgeTexture;
@property (nonatomic, assign) GLuint smudgeBackTexture;
@property (nonatomic, assign) GLuint smudgeFramebuffer;
@property (nonatomic, assign) GLuint smudgeBackFramebuffer;
@property (nonatomic, assign) NSUInteger lastSmudgeTextureSize;
@property (nonatomic, assign) CGPoint lastDrawPoint;
@property (nonatomic, assign) CGPoint curDrawPoint;
@property (nonatomic, retain) BrushState* brushState;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, weak) EAGLContext* context;
@property (nonatomic, assign) float radiusSliderMaxValue;
@property (nonatomic, assign) float radiusSliderMinValue;
@property (nonatomic, assign) float curDrawAccumDeltaLength;//当前绘制的长度
@property (nonatomic, assign) float curDrawLength;//当前绘制的总长度
@property (nonatomic, assign) float curDrawFade;//当前绘制结束防缩
@property (nonatomic, assign) float lastDrawFade;//当前绘制结束防缩
@property (nonatomic, assign) size_t allDrawSpriteCount;//当前一次绘制的数量
@property (nonatomic, assign) CGPoint lastDrawSubPoint;
@property (nonatomic, assign, readonly) BOOL isEditable;
@property (nonatomic, retain) NSString *shaderPreDefines;
@property (nonatomic, retain) NSDictionary *vertShaderCaches;
@property (nonatomic, retain) NSDictionary *fragShaderCaches;


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
