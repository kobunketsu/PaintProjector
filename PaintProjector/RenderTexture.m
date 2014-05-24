//
//  RenderTexture.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RenderTexture.h"

@interface RenderTexture()
{
    GLuint _framebuffer;
}
@end

@implementation RenderTexture
-(id)initWithWidth:(size_t)width height:(size_t)height{
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
    }
    return  self;
}

- (BOOL)create{
    //创建frame buffer

    glGenFramebuffersOES(1, &_framebuffer);
    [[GLWrapper current] bindFramebufferOES:_framebuffer discardHint:false clear:false];
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _framebuffer, 0, [@"framebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    glGenTextures(1, &_texID);
    [[GLWrapper current] bindTexture:_texID];
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _texID, 0, [@"texID" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  self.width, self.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _texID, 0);
    self.colorBuffer = _texID;
    
    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [[GLWrapper current] bindTexture:0];
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
	return YES;
}

- (void)active{
    [[GLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
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

    [[GLWrapper current] deleteFramebufferOES:_framebuffer];
}
@end
