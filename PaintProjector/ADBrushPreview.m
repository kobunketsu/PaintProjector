//
//  BrushPreview.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADBrushPreview.h"
#import "ADPaintView.h"

#import "ADFinger.h"
#import "ADOilBrush.h"

@implementation ADBrushPreview

+ (Class) layerClass
{
	return [CAEAGLLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    
	return self;
}

-(void)commonInit{
    CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
    eaglLayer.opaque = NO;
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
    DebugLogFuncStart(@"tearDownGL");
    [self deleteLayerFramebufferTexture];
    
    [self deleteTempLayerFramebufferTexture];
    
    [self deleteBrushFramebuffer];
    
    [self deletePreviewFramebuffer];
    
    [self deleteTextureForSmudgeBrush];
}

- (void)setupGL{
    DebugLogFuncStart(@"setupGL");
    [EAGLContext setCurrentContext:[REGLWrapper current].context];

    [self createLayerFramebufferTexture];
    
    [self createTempLayerFramebufferTexture];
    
    [self createBrushFramebuffer];
    
    [self createPreviewFramebuffer];
    
    [self prepareDrawEnv];
}

- (void)deletePreviewFramebuffer{
    [[REGLWrapper current] deleteFramebufferOES:_framebuffer];
    
    [[REGLWrapper current] deleteRenderbufferOES:_renderbuffer];
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
	[[REGLWrapper current].context renderbufferStorage:GL_RENDERBUFFER fromDrawable:(id<EAGLDrawable>)self.layer];
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

    [[REGLWrapper current] deleteFramebufferOES:_brushFramebuffer];
    
    [[REGLWrapper current] deleteTexture:_brushTexture];
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
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _brushFramebuffer, 0, [@"brushPreviewBrushFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    if (_brushTexture==0) {
        glGenTextures(1, &_brushTexture);
    }
    glBindTexture(GL_TEXTURE_2D, _brushTexture);
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _brushTexture, 0, [@"brushPreviewBrushTexture" UTF8String]);
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

//PaintLayer
- (void)deleteLayerFramebufferTexture{
    DebugLogFuncStart(@"deleteLayerFramebufferTexture");
    [[REGLWrapper current] deleteFramebufferOES:_curLayerFramebuffer];
    
    [[REGLWrapper current] deleteTexture:_curLayerTexture];
}

- (BOOL)createLayerFramebufferTexture{
    DebugLogFuncStart(@"createLayerFramebufferTexture");
#if DEBUG
    glPushGroupMarkerEXT(0, "createLayerFramebufferTexture");
#endif
    //创建frame buffer
    if (_curLayerFramebuffer==0) {
        glGenFramebuffersOES(1, &_curLayerFramebuffer);
    }
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curLayerFramebuffer);
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _curLayerFramebuffer, 0, [@"brushPreviewLayerFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    if (_curLayerTexture==0) {
        glGenTextures(1, &_curLayerTexture);
    }
    glBindTexture(GL_TEXTURE_2D, _curLayerTexture);
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _curLayerTexture, 0, [@"brushPreviewLayerTexture" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  BrushPreview_Size, BrushPreview_Size, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    //    glGenerateMipmapOES(GL_TEXTURE_2D);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _curLayerTexture, 0);
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

//TempLayer
- (void)deleteTempLayerFramebufferTexture{
    DebugLogFuncStart(@"deleteTempLayerFramebufferTexture");
    [[REGLWrapper current] deleteFramebufferOES:_curPaintedLayerFramebuffer];
    
    [[REGLWrapper current] deleteTexture:_curPaintedLayerTexture];
}

- (BOOL)createTempLayerFramebufferTexture{
    DebugLogFuncStart(@"createTempLayerFramebufferTexture");
#if DEBUG
    glPushGroupMarkerEXT(0, "createTempLayerFramebufferTexture");
#endif
    //创建frame buffer
    if (_curPaintedLayerFramebuffer==0) {
        glGenFramebuffersOES(1, &_curPaintedLayerFramebuffer);
    }
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curPaintedLayerFramebuffer);
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _curPaintedLayerFramebuffer, 0, [@"brushPreviewPaintedLayerFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    if (_curPaintedLayerTexture==0) {
        glGenTextures(1, &_curPaintedLayerTexture);
    }
    glBindTexture(GL_TEXTURE_2D, _curPaintedLayerTexture);
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _curPaintedLayerTexture, 0, [@"brushPreviewPaintedLayerTexture" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  BrushPreview_Size, BrushPreview_Size, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
//    glGenerateMipmapOES(GL_TEXTURE_2D);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _curPaintedLayerTexture, 0);
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

//为涂抹笔刷试用创建初始图层
- (void)createTextureForSmudgeBrush{
    DebugLogFuncStart(@"createTextureForSmudgeBrush");
    self.texInfo = [RETextureManager textureInfoFromImageName:@"AnaDraw_alpha@2x.png" reload:false];
}

- (void)deleteTextureForSmudgeBrush{
    DebugLogFuncStart(@"deleteTextureForSmudgeBrush");
    [RETextureManager deleteTexture:self.texInfo.name];
}

- (void) prepareDrawEnv{
#if DEBUG
    glPushGroupMarkerEXT(0, "prepareDrawEnv");
#endif
    
    //重置混合模式
    glClearColor(125.0/255.0, 130.0 / 255.0, 138.0 / 255.0, 1.0);
    [[REGLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
    glClearColor(0, 0, 0, 0);
    
    glViewport(0, 0, BrushPreview_Size, BrushPreview_Size);
    
    glEnable(GL_BLEND);
    [[REGLWrapper current] blendFunc:BlendFuncAlphaBlend];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)clear{
    DebugLogFuncStart(@"clear");
#if DEBUG
    glPushGroupMarkerEXT(0, "clear");
#endif
    [[REGLWrapper current] bindFramebufferOES: _brushFramebuffer discardHint:true clear:true];
    [[REGLWrapper current] bindFramebufferOES: _curLayerFramebuffer discardHint:true clear:true];
    [[REGLWrapper current] bindFramebufferOES: _curPaintedLayerFramebuffer discardHint:true clear:true];
    [[REGLWrapper current] bindFramebufferOES: _framebuffer discardHint:true clear:true];
    [[REGLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER];
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)prepareBrush:(ADBrush *)brush{
    DebugLogFuncStart(@"prepareBrush");
    self.brush = brush;
    self.brush.canvasSize = self.bounds.size;//设置临时Canvas,需要恢复paintView的设置
    
    //根据特殊的brush类型，进行特殊设置
    //涂抹brush需要准备涂抹的预制层
//    if ([brush isKindOfClass:[Finger class]] ||
//        [brush isKindOfClass:[OilBrush class]] ) {
        [self deleteTextureForSmudgeBrush];
        [self createTextureForSmudgeBrush];
        
       [[REGLWrapper current] bindFramebufferOES: _curLayerFramebuffer discardHint:true clear:true];
        [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:self.texInfo.name];
        [self copyCurLayerToCurPaintedLayer];
        [self _updateRender];
//    }
}

- (void)reset{
    [self clear];
    [self prepareBrush:self.brush];
}

#pragma mark- Auto Draw
- (void)refreshStroke{
    DebugLogFuncUpdate(@"refresh");
    self.paintCommand.brushState = self.brush.brushState;
    
    //不显示brushState Smudge特性
    self.paintCommand.brushState.wet = 0;
    
    [self.paintCommand execute];
}
- (void)createStroke:(ADBrush*)brush{
    DebugLogFuncStart(@"createStroke");
#if DEBUG
    glPushGroupMarkerEXT(0, "createStroke");
#endif
    
    self.brush = brush;
    self.brush.canvasSize = self.bounds.size;//设置临时Canvas,需要恢复paintView的设置
    
    self.paintCommand = [[ADPaintCommand alloc]initWithBrushState:self.brush.brushState];

    self.paintCommand.delegate = self;
    
    float margin = self.brush.brushState.radius + 10;
    float height = 130;
    [self.paintCommand addPathPointStart:[self convertPointToGL:CGPointMake(margin, height * 0.5) fromView:self]
                                     End:[self convertPointToGL:CGPointMake(self.frame.size.width * 0.33, height * 0.33) fromView:self]];
    
    [self.paintCommand addPathPointStart:[self convertPointToGL:CGPointMake(self.frame.size.width * 0.33, height * 0.33) fromView:self]
                                     End:[self convertPointToGL:CGPointMake(self.frame.size.width * 0.67, height * 0.67) fromView:self]];
    
    [self.paintCommand addPathPointStart:[self convertPointToGL:CGPointMake(self.frame.size.width * 0.67, height * 0.67) fromView:self]
                                     End:[self convertPointToGL:CGPointMake(self.frame.size.width - margin, height * 0.5) fromView:self]];
    
    [self.paintCommand addPathPointStart:[self convertPointToGL:CGPointMake(self.frame.size.width - margin, height * 0.5) fromView:self]
                                      End:[self convertPointToGL:CGPointMake(self.frame.size.width - margin, height * 0.5) fromView:self]];
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)deleteStroke{
    DebugLogFuncStart(@"deleteStroke");
    self.brush = nil;
    self.paintCommand = nil;
}
#pragma mark- Action Draw
- (void)startDraw:(CGPoint)startPoint{
    DebugLogFuncStart(@"startDraw %@", NSStringFromCGPoint(startPoint));
    self.paintCommand = [[ADPaintCommand alloc]initWithBrushState:self.brush.brushState];
    self.paintCommand.delegate = self;
    [self.paintCommand drawImmediateStart:startPoint];
}

- (void) drawFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint isTapDraw:(BOOL)isTapDraw{
    DebugLogFuncStart(@"drawFromPoint %@ toPoint %@", NSStringFromCGPoint(startPoint), NSStringFromCGPoint(endPoint));
    if (!self.paintCommand) {
        DebugLogError(@"self.paintCommand nil!");
        return;
    }
    //记录绘图信息
    [self.paintCommand addPathPointStart:startPoint End:endPoint];
    
    //立即绘制
    [self.paintCommand drawImmediateFrom:startPoint to:endPoint];
}

- (void)endDraw{
    DebugLogFuncStart(@"endDraw");
    //Fixme: paintCommand可能导致爆，需要找到具体原因
    if (!self.paintCommand) {
        DebugLogError(@"self.paintCommand nil!");
        return;
    };
    
    [self.paintCommand drawImmediateEnd];
    self.paintCommand = nil;
}

#pragma mark- Action
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"touchesBegan %@", NSStringFromCGPoint([(UITouch*)[touches anyObject] locationInView:self]));
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    location.y = self.bounds.size.height - location.y;
    [self startDraw:location];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"touchesMoved %@", NSStringFromCGPoint([(UITouch*)[touches anyObject] locationInView:self]));
    UITouch *touch = [touches anyObject];
    //更新触摸点
    CGPoint location = [touch locationInView:self];
    location.y = self.bounds.size.height - location.y;
    CGPoint previousLocation = [touch previousLocationInView:self];
    previousLocation.y = self.bounds.size.height - previousLocation.y;
    //将previousLocation加入到drawPath中，用来连接previousLocation到drawPath.lastObject，绘制完清空path
    
    [self drawFromPoint:previousLocation toPoint:location isTapDraw:false];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"touchesEnded %@", NSStringFromCGPoint([(UITouch*)[touches anyObject] locationInView:self]));
    [self endDraw];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"touchesCancelled %@", NSStringFromCGPoint([(UITouch*)[touches anyObject] locationInView:self]));
    [self endDraw];
}

#pragma mark- PaintCommand Delegate
//将临时buffer的内容拷贝到当前层
- (void)copyCurLayerToCurPaintedLayer{
    //    DebugLog(@"[ copyCurLayerToCurPaintedLayer ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "copyCurLayerToCurPaintedLayer");
#endif
	[[REGLWrapper current] bindFramebufferOES: _curPaintedLayerFramebuffer discardHint:true clear:true];
    
    [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:_curLayerTexture];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)copyCurPaintedLayerToCurLayer{
    //    DebugLog(@"[ copyCurPaintedLayerToCurLayer ]");
	[[REGLWrapper current] bindFramebufferOES: _curLayerFramebuffer discardHint:true clear:true];
    
    [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:_curPaintedLayerTexture];
}

#pragma mark- PaintCommand Delegate
//执行周期为一个移动操作
- (void) willStartDrawBrushState:(ADBrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped{
//    DebugLog(@"[ willStartDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willStartDrawBrushState");
#endif
//    DebugLog(@"willStartDrawBrushState %@", [brushState.color colorString]);
    
    ADBrush *brush = self.brush;
    [brush startDraw:startPoint];
    
    if (brushState.wet > 0 && !isUndoBaseWrapped) {
        //在curPaintedLayer上直接绘制内容，得到绘制前正确的内容
        DebugLog(@"[ willStartDraw copyCurLayerToCurPaintedLayer ]");
        [self copyCurLayerToCurPaintedLayer];
    }
    else{
        //在吸取屏幕颜色的brush吸取颜色之后，切换到brushFramebuffer
        //clear brushFramebuffer
        [[REGLWrapper current] bindFramebufferOES: _brushFramebuffer discardHint:true clear:true];
    }
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void) willAllocUndoVertexBufferWithPaintCommand:(ADPaintCommand*)cmd{
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
    [[REGLWrapper current] bindBuffer: self.brush.paintView.VBOBrushBack];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    
    [[REGLWrapper current] bindBuffer: self.brush.paintView.VBOBrush];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    DebugLog(@"glBufferData realloc count %lu", count);
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void) willBeforeDrawBrushState:(ADBrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isImmediate{
//    DebugLog(@"[ willBeforeDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willBeforeDraw");
#endif
    if (brushState.wet > 0) {
        if (isUndoBaseWrapped) {
            //直接在_curPaintLayerFramebuffer上进行涂抹绘制
            //            DebugLog(@"isUndoBaseWrapped command draw wet");
        }
        else{
            //直接在_curLayerFramebuffer上进行涂抹绘制 //need copy templayer to curlayer outside
            //            DebugLog(@"normal command draw wet");
        }
    }
    else {
        //reserve brushFramebuffer
        [[REGLWrapper current] bindFramebufferOES: _brushFramebuffer discardHint:true clear:false];
    }
    
//    Brush *brush = self.brush;
//    UIColor *color = [brushState.color copy];
//    brushState.color = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self.brush prepareWithBrushState:brushState lastBrushState:nil];
//    brushState.color = color;
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}


- (void) willFillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate{
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willFillDataFromPoint");
#endif
    
    ADBrush *brush = self.brush;
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
    
    ADBrush *brush = self.brush;
    [brush renderImmediate:isImmediate];
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)willAfterDraw:(ADBrushState*)brushState refresh:(BOOL)refresh retainBacking:(BOOL)retainBacking{
//    DebugLog(@"[ willAfterDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreview willAfterDraw");
#endif
    if (self.brush.brushState.wet > 0) {
        
    }
    else{
        //绑定最终显示buffer
        //如果之前尚未调用过copyCurPaintedLayerToCurLayer,导致curLayer是未更新过的,在wrapUndoCommand时调用willAfterDraw会导致错误
        if (retainBacking) {
            [self copyCurLayerToCurPaintedLayer];
        }
        else{
            //do not clear!
            [[REGLWrapper current] bindFramebufferOES: _curPaintedLayerFramebuffer discardHint:true clear:false];
        }
        
        //
//        glClearColor(125.0/255.0, 130.0 / 255.0, 138.0 / 255.0, 0.0);
//        [[REGLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
//        glClearColor(0, 0, 0, 0);
        
        //TODO: screenQuad aspect is square ratio here!
//        [self.delegate willDrawScreenQuadWithTexture2D:_brushTexture Alpha:brushState.opacity];
        [self.delegate willDrawQuadBrush:brushState texture2D:_brushTexture alpha:brushState.opacity];
    }
    
    if (refresh) {
        [self _updateRender];
    }

    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)willEndDraw:(ADBrushState*)brushState isUndoWrapped:(BOOL)isUndoWrapped{
//    DebugLog(@"[ willEndDraw ]");
#if DEBUG
    glPushGroupMarkerEXT(0, "brushPreivew willEndDraw");
#endif
    //无论笔刷操作类型，将临时buffer的内容拷贝到当前层
    if (!isUndoWrapped) {
        //        DebugLog(@"!isUndoWrapped copyCurPaintedLayerToCurLayer");
        [self copyCurPaintedLayerToCurLayer];
    }
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)_updateRender{
#if DEBUG
    glPushGroupMarkerEXT(0, "_updateRender Draw Final Framebuffer");
#endif
//    glClearColor(0.0, 0.0, 0.0, 0.0);
    [[REGLWrapper current] bindFramebufferOES: _framebuffer discardHint:true clear:true];
    
    [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:_curPaintedLayerTexture];
    
    [[REGLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER];
    DebugLog(@"-----------------------------------Frame End-----------------------------------");
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

#pragma mark- Brush Delegate
- (void) willUpdateSmudgeTextureWithBrushState:(ADBrushState*)brushState location:(CGPoint)point{
    //    DebugLog(@"willUpdateSmudgeTextureWithBrush location %@", NSStringFromCGPoint(point));
    [self.delegate willPreviewUpdateSmudgeTextureWithBrushState:brushState location:point inRect:self.bounds ofFBO:self.curPaintedLayerFramebuffer ofTexture:self.curPaintedLayerTexture];
}


//?
-(void)willUpdateSmudgeSubPoint{
    [self willAfterDraw:self.brush.brushState refresh:false retainBacking:true];
}
@end