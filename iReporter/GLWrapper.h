//
//  GLWrapper.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

typedef NS_ENUM(NSInteger, BlendFuncType) {
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

#define SwapGL(a,b){GLuint temp = a; a = b; b = temp;}

#define RELEASE_FRAMEBUFFER(fb) if(fb){glDeleteFramebuffersOES(1, &fb);fb = 0;}
#define RELEASE_RENDERBUFFER(rb) if(rb){glDeleteRenderbuffersOES(1, &rb);rb = 0;}
#define RELEASE_PROGRAM(program) if(program){glDeleteProgram(program);program = 0;}
#define RELEASE_BUFFER(buffer) if(buffer){glDeleteBuffers(1, &buffer);buffer = 0;}
#define RELEASE_VERTEXARRAY(va) if(va){glDeleteVertexArraysOES(1, &va);va = 0;}
#define RELEASE_TEXTURE(tex) if(tex){glDeleteTextures(1, &tex);tex = 0;}

@interface GLWrapper : NSObject
@property(nonatomic, assign) GLuint lastProgram;//记录上一次绘制使用的program
@property(nonatomic, assign) GLuint lastVBO;//记录上一次绘制使用的vertexbuffer object
@property(nonatomic, assign) GLuint lastVEBO;//记录上一次绘制使用的vertex element buffer object
@property(nonatomic, assign) GLuint lastVAO;//记录上一次绘制使用的vertexArrayObject
@property(nonatomic, assign) GLuint lastFramebuffer;//记录上一次绘制使用的framebuffer
@property(nonatomic, assign) GLuint lastTexture;//记录上一次绘制使用的framebuffer
@property(nonatomic, assign) GLuint lastActiveTexSlot;
@property(nonatomic, assign) BlendFuncType lastBlendFuncType;
//@property(nonatomic, assign) InterpolationType lastInterpolationType;
@property(nonatomic, retain) NSMutableDictionary *activeSlotTex;
-(void)blendFunc:(BlendFuncType)blendFuncType;

-(void)bindFramebufferOES:(GLuint)FBO discardHint:(BOOL)discardHint clear:(BOOL)clear;

-(void)bindBuffer:(GLuint)buffer;

-(void)bindElementBuffer:(GLuint)buffer;

-(void)bindVertexArrayOES:(GLuint)VAO;

-(void)bindTexture:(GLuint)tex;

-(void)activeTexture:(GLuint)tex;

-(void)activeTexSlot:(GLuint)activeTex bindTexture:(GLuint)bindTex;

-(void)useProgram:(GLuint)program uniformBlock:(void (^) (void))block;

-(void)setImageInterpolation:(InterpolationType)type;

-(void)setImageInterpolationFinished;
@end
