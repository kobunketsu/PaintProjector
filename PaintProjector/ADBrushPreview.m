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

@interface ADBrushPreview()
@property (assign, nonatomic) CGPoint starDrawLocation;
@end

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
    
    //Notification
    //通知程序退出到后台保存数据
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(applicationDidEnterBackground:)
     name:UIApplicationDidEnterBackgroundNotification
     object:nil];
    
    //通知程序返回激活状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(applicationWillEnterForeground:)
     name:UIApplicationWillEnterForegroundNotification
     object:nil];
    
    //通知程序退出激活状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillResignActive:)
     name:UIApplicationWillResignActiveNotification
     object:nil];
    
    //通知程序退出激活状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationDidBecomeActive:)
     name:UIApplicationDidBecomeActiveNotification
     object:nil];
    
    //通知程序即将关闭
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(applicationWillTerminate:)
     name:UIApplicationWillTerminateNotification
     object:nil];
    
}
- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)applicationDidEnterBackground:(id)sender{
    DebugLogSystem(@"applicationDidEnterBackground");
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    [self tearDownGL];
    
    glFinish();
}

- (void)applicationWillEnterForeground:(NSNotification *)note{
    DebugLogSystem(@"applicationWillEnterForeground");
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    [self setupGL];
    
    [self prepareBrush:self.brush];
    
    [self _updateRender];
    
    glFinish();
}

-(void)applicationDidBecomeActive:(id)sender{
    DebugLogSystem(@"applicationDidBecomeActive");
//    //在购买iap时会调用
//    [EAGLContext setCurrentContext:[REGLWrapper current].context];
//    
//    [self setupGL];
//    
//    [self prepareBrush:self.brush];
//    
//    [self _updateRender];
    
    glFinish();
    
}
-(void)applicationWillResignActive:(id)sender{
    DebugLogSystem(@"applicationWillResignActive");
    glFinish();
}

-(void)applicationWillTerminate:(id)sender{
    DebugLogSystem(@"applicationWillTerminate");
}

#pragma mark- UI

#pragma mark- GL
- (void)tearDownGL{
    DebugLogFuncStart(@"tearDownGL");
    [self deleteLayerRenderTexture];
    
    [self deleteTempLayerRenderTexture];
    
    [self deleteBrushRenderTexture];
    
    [self deletePreviewFramebuffer];
    
    [self deleteTextureForSmudgeBrush];
}

- (void)setupGL{
    DebugLogFuncStart(@"setupGL");

    [self createLayerRenderTexture];
    
    [self createTempLayerRenderTexture];
    
    [self createBrushRenderTexture];
    
    [self createPreviewFramebuffer];
    
    [self prepareDrawEnv];
}

- (void)deletePreviewFramebuffer{
    DebugLogFuncStart(@"deletePreviewFramebuffer");
    [[REGLWrapper current] deleteFramebufferOES:_framebuffer];
    
    [[REGLWrapper current] deleteRenderbufferOES:_renderbuffer];
}

- (BOOL)createPreviewFramebuffer{
    DebugLogFuncStart(@"createPreviewFramebuffer");
    DebugLogGLGroupStart(@"createPreviewFramebuffer");
    
	// Generate IDs for a framebuffer object and a color renderbuffer
    if (_framebuffer==0) {
        glGenFramebuffersOES(1, &_framebuffer);
    }
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _framebuffer);
    DebugLogGLLabel(GL_FRAMEBUFFER_OES, _framebuffer, 0, [@"brushPreviewFramebuffer" UTF8String]);
    
    if (_renderbuffer==0) {
        glGenRenderbuffersOES(1, &_renderbuffer);
    }
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, _renderbuffer);
    DebugLogGLLabel(GL_RENDERBUFFER_OES, _renderbuffer, 0, [@"brushPreviewRenderbuffer" UTF8String]);
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
    DebugLogGLGroupEnd();
    
	return YES;
}

- (void)deleteBrushRenderTexture{
    DebugLogFuncStart(@"deleteBrushRenderTexture");
    [self.brushTexture destroy];
    self.brushTexture = nil;
}

