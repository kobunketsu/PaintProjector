//
//  GLWrapper.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
@class REShader;

typedef NS_ENUM(NSInteger, BlendFuncType) {
    BlendFuncAdditive,
    BlendFuncOpaque,
    BlendFuncOpaqueAlphaBlend,
    BlendFuncAlphaBlend,
    BlendFuncAlphaBlendPremultiplied,
    BlendFuncErase,
};

typedef NS_ENUM(NSInteger, InterpolationType) {
    Interpolation_Nearest,
    Interpolation_Linear,
};

typedef NS_ENUM(NSInteger, WrapMode) {
    WrapMode_Clamp,
    WrapMode_Repeat,
};
#define SwapGL(a,b){GLuint temp = a; a = b; b = temp;}

#define RELEASE_FRAMEBUFFER(fb) if(fb){glDeleteFramebuffersOES(1, &fb);fb = 0;}
#define RELEASE_RENDERBUFFER(rb) if(rb){glDeleteRenderbuffersOES(1, &rb);rb = 0;}
#define RELEASE_PROGRAM(program) if(program){glDeleteProgram(program);program = 0;}
#define RELEASE_BUFFER(buffer) if(buffer){glDeleteBuffers(1, &buffer);buffer = 0;}
#define RELEASE_VERTEXARRAY(va) if(va){glDeleteVertexArraysOES(1, &va);va = 0;}
#define RELEASE_TEXTURE(tex) if(tex){glDeleteTextures(1, &tex);tex = 0;}

@class REGLWrapper;
static REGLWrapper* glWrapper = nil;

@interface REGLWrapper : NSObject
@property (retain, nonatomic) EAGLContext *context;
@property (assign, nonatomic) GLuint lastProgram;//记录上一次绘制使用的program
@property (assign, nonatomic) GLuint lastVBO;//记录上一次绘制使用的vertexbuffer object
@property (assign, nonatomic) GLuint lastVEBO;//记录上一次绘制使用的vertex element buffer object
@property (assign, nonatomic) GLuint lastVAO;//记录上一次绘制使用的vertexArrayObject
@property (assign, nonatomic) GLuint lastFramebuffer;//记录上一次绘制使用的framebuffer
@property (assign, nonatomic) GLuint lastTexture;//记录上一次绘制使用的framebuffer
@property (assign, nonatomic) GLuint lastActiveTexSlot;
@property (assign, nonatomic) BlendFuncType lastBlendFuncType;
//@property (assign, nonatomic) InterpolationType lastInterpolationType;
@property (retain, nonatomic) NSMutableDictionary *activeSlotTex;


+(REGLWrapper*)current;
+(void)setCurrent:(REGLWrapper*)current;

+(void)destroy;

-(void)blendFunc:(BlendFuncType)blendFuncType;

-(void)deleteRenderbufferOES:(GLuint)RBO;

-(void)bindFramebufferOES:(GLuint)FBO discardHint:(BOOL)discardHint clear:(BOOL)clear;

-(void)deleteFramebufferOES:(GLuint)FBO;

-(void)bindBuffer:(GLuint)buffer;

-(void)deleteBuffer:(GLuint)buffer;

-(void)bindElementBuffer:(GLuint)buffer;

-(void)deleteElementBuffer:(GLuint)buffer;

-(void)bindVertexArrayOES:(GLuint)VAO;

-(void)deleteVertexArrayOES:(GLuint)VAO;

-(void)bindTexture:(GLuint)tex;

-(void)activeTexture:(GLuint)tex;

-(void)activeTexSlot:(GLuint)activeTex bindTexture:(GLuint)bindTex;

-(void)deleteTexture:(GLuint)tex;

-(REShader*)createShader:(NSString*)name;

-(void)deleteShader:(NSString*)name;

-(void)useProgram:(GLuint)program uniformBlock:(void (^) (void))block;

-(void)deleteProgram:(GLuint)program;

-(void)setImageInterpolation:(InterpolationType)type;

-(void)setImageInterpolationFinished;

- (void)setImageWrapMode:(WrapMode)wrapMode;

#pragma mark- compile shader
@property (retain, nonatomic) NSMutableDictionary *shaderCaches;//用关键字记录所有shader

- (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file preDefines:(NSString*)preDefines;
- (BOOL)linkProgram:(GLuint)prog;
- (BOOL)validateProgram:(GLuint)prog;
@end
