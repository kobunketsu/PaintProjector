//
//  BrushPreview.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "PaintCommand.h"
#import "GLWrapper.h"

#define BrushPreview_Size 256


@protocol BrushPreviewDelegate
- (void) willDrawScreenQuadWithTexture2D:(GLuint)texture Alpha:(GLfloat)alpha;
- (id) willGetBrushPreviewDelegate;
//- (EAGLContext*)willGetBrushPreviewContext;
@end

@interface BrushPreview : UIView <PaintCommandDelegate>
{
}
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) EAGLContext *context;
@property (assign, nonatomic) GLuint renderbuffer;
@property (assign, nonatomic) GLuint framebuffer;
@property (assign, nonatomic) GLuint brushFramebuffer;
@property (assign, nonatomic) GLuint brushTexture;
@property (weak, nonatomic) Brush* brush;
@property (retain, nonatomic) PaintCommand *paintCommand;
@property (assign, nonatomic) GLuint lastProgram;

- (void)setupGL;
- (void)tearDownGL;
- (void)createStroke:(Brush*)brush;
- (void)refresh;

@end