- (BOOL)createBrushRenderTexture{
    DebugLogFuncStart(@"createBrushRenderTexture");
    self.brushTexture = [RERenderTexture textureWithName:@"brushPreviewBrushTexture" size:BrushPreview_Size mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    
	return YES;
}

//PaintLayer
- (void)deleteLayerRenderTexture{
    DebugLogFuncStart(@"deleteLayerRenderTexture");
    [self.curLayerTexture destroy];
    self.curLayerTexture = nil;
}

- (BOOL)createLayerRenderTexture{
    DebugLogFuncStart(@"createLayerRenderTexture");
    self.curLayerTexture = [RERenderTexture textureWithName:@"brushPreviewLayerTexture" size:BrushPreview_Size mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
	return YES;
}

//TempLayer
- (void)deleteTempLayerRenderTexture{
    DebugLogFuncStart(@"deleteTempLayerFramebufferTexture");
    [self.curPaintedLayerTexture destroy];
    self.curPaintedLayerTexture = nil;
}

- (BOOL)createTempLayerRenderTexture{
    DebugLogFuncStart(@"createTempLayerRenderTexture");
    self.curPaintedLayerTexture = [RERenderTexture textureWithName:@"brushPreviewPaintedLayerTexture" size:BrushPreview_Size mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
	return YES;
}

//为涂抹笔刷试用创建初始图层
- (void)createTextureForSmudgeBrush{
    DebugLogFuncStart(@"createTextureForSmudgeBrush");
    self.backgroundTex = [RETexture textureFromImageName:@"iap_brushPreviewBg.png" reload:false];
}

- (void)deleteTextureForSmudgeBrush{
    DebugLogFuncStart(@"deleteTextureForSmudgeBrush");
    [self.backgroundTex destroy];
}

- (void) prepareDrawEnv{
    DebugLogGLGroupStart(@"prepareDrawEnv");
    
    //重置混合模式
    glClearColor(125.0/255.0, 130.0 / 255.0, 138.0 / 255.0, 1.0);
    [[REGLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
    glClearColor(0, 0, 0, 0);
    
    glViewport(0, 0, BrushPreview_Size, BrushPreview_Size);
    
    glEnable(GL_BLEND);
    [[REGLWrapper current] blendFunc:BlendFuncAlphaBlend];
   

    DebugLogGLGroupEnd();

}

- (void)clear{
    DebugLogFuncStart(@"clear");

    DebugLogGLGroupStart(@"clear");

    [[REGLWrapper current] bindFramebufferOES: self.brushTexture.frameBuffer discardHint:true clear:true];
    [[REGLWrapper current] bindFramebufferOES:self.curLayerTexture.frameBuffer discardHint:true clear:true];
    [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:true clear:true];
    [[REGLWrapper current] bindFramebufferOES: _framebuffer discardHint:true clear:true];
    [[REGLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER];

    DebugLogGLGroupEnd();

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
        
       [[REGLWrapper current] bindFramebufferOES:self.curLayerTexture.frameBuffer discardHint:true clear:true];
        [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:self.backgroundTex.texID];
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

    DebugLogGLGroupStart(@"createStroke");

    
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

    DebugLogGLGroupEnd();

}

- (void)deleteStroke{
    DebugLogFuncStart(@"deleteStroke");
    self.brush = nil;
    self.paintCommand = nil;
}
#pragma mark- Action Draw
- (void)startDraw:(CGPoint)startPoint{
    DebugLogFuncStart(@"startDraw %@", NSStringFromCGPoint(startPoint));
    self.starDrawLocation = startPoint;
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
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self];
//    location.y = self.bounds.size.height - location.y;
//    [self startDraw:location];
}
//MARK:touchesBegan和touchesMoved之间有比较大的时间间隔
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"touchesMoved current %@ previous %@", NSStringFromCGPoint([(UITouch*)[touches anyObject] locationInView:self]), NSStringFromCGPoint([(UITouch*)[touches anyObject] previousLocationInView:self]));
    UITouch *touch = [touches anyObject];
    //更新触摸点
    CGPoint location = [touch locationInView:self];
    location.y = self.bounds.size.height - location.y;
    CGPoint previousLocation = [touch previousLocationInView:self];
    previousLocation.y = self.bounds.size.height - previousLocation.y;
    //将previousLocation加入到drawPath中，用来连接previousLocation到drawPath.lastObject，绘制完清空path
    
    //将touchesBegan的点连接起来
    if (!self.paintCommand) {
        [self startDraw:location];
    }
    else{
        [self drawFromPoint:previousLocation toPoint:location isTapDraw:false];
    }
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
    DebugLog(@"[ copyCurLayerToCurPaintedLayer ]");

    DebugLogGLGroupStart(@"copyCurLayerToCurPaintedLayer");

	[[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:true clear:true];
    
    [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:self.curLayerTexture.texID];
    

    DebugLogGLGroupEnd();

}

- (void)copyCurPaintedLayerToCurLayer{
    //    DebugLog(@"[ copyCurPaintedLayerToCurLayer ]");
	[[REGLWrapper current] bindFramebufferOES:self.curLayerTexture.frameBuffer discardHint:true clear:true];
    
    [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:self.curPaintedLayerTexture.texID];
}

#pragma mark- PaintCommand Delegate
//执行周期为一个移动操作
- (void) willStartDrawBrushState:(ADBrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped{
//    DebugLog(@"[ willStartDraw ]");

    DebugLogGLGroupStart(@"brushPreview willStartDrawBrushState");

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
        [[REGLWrapper current] bindFramebufferOES:self.brushTexture.frameBuffer discardHint:true clear:true];
    }
    
    DebugLogGLGroupEnd();
}

- (void) willAllocUndoVertexBufferWithPaintCommand:(ADPaintCommand*)cmd{

    DebugLogGLGroupStart(@"brushPreview willAllocUndoVertexBuffer");

    
    size_t count = 0;
    //    DebugLog(@"paintCommand paintPaths count %d", [cmd.paintPaths count]);
    self.brush.curSegmentEndPoint = self.brush.lastSegmentEndPoint = [[cmd.paintPaths objectAtIndex:0] CGPointValue];
    for (int i = 0; i < [cmd.paintPaths count]-1; ++i) {
        
        NSUInteger endIndex = (cmd.paintPaths.count == 1 ? i : (i+1));
        CGPoint startPoint = [[cmd.paintPaths objectAtIndex:i] CGPointValue];
        CGPoint endPoint = [[cmd.paintPaths objectAtIndex:endIndex] CGPointValue];
        
        size_t countSegment = [self.brush numOfSegmentPointFromStart:startPoint toEnd:endPoint brushState:cmd.brushState isTapDraw:cmd.isTapDraw];
        DebugLog(@"calculateDrawCountFromPointToPoint countSegment %lu", countSegment);
        
        self.brush.lastSegmentEndPoint = self.brush.curSegmentEndPoint;
        
        count += countSegment;
    }
    
    //重新分配_VBOBrush用于undo data的缓冲区的大小
    [[REGLWrapper current] bindBuffer: self.brush.paintView.VBOBrushBack];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    
    [[REGLWrapper current] bindBuffer: self.brush.paintView.VBOBrush];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    DebugLog(@"glBufferData realloc count %lu", count);
    
    DebugLogGLGroupEnd();
}

- (void) willBeforeDrawBrushState:(ADBrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isImmediate{
//    DebugLog(@"[ willBeforeDraw ]");

    DebugLogGLGroupStart(@"brushPreview willBeforeDraw");

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
        [[REGLWrapper current] bindFramebufferOES:self.brushTexture.frameBuffer discardHint:true clear:false];
    }
    
    
//    Brush *brush = self.brush;
//    UIColor *color = [brushState.color copy];
//    brushState.color = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self.brush prepareWithBrushState:brushState lastBrushState:self.lastBrushState];
    self.lastBrushState = brushState;
//    brushState.color = color;
    
    DebugLogGLGroupEnd();
}


- (void) willFillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate{

    DebugLogGLGroupStart(@"brushPreview willFillDataFromPoint");

    
    ADBrush *brush = self.brush;
    [brush fillDataFromPoint:start toPoint:end segmentOffset:segmentOffset brushState:brushState isTapDraw:isTapDraw isImmediate:isImmediate];
    
    DebugLogGLGroupEnd();
}

//method can be put in paintingView
- (void)willRenderDataWithBrushId:(NSInteger)brushId isImmediate:(BOOL)isImmediate{

    DebugLogGLGroupStart(@"brushPreview willRenderDraw");
    
    ADBrush *brush = self.brush;
    [brush renderImmediate:isImmediate];
    
    DebugLogGLGroupEnd();
}

- (void)willAfterDraw:(ADBrushState*)brushState refresh:(BOOL)refresh retainBacking:(BOOL)retainBacking{
//    DebugLog(@"[ willAfterDraw ]");

    DebugLogGLGroupStart(@"brushPreview willAfterDraw");

    if (self.brush.brushState.wet > 0) {
//        [self.delegate resetBrush:brushState];
    }
    else{
        //绑定最终显示buffer
        //如果之前尚未调用过copyCurPaintedLayerToCurLayer,导致curLayer是未更新过的,在wrapUndoCommand时调用willAfterDraw会导致错误
        if (retainBacking) {
            [self copyCurLayerToCurPaintedLayer];
        }
        else{
            //do not clear!
            [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:true clear:false];
        }
        
        //
//        glClearColor(125.0/255.0, 130.0 / 255.0, 138.0 / 255.0, 0.0);
//        [[REGLWrapper current] bindFramebufferOES:_framebuffer discardHint:true clear:true];
//        glClearColor(0, 0, 0, 0);
        
        //TODO: screenQuad aspect is square ratio here!
//        [self.delegate willDrawScreenQuadWithTexture2D:_brushTexture Alpha:brushState.opacity];
        [self.delegate willDrawQuadBrush:brushState texture2D:self.brushTexture.texID alpha:brushState.opacity];
    }
    
    if (refresh) {
        [self _updateRender];
    }

    
    DebugLogGLGroupEnd();
}

- (void)willEndDraw:(ADBrushState*)brushState isUndoWrapped:(BOOL)isUndoWrapped{
//    DebugLog(@"[ willEndDraw ]");

    DebugLogGLGroupStart(@"brushPreivew willEndDraw");

    //无论笔刷操作类型，将临时buffer的内容拷贝到当前层
    if (!isUndoWrapped) {
        //        DebugLog(@"!isUndoWrapped copyCurPaintedLayerToCurLayer");
        [self copyCurPaintedLayerToCurLayer];
    }
    
    DebugLogGLGroupEnd();
}

- (void)_updateRender{

    DebugLogGLGroupStart(@"_updateRender Draw Final Framebuffer");

//    glClearColor(0.0, 0.0, 0.0, 0.0);
    [[REGLWrapper current] bindFramebufferOES: _framebuffer discardHint:true clear:true];
    
    [self.delegate willDrawSquareQuadWithTexture2DPremultiplied:self.curPaintedLayerTexture.texID];
    
    [[REGLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER];
    DebugLogGL(@"-----------------------------------Frame End-----------------------------------");
    
    DebugLogGLGroupEnd();
}

#pragma mark- Brush Delegate
- (void) willUpdateSmudgeTextureWithBrushState:(ADBrushState*)brushState location:(CGPoint)point{
    //    DebugLog(@"willUpdateSmudgeTextureWithBrush location %@", NSStringFromCGPoint(point));
    [self.delegate willPreviewUpdateSmudgeTextureWithBrushState:brushState location:point inRect:self.bounds ofFBO:self.curPaintedLayerTexture.frameBuffer ofTexture:self.curPaintedLayerTexture.texID];
}


//?
-(void)willUpdateSmudgeSubPoint{
    [self willAfterDraw:self.brush.brushState refresh:false retainBacking:true];
}

- (void) willBrushColorChanged:(ADBrush *)brush{

}
@end
