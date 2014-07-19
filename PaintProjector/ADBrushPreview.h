//
//  BrushPreview.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "ADPaintCommand.h"
#import "REGLWrapper.h"

#define BrushPreview_Size 256


@protocol ADBrushPreviewDelegate
- (void) willDrawQuadBrush:(ADBrushState*)brushState texture2D:(GLuint)texture alpha:(GLfloat)alpha;
- (void) willDrawSquareQuadWithTexture2DPremultiplied:(GLuint)texture;
- (void) willDrawScreenQuadWithTexture2D:(GLuint)texture Alpha:(GLfloat)alpha;
//吸取颜色的描画在绘制前的准备工作，需要从paintView使用公用的资源
- (void) willPreviewUpdateSmudgeTextureWithBrushState:(ADBrushState*)brushState location:(CGPoint)point inRect:(CGRect)rect ofFBO:(GLuint)fbo ofTexture:(GLuint)texture;
- (id) willGetBrushPreviewDelegate;

//FIXME:以后使用BrushManager整合时去除
- (ADBrushState*)willGetLastBrushState;
- (void)willSetLastBrushState:(ADBrushState*)brushState;
@end

@interface ADBrushPreview : UIView <ADPaintCommandDelegate>
{
}
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) GLuint renderbuffer;
@property (assign, nonatomic) GLuint framebuffer;

@property (retain, nonatomic) RERenderTexture *curPaintedLayerTexture;
@property (retain, nonatomic) RERenderTexture *curLayerTexture;
@property (retain, nonatomic) RERenderTexture *brushTexture;

@property (weak, nonatomic) ADBrush* brush;
@property (retain, nonatomic) ADBrushState* lastBrushState; //记录上一次绘制使用的brushState
@property (retain, nonatomic) ADPaintCommand *paintCommand;
@property (assign, nonatomic) GLuint lastProgram;

 //GL设置
- (void)setupGL;
- (void)tearDownGL;

//使用一个画笔自动创建绘制路径
- (void)createStroke:(ADBrush*)brush;
- (void)deleteStroke;
- (void)refreshStroke;

//重置预览各种设置
- (void)reset;
//重置第一步
- (void)clear;
//准备新笔刷
- (void)prepareBrush:(ADBrush *)brush;

//@property (retain, nonatomic) GLKTextureInfo *texInfo;
@property (retain, nonatomic) RETexture *backgroundTex;
@end
