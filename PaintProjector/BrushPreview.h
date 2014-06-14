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
- (void) willDrawQuadBrush:(BrushState*)brushState texture2D:(GLuint)texture alpha:(GLfloat)alpha;
- (void) willDrawSquareQuadWithTexture2DPremultiplied:(GLuint)texture;
- (void) willDrawScreenQuadWithTexture2D:(GLuint)texture Alpha:(GLfloat)alpha;
//吸取颜色的描画在绘制前的准备工作，需要从paintView使用公用的资源
- (void) willPreviewUpdateSmudgeTextureWithBrushState:(BrushState*)brushState location:(CGPoint)point inRect:(CGRect)rect ofFBO:(GLuint)fbo ofTexture:(GLuint)texture;
- (id) willGetBrushPreviewDelegate;
@end

@interface BrushPreview : UIView <PaintCommandDelegate>
{
}
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) GLuint renderbuffer;
@property (assign, nonatomic) GLuint framebuffer;
@property (assign, nonatomic) GLuint brushFramebuffer;
@property (assign, nonatomic) GLuint curPaintedLayerFramebuffer;
@property (assign, nonatomic) GLuint curLayerFramebuffer;
@property (assign, nonatomic) GLuint brushTexture;
@property (assign, nonatomic) GLuint curPaintedLayerTexture;
@property (assign, nonatomic) GLuint curLayerTexture;
@property (weak, nonatomic) Brush* brush;
@property (retain, nonatomic) PaintCommand *paintCommand;
@property (assign, nonatomic) GLuint lastProgram;

 //GL设置
- (void)setupGL;
- (void)tearDownGL;

//使用一个画笔自动创建绘制路径
- (void)createStroke:(Brush*)brush;
- (void)deleteStroke;
- (void)refreshStroke;

//重置预览各种设置
- (void)reset;
//重置第一步
- (void)clear;
//准备新笔刷
- (void)prepareBrush:(Brush *)brush;

@property (retain, nonatomic) GLKTextureInfo *texInfo;
@end
