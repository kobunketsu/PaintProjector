//
//  Brush.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-28.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <GLKit/GLKit.h>
#import "Ultility.h"
#import "ShaderUltility.h"
#define BUFFER_OFFSET(i) ((char *)NULL + (i))
#define kBrushCurveIntervalScale 1.2
#define kBrushPixelStep		2
@interface BrushState : NSObject
{
}
@property(nonatomic, retain)UIColor* color;
@property(nonatomic, assign)float radius;
@property(nonatomic, assign)float opacity;
@property(nonatomic, assign)int   brushId;
@end

typedef struct {
    float Position[4];
    float Color[4];
} BrushVertex;

@protocol BrushDelegate
- (void) brushColorChanged:(UIColor*)color;
@end
@interface Brush : NSObject
{
    NSString* _typeName;
    UIImage* _iconImage;        
    
    BrushState* _brushState;    
//    CGFloat _radius;
//    UIColor *_color;
//    CGFloat _opacity;
    CGFloat _angle;
    
    CGPoint _lastDrawPoint;
    CGPoint _curDrawPoint; 
    
    UIView* _canvas;
    EAGLContext*  _context;    
    //shader        
    GLuint _programBrush;   
    //tex
    GLuint _strokeTexture;
    GLuint _textureUniform;
    GLuint _pointSizeUniform;
    GLuint _projectionUniform;
    GLuint _colorUniform;    
//    GLuint _angleUniform;    
    
    //attr
//    GLuint _attrPosition;
//    GLuint _attrColor;

    
    GLuint _vertexArray;
    BrushVertex* _vertexBuffer;
	NSUInteger	_vertexMax;    
    GLuint _drawingVBO;    
    
}
typedef enum
{
    BrushType_Pencil,
    BrushType_Pen,    
    BrushType_Airbrush,
    BrushType_Rubber,
    BrushType_Max,
}BrushType;
//@property (nonatomic, assign) int brushId;
@property (nonatomic, retain) UIImage* iconImage;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) GLuint  strokeTexture;    
@property (nonatomic, assign) CGPoint lastDrawPoint;
@property (nonatomic, assign) CGPoint curDrawPoint;
@property (nonatomic, assign) BrushType brushType;
@property (nonatomic, retain) NSString* typeName;
@property (nonatomic, retain) BrushState* brushState;
//@property (nonatomic, assign) CGFloat opacity;
//@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) BOOL isDrawing;
@property (nonatomic, retain) EAGLContext* context;
- (id)initWithContext:(EAGLContext*)context Canvas:(UIView*)canvas;
- (CGFloat)radius;
- (void)setRadius:(CGFloat)newValue;
- (void)startDraw:(CGPoint)startLocation;
- (void)prepare;
- (void)prepareWithBrushState:(BrushState*)brushState;
- (void)setBrushTextureWithImage: (NSString*)brushName;
- (UIColor *)color;
- (void)setColor:(UIColor *)newValue;
- (void)setBlendMode;
- (void)renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end;
- (void)drawBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint)destination Count:(int) count;
- (BOOL)loadShader;
- (void)setupVertexBufferObjects;
- (void) initializeVertexBufferObject;
- (void) destroyVertexBufferObject;
- (GLuint)getDebugTexture;
@end
