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
- (EAGLContext*)willGetBrushPreviewContext;
- (GLWrapper*)willGetBrushPreviewGLWrapper;
@end

@interface BrushPreview : UIView <PaintCommandDelegate>
{
}
@property(nonatomic, assign) id delegate;
@property(nonatomic, weak) GLWrapper *glWrapper;
@property(nonatomic, weak) EAGLContext *context;
@property(nonatomic, assign) GLuint renderbuffer;
@property(nonatomic, assign) GLuint framebuffer;
@property(nonatomic, assign) GLuint brushFramebuffer;
@property(nonatomic, assign) GLuint brushTexture;
@property(nonatomic, weak) Brush* brush;
@property(nonatomic, retain) PaintCommand *paintCommand;
@property(nonatomic, assign) GLuint lastProgram;

- (void)setupGL;
- (void)tearDownGL;
- (void)createStroke:(Brush*)brush;
- (void)refresh;

@end
