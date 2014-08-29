//
//  RenderTexture.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RERenderTexture.h"
#import "ADUltility.h"

@interface RERenderTexture()
{
//    GLuint _framebuffer;
}
@end

@implementation RERenderTexture
+ (id)textureWithName:(NSString *)name size:(CGFloat)size mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode{
    return [RERenderTexture textureWithName:name width:size height:size mipmap:interpolationType wrapMode:wrapMode];
}

+ (id)textureWithName:(NSString *)name width:(CGFloat)width height:(CGFloat)height mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode{
//    DebugLogWarn(@"textureWithName %@", name);
//    DebugLogWarn(@"context:%@", [REGLWrapper current].context);
//    GLint defaultFBO;
//    glGetIntegerv(GL_FRAMEBUFFER_BINDING_OES, &defaultFBO);
//    DebugLogWarn(@"defaultFBO:%u", defaultFBO);
    
    RERenderTexture *texture = [[RERenderTexture alloc]init];
    texture.name = name;

    //使用双贴图方式在多次拷贝贴图时减少阻塞
    //创建frame buffer
    GLuint rt = 0;
    glGenFramebuffersOES(1, &rt);
    [[REGLWrapper current] bindFramebufferOES:rt discardHint:false clear:false];
#if DEBUG
    NSString *rtName = [NSString stringWithFormat:@"FBO %@", texture.name];
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, rt, 0, [rtName UTF8String]);
#endif
    texture.frameBuffer = rt;
    
    //链接renderBuffer对象
    GLuint tex;
    glGenTextures(1, &tex);
    [[REGLWrapper current] bindTexture: tex];
#if DEBUG
    NSString *texName = [NSString stringWithFormat:@"Tex %@", texture.name];
    glLabelObjectEXT(GL_TEXTURE, tex, 0, [texName UTF8String]);
#endif
    [[REGLWrapper current]setImageInterpolation:interpolationType];
    
    [[REGLWrapper current]setImageWrapMode:wrapMode];
    
    //none power of 2 size texture not support mipmap
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    //    self.lastSmudgeTextureSize = self.brushState.radius * 2;
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, tex, 0);
    
    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    glClear(GL_COLOR_BUFFER_BIT);
    
    texture.texID = tex;
    texture.width = width;
    texture.height = height;
    
    [[REGLWrapper current] bindTexture:0];
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return nil;
	}
    
    DebugLogWarn(@"create fbo:%u tex:%u  name:%@", rt, tex, texture.name);
    return texture;
}


- (void)active{
    [[REGLWrapper current] bindFramebufferOES:_frameBuffer discardHint:true clear:true];
    glViewport(0, 0, self.width, self.height);
    
    if (!self.depthBuffer) {
        glDisable(GL_DEPTH_TEST);
    }
    else{
        glEnable(GL_DEPTH_TEST);
    }
}

- (void)destroy{
    DebugLogError(@"destroy fbo:%u tex:%u name:%@", self.frameBuffer, self.texID, self.name);
    [[REGLWrapper current] deleteFramebufferOES:self.frameBuffer];

    //override supper destroy;
    [[REGLWrapper current]deleteTexture:self.texID];
}

- (UIImage*)snapshotImageToViewportSize:(CGSize)viewportSize
{
	[EAGLContext setCurrentContext:[REGLWrapper current].context];//之前有丢失context的现象出现
    [[REGLWrapper current] bindFramebufferOES:self.frameBuffer discardHint:false clear:false];
    UIImage *image = [ADUltility snapshot:nil Context:[REGLWrapper current].context InViewportSize:CGSizeMake(self.width, self.height) ToOutputSize:viewportSize];
    
    return image;
}
@end
