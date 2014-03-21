//
//  Display.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Display.h"

@implementation Display
+ (Display*)main{
    return main;
}
+ (void)setMain:(Display*)display{
    main = display;
}
- (id)initWithGLKView:(GLKView*)view{
    self = [super init];
    if (self) {
        _view = view;
    }
    return self;
}

- (void)active{
    [self.view bindDrawable];
    
    GLint fbo;
    glGetIntegerv(GL_FRAMEBUFFER_BINDING_OES, &fbo);
    GLWrapper.current.lastFramebuffer = fbo;
    
    //将画面主体移动到中心
    GLfloat offsetToCenter = -170;
    glViewport(0, offsetToCenter, self.view.bounds.size.width, (self.view.bounds.size.height + ToSeeCylinderTopPixelOffset));
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    glEnable(GL_DEPTH_TEST);
    glClear(GL_DEPTH_BUFFER_BIT);
    
    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
}
@end
