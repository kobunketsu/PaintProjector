//
//  BrushPreview.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BrushPreview.h"
#import "PaintingView.h"

@implementation BrushPreview

+ (Class) layerClass
{
	return [CAEAGLLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commitInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        [self commitInit];
    }
    
	return self;
}

-(void)commitInit{
    CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
    eaglLayer.opaque = YES;
    eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)tearDownGL{
    [self deleteBrushFramebuffer];
    
    [self deletePreviewFramebuffer];
}

- (void)setupGL{
//    self.context = [self.delegate willGetBrushPreviewContext];
    [EAGLContext setCurrentContext:[GLWrapper current].context];

    [self createBrushFramebuffer];
    
    [self createPreviewFramebuffer];
    
    [self prepareDrawEnv];
}

- (void)deletePreviewFramebuffer{
    [[GLWrapper current] deleteFramebufferOES:_framebuffer];
    
    [[GLWrapper current] deleteRenderbufferOES:_renderbuffer];
}

- (BOOL)createPreviewFramebuffer{
#if DEBUG
    glPushGroupMarkerEXT(0, "createPreviewFramebuffer");
#endif
    
	// Generate IDs for a framebuffer object and a color renderbuffer
    if (_framebuffer==0) {
        glGenFramebuffersOES(1, &_framebuffer);
    }
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _framebuffer);
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _framebuffer, 0, [@"brushPreviewFramebuffer" UTF8String]);
#endif
    
    if (_renderbuffer==0) {
        glGenRenderbuffersOES(1, &_renderbuffer);
    }
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, _renderbuffer);
#if DEBUG
    glLabelObjectEXT(GL_RENDERBUFFER_OES, _renderbuffer, 0, [@"brushPreviewRenderbuffer" UTF8String]);
#endif
	// This call associates the storage for the current render buffer with the EAGLDrawable (our CAEAGLLayer)
	// allowing us to draw into a buffer that will later be rendered to screen wherever the layer is (which corresponds with our view).
	[[GLWrapper current].context renderbufferStorage:GL_RENDERBUFFER fromDrawable:(id<EAGLDrawable>)self.layer];
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, _renderbuffer);
	
//	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &_backingWidth);
//	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &_backingHeight);
	
	// For this sample, we also need a depth buffer, so we'll create and attach one via another renderbuffer.
    //	glGenRenderbuffersOES(1, &_depthRenderbuffer);
    //	glBindRenderbufferOES(GL_RENDERBUFFER_OES, _depthRenderbuffer);
    //	glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, _backingWidth, _backingHeight);
    //	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, _depthRenderbuffer);
	
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
    
	return YES;
}

- (void)deleteBrushFramebuffer{

    [[GLWrapper current] deleteFramebufferOES:_brushFramebuffer];
    
    [[GLWrapper current] deleteTexture:_brushTexture];
}

