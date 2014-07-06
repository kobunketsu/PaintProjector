//
//  RenderTexture.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RERenderTexture.h"

@interface RERenderTexture()
{
//    GLuint _framebuffer;
}
@end

@implementation RERenderTexture
+ (id)textureWithSize:(CGFloat)size mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode{
    return [RERenderTexture textureWithWidth:size height:size mipmap:interpolationType wrapMode:wrapMode];
}

+ (id)textureWithWidth:(CGFloat)width height:(CGFloat)height mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode{
    RERenderTexture *texture = [[RERenderTexture alloc]init];
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
    [super destroy];

    [[REGLWrapper current] deleteFramebufferOES:_frameBuffer];
}
@end