- (BOOL)createBrushFramebuffer{
#if DEBUG
    glPushGroupMarkerEXT(0, "createBrushFramebuffer");
#endif
    
    //创建frame buffer
    if (_brushFramebuffer==0) {
        glGenFramebuffersOES(1, &_brushFramebuffer);
    }
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _brushFramebuffer, 0, [@"previewBrushFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    if (_brushTexture==0) {
        glGenTextures(1, &_brushTexture);
    }
    glBindTexture(GL_TEXTURE_2D, _brushTexture);
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _brushTexture, 0, [@"previewBrushTexture" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  BrushPreview_Size, BrushPreview_Size, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
//    glGenerateMipmapOES(GL_TEXTURE_2D);        
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _brushTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
	return YES;
}

- (void) prepareDrawEnv{
#if DEBUG
    glPushGroupMarkerEXT(0, "prepareDrawEnv");
#endif
    
    //重置混合模式
    glClearColor(125.0/255.0, 130.0 / 255.0, 138.0 / 255.0, 1.0);
    [[GLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
    glClearColor(0, 0, 0, 0);
    
    glViewport(0, 0, BrushPreview_Size, BrushPreview_Size);
    
    glEnable(GL_BLEND);
    [[GLWrapper current] blendFunc:BlendFuncAlphaBlend];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)createStroke:(Brush*)brush{
#if DEBUG
    glPushGroupMarkerEXT(0, "createStroke");
#endif
    
    self.brush = brush;
    self.brush.canvasSize = self.bounds.size;//设置临时Canvas,需要恢复paintView的设置
    
    self.paintCommand = [[PaintCommand alloc]initWithBrushState:self.brush.brushState];

    self.paintCommand.delegate = self;
    
    float margin = self.brush.brushState.radius + 10;
    float height = 130;
    [self.paintCommand addPathPointStart:[self glConvertPoint:CGPointMake(margin, height * 0.5)]
                                     End:[self glConvertPoint:CGPointMake(self.frame.size.width * 0.33, height * 0.33)]];
    
    [self.paintCommand addPathPointStart:[self glConvertPoint:CGPointMake(self.frame.size.width * 0.33, height * 0.33)]
                                     End:[self glConvertPoint:CGPointMake(self.frame.size.width * 0.67, height * 0.67)]];
    
    [self.paintCommand addPathPointStart:[self glConvertPoint:CGPointMake(self.frame.size.width * 0.67, height * 0.67)]
                                     End:[self glConvertPoint:CGPointMake(self.frame.size.width - margin, height * 0.5)]];
    
    [self.paintCommand addPathPointStart:[self glConvertPoint:CGPointMake(self.frame.size.width - margin, height * 0.5)]
                                      End:[self glConvertPoint:CGPointMake(self.frame.size.width - margin, height * 0.5)]];
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)refresh{
    self.paintCommand.brushState = self.brush.brushState;
    
    //不显示brushState Smudge特性
    self.paintCommand.brushState.wet = 0;

    [self.paintCommand execute];
}

#pragma mark- PaintCommand Delegate
//执行周期为一个移动操作
- (void) willStartDrawBrushState:(BrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped{
//    DebugLog(@"[ willStartDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willStartDrawBrushState");
#endif
    
    Brush *brush = self.brush;
    [brush startDraw:startPoint];
    
    if (brushState.wet > 0 && !isUndoBaseWrapped) {
        //在curPaintedLayer上直接绘制内容，得到绘制前正确的内容
//        DebugLog(@"[ willStartDraw copyCurLayerToCurPaintedLayer ]");
//        [self copyCurLayerToCurPaintedLayer];
    }
    else{
        //在吸取屏幕颜色的brush吸取颜色之后，切换到brushFramebuffer
        //clear brushFramebuffer
        [[GLWrapper current] bindFramebufferOES: _brushFramebuffer discardHint:true clear:true];
    }
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void) willAllocUndoVertexBufferWithPaintCommand:(PaintCommand*)cmd{
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willAllocUndoVertexBuffer");
#endif
    
    size_t count = 0;
    //    DebugLog(@"paintCommand paintPaths count %d", [cmd.paintPaths count]);
    self.brush.curDrawPoint = self.brush.lastDrawPoint = [[cmd.paintPaths objectAtIndex:0] CGPointValue];
    for (int i = 0; i < [cmd.paintPaths count]-1; ++i) {
        
        NSUInteger endIndex = (cmd.paintPaths.count == 1 ? i : (i+1));
        CGPoint startPoint = [[cmd.paintPaths objectAtIndex:i] CGPointValue];
        CGPoint endPoint = [[cmd.paintPaths objectAtIndex:endIndex] CGPointValue];
        
        size_t countSegment = [self.brush calculateDrawCountFromPoint:startPoint toPoint:endPoint brushState:cmd.brushState isTapDraw:cmd.isTapDraw];
        DebugLog(@"calculateDrawCountFromPointToPoint countSegment %lu", countSegment);
        
        self.brush.lastDrawPoint = self.brush.curDrawPoint;
        //重置累积距离
        if (countSegment > 0) {
            self.brush.curDrawAccumDeltaLength = 0;
        }
        
        count += countSegment;
    }
    
    //重新分配_VBOBrush用于undo data的缓冲区的大小
    [[GLWrapper current] bindBuffer: self.brush.paintView.VBOBrushBack];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    
    [[GLWrapper current] bindBuffer: self.brush.paintView.VBOBrush];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    DebugLog(@"glBufferData realloc count %lu", count);
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void) willBeforeDrawBrushState:(BrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isContinuous{
//    DebugLog(@"[ willBeforeDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willBeforeDraw");
#endif
//    if (brushState.wet > 0) {
//        if (isUndoBaseWrapped) {
//            //直接在_curPaintLayerFramebuffer上进行涂抹绘制
//            //            DebugLog(@"isUndoBaseWrapped command draw wet");
//        }
//        else{
//            //直接在_curLayerFramebuffer上进行涂抹绘制 //need copy templayer to curlayer outside
//            //            DebugLog(@"normal command draw wet");
//        }
//    }
//    else {
//        //        DebugLog(@"normal command draw");
//        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
//        //不进行ClearColor操作，累积绘制
//        if (!isContinuous) {
//            glClearColor(0.0, 0.0, 0.0, 0.0);
//            glClear(GL_COLOR_BUFFER_BIT);
//        }
//    }
    
    Brush *brush = self.brush;
    UIColor *color = [brushState.color copy];
    brushState.color = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [brush prepareWithBrushState:brushState lastBrushState:nil];
    brushState.color = color;
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}


- (void) willFillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId segmentOffset:(int)segmentOffset brushState:(BrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate{
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willFillDataFromPoint");
#endif
    
    Brush *brush = self.brush;
    [brush fillDataFromPoint:start toPoint:end segmentOffset:segmentOffset brushState:brushState isTapDraw:isTapDraw isImmediate:isImmediate];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

//method can be put in paintingView
- (void)willRenderDataWithBrushId:(NSInteger)brushId isImmediate:(BOOL)isImmediate{
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willRenderDraw");
#endif
    
    Brush *brush = self.brush;
    [brush renderImmediate:isImmediate];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)willAfterDraw:(BrushState*)brushState refresh:(BOOL)refresh retainBacking:(BOOL)retainBacking{
//    DebugLog(@"[ willAfterDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willAfterDraw");
#endif
    if (self.brush.brushState.wet > 0) {
        
    }
    else{
        //绑定最终显示buffer
        //如果之前尚未调用过copyCurPaintedLayerToCurLayer,导致curLayer是未更新过的,在wrapUndoCommand时调用willAfterDraw会导致错误
//        if (retainBacking) {
//            [self copyCurLayerToCurPaintedLayer];
//        }
//        else{
//            //do not clear!
//            glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curPaintedLayerFramebuffer);
//        }
        
//        DebugLog(@"draw curLayerTexture %d on curPaintedLayerFramebuffer %d Tex %d Opacity %.1f", _curLayerTexture, _curPaintedLayerFramebuffer, _curPaintedLayerTexture, brushState.opacity);
        
        //_brushTexture 描画后，_curPaintedLayerFramebuffer成为alpha premultiply buffer
//        glViewport(0, 0, self.frame.size.width, self.frame.size.height);
        glClearColor(125.0/255.0, 130.0 / 255.0, 138.0 / 255.0, 1.0);
        [[GLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
        glClearColor(0, 0, 0, 0);
        
        //TODO: screenQuad aspect is square ratio here!
        [self.delegate willDrawScreenQuadWithTexture2D:_brushTexture Alpha:brushState.opacity];
    }
    
    [[GLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)willEndDraw:(BrushState*)brushState isUndoWrapped:(BOOL)isUndoWrapped{
//    DebugLog(@"[ willEndDraw ]");
}
#pragma mark- Ultility
-(CGPoint)glConvertPoint:(CGPoint)point{
    return CGPointMake(point.x, self.frame.size.height - point.y);
    
}

@end
