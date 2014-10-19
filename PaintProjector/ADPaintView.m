//
//  PaintingView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>

#import "ADPaintView.h"
#import "ADPaintLayer.h"
#import "ADBackgroundLayer.h"

#import "ADUltility.h"
#import "RETextureManager.h"

#import "ADFinger.h"
#import "ADBucket.h"



#define BUFFER_OFFSET(i) ((char *)NULL + (i))
#define EmptyAlpha 0.01
#define CanvasScaleMinimum 0.2
#define TwoFingerPanGestureTime 0.016

// A class extension to declare private methods
@interface ADPaintView ()
@property (weak, nonatomic) IBOutlet UIView *rootCanvasView;
@property (retain, nonatomic) NSMutableArray *touchPath;  //记录路径

//@property (retain, nonatomic)NSMutableArray *layerFramebuffers;

@property (assign, nonatomic)int multiTouchEndCount;
@property (retain, nonatomic) ADBrushState* lastBrushState; //记录上一次绘制使用的brushState
@property(nonatomic, readwrite) CGPoint location;
@property(nonatomic, readwrite) CGPoint previousLocation;

@property (retain, nonatomic) RERenderTexture *curPaintedLayerTexture;
@property (retain, nonatomic) RERenderTexture *curLayerTexture;
@property (retain, nonatomic) RERenderTexture *undoBaseTexture;
@property (retain, nonatomic) RERenderTexture *brushTexture;
@property (retain, nonatomic) RERenderTexture *backgroundLayerTexture;
@property (retain, nonatomic) RETexture *toTransformImageTex;

@property (retain, nonatomic) ADPaintCommand *curPaintCommand;
@property (assign, nonatomic) BrushVertex* vertexBufferBrush;//每只笔预先分配的用于绘制的顶点数据
@property (assign, nonatomic) BrushVertex* vertexBufferBrushUndo;//每只笔临时分配的用于undo的大内存空间

@property (assign, nonatomic) BOOL lastProgramQuadTransformIdentity;//
@property (assign, nonatomic) GLfloat lastProgramQuadAlpha;
@property (assign, nonatomic) GLint lastProgramQuadTex;
@property (assign, nonatomic) GLfloat lastProgramLayerAlpha;
@property (assign, nonatomic) GLint lastProgramLayerTex;
@property (retain, nonatomic) CADisplayLink *displayLink;

#pragma mark- Transform
@property (assign, nonatomic) CGPoint anchorTranslate;
@property (assign, nonatomic) CGPoint anchorInverseTranslate;
@property (assign, nonatomic) CGPoint imageTranslate;
@property (assign, nonatomic) CGPoint imageSrcTranslate;
@property (assign, nonatomic) CGFloat imageRotate;
@property (assign, nonatomic) CGFloat imageSrcRotate;
@property (assign, nonatomic) CGPoint imageScale;
@property (assign, nonatomic) CGPoint imageSrcScale;
@property (assign, nonatomic) CGPoint canvasTranslate;
@property (assign, nonatomic) CGPoint canvasSrcTranslate;
@property (assign, nonatomic) CGFloat canvasRotate;
@property (assign, nonatomic) CGFloat canvasSrcRotate;
@property (assign, nonatomic) CGFloat canvasScale;
@property (assign, nonatomic) CGFloat canvasSrcScale;
@property (assign, nonatomic) BOOL isRotateSnapFit;
@property (assign, nonatomic) BOOL isTranslateSnapFit;
@property (retain, nonatomic) ADTransformCommand *transformCommand;
#pragma mark- 文件File
- (void)close;

- (void)open;

#pragma mark- OpenGLES
- (void)createFramebufferTextures;

#pragma mark- 工具Tools
- (UIImage*)snapshotPaintToUIImage;
#if DEBUG_VIEW_COLORALPHA
@property (retain, nonatomic) UIImageView* imageView;
@property (retain, nonatomic) UIImageView* debugAlphaView;
#endif

#pragma mark- debug
//@property (retain, nonatomic) UIView *debugView;
@end

@implementation ADPaintView
// Implement this to override the default layer class (which is [CALayer class]).
// We do this so that our view will be backed by a layer that is capable of OpenGL ES rendering.
+ (Class) layerClass
{
	return [CAEAGLLayer class];
}

//+ (BOOL)requiresConstraintBasedLayout{
//    return NO;
//}
//
//- (void)updateConstraints{
//    DebugLog(@"updateConstraints");
//    [super updateConstraints];
//}

// The GL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder {

    DebugLog(@"[ initWithCoder ]");
    if ((self = [super initWithCoder:coder])) {
        //node
        //for open file fade in animation
        self.alpha = 0;
        
        //opengles
		CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;

		eaglLayer.opaque = NO;//使用premuliplied方式和下层进行混合
		// In this application, we want to retain the EAGLDrawable contents after a call to presentRenderbuffer.
		eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
										[NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
		
        eaglLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        //放大时显示出像素
        eaglLayer.magnificationFilter = kCAFilterNearest;
        //缩小时过滤画质
        eaglLayer.minificationFilter = kCAFilterTrilinear;
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawFrame:)];
        self.displayLink.frameInterval = 300;
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
        ADCommandManager * cmdManger = [[ADCommandManager alloc]init];
        cmdManger.delegate = self;
        self.commandManager = cmdManger;
        
        self.touchPath = [[NSMutableArray alloc]init];
        
		// Make sure to start with a cleared buffer
        _state = PaintView_TouchNone;
        
        self.curNumberOfTouch = 0;
		
        //变换Transform
        _canvasTranslate = CGPointZero;
        _canvasRotate = 0;
        _canvasScale = 1.0;
        
        _anchorInverseTranslate = CGPointZero;
        _anchorTranslate = CGPointZero;
        
        _lastProgramQuadAlpha = 0;
        _lastProgramLayerAlpha = 0;
        _lastProgramQuadTex = -1;
        _lastProgramLayerTex = -1;
        
#if DEBUG_VIEW_COLORALPHA
        //        [self createDebugQuadVerticesbuffer];
        //        [self createDebugQuadVerticesbuffer2];
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 512, 128, 128)];
        self.imageView.backgroundColor = [UIColor whiteColor];
        self.imageView.layer.borderColor = [UIColor greenColor].CGColor;
        self.imageView.layer.borderWidth = 2.0;
        [self addSubview:self.imageView];
        
        
        self.debugAlphaView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 384, 128, 128)];
        self.debugAlphaView.backgroundColor = [UIColor blackColor];
        self.debugAlphaView.layer.borderColor = [UIColor greenColor].CGColor;
        self.debugAlphaView.layer.borderWidth = 2.0;
        [self addSubview:self.debugAlphaView];
        
#endif
	}
	
	return self;
}

//move from viewDidLoad to viewWillAppear
-(void)initGL{
    DebugLogFuncStart(@"initGL");
    
//    [GLWrapper destroy];
    [REGLWrapper initialize];
    [[REGLWrapper current].context setDebugLabel:@"PaintView Context"];
    [RETextureManager initialize];
    
//    [EAGLContext setCurrentContext:self.context];
    
    [self loadPrograms];
    
    [self createBuffers];
    
    //重置混合模式 redundent
//    glDisable(GL_DITHER);
//    glDisable(GL_STENCIL_TEST);
//    glDisable(GL_DEPTH_TEST);
//    glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
//    glClearColor(0.0, 0.0, 0.0, 0.0);
    
    glEnable(GL_BLEND);
    

}

- (void)tearDownGL{
    DebugLogFuncStart(@"tearDownGL");
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    [self destroyFrameBufferTextures];
    
    [self destroyVertexBufferObjects];
    
    [self destroyPrograms];
    
    [self destroyTextures];
    
    [RETextureManager destroy];

}

//dealloc调用导致内存增加的问题？
- (void)destroy{
    DebugLogFuncStart(@"destroy");
    self.paintData = nil;
    
    [self.displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    self.displayLink = nil;
}

- (void)dealloc
{
    DebugLogSystem(@"dealloc");
}

-(void)applicationDidBecomeActive{
    DebugLogSystem(@"applicationDidBecomeActive");
}

-(void)applicationWillResignActive{
    DebugLogSystem(@"applicationWillResignActive");
    //remove animation timer
    
    glFinish();
}

-(void)applicationDidEnterBackground{
    DebugLogSystem(@"applicationDidEnterBackground");
    //https://developer.apple.com/library/ios/documentation/3DDrawing/Conceptual/OpenGLES_ProgrammingGuide/ImplementingaMultitasking-awareOpenGLESApplication/ImplementingaMultitasking-awareOpenGLESApplication.html
    //textures models should not be disposed.
    //TODO:some framebuffers can be disposed.
//    [EAGLContext setCurrentContext:[REGLWrapper current].context];
//    [self destroyFrameBufferTextures];
//    glFinish();
}

-(void)applicationWillEnterForeground{
    DebugLogSystem(@"applicationWillEnterForeground");
//    [EAGLContext setCurrentContext:[REGLWrapper current].context];
//    [self createFramebufferTextures];
//    [self setCurLayerIndex:self.curLayerIndex];
//    //刷新renderbuffer, 保证重新创建的内容还原正确
//    [self _updateRender];
//    glFinish();
}

// If our view is resized, we'll be asked to layout subviews.
// This is the perfect opportunity to also update the framebuffer so that it is
// the same size as our display area.
//-(void)layoutSubviews
//{
//    DebugLog(@"[ layoutSubviews ]");
//    [super layoutSubviews];
//}

#pragma mark- Buffer

- (BOOL)createDebugQuadVerticesbuffer{
//    float widthScale = (float)_brush.brushState.radius*2 / (float)self.bounds.size.height;
//    float heightScale = (float)_brush.brushState.radius*2 / (float)self.bounds.size.height;
    float widthScale = 0.5f;
    float heightScale = 0.5f;
    GLKVector2 offset = GLKVector2Make(-0.5, 0.5);
    QuadVertex debugQuadVertices[] = {
        {{1.0f*widthScale + offset.x, -1.0f*heightScale + offset.y, 0.0},{1.0f, 0.0f}},
        {{-1.0f*widthScale + offset.x, -1.0f*heightScale + offset.y, 0.0},{ 0.0f, 0.0f}},
        {{1.0f*widthScale + offset.x, 1.0f*heightScale + offset.y, 0.0},{1.0f, 1.0f}},
        {{1.0f*widthScale + offset.x, 1.0f*heightScale + offset.y, 0.0},{1.0f, 1.0f}},
        {{-1.0f*widthScale + offset.x, -1.0f*heightScale + offset.y, 0.0},{0.0f, 0.0f}},
        {{-1.0f*widthScale + offset.x, 1.0f*heightScale + offset.y, 0.0},{0.0f, 1.0f}}   
    };
    glGenVertexArraysOES(1, &_debugVertexArray);
    [[REGLWrapper current] bindVertexArrayOES: _debugVertexArray];
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _debugVertexArray, 0, "debugVertexArray");
    glGenBuffers(1, &_debugVertexBuffer);
    [[REGLWrapper current] bindBuffer: _debugVertexBuffer];
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _debugVertexBuffer, 0, "debugVertexBuffer");
    glBufferData(GL_ARRAY_BUFFER, sizeof(debugQuadVertices), debugQuadVertices, GL_STREAM_DRAW);
    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);    
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    [[REGLWrapper current] bindVertexArrayOES:0];
    
    return true;
}
- (BOOL)createDebugQuadVerticesbuffer2{
    //    float widthScale = (float)_brush.brushState.radius*2 / (float)self.bounds.size.height;
    //    float heightScale = (float)_brush.brushState.radius*2 / (float)self.bounds.size.height;
    float widthScale = 0.5f;
    float heightScale = 0.5f;
    GLKVector2 offset = GLKVector2Make(0.5, 0.5);    
    QuadVertex debugQuadVertices2[] = {
        {{1.0f*widthScale + offset.x, -1.0f*heightScale + offset.y, 0.0},{1.0f, 0.0f}},
        {{-1.0f*widthScale + offset.x, -1.0f*heightScale + offset.y, 0.0},{ 0.0f, 0.0f}},
        {{1.0f*widthScale + offset.x, 1.0f*heightScale + offset.y, 0.0},{1.0f, 1.0f}},
        {{1.0f*widthScale + offset.x, 1.0f*heightScale + offset.y, 0.0},{1.0f, 1.0f}},
        {{-1.0f*widthScale + offset.x, -1.0f*heightScale + offset.y, 0.0},{0.0f, 0.0f}},
        {{-1.0f*widthScale + offset.x, 1.0f*heightScale + offset.y, 0.0},{0.0f, 1.0f}}
    };
    glGenVertexArraysOES(1, &_debugVertexArray2);
    [[REGLWrapper current] bindVertexArrayOES:_debugVertexArray2];
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _debugVertexArray2, 0, "debugVertexArray2");
    glGenBuffers(1, &_debugVertexBuffer2);
    [[REGLWrapper current] bindBuffer: _debugVertexBuffer2];
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _debugVertexBuffer2, 0, "debugVertexBuffer2");
    glBufferData(GL_ARRAY_BUFFER, sizeof(debugQuadVertices2), debugQuadVertices2, GL_STREAM_DRAW);
    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    [[REGLWrapper current] bindVertexArrayOES:0];
    
    return true;
}

- (BOOL)createScreenQuadVertexbuffer{
    glGenVertexArraysOES(1, &_VAOScreenQuad);
    [[REGLWrapper current] bindVertexArrayOES:_VAOScreenQuad];
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _VAOScreenQuad, 0, "VAOScreenQuad");
    glGenBuffers(1, &_VBOScreenQuad);
//    [[REGLWrapper current] bindBuffer: _vertexBufferScreenQuad];
    [[REGLWrapper current] bindBuffer: _VBOScreenQuad];
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _VBOScreenQuad, 0, "VBOScreenQuad");
    QuadVertex quadVertices[] = {
        {{1, -1, 0.0},{1.0f, 0.0f}},
        {{-1, -1, 0.0},{ 0.0f, 0.0f}},
        {{1, 1, 0.0},{1.0f, 1.0f}},
        {{1, 1, 0.0},{1.0f, 1.0f}},
        {{-1, -1, 0.0},{0.0f, 0.0f}},
        {{-1, 1, 0.0},{0.0f, 1.0f}}
    };
    glBufferData(GL_ARRAY_BUFFER, sizeof(quadVertices), quadVertices, GL_STREAM_DRAW);
    
    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    [[REGLWrapper current] bindVertexArrayOES:0];
    return true;
}

- (BOOL)createQuadVertexbuffer{
    glGenVertexArraysOES(1, &_VAOQuad);
    [[REGLWrapper current] bindVertexArrayOES:_VAOQuad];
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _VAOQuad, 0, "VAOQuad");
    glGenBuffers(1, &_VBOQuad);
    [[REGLWrapper current] bindBuffer: _VBOQuad];
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _VBOQuad, 0, "VBOQuad");
    //scale quadVertices by view size
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    //(0,h)--(w,h)
    //  |      |
    //(0,0)--(w,0)
    //(-1, 2 * ratio -1)
    CGFloat ratio = h / w;
    float widthScale; float heightScale;
    if (h > w) {
        widthScale = 2 * ratio - 1;
        heightScale = 1;
    }
    else if (h < w){
        heightScale = 2 * ratio - 1;
        widthScale = 1;
    }
    else{
        widthScale = heightScale = 1;
    }

    QuadVertex quadVertices[] = {
        {{1.0f * widthScale, -1.0f * heightScale, 0.0},{1.0f, 0.0f}},
        {{-1.0f, -1.0f * heightScale, 0.0},{ 0.0f, 0.0f}},
        {{1.0f * widthScale, 1.0f * heightScale, 0.0},{1.0f, 1.0f}},
        {{1.0f * widthScale, 1.0f * heightScale, 0.0},{1.0f, 1.0f}},
        {{-1.0f, -1.0f * heightScale, 0.0},{0.0f, 0.0f}},
        {{-1.0f, 1.0, 0.0},{0.0f, 1.0f}}
    };
    
//    QuadVertex quadVertices[] = {
//        {{w, 0, 0.0},{1.0f, 0.0f}},
//        {{0, 0, 0.0},{ 0.0f, 0.0f}},
//        {{w, h, 0.0},{1.0f, 1.0f}},
//        {{w, h, 0.0},{1.0f, 1.0f}},
//        {{0, 0, 0.0},{0.0f, 0.0f}},
//        {{0, h, 0.0},{0.0f, 1.0f}}
//    };
    glBufferData(GL_ARRAY_BUFFER, sizeof(quadVertices), quadVertices, GL_STREAM_DRAW);

    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);    
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    [[REGLWrapper current] bindVertexArrayOES:0];
    
    //setup projMatrix
//    float size = MAX(self.bounds.size.width, self.bounds.size.height);
//    _vertexQuadProjMatrix = GLKMatrix4MakeOrtho(0, size, 0, size, 0.01, 1000);
    
    return true;
}

- (BOOL)createFinalFramebufferTexture{
    DebugLogFuncStart(@"createFinalFramebufferTexture");
	// Generate IDs for a framebuffer object and a color renderbuffer
    if (_finalFramebuffer==0) {
        glGenFramebuffersOES(1, &_finalFramebuffer);
    }
	[[REGLWrapper current] bindFramebufferOES: _finalFramebuffer discardHint:false clear:false];
    DebugLogGLLabel(GL_FRAMEBUFFER_OES, _finalFramebuffer, 0, [@"finalFramebuffer" UTF8String]);
    if (_finalRenderbuffer==0) {
        glGenRenderbuffersOES(1, &_finalRenderbuffer);
    }
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, _finalRenderbuffer);
    DebugLogGLLabel(GL_RENDERBUFFER_OES, _finalRenderbuffer, 0, [@"finalRenderbuffer" UTF8String]);
	// This call associates the storage for the current render buffer with the EAGLDrawable (our CAEAGLLayer)
	// allowing us to draw into a buffer that will later be rendered to screen wherever the layer is (which corresponds with our view).
	[[REGLWrapper current].context renderbufferStorage:GL_RENDERBUFFER fromDrawable:(id<EAGLDrawable>)self.layer];
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, _finalRenderbuffer);
	
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
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    return YES;
}
- (void)deleteFinalFramebufferTexture{
    DebugLogFuncStart(@"deleteFinalFramebufferTexture");
    [[REGLWrapper current] deleteFramebufferOES:_finalFramebuffer];
    
    [[REGLWrapper current] deleteRenderbufferOES:_finalRenderbuffer];
    
}
- (BOOL)createBrushRenderTexture{
    DebugLogFuncStart(@"createBrushRenderTexture");
    self.brushTexture = [RERenderTexture textureWithName:@"brushTexture" size:self.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];

	return YES;
}
- (void)deleteBrushRenderTexture{
    DebugLogFuncStart(@"deleteBrushFramebufferTexture");
    [self.brushTexture destroy];
    self.brushTexture = nil;
}

- (void)setVBOBrushForImmediate{
    DebugLogFuncStart(@"setVBOBrushForImmediate");
    //恢复分配_VBOBrush用于普通描画的缓冲区大小, 顺序不能交换，保证最后bind VBOBrush
    [[REGLWrapper current] bindBuffer: _VBOBrushBack];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * _vertexBrushMaxCount, NULL, GL_STREAM_DRAW);
    [[REGLWrapper current] bindBuffer: _VBOBrush];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * _vertexBrushMaxCount, NULL, GL_STREAM_DRAW);
    
    //测试
    self.curVertexBrushCount = _vertexBrushMaxCount;
    
    DebugLog(@"glBufferData vertex count %zu", _vertexBrushMaxCount);
}

- (void)createBuffers{
    DebugLogFuncStart(@"createBuffers");
    //创建GLObject not related to view size
    [self createBrushVertexbuffer];
    
    [self createQuadVertexbuffer];
    
    [self createScreenQuadVertexbuffer];
}

- (BOOL)createBrushVertexbuffer{
    DebugLogFuncStart(@"createBrushVertexbuffer");
    if(_vertexBufferBrush == NULL){
        _vertexBufferBrush = malloc(256 * sizeof(BrushVertex));
    }
    _vertexBrushMaxCount = 256;
    _vertexBrushUndoMaxCount = 1;
    
    //创建VAO
    glGenVertexArraysOES(1, &_VAOBrush);
    [[REGLWrapper current] bindVertexArrayOES:_VAOBrush];
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _VAOBrush, 0, "VAOBrush");
    //生成VBO
    if (!_VBOBrush) {
        glGenBuffers(1, &_VBOBrush);
    }
    
    //将buffer数据绑定VBO
    [[REGLWrapper current] bindBuffer: _VBOBrush];
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _VBOBrush, 0, "VBOBrush");
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * _vertexBrushMaxCount, NULL, GL_STREAM_DRAW);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 4, GL_FLOAT, GL_FALSE, sizeof(BrushVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(BrushVertex), BUFFER_OFFSET(16));
    [[REGLWrapper current] bindVertexArrayOES:0];
    
    
    //创建VAO
    glGenVertexArraysOES(1, &_VAOBrushBack);
    [[REGLWrapper current] bindVertexArrayOES:_VAOBrushBack];
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _VAOBrushBack, 0, "VAOBrushBack");
    if (!_VBOBrushBack) {
        glGenBuffers(1, &_VBOBrushBack);
    }
    
    //将buffer数据绑定Back VBO
    [[REGLWrapper current] bindBuffer: _VBOBrushBack];
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _VBOBrushBack, 0, "VBOBrushBack");
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * _vertexBrushMaxCount, NULL, GL_STREAM_DRAW);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 4, GL_FLOAT, GL_FALSE, sizeof(BrushVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(BrushVertex), BUFFER_OFFSET(16));
    [[REGLWrapper current] bindVertexArrayOES:0];
    
    return YES;
}


- (void)createFramebufferTextures
{
    DebugLogFuncStart(@"createFramebufferTextures");
    glClearColor(0, 0, 0, 0);
//    DebugLogGLSnapshotStart
    [self createFinalFramebufferTexture];
    //从paintData创建显示用的layer texture
    [self createLayerRenderTextures];
    //创建临时绘制层
    [self createTempLayerRenderTexture];
    
    [self createBrushRenderTexture];
    
    [self createUndoBaseRenderTexture];
//    DebugLogGLSnapshotEnd
}

- (void)destroyFrameBufferTextures{
    DebugLogFuncStart(@"destroyFrameBufferTextures");
    
    //final
    [self deleteFinalFramebufferTexture];
    
    //layers
    [self deleteLayerRenderTextures];
    
    //current paint layer
    [self deleteTempLayerRenderTexture];
    
    //brush temp
    [self deleteBrushRenderTexture];
    
    //undo
    [self deleteUndoBaseRenderTexture];
}

- (void)loadPrograms{
    DebugLogFuncStart(@"loadPrograms");
    //确保不重复load两次
    if (_programQuad == 0) {
        [self loadShaderQuad];
        
        [[REGLWrapper current] useProgram:_programQuad uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
            _lastProgramQuadTransformIdentity = true;
        }];
    }
    
//    if (_programBackgroundLayer == 0) {
//        _programBackgroundLayer = [self loadShaderBackgroundLayer];
//    }

    if (_programPaintLayerBlendModeNormal == 0) {
        _programPaintLayerBlendModeNormal = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeNormal"];
        
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeNormal uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
//            _lastProgramLayerNormalTransformIdentity = true;
        }];
    }
    
    if (_programPaintLayerBlendModeMultiply == 0) {
        _programPaintLayerBlendModeMultiply = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeMultiply"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeMultiply uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeScreen == 0) {
        _programPaintLayerBlendModeScreen = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeScreen"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeScreen uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeOverlay == 0) {
        _programPaintLayerBlendModeOverlay = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeOverlay"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeOverlay uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeDarken == 0) {
        _programPaintLayerBlendModeDarken = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeDarken"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeDarken uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeLighten == 0) {
        _programPaintLayerBlendModeLighten = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeLighten"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeLighten uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeColorDodge == 0) {
        _programPaintLayerBlendModeColorDodge = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeColorDodge"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeColorDodge uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeColorBurn == 0) {
        _programPaintLayerBlendModeColorBurn = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeColorBurn"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeColorBurn uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeSoftLight == 0) {
        _programPaintLayerBlendModeSoftLight = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeSoftLight"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeSoftLight uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeHardLight == 0) {
        _programPaintLayerBlendModeHardLight = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeHardLight"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeHardLight uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeDifference == 0) {
        _programPaintLayerBlendModeDifference = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeDifference"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeDifference uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeExclusion == 0) {
        _programPaintLayerBlendModeExclusion = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeExclusion"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeExclusion uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeHue == 0) {
        _programPaintLayerBlendModeHue = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeHue"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeHue uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeSaturation == 0) {
        _programPaintLayerBlendModeSaturation = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeSaturation"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeSaturation uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeColor == 0) {
        _programPaintLayerBlendModeColor = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeColor"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeColor uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
    if (_programPaintLayerBlendModeLuminosity == 0) {
        _programPaintLayerBlendModeLuminosity = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeLuminosity"];
        [[REGLWrapper current] useProgram:_programPaintLayerBlendModeLuminosity uniformBlock:^{
            glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        }];
    }
    
#if DEBUG_VIEW_COLORALPHA
//    [self loadShaderQuadDebugAlpha];
//    [self loadShaderQuadDebugColor];
#endif
}

- (void)destroyPrograms{
    DebugLogFuncStart(@"destroyPrograms");
    
    [[REGLWrapper current] deleteProgram:_programQuad];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeColor];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeColorBurn];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeColorDodge];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeDarken];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeDifference];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeExclusion];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeHardLight];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeHue];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeLighten];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeLuminosity];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeMultiply];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeNormal];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeOverlay];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeSaturation];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeScreen];
    [[REGLWrapper current] deleteProgram:_programPaintLayerBlendModeSoftLight];
    
#if DEBUG_VIEW_COLORALPHA
//    RELEASE_PROGRAM(_programQuadDebugAlpha);
//    RELEASE_PROGRAM(_programQuadDebugColor);
#endif
}

- (void)prewarmShaders{
    for (ADBrush *brush in self.brushTypes) {
        [RemoteLog log:[NSString stringWithFormat:@"prewarmShaders brushState %d", brush.brushState.classId]];
        ADPaintCommand *paintCommand = [[ADPaintCommand alloc]initWithBrushState:brush.brushState];
        paintCommand.delegate = self;
        [paintCommand prewarm];
    }
    //完成prewarm之后恢复bufferData的大小
    [self setVBOBrushForImmediate];
    
    //清除prewarm的结果
    [[REGLWrapper current] bindFramebufferOES:self.brushTexture.frameBuffer discardHint:true clear:true];
    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)destroyVertexBufferObjects
{
    DebugLogFuncStart(@"destroyBuffers");
    
    [[REGLWrapper current] deleteBuffer:_VBOBrush];
    
    [[REGLWrapper current] deleteBuffer:_VBOBrushBack];
    
    [[REGLWrapper current] deleteVertexArrayOES:_VAOBrush];
    
    [[REGLWrapper current] deleteVertexArrayOES:_VAOBrushBack];
    
    [[REGLWrapper current] deleteBuffer:_VBOQuad];
    
    [[REGLWrapper current] deleteVertexArrayOES:_VAOQuad];
    
    [[REGLWrapper current] deleteBuffer:_VBOScreenQuad];
    
    [[REGLWrapper current] deleteVertexArrayOES:_VAOScreenQuad];
    
    [[REGLWrapper current] deleteBuffer:_debugVertexBuffer];
    
    [[REGLWrapper current] deleteVertexArrayOES:_debugVertexArray];
    
    [[REGLWrapper current] deleteBuffer:_debugVertexBuffer2];
    
    [[REGLWrapper current] deleteVertexArrayOES:_debugVertexBuffer2];
    
}

- (void)destroyTextures{

    [self.toTransformImageTex destroy];
    self.toTransformImageTex = nil;

    [RETextureManager destroyTextures];
}

// Reads previously recorded points and draws them onscreen. This is the Shake Me message that appears when the application launches.
//- (void) playback:(NSMutableArray*)recordedPaths
//{
//	NSData*				data = [recordedPaths objectAtIndex:0];
//	CGPoint*			point = (CGPoint*)[data bytes];
//	NSUInteger			count = [data length] / sizeof(CGPoint),
//						i;
//	
//	// Render the current path
//	for(i = 0; i < count - 1; ++i, ++point)
//		[self renderLineFromPoint:*point toPoint:*(point + 1)];
//	
//	// Render the next path after a short delay 
//	[recordedPaths removeObjectAtIndex:0];
//	if([recordedPaths count])
//		[self performSelector:@selector(playback:) withObject:recordedPaths afterDelay:0.01];
//}


#pragma mark- Touch

- (void)eyeDropBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint location = [self.firstTouch locationInView:self];
	location.y = self.bounds.size.height - location.y;
    self.location = location;
}

// Handles the start of a touch
//FIXME:在快速绘制中，有可能出现上一个用于paint的UITouch还没有调用touchesEnd,新的UITouch调用touchesBegan, 导致firstTouch,paintTouch还是使用的上一个UITouch的数据的问题
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"touchesBegan! touches count:%d", [touches count]);
    [super touchesBegan:touches withEvent:event];
    
    self.curNumberOfTouch += touches.count;
    
    //不在Touch发生时马上开始绘制，不修改paintView.state
    if (self.firstTouch == NULL) {
        self.firstTouch = [touches anyObject];
    }
    
    //判断是否是触摸边缘切换全屏状态
//    location = [self.firstTouch locationInView:self];
//    DebugLog(@"firstTouch location %@", NSStringFromCGPoint(location));
//    
//    CGFloat toggleFullScreenRegionHeight = 10;
//    if (location.y >= self.frame.size.height - toggleFullScreenRegionHeight ||
//        location.y <= toggleFullScreenRegionHeight) {
//        self.state = PaintView_TouchToggleFullScreen;
//        DebugLogWarn(@"TouchToggleFullScreen");
//    }
    
    
    //可能会被后续动作修改状态
    switch (self.state) {
        case PaintView_TouchEyeDrop:{
            [self.delegate willStartUIEyeDrop];
            CGPoint point = [self.delegate willGetEyeDropLocation];
            [self eyeDropColor:point];
            break;
        }
        case PaintView_TouchNone:{
            self.paintTouch = nil;
            
            CGPoint location = [self.firstTouch locationInView:self];
            location.y = self.bounds.size.height - location.y;
            self.previousLocation = self.location = location;
            
            //清空之前可能在PaintView_TouchNone状态下留下的笔迹
            [self.touchPath removeAllObjects];
            
            break;
        }
        case PaintView_TouchPaint:{
            CGPoint location = [self.firstTouch locationInView:self];
            location.y = self.bounds.size.height - location.y;
            self.previousLocation = self.location = location;
            
            //清空之前可能在PaintView_TouchNone状态下留下的笔迹
            [self.touchPath removeAllObjects];
            
            break;
        }
        default:{
            CGPoint location = [self.firstTouch locationInView:self];
            location.y = self.bounds.size.height - location.y;
            self.previousLocation = location;
            break;
        }
    }
    

}

// Handles the continuation of a touch.
- (void)drawCachedTouchPath{
    //绘制所有PaintingView_NormalToPaint的path
    if (self.touchPath.count > 1) {
        for (int i = 0; i < self.touchPath.count - 1; ++i) {
            DebugLog(@"draw confirmed stored path count:%d index:%d", self.touchPath.count, i);
            CGPoint startPoint = [[self.touchPath objectAtIndex:i] CGPointValue];
            CGPoint endPoint = [[self.touchPath objectAtIndex:i+1] CGPointValue];
            DebugLog(@"startPoint x:%.2f y:%.2f endPoint x:%.2f y:%.2f", startPoint.x, startPoint.y, endPoint.x, endPoint.y);
            
            if (i==0) {
                [self startDraw:startPoint isTapDraw:false];
            }
            
            [self drawFromPoint:startPoint toPoint:endPoint isTapDraw:false];
        }
    }
    else if (self.touchPath.count == 1){
        CGPoint startPoint = [[self.touchPath objectAtIndex:0] CGPointValue];
        CGPoint endPoint = startPoint;
        [self startDraw:startPoint isTapDraw:false];
        [self drawFromPoint:startPoint toPoint:endPoint isTapDraw:false];
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    DebugLogSystem(@"[ touchesMoved! touches count:%d ]", [touches count]);
    [super touchesMoved:touches withEvent:event];
    
    //只接受在touchesBegan注册的UITouch事件处理
    if (![touches containsObject:self.firstTouch]) {
        return;
    }
    
    switch (self.state) {
        //在未确认是绘制触摸前，记录确定的一个触摸点(firstTouch)位置，避免将双触摸点判断为一个触摸点的两个连续的移动点
        case PaintView_TouchNone:{
//            DebugLog(@"state PaintView_TouchNone");
        
            CGPoint location = [self.firstTouch locationInView:self];
            location.y = self.bounds.size.height - location.y;
            self.location = location;
            //记录下操作Path，在后期如果判断为绘图，则将路径补偿画出
            [self.touchPath addObject:[NSValue valueWithCGPoint:location]];
            
            //满足当前触摸数的情况下，进入绘制式
            if (self.curNumberOfTouch == 1) {
                if([self enterState:PaintView_TouchPaint]){
                    self.paintTouch = self.firstTouch;
                    
                    [self drawCachedTouchPath];
                };
            }
            
            break;
        }
        case PaintView_TouchPaint:{
//            Debuglog(@"state PaintView_TouchPaint");
            //更新触摸点
            CGPoint location = [self.paintTouch locationInView:self];
            location.y = self.bounds.size.height - location.y;
            self.location = location;
            CGPoint previousLocation = [self.paintTouch previousLocationInView:self];
            previousLocation.y = self.bounds.size.height - previousLocation.y;
            self.previousLocation = previousLocation;
            
            //将previousLocation加入到drawPath中，用来连接previousLocation到drawPath.lastObject，绘制完清空path
            if(self.touchPath.count > 0){
                CGPoint lastDrawPathPoint = [self.touchPath.lastObject CGPointValue];
                
                [self drawFromPoint:lastDrawPathPoint toPoint:previousLocation isTapDraw:false];
                
                [self.touchPath removeAllObjects];
                DebugLog(@"draw confirmed stored path done. remove drawPath");
            }
            
            [self drawFromPoint:previousLocation toPoint:location isTapDraw:false];
            
//                DebugLog(@"draw update layer transform translate x:%.2f y:%.2f", self.transform.tx, self.transform.ty);
//            }
            
            if(!self.paintTouch){
                //如果绘图笔触覆盖UI面板， 隐藏UI面板，绘制结束后显示恢复UI面板的显示
                [self.delegate willHideUIPaintArea:true touchPoint:[self.paintTouch locationInView:self]];
            }
            break;
        }
        case PaintView_TouchEyeDrop:{
            if (self.firstTouch == NULL) {
                self.firstTouch = [touches anyObject];
                [self.delegate willStartUIEyeDrop];
            }
            
            //更新触摸点
            //        location = [self.eyeDropTouch locationInView:self];
            //        location.y = self.bounds.size.height - location.y;
            CGPoint point = [self.delegate willGetEyeDropLocation];
            
            [self eyeDropColor:point];
            break;
            
        }
        default:
            break;
    }
}

- (void)handleTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //不响应变换操作
    switch (self.state) {
        case PaintView_TouchEyeDrop:{
            if([touches containsObject:self.firstTouch]){
                self.firstTouch = nil;
                self.paintTouch = nil;

                [self.delegate willEndUIEyeDrop];
                if ([self enterState:PaintView_TouchNone]) {
                }
            }
            break;
        }
        case PaintView_TouchPaint:{
            if([touches containsObject:self.paintTouch]){
                CGPoint location = [self.paintTouch locationInView:self];
//                [self.delegate willHideUIPaintArea:false touchPoint:location];
                location.y = self.bounds.size.height - location.y;
                self.location = location;
                CGPoint previousLocation = [self.paintTouch previousLocationInView:self];
                previousLocation.y = self.bounds.size.height - previousLocation.y;
                self.previousLocation = previousLocation;
                
//                DebugLog(@"previousLocation x:%.0f y:%.0f", previousLocation.x, previousLocation.y);
//                [self draw:false];
                [self endDraw];
                
                self.paintTouch = nil;
                self.firstTouch = nil;
                DebugLog(@"touchesEnded PaintView_TouchPaint remove drawPath, set paintTouch nil!");

                
                if ([self enterState:PaintView_TouchNone]) {
                }
            }
            else{
//                DebugLog(@"test");
            }
            break;
        }
            
        case PaintView_TouchNone:
        {
            DebugLog(@"touchesEnded PaintView_TouchNone remove drawPath, set firstTouch nil!");
            if([touches containsObject:self.firstTouch]){
                self.firstTouch = nil;
                self.paintTouch = nil;
                [self.touchPath removeAllObjects];
            }
            else{
//                DebugLog(@"test");
            }
            break;
        }
        case PaintView_TouchTransformCanvas:
        case PaintView_TouchTransformLayer:
        case PaintView_TouchTransformImage:
        case PaintView_TouchQuickTool:
        {
            if([touches containsObject:self.firstTouch]){
                self.firstTouch = nil;
                self.paintTouch = nil;
            }
            
            break;
        }
            
        default:
            break;
    }

}
// Handles the end of a touch event when the touch is a tap.
//有手指结束按住状态，不能用来判断操作的完成
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    DebugLogSystem(@"[ touchesEnded! touches count:%d ]", [touches count]);
    [super touchesEnded:touches withEvent:event];
    
    self.curNumberOfTouch -= touches.count;

    [self handleTouchesEnded:touches withEvent:event];
}

// Handles the end of a touch event.
//手势会触发touchesCancelled
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	// If appropriate, add code necessary to save the state of the application.
	// This application is not saving state.
    DebugLogSystem(@"touchesCancelled! touches count:%d", [touches count]);
    [super touchesCancelled:touches withEvent:event];
    
    self.curNumberOfTouch -= touches.count;

    [self handleTouchesEnded:touches withEvent:event];
}

//实现按更新时间来绘制的操作(喷枪)
- (void) drawFrame:(CADisplayLink *)sender{
    if(self.brush.brushState.isAirbrush){
        if(self.state == PaintView_TouchPaint){
            DebugLog(@"drawFrame");
            //在已经把待确认的路径绘制完毕后开始每帧更新绘制
            if (self.paintTouch != NULL) {
                //更新触摸点
                CGPoint location = [self.paintTouch locationInView:self];
                location.y = self.bounds.size.height - location.y;
                self.location = location;
                CGPoint previousLocation = [self.paintTouch previousLocationInView:self];
                previousLocation.y = self.bounds.size.height - previousLocation.y;
                self.previousLocation = previousLocation;
//                DebugLog(@"previousLocation x:%.0f y:%.0f", previousLocation.x, previousLocation.y);
                
                [self draw:false];
            }
        }
    }
}

- (void)setCurNumberOfTouch:(NSInteger)curNumberOfTouch{
    _curNumberOfTouch = MAX(0, curNumberOfTouch);
//    DebugLogWarn(@"setCurNumberOfTouch %d", _curNumberOfTouch);
}

#pragma mark-
- (void)updateRender{
    [self _updateRender];
}

- (void)_updateRender{
    DebugLog(@"UpdateRender layer count %d", self.paintData.layers.count);

    DebugLogGLGroupStart(@"_updateRender Draw Final Framebuffer");

    [[REGLWrapper current] bindFramebufferOES: _finalFramebuffer discardHint:true clear:false];

    //使用Disable 不需要Clear
//    glClear(GL_COLOR_BUFFER_BIT);
    
    //绘制背景层
    [self drawBackgroundLayer];
    
    //合成图层
    for (int i = 0; i < self.paintData.layers.count; ++i) {
        [self drawPaintLayerAtIndex:i];
    }

//    DebugLog(@"_updateRender willEndDraw glFinish. presentRenderbuffer.");
    //call glFlush internally
    [[REGLWrapper current].context presentRenderbuffer:GL_RENDERBUFFER_OES];
    DebugLogGL(@"-----------------------------------Frame End-----------------------------------");

    DebugLogGLGroupEnd();
}


//交换前一次绘制内容作为绘制源内容
//- (void)swapCurLayerFramebufferTexture{
//    GLuint tempFrameBuffer = _curLayerFramebuffer;
//    _curLayerFramebuffer = _curPaintedLayerFramebuffer;
//    _curPaintedLayerFramebuffer = tempFrameBuffer;
//    
//    GLuint tempTexture = _curLayerTexture;
//    _curLayerTexture = _curPaintedLayerTexture;
//    _curPaintedLayerTexture = tempTexture;
//    
//    DebugLog(@"swap Framebuffer:%d to Painted %d Texture:%d to Painted %d", _curLayerFramebuffer, _curPaintedLayerFramebuffer, _curLayerTexture, _curPaintedLayerTexture);
//}

//将临时buffer的内容拷贝到当前层
- (void)copyCurLayerToCurPaintedLayer{
    DebugLogGLGroupStart(@"copyCurLayerToCurPaintedLayer");

	[[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:true clear:true];
    
    [self drawSquareQuadWithTexture2DPremultiplied:self.curLayerTexture.texID];
    
    DebugLogGLGroupEnd();
}

- (void)copyCurPaintedLayerToCurLayer{
    DebugLogFuncStart(@"copyCurPaintedLayerToCurLayer");
	[[REGLWrapper current] bindFramebufferOES:self.curLayerTexture.frameBuffer discardHint:true clear:true];
    
    [self drawSquareQuadWithTexture2DPremultiplied:self.curPaintedLayerTexture.texID];
}

- (void)copyScreenBufferToTexture:(GLuint)texture{
    [[REGLWrapper current] bindTexture:texture];
    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, 1024, 1024);
}

//-(void)drawRect:(CGRect)rect{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    if (self.isUndoDrawing) {//用上次描画touch down按下时保存下来的image覆盖context
//        CGImageRef undoImage = [self.undoStack lastUndoImage];
//        CGContextDrawImage(ctx, self.bounds, undoImage);
//        self.isUndoDrawing = false;
//    }
//    else if (self.isRedoDrawing) {
//        CGImageRef redoImage = [self.redoStack pop];
//        if (redoImage!=nil) {
//            [self.undoStack push:redoImage];
////            CGContextDrawImage(cacheContext, self.bounds, redoImage);//保证下次touchBegan tempImage取道最新的cacheContext
//            CGContextDrawImage(ctx, self.bounds, redoImage);
//
//        }
//        self.isRedoDrawing = false;
//
//        //禁止redo功能
//        if ([self.redoStack size]==0) {
//            [self.delegate redoDisabled];
//        }
//
//    }
//}



- (void)eyeDropColor:(CGPoint)point{
    
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    [[REGLWrapper current] bindFramebufferOES: _finalFramebuffer discardHint:false clear:false];
    
    GLubyte *data = (GLubyte*)malloc(4 * sizeof(GLubyte));
    // Read pixel data from the framebuffer
    glPixelStorei(GL_PACK_ALIGNMENT, 4);
    

    glReadPixels(point.x, point.y, 1, 1, GL_RGBA, GL_UNSIGNED_BYTE, data);
    CGFloat components[4];
    components[0] = (float)data[0] / 255.0f;
    components[1] = (float)data[1] / 255.0f;
    components[2] = (float)data[2] / 255.0f;
    components[3] = 1.0f;
//    DebugLog(@"eyeDropColor R:%.2f G:%.2f B:%.2f A:%.2f", components[0], components[1], components[2], components[3]);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, components);
    UIColor* uiColor = [UIColor colorWithCGColor:color];
    [self.brush setColor:uiColor];
//    DebugLog(@"eyeDropColor location x:%.2f y:%.2f", location.x, location.y);
    [self.delegate willEyeDroppingUI:CGPointMake(point.x, self.bounds.size.height - point.y) Color:uiColor];
    CGColorSpaceRelease(colorSpaceRef);
    CGColorRelease(color);
    free(data);
}


- (void)setBrush:(ADBrush *)brush{
    if([_brush isEqual:brush]){
        return;
    }
    
    [self.delegate willChangeFromBrush:_brush toBrush:brush];
    _brush = brush;
    [self.delegate willChangeUIBrush:brush];
}

#pragma mark- Draw
- (BOOL)enterState:(PaintingViewState)state{
    DebugLogFuncStart(@"enterState %d", state);
    if (state == PaintView_TouchPaint) {
        ADPaintLayer *layer = (ADPaintLayer *)self.paintData.layers[self.curLayerIndex];
        if (!layer.visible) {
            DebugLogWarn(@"enter state PaintView_TouchPaint failed on invisible layer");
            return NO;
        }
    }
    else if(state == PaintView_TouchEyeDrop){
        //如果进入吸管时当前笔刷为橡皮的画，不进入state
        if ([self.brush isKindOfClass:[ADEraser class]]) {
            return NO;
        }
    }
    
    _state = state;
    return YES;
}

- (void)prepareDrawEnv{
    //设置renderbuffer
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _finalRenderbuffer);
    
    glViewport(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    //保证切换到当前canvase的大小
    for (ADBrush* brush in self.brushTypes) {
        brush.canvasSize = self.bounds.size;
    }
}

- (void)startDraw:(CGPoint)startPoint isTapDraw:(BOOL)isTapDraw{
    DebugLog(@"startDraw! isTapDraw %i", isTapDraw);

    //UI
    [self.delegate willEnableDirectEyeDropper:!self.brush.brushState.isAirbrush];
    
    //brushPreview will set other canvas
    [self.brush setPaintView:self];
    
    //command
//    DebugLog(@"PaintCommand _brushId %d", self.brush.brushState.classId);
    _curPaintCommand = [[ADPaintCommand alloc]initWithBrushState:self.brush.brushState];
    self.curPaintCommand.delegate = self;
    self.curPaintCommand.isTapDraw = isTapDraw;
    [self.curPaintCommand drawImmediateStart:startPoint];
}

- (void) draw:(BOOL)isTapDraw{
//    DebugLog(@"drawFromPoint %@ toPoint %@", NSStringFromCGPoint(previousLocation), NSStringFromCGPoint(location));
    [self drawFromPoint:self.previousLocation toPoint:self.location isTapDraw:isTapDraw];
}

- (void) drawFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint isTapDraw:(BOOL)isTapDraw{
//    DebugLog(@"drawFromPoint %@ toPoint %@", NSStringFromCGPoint(startPoint), NSStringFromCGPoint(endPoint));
    //记录绘图信息
    
    [self.curPaintCommand addPathPointStart:startPoint End:endPoint];
    
    //立即绘制
    [self.curPaintCommand drawImmediateFrom:startPoint to:endPoint];
    
    //代理
    [self.delegate willTouchMoving:endPoint];
    
#if DEBUG_VIEW_COLORALPHA
    //小窗口检测buffer内容
    if(self.brush.brushState.wet > 0){
        [self glSmudgeTexToUIImage];
    }
#endif
}

- (void)endDraw{
    //Fixme: curPaintCommand可能导致爆，需要找到具体原因
    if (self.curPaintCommand == nil) {
//        [RemoteLog log:@"self.curPaintCommand nil"];
//        DebugLogError(@"self.curPaintCommand nil");
        return;
    };
    
    [self.curPaintCommand drawImmediateEnd];
    
    //绘制命令完成后加入命令处理队列
    //    DebugLog(@"willEndDraw brushId %d", self.curPaintCommand.brushState.classId);
    [self.commandManager addCommand:self.curPaintCommand];
}

-(void)swapVBO{
    //Double Buffering 交换VBO
    SwapGL(self.VBOBrush, self.VBOBrushBack)
    SwapGL(self.VAOBrush, self.VAOBrushBack)
    
//    [[REGLWrapper current] bindVertexArrayOES: self.VAOBrush];
//    [[REGLWrapper current] bindBuffer:self.VBOBrush];
}

#pragma mark- Paint Command Delegate
//执行周期为一个移动操作
- (void) willStartDrawBrushState:(ADBrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped{
//    DebugLog(@"[ willStartDraw ]");
    DebugLogGLGroupStart(@"paintView willStartDraw brushId %d", brushState.classId);
    
    ADBrush *brush = self.brushTypes[brushState.classId];
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
    DebugLogGLGroupStart(@"paintView willAllocUndoVertexBuffer");

    
    if (cmd.paintPaths.count==0) {
        return;
    }
//    DebugLog(@"paintCommand paintPaths count %d", [cmd.paintPaths count]);
    
    size_t count = 0;
    ADBrush *brush = self.brushTypes[cmd.brushState.classId];
    brush.curSegmentEndPoint = brush.lastSegmentEndPoint = [cmd.paintPaths[0] CGPointValue];
    
    if (cmd.paintPaths.count == 1) {
//        DebugLogWarn(@"cmd.paintPaths.count == 1");
        CGPoint startPoint = [cmd.paintPaths[0] CGPointValue];
        CGPoint endPoint = [cmd.paintPaths[0] CGPointValue];
        size_t countSegment = [brush numOfSegmentPointFromStart:startPoint toEnd:endPoint brushState:cmd.brushState isTapDraw:cmd.isTapDraw];
        brush.lastSegmentEndPoint = brush.curSegmentEndPoint;
        
        count += countSegment;
    }
    else{
//        DebugLogWarn(@"cmd.paintPaths.count %d", cmd.paintPaths.count);
        for (int i = 0; i < [cmd.paintPaths count]-1; ++i) {
            CGPoint startPoint = [cmd.paintPaths[i] CGPointValue];
            CGPoint endPoint = [cmd.paintPaths[i+1] CGPointValue];
            size_t countSegment = [brush numOfSegmentPointFromStart:startPoint toEnd:endPoint brushState:cmd.brushState isTapDraw:cmd.isTapDraw];
            brush.lastSegmentEndPoint = brush.curSegmentEndPoint;
            
            count += countSegment;
        }
    }
    
    //不需要描画，退出内存分配
    if (count == 0) {
        return;
    }
    
    //测试记录一共需要多少点
    self.curVertexBrushCount = count;
    
    //重新分配_VBOBrush用于undo data的缓冲区的大小
    [[REGLWrapper current] bindBuffer: _VBOBrushBack];
    //TODO:GL_INVALID_VALUE
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
    
    [[REGLWrapper current] bindBuffer: _VBOBrush];
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * count, NULL, GL_STREAM_DRAW);
//    [RemoteLog log:[NSString stringWithFormat:@"glBufferData realloc count %lu", count]];
    //    self.allocVertexCount = count;

    DebugLogGLGroupStart(@"glBufferData count %zu", count);
    DebugLogGLGroupEnd();
    
    DebugLogGLGroupEnd();

}


//修正brushState内容
-(void)modifyBrushState:(ADBrushState*)brushState{
    brushState.isOpacityLocked = ((ADPaintLayer*)(self.paintData.layers[self.paintData.curLayerIndex])).opacityLock;
}

//执行周期为一个移动单位
- (void) willBeforeDrawBrushState:(ADBrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isImmediate{
//    DebugLog(@"[ willBeforeDraw ]");

    DebugLogGLGroupStart(@"paintView willBeforeDraw");

    if (brushState.wet > 0) {
        if (isUndoBaseWrapped) {
            //直接在_curPaintLayerFramebuffer上进行涂抹绘制
//            DebugLog(@"isUndoBaseWrapped command draw wet");
        }
        else{
        }
    }
    else {
        //reserve brushFramebuffer
        [[REGLWrapper current] bindFramebufferOES:self.brushTexture.frameBuffer discardHint:true clear:false];
    }
    
    [self modifyBrushState:brushState];
    
    ADBrush *brush = self.brushTypes[brushState.classId];
    [brush prepareWithBrushState:brushState lastBrushState:self.lastBrushState];
    self.lastBrushState = brushState;
    
    DebugLogGLGroupEnd();
}

- (void) willFillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate{
//    DebugLog(@"[ willRenderLineFromPoint ]");

//    DebugLogGLGroupStart(@"paintView willFillData");
    
    ADBrush *brush = self.brushTypes[brushId];
    [brush fillDataFromPoint:start toPoint:end segmentOffset:segmentOffset brushState:brushState isTapDraw:isTapDraw isImmediate:isImmediate];
//    DebugLogGLGroupEnd();
}

//method can be put in paintingView
- (void)willRenderDataWithBrushId:(NSInteger)brushId isImmediate:(BOOL)isImmediate{

    DebugLogGLGroupStart(@"paintView willRenderDraw");
    
    ADBrush *brush = self.brushTypes[brushId];
    [brush renderImmediate:isImmediate];
    
    DebugLogGLGroupEnd();
}

- (void)willAfterDraw:(ADBrushState*)brushState refresh:(BOOL)refresh retainBacking:(BOOL)retainBacking{
//    DebugLog(@"[ willAfterDraw ]");

    DebugLogGLGroupStart(@"paintView willAfterDraw");

    if (brushState.wet > 0) {
        
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
        
//        DebugLog(@"draw curLayerTexture %d on curPaintedLayerFramebuffer %d Tex %d Opacity %.1f", _curLayerTexture, _curPaintedLayerFramebuffer, _curPaintedLayerTexture, brushState.opacity);
        
        //_brushTexture 描画后，_curPaintedLayerFramebuffer成为alpha premultiply buffer
        //图层透明度锁定
//        ADPaintLayer *layer = self.paintData.layers[_curLayerIndex];
//        CGFloat opacity = brushState.opacity * (layer.opacityLock ? -1 : 1);
        CGFloat opacity = brushState.opacity;
        
        //none premultiplied data saved to layerTexture
        [self drawQuad:_VAOQuad brush:brushState texture2D:self.brushTexture.texID alpha:opacity];
    }
    
    if (refresh) {
        [self _updateRender];
    }
    
    DebugLogGLGroupEnd();
}

- (void)willEndDraw:(ADBrushState*)brushState isUndoWrapped:(BOOL)isUndoWrapped{
//    DebugLog(@"[ willEndDraw ]");

    DebugLogGLGroupStart(@"paintView willEndDraw");

    //无论笔刷操作类型，将临时buffer的内容拷贝到当前层
    if (!isUndoWrapped) {
//        DebugLog(@"!isUndoWrapped copyCurPaintedLayerToCurLayer");
        [self copyCurPaintedLayerToCurLayer];
    }
    
    //更新UI
    [self.delegate willLayerDirtyAtIndex:_curLayerIndex];
    
    [self.delegate willEnableDirectEyeDropper:true];
    
    DebugLogGLGroupEnd();
}

#pragma mark- Command Manager Delegate
- (void)finishUndoRedo{
    [self setVBOBrushForImmediate];
    
    [self _updateRender];
}
- (void)willBeginUndo{

    DebugLogGLGroupStart(@"willBeginUndo");

    [EAGLContext setCurrentContext:[REGLWrapper current].context];

    //清空实际图层，重新进行绘制
	[[REGLWrapper current] bindFramebufferOES:self.curLayerTexture.frameBuffer discardHint:false clear:true];
    DebugLogGLGroupEnd();
}

- (void)willFinishUndo{

    DebugLogGLGroupStart(@"WillFinishUndo");

    [self finishUndoRedo];
    DebugLogGLGroupEnd();
    
}

- (void)willBeginRedo{

    DebugLogGLGroupStart(@"willBeginRedo");

    [EAGLContext setCurrentContext:[REGLWrapper current].context];
//    //undo之前强制执行并清空命令
//    glFinish();
    DebugLogGLGroupEnd();
}

- (void)willFinishRedo{

    DebugLogGLGroupStart(@"willFinishRedo");

    [self finishUndoRedo];
    DebugLogGLGroupEnd();
}
- (void) willEnableRedo:(BOOL)enable{
    [self.delegate willEnableUIRedo:enable];
}

- (void) willEnableUndo:(BOOL)enable{
    [self.delegate willEnableUIUndo:enable];
}


- (void) willBeginWrapUndoBaseCommand{
//    DebugLog(@"willBeginWrapUndoBaseCommand draw _undoBaseTexture to _curPaintedLayerFramebuffer");
//    [[REGLWrapper current] bindFramebufferOES: _curPaintedLayerFramebuffer];
//    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
//    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
//    glClear(GL_COLOR_BUFFER_BIT);
//    [self drawScreenQuadWithTexture2DPremultiplied:_undoBaseTexture];
}

//将当前临时layerTexture画到undoBaseTexture中作为基准
- (void) willEndWrapUndoBaseCommand{
    DebugLogFuncStart(@"willWrapUndoBaseCommand draw _curPaintedLayerTexture to _undoBaseFramebuffer");

    DebugLogGLGroupStart(@"willWrapUndoBaseCommand");

    
    //将tempLayerFramebuffer的结果Copy到undoBaseFramebuffer
    [[REGLWrapper current] bindFramebufferOES:self.undoBaseTexture.frameBuffer discardHint:true clear:true];

    [self drawSquareQuadWithTexture2DPremultiplied:self.curPaintedLayerTexture.texID];

    ADUndoBaseCommand *cmd = [[ADUndoBaseCommand alloc]initWithTexture:self.undoBaseTexture.texID];
    cmd.delegate = self;
    [self.commandManager wrapCommand:cmd];
    
    [self copyCurLayerToCurPaintedLayer];
    
    [self setVBOBrushForImmediate];

    //MARK:修正两次打开图层后绘图出错的问题
    [self copyCurPaintedLayerToCurLayer];
    
    DebugLogGLGroupEnd();
}

#pragma mark- Undo Redo
- (BOOL)createUndoBaseRenderTexture{
    DebugLogFuncStart(@"createUndoBaseFramebufferTexture");
    
    self.undoBaseTexture = [RERenderTexture textureWithName:@"undoBaseTexture" size:self.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    
    return YES;
}
- (void)deleteUndoBaseRenderTexture{
    DebugLogFuncStart(@"deleteUndoBaseFramebufferTexture");
    [self.undoBaseTexture destroy];
    self.undoBaseTexture = nil;
}

/*机制 记录形式为: UndoMaxCount = 4
 (PaintOp)UndoBaseImage PaintOp PaintOp PaintOp PaintOp(UndoCheckPointImage<-> UndoBaseImage) PaintOp PaintOp PaintOp PaintOp(Current <->UndoCheckPointImage)
 */
- (void)undoDraw{
    [self.commandManager undo];
}

- (void)redoDraw{
    [self.commandManager redo];
}

- (void)resetUndoRedo{
    DebugLogFuncStart(@"resetUndoRedo");
    //重置undo
    [self.commandManager clearAllCommands];
    [self willEndWrapUndoBaseCommand];
}
//- (void)undoDrawClearCacheImages{
//    NSString *fileName;NSString *newPath;
//    NSFileManager *manager = [NSFileManager defaultManager];
//    NSString* path = [Ultility applicationDocumentDirectory];
//	NSString *undoImagePath = [path stringByAppendingPathComponent:@"/undoImages/"];
//
//    for(fileName in [manager enumeratorAtPath:undoImagePath]){
//        newPath = [undoImagePath stringByAppendingPathComponent:fileName];
//        [manager removeItemAtPath:newPath error:NULL];
//    }
//}
//- (void)undoDrawPushImage{
//    NSString* undoImagesDir = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:@"undoImages/"];
//    NSFileManager *fileManager= [NSFileManager defaultManager];
//    if(![fileManager fileExistsAtPath:undoImagesDir])
//        if(![fileManager createDirectoryAtPath:undoImagesDir withIntermediateDirectories:YES attributes:nil error:NULL])
//            DebugLog(@"Error: Create folder failed %@", undoImagesDir);
//
//    NSString* path = [NSString stringWithFormat:@"undoImages/image%d.png", _undoCount++];
//    [self.undoStack push:path];
//}

#pragma mark- Paint Frame
- (void)uploadLayerDataAtIndex:(int)index{
    DebugLog(@"uploadLayerDataAtIndex %d", index);
    GLuint layerFramebuffer;
    if (_curLayerIndex == index) {
        layerFramebuffer = self.curPaintedLayerTexture.frameBuffer;
    }
    else{
        layerFramebuffer = ((RERenderTexture*)self.layerTextures[index]).frameBuffer;
    }

    ADPaintLayer* layer = self.paintData.layers[index];
    layer.data = nil;
//    @autoreleasepool {
    UIImage* image = [self snapshotFramebufferToUIImage:layerFramebuffer];
        //data是none premultiplied
        layer.data = (NSData*)UIImagePNGRepresentation(image);//+4m MALLOC_LARGE
        image = nil;
//    }
//    layer.data = [self dataSnapshotFromFramebuffer:layerFramebuffer];
}

- (void)uploadLayerDatas{
    [self uploadLayerDatas:false];
}

- (void)uploadLayerDatas:(BOOL)forceUpdate{
    DebugLogFuncStart(@"uploadLayerDatas");
    //更新层的内容
    for (int i =0; i < self.paintData.layers.count; ++i) {
        ADPaintLayer* layer = [self.paintData.layers objectAtIndex:i];
        if (forceUpdate) {
            [self uploadLayerDataAtIndex:i];
        }
        else{
            if (layer.dirty == true) {
                [self uploadLayerDataAtIndex:i];
                layer.dirty = false;
            }
        }

    }
    DebugLog(@"uploadLayerDatas completed!");
}

- (void)setOpenData:(ADPaintData*)data{
    //如果data是nil, self.paintData无法保存paintDoc的data数据
    self.paintData = data;//paintDoc own paintData
    _state = PaintView_TouchNone;
    [self open];
}

//打开文件
- (void)open{
    DebugLogFuncStart(@"open doc");
    self.contentScaleFactor = 1.0;
    
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    //before opengles
    _viewGLSize = MAX(self.bounds.size.width, self.bounds.size.height);
    glViewport(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    //删除之前的buffer
    [self destroyFrameBufferTextures];
    [self createFramebufferTextures];
    //预编译部分Shader
    [self prewarmShaders];
    
    if (self.paintData.version.floatValue >= 1.11) {
        [self setCurLayerIndex:self.paintData.curLayerIndex];
    }
    else{
        [self setCurLayerIndex:self.paintData.layers.count - 1];
    }

    //重置撤销
    [self resetUndoRedo];

    //第一次presentRenderbuffer,在此之前prewarm所有的shader
    [self _updateRender];
    
    [self.delegate didOpenPaintDoc];
}

- (void)close{
    
}
#pragma mark- 绘图命令代理Command Delegate
- (void) willExecuteOpenCommand:(ADOpenCommand*)openCommand{
    //do nothing
}
//将undobase的基点贴图纹理绘制到当前临时图层上(临时贴图和原始贴图都已经被clear)
- (void) willExecuteUndoBaseCommand:(ADUndoBaseCommand*)command{
    DebugLog(@"willExecuteUndoBaseCommand  copy command.texture to curPaintedLayer");
    
    DebugLogGLGroupStart(@"willExecuteUndoBaseCommand");

    [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:true clear:true];

    [self drawSquareQuadWithTexture2DPremultiplied:command.texture];
    
    //将临时buffer的内容拷贝到当前层
    if(!command.isUndoBaseWrapped){
        DebugLog(@"!command.isUndoBaseWrapped copyCurPaintedLayerToCurLayer");
        [self copyCurPaintedLayerToCurLayer];
    }
    DebugLogGLGroupEnd();
}



#pragma mark- 笔刷代理 Brush Delegate (Refresh UI)
- (void) willBrushColorChanged:(ADBrush *)brush{
    //剔除brushPreview brush
    NSRange range = [brush.name rangeOfString:@"brushPreview"];
    if (range.location != NSNotFound) {
        return;
    }
    
    [self.delegate willChangeUIPaintColor:brush.brushState.color];
}

- (void) willUpdateSmudgeTextureWithBrushState:(ADBrushState *)brushState location:(CGPoint)point{
//    DebugLog(@"willUpdateSmudgeTextureWithBrush location %@", NSStringFromCGPoint(point));
    [self willUpdateSmudgeTextureWithBrushState:brushState location:point inRect:self.bounds ofFBO:self.curPaintedLayerTexture.frameBuffer ofTexture:self.curPaintedLayerTexture.texID ofVAO:_VAOQuad];
}

- (void) willUpdateSmudgeTextureWithBrushState:(ADBrushState*)brushState location:(CGPoint)point inRect:(CGRect)rect ofFBO:(GLuint)fbo ofTexture:(GLuint)texture ofVAO:(GLuint)vao{
    ADBrush *brush = self.brushTypes[brushState.classId];
    
    if (!brush.smudgeTexture) {
        [brush createSmudgeFramebuffers];
    }
    
    //    [brush swapSmudgeFramebuffers];
    
    NSUInteger copyRadius = (NSUInteger)brushState.radius;
    
    DebugLogGLGroupStart(@"Get BrushSmudgeTexture From CurrentLayer");
    
    //    使用DrawQuad的方式代替glCopyTexSubImage2D
    //    [[REGLWrapper current] bindFramebufferOES: _curPaintedLayerFramebuffer];
    //
    //    [[REGLWrapper current] bindTexture:brush.smudgeTexture];
    //
    //    //如果笔刷涂抹半径发生变化，重置贴图空间
    ////    if (brush.lastSmudgeTextureSize != copyRadius * 2) {
    ////        DebugLog(@"brush lastSmudgeTextureSize %d to %d", brush.lastSmudgeTextureSize, copyRadius * 2);
    ////        brush.lastSmudgeTextureSize = copyRadius * 2;
    //
    //        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, copyRadius*2, copyRadius*2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    ////    }
    //    int locationX = point.x - copyRadius;
    //    int locationY = point.y - copyRadius;
    //    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, locationX, locationY, copyRadius*2, copyRadius*2);
    
    
    
    [[REGLWrapper current] bindTexture:brush.smudgeTexture.texID];
    
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, copyRadius*2, copyRadius*2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    
    //save last state
    GLuint lastVAO = [REGLWrapper current].lastVAO;
    GLuint lastProgram = [REGLWrapper current].lastProgram;
    BlendFuncType lastBlendFuncType = [REGLWrapper current].lastBlendFuncType;
    
    glViewport(0, 0, copyRadius*2, copyRadius*2);
    [[REGLWrapper current] bindFramebufferOES:brush.smudgeTexture.frameBuffer discardHint:true clear:true];
    
    [[REGLWrapper current] bindVertexArrayOES:vao];
    
    [[REGLWrapper current] useProgram:_programQuad uniformBlock:nil];
    
    GLKMatrix4 transform = GLKMatrix4MakeScale((float)rect.size.width / (float)(copyRadius*2), (float)rect.size.height / (float)(copyRadius*2), 1.0);
    
    float x =  -(float)(point.x - rect.size.width * 0.5) / (float)(rect.size.width * 0.5);
    float y =  -(float)(point.y - rect.size.height * 0.5) / (float)(rect.size.height * 0.5);
    transform = GLKMatrix4Translate(transform, x, y, 0);
    
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, transform.m);
    _lastProgramQuadTransformIdentity = false;
    
    if (self.lastProgramQuadTex != 0) {
        glUniform1i(_texQuadUniform, 0);
        self.lastProgramQuadTex = 0;
    }
    
    if (self.lastProgramQuadAlpha != 1) {
        glUniform1f(_alphaQuadUniform, 1);
        self.lastProgramQuadAlpha = 1;
    }
    
    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:texture];
    
    [[REGLWrapper current] blendFunc:BlendFuncAlphaBlendPremultiplied];
    
    glDrawArrays(GL_TRIANGLES, 0, 6);
    
    //恢复到之前的状态
    glViewport(0, 0, rect.size.width, rect.size.height);
    
    [[REGLWrapper current] bindFramebufferOES:fbo discardHint:true clear:false];
    
    [[REGLWrapper current] bindVertexArrayOES:lastVAO];
    
    [[REGLWrapper current] useProgram:lastProgram uniformBlock:nil];
    
    [[REGLWrapper current] blendFunc:lastBlendFuncType];
    
    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:brush.smudgeTexture.texID];
    
    DebugLogGLGroupEnd();
}

//?
-(void)willUpdateSmudgeSubPoint{
    [self willAfterDraw:self.brush.brushState refresh:false retainBacking:true];
}

#if DEBUG_VIEW_COLORALPHA
- (void)glSmudgeTexToUIImage
{
    //	[EAGLContext setCurrentContext:_context];//之前有丢失context的现象出现

    [[REGLWrapper current] bindFramebufferOES: self.brush.smudgeFramebuffer];
    
    size_t width = roundf(self.brush.brushState.radius) * 2;
    size_t height = width;
    
    //    DebugLog(@"width:%d height%d", width, height);
    
    NSInteger myDataLength = width * height * 4;
    
    // allocate array and read pixels into it.
    GLubyte *buffer = (GLubyte *) malloc(myDataLength);
    
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
    
    // gl renders "upside down" so swap top to bottom into new array.
    // there's gotta be a better way, but this works.
    GLubyte *buffer2 = (GLubyte *) malloc(myDataLength);
    for(int y = 0; y < height; y++)
    {
        for(int x = 0; x < width; x++)
        {
            buffer2[y * width * 4 + x * 4] = buffer[y * 4 * width + x * 4 + 3];
            buffer2[y * width * 4 + x * 4 + 1] = buffer[y * 4 * width + x * 4 + 3];
            buffer2[y * width * 4 + x * 4 + 2] = buffer[y * 4 * width + x * 4 + 3];
            buffer2[y * width * 4 + x * 4 + 3] = 1.0;
        }
    }
    
    // make data provider with data.
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer, myDataLength, NULL);
    
    // prep the ingredients
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 * width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
//    CGBitmapInfo bitmapInfo = kCGBitmapAlphaInfoMask;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    // make the cgimage
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    
    
    //alpha
    // make data provider with data.
    CGDataProviderRef provider2 = CGDataProviderCreateWithData(NULL, buffer2, myDataLength, NULL);
    // make the cgimage
    CGImageRef imageRef2 = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider2, NULL, NO, renderingIntent);
    

    // Clean up
    free(buffer);
//    free(buffer2);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);

    // then make the uiimage from that
    UIImage *colorImage = [[UIImage imageWithCGImage:imageRef] flipVertically];
    CGImageRelease(imageRef);
    

    CGDataProviderRelease(provider2);
    UIImage *alphaImage = [[UIImage imageWithCGImage:imageRef2] flipVertically];
    CGImageRelease(imageRef2);
    
    self.imageView.image = colorImage;
    [self.imageView setNeedsDisplay];
    
    self.debugAlphaView.image = alphaImage;
    [self.debugAlphaView setNeedsDisplay];
}
#endif

#pragma mark- BrushPreview Delegate
- (void) willPreviewUpdateSmudgeTextureWithBrushState:(ADBrushState*)brushState location:(CGPoint)point inRect:(CGRect)rect ofFBO:(GLuint)fbo ofTexture:(GLuint)texture{
    [self willUpdateSmudgeTextureWithBrushState:brushState location:point inRect:rect ofFBO:fbo ofTexture:texture ofVAO:_VAOScreenQuad];
}

- (void) willDrawQuadBrush:(ADBrushState*)brushState texture2D:(GLuint)texture alpha:(GLfloat)alpha{
    [self drawQuad:_VAOScreenQuad brush:brushState texture2D:texture alpha:alpha];
}
- (void) willDrawSquareQuadWithTexture2DPremultiplied:(GLuint)texture{
    //brushPreview bound is square
    [self drawQuad:_VAOScreenQuad texture2D:texture premultiplied:true alpha:1.0];
}
- (void) willDrawScreenQuadWithTexture2D:(GLuint)texture Alpha:(GLfloat)alpha{
    [self drawQuad:_VAOScreenQuad texture2D:texture premultiplied:false alpha:alpha];
}

- (id) willGetBrushPreviewDelegate{
    return self;
}

- (ADBrushState*)willGetLastBrushState{
    return self.lastBrushState;
}
- (void)willSetLastBrushState:(ADBrushState*)brushState{
    self.lastBrushState = brushState;
}
//- (EAGLContext*)willGetBrushPreviewContext{
//    return self.context;
//}

#pragma mark- Layer

- (BOOL)createLayerRenderTextures{
    DebugLogFuncStart(@"createLayerRenderTexturesFromPaintData");
    if (self.paintData == nil) {
        DebugLogError(@"createLayerRenderTexturesFromPaintData failed. paintData nil");
        return NO;
    }
    
    self.layerTextures = [[NSMutableArray alloc]init];
    
    for (int i=0; i < self.paintData.layers.count; ++i) {
        NSString *name = [NSString stringWithFormat:@"layerTexture_%d", i];
        ADPaintLayer* layer = self.paintData.layers[i];
        
        RERenderTexture *layerTexture = [RERenderTexture textureWithName:name size:self.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
        
        name = [NSString stringWithFormat:@"layerTextureSrc_%d", i];
        RETexture *dataTexture = [RETexture textureFromData:layer.data name:name];
        
        //如果图像源是premultiplied的话会导致边缘变黑 layer的源头是从UIImagePNGPresentation来的rgb不是premultiplied
        [self drawQuad:_VAOScreenQuad texture2D:dataTexture.texID premultiplied:false alpha:1.0];
        [dataTexture destroy];
        
        [self.layerTextures addObject:layerTexture];
    }
    
    if (self.paintData.backgroundLayer.data) {
        NSString *name = @"backgroundLayerTexture";
        RERenderTexture *layerTexture = [RERenderTexture textureWithName:name size:self.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
        
        RETexture *dataTexture = [RETexture textureFromData:self.paintData.backgroundLayer.data name:name];
        [self drawQuad:_VAOScreenQuad texture2D:dataTexture.texID premultiplied:false alpha:1.0];
        [dataTexture destroy];
        
        self.backgroundLayerTexture = layerTexture;
    }
    
    return true;
}
- (void)deleteLayerRenderTextures{
    DebugLogFuncStart(@"deleteLayerRenderTextures");
    for(int i = 0; i< self.layerTextures.count;++i){
        RERenderTexture *texture = (RERenderTexture *)self.layerTextures[i];
        [texture destroy];
        texture = nil;
    }
    self.curLayerTexture = nil;
    
    if (self.paintData.backgroundLayer.data) {
        [self.backgroundLayerTexture destroy];
        self.backgroundLayerTexture = nil;
    }
    
    [self.layerTextures removeAllObjects];
    
}
- (BOOL)createTempLayerRenderTexture{
    DebugLogFuncStart(@"createTempLayerRenderTexture");
        self.curPaintedLayerTexture = [RERenderTexture textureWithName:@"curPaintedLayerTexture" size:self.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    
//    DebugLog(@"createTempLayerFramebuffer: %d Texture: %d", _tempLayerFramebuffer, _tempLayerTexture);
	return YES;
}

- (void)deleteTempLayerRenderTexture{
    DebugLogFuncStart(@"deleteTempLayerRenderTexture");
    [self.curPaintedLayerTexture destroy];
    self.curPaintedLayerTexture = nil;
}

- (int)curLayerIndex {
    return _curLayerIndex;
}

//设置当前图层
- (void)setCurLayerIndex:(int)newValue {
    DebugLogFuncStart(@"setCurLayerIndex %u", newValue);
    
    if (newValue < 0) {
        return;
    }
    
    if (newValue >= self.paintData.layers.count) {
        return;
    }
    
    self.paintData.curLayerIndex = newValue;
    _curLayerIndex = newValue;
    self.curLayerTexture = (RERenderTexture*)self.layerTextures[newValue];
   
    //将当前层内容拷贝到临时绘制层种
    [self copyCurLayerToCurPaintedLayer];
}

//插入图层
- (void)insertLayer:(ADPaintLayer*)layer atIndex:(int)index immediate:(BOOL)isImmediate{
    assert(index+1 <= self.paintData.layers.count);
    //数据

    NSString *name = @"insertedlayerTexture";
    [self.paintData.layers insertObject:layer atIndex:index+1];

    RERenderTexture *layerTexture = [RERenderTexture textureWithName:name size:self.viewGLSize mipmap:Interpolation_Nearest wrapMode:WrapMode_Clamp];
    
    RETexture *dataTexture = [RETexture textureFromData:layer.data name:name];
    [self drawQuad:_VAOScreenQuad texture2D:dataTexture.texID premultiplied:false alpha:1.0];
    [dataTexture destroy];

    [self.layerTextures insertObject:layerTexture atIndex:index+1];
    
    //显示
    if (isImmediate) {
        [self _updateRender];
    }
}

- (void)insertBlankLayerAtIndex:(int)index transparent:(bool)transparent immediate:(BOOL)isImmediate{
    DebugLog(@"insertLayerAtIndex: %d", index);
    ADPaintLayer *layer = [ADPaintLayer createBlankLayerWithSize:self.bounds.size transparent:transparent];
    [self insertLayer:layer atIndex:index immediate:isImmediate];
}

- (void)insertCopyLayerAtIndex:(int)index immediate:(BOOL)isImmediate{
    DebugLog(@"copyLayerAtIndex: %d", index);

    ADPaintLayer *layer = [[self.paintData.layers objectAtIndex:index] copy];
    [self insertLayer:layer atIndex:index immediate:isImmediate];
}

- (void)deleteLayerAtIndex:(int)index immediate:(BOOL)isImmediate{
    DebugLog(@"deleteLayerAtIndex: %d", index);
    assert(index < self.paintData.layers.count);
    
//数据
    //layer
    ADPaintLayer *layer = self.paintData.layers[index];
    [self.paintData.layers removeObject:layer];
    layer = nil;
    
//GL数据
    RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[index];
    [self.layerTextures removeObject:layerTexture];
    [layerTexture destroy];
    layerTexture = nil;
    

    //在没有选定新图层之前，去除当前图层标示，保证updateRender时候bu
//    self.curLayerIndex = -1;
//显示
    if (isImmediate) {
        [self _updateRender];
    }

}

- (void) clearData{

    //清除图层
    int count = self.paintData.layers.count;
    for (int i = count-1; i >= 0; i--) {
        [self deleteLayerAtIndex:i immediate:false];
    }
    
    //清除临时绘制图层
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
	[[REGLWrapper current] bindFramebufferOES: self.curPaintedLayerTexture.frameBuffer discardHint:false clear:true];
    
    //插入空图层
    [self insertBlankLayerAtIndex:-1 transparent:true immediate:false];
    
    [self setCurLayerIndex:0];
    
    [self _updateRender];
    
    //将tempLayerFramebuffer的结果Copy到undoBaseFramebuffer
    [[REGLWrapper current] bindFramebufferOES:self.undoBaseTexture.frameBuffer discardHint:false clear:true];

    [self drawSquareQuadWithTexture2DPremultiplied:self.curPaintedLayerTexture.texID];
    
    [self resetUndoRedo];
}

// Erases the screen
- (void) eraseLayerAtIndex:(int)index{
    assert(index < self.paintData.layers.count);
    //数据
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:index];
    layer.dirty = true;
    
    //显示
	[EAGLContext setCurrentContext:[REGLWrapper current].context];
    
	//clear paint layer
    RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[index];
    [[REGLWrapper current] bindFramebufferOES: layerTexture.frameBuffer discardHint:false clear:true];
    
    if (self.curLayerIndex == index) {
        // Clear the buffer
        [[REGLWrapper current] bindFramebufferOES: self.curPaintedLayerTexture.frameBuffer discardHint:false clear:true];
    }
    
    [self _updateRender];
}

- (void) eraseAllLayers
{
    //数据
    for (int i = 0; i < self.paintData.layers.count; ++i) {
        ADPaintLayer* layer = [self.paintData.layers objectAtIndex:i];
        layer.dirty = true;
    }
    
    //显示
	[EAGLContext setCurrentContext:[REGLWrapper current].context];
    
	//clear all paint layer
    for (int i = 0; i < self.paintData.layers.count; ++i) {
        RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[i];
        [[REGLWrapper current] bindFramebufferOES: layerTexture.frameBuffer discardHint:false clear:true];
    }
    //	[[REGLWrapper current] bindFramebufferOES: _curLayerFramebuffer];
    //	glClear(GL_COLOR_BUFFER_BIT);
    
	// Clear the buffer
	[[REGLWrapper current] bindFramebufferOES: self.curPaintedLayerTexture.frameBuffer discardHint:false clear:true];
    
    [self _updateRender];
}

- (void)moveLayerUpFromIndex:(int)fromIndex ToIndex:(int)toIndex immediate:(BOOL)isImmediate{
    assert(fromIndex < self.paintData.layers.count && toIndex < self.paintData.layers.count);
    
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:fromIndex];
    [self.paintData.layers removeObject:layer];
    [self.paintData.layers insertObject:layer atIndex:toIndex];
    
    RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[fromIndex];
    [self.layerTextures removeObject:layerTexture];
    [self.layerTextures insertObject:layerTexture atIndex:toIndex];
    
    if (self.curLayerIndex < toIndex) {
    }
    else if(self.curLayerIndex == toIndex){
        self.curLayerIndex ++;
    }
    else if(self.curLayerIndex > toIndex && self.curLayerIndex < fromIndex){
        self.curLayerIndex ++;
    }
    else if(self.curLayerIndex == fromIndex){
        self.curLayerIndex = toIndex;
    }
    else if (self.curLayerIndex > fromIndex){
    }
    if (isImmediate) {
        [self _updateRender];
    }

}

- (void)moveLayerDownFromIndex:(int)fromIndex ToIndex:(int)toIndex immediate:(BOOL)isImmediate{
    assert(fromIndex < self.paintData.layers.count && toIndex < self.paintData.layers.count);
    
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:fromIndex];
    [self.paintData.layers insertObject:layer atIndex:toIndex+1];
    [self.paintData.layers removeObjectAtIndex:fromIndex];
    
    RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[fromIndex];
    [self.layerTextures insertObject:layerTexture atIndex:toIndex+1];
    [self.layerTextures removeObjectAtIndex:fromIndex];
    
    if (self.curLayerIndex < fromIndex) {
    }
    else if(self.curLayerIndex == fromIndex){
        self.curLayerIndex = toIndex;
    }
    else if(self.curLayerIndex > fromIndex && self.curLayerIndex < toIndex){
        self.curLayerIndex --;
    }
    else if(self.curLayerIndex == toIndex){
        self.curLayerIndex --;
    }
    else if (self.curLayerIndex > toIndex){
    }
    if (isImmediate) {
        [self _updateRender];
    }

}

//绘制背景图层
-(void)drawBackgroundLayer{

    DebugLogGLGroupStart(@"Draw Background");

    //隐藏层不绘制
    if(!self.paintData.backgroundLayer.visible) {
        glClearColor(0, 0, 0, 0);
        glClear(GL_COLOR_BUFFER_BIT);
    }
    else if (self.paintData.backgroundLayer.data) {
        [self drawLayerWithTex:self.backgroundLayerTexture.texID blend:kCGBlendModeNormal opacity:1.0];
    }
    else{
        const CGFloat* colors = CGColorGetComponents(self.paintData.backgroundLayer.clearColor.CGColor);
        glClearColor(colors[0], colors[1], colors[2], colors[3]);
        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(0, 0, 0, 0);
    }

    DebugLogGLGroupEnd();
}

//绘制图层
- (void)drawPaintLayerAtIndex:(int)index{
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:index];

    //隐藏层不绘制
    if(!layer.visible) return;
    
    DebugLogGLGroupStart(@"Draw layer %d", index);
    //如果是当前绘图层
    if (_curLayerIndex == index) {
        //_paintTexturebuffer是黑底混合的图，使用ONE ONE_MINUS_SRCALPHA混合
        DebugLog(@"drawLayerAtIndex: %d Texture: %d blendMode: %d opacity: %.2f Current Painted!", index, self.curPaintedLayerTexture.texID, layer.blendMode, layer.opacity);
        [self drawLayerWithTex:self.curPaintedLayerTexture.texID blend:(CGBlendMode)layer.blendMode opacity:layer.opacity];
    }
    else{
        RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[index];
        DebugLog(@"drawLayerAtIndex: %d Texture: %d blendMode: %d opacity: %.2f", index, layerTexture.texID,  layer.blendMode, layer.opacity);
        [self drawLayerWithTex:layerTexture.texID blend:(CGBlendMode)layer.blendMode opacity:layer.opacity];
    }
    DebugLogGLGroupEnd();
}

//test
//混合当前图层和下个图层
- (void) drawTestLayerWithTex:(GLuint)texture blend:(CGBlendMode)blendMode opacity:(float)opacity{
    GLuint program = 0;
    //    BOOL *lastProgramTransformIdentity;
    
    switch (blendMode) {
        case kLayerBlendModeNormal:
            program = _programPaintLayerBlendModeNormal;
            //            lastProgramTransformIdentity = &_lastProgramLayerNormalTransformIdentity;
            break;
        case kLayerBlendModeMultiply:
            program = _programPaintLayerBlendModeMultiply;
            break;
        case kLayerBlendModeScreen:
            program = _programPaintLayerBlendModeScreen;
            break;
        case kLayerBlendModeOverlay:
            program = _programPaintLayerBlendModeOverlay;
            break;
        case kLayerBlendModeDarken:
            program = _programPaintLayerBlendModeDarken;
            break;
        case kLayerBlendModeLighten:
            program = _programPaintLayerBlendModeLighten;
            break;
        case kLayerBlendModeColorDodge:
            program = _programPaintLayerBlendModeColorDodge;
            break;
        case kLayerBlendModeColorBurn:
            program = _programPaintLayerBlendModeColorBurn;
            break;
        case kLayerBlendModeSoftLight:
            program = _programPaintLayerBlendModeSoftLight;
            break;
        case kLayerBlendModeHardLight:
            program = _programPaintLayerBlendModeHardLight;
            break;
        case kLayerBlendModeDifference:
            program = _programPaintLayerBlendModeDifference;
            break;
        case kLayerBlendModeExclusion:
            program = _programPaintLayerBlendModeExclusion;
            break;
        case kLayerBlendModeHue:
            program = _programPaintLayerBlendModeHue;
            break;
        case kLayerBlendModeSaturation:
            program = _programPaintLayerBlendModeSaturation;
            break;
        case kLayerBlendModeColor:
            program = _programPaintLayerBlendModeColor;
            break;
        case kLayerBlendModeLuminosity:
            program = _programPaintLayerBlendModeLuminosity;
            break;
        default:
            break;
    }
    
    [[REGLWrapper current] useProgram:program uniformBlock:nil];
    
    //设置太麻烦，统一设数值
    //    if (! (&lastProgramTransformIdentity)) {
    GLKMatrix4 matrix = GLKMatrix4Scale(GLKMatrix4Identity, 0.25, 0.25, 1);
    matrix = GLKMatrix4Translate(matrix, -2, -2, 0);

    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, matrix.m);
    //        (*lastProgramTransformIdentity) = true;
    //    }
    
    if (self.lastProgramLayerTex != 0) {
        glUniform1i(_texQuadUniform, 0);
        self.lastProgramLayerTex = 0;
    }
    
    //    if (self.lastProgramLayerAlpha != opacity) {
    glUniform1f(_alphaQuadUniform, opacity);
    //        self.lastProgramLayerAlpha = opacity;
    //    }
    
    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:texture];
    
    //already disable blend
    [[REGLWrapper current] blendFunc:BlendFuncOpaqueAlphaBlend];
    
    [[REGLWrapper current] bindVertexArrayOES: _VAOQuad];
    
    glDrawArrays(GL_TRIANGLES, 0, 6);
}
//混合当前图层和下个图层
- (void) drawLayerWithTex:(GLuint)texture blend:(CGBlendMode)blendMode opacity:(float)opacity{
    GLuint program = 0;
//    BOOL *lastProgramTransformIdentity;
    
    switch (blendMode) {
        case kLayerBlendModeNormal:
            program = _programPaintLayerBlendModeNormal;
//            lastProgramTransformIdentity = &_lastProgramLayerNormalTransformIdentity;
            break;
        case kLayerBlendModeMultiply:
            program = _programPaintLayerBlendModeMultiply;
            break;
        case kLayerBlendModeScreen:
            program = _programPaintLayerBlendModeScreen;
            break;
        case kLayerBlendModeOverlay:
            program = _programPaintLayerBlendModeOverlay;
            break;
        case kLayerBlendModeDarken:
            program = _programPaintLayerBlendModeDarken;
            break;
        case kLayerBlendModeLighten:
            program = _programPaintLayerBlendModeLighten;
            break;
        case kLayerBlendModeColorDodge:
            program = _programPaintLayerBlendModeColorDodge;
            break;
        case kLayerBlendModeColorBurn:
            program = _programPaintLayerBlendModeColorBurn;
            break;
        case kLayerBlendModeSoftLight:
            program = _programPaintLayerBlendModeSoftLight;
            break;
        case kLayerBlendModeHardLight:
            program = _programPaintLayerBlendModeHardLight;
            break;
        case kLayerBlendModeDifference:
            program = _programPaintLayerBlendModeDifference;
            break;
        case kLayerBlendModeExclusion:
            program = _programPaintLayerBlendModeExclusion;
            break;
        case kLayerBlendModeHue:
            program = _programPaintLayerBlendModeHue;
            break;
        case kLayerBlendModeSaturation:
            program = _programPaintLayerBlendModeSaturation;
            break;
        case kLayerBlendModeColor:
            program = _programPaintLayerBlendModeColor;
            break;
        case kLayerBlendModeLuminosity:
            program = _programPaintLayerBlendModeLuminosity;
            break;
        default:
            break;
    }
    
    [[REGLWrapper current] useProgram:program uniformBlock:nil];

    //设置太麻烦，统一设数值
//    if (! (&lastProgramTransformIdentity)) {
        glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
//        (*lastProgramTransformIdentity) = true;
//    }
    
    if (self.lastProgramLayerTex != 0) {
        glUniform1i(_texQuadUniform, 0);
        self.lastProgramLayerTex = 0;
    }
    
//    if (self.lastProgramLayerAlpha != opacity) {
        glUniform1f(_alphaQuadUniform, opacity);
//        self.lastProgramLayerAlpha = opacity;
//    }

    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:texture];

    //already disable blend
    [[REGLWrapper current] blendFunc:BlendFuncOpaqueAlphaBlend];
    
    [[REGLWrapper current] bindVertexArrayOES: _VAOQuad];

    glDrawArrays(GL_TRIANGLES, 0, 6);
}

- (void)setLayerAtIndex:(int)index blendMode:(LayerBlendMode)blendMode{
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:index];
    layer.blendMode = blendMode;
    
    [self _updateRender];
}
- (void)setLayerAtIndex:(int)index opacity:(float)opacity{
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:index];
    layer.opacity = opacity;
    
    [self _updateRender];
    
}
- (void)setLayerAtIndex:(int)index opacityLock:(BOOL)opacityLock{
    ADPaintLayer* layer = [self.paintData.layers objectAtIndex:index];
    layer.opacityLock = opacityLock;
    
    [self _updateRender];
    
}
- (void)clearLayerAtIndex:(int)index{
}
- (void)mergeLayerAtIndex:(int)index{
    //最底层不合并
    if (index <= 0) {
        return;
    }
    
    //仅绘制当前图层和下层图层
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[index - 1];
    [[REGLWrapper current] bindFramebufferOES: layerTexture.frameBuffer discardHint:false clear:false];
    
    //合成图层(暂时不考虑混合模式)
    [self drawPaintLayerAtIndex:index];
    
    //删除当前图层
    [self deleteLayerAtIndex:index immediate:false];
    
    //设定新当前层
    [self setCurLayerIndex:index - 1];
    
    //更新
    [self _updateRender];
}

- (CGRect)calculateLayerContentRect{

    DebugLogFuncStart(@"calculateLayerContentRect");
    CGFloat minX = CGFLOAT_MAX;
    CGFloat maxX = CGFLOAT_MIN;
    CGFloat minY = CGFLOAT_MAX;
    CGFloat maxY = CGFLOAT_MIN;
    
    RERenderTexture *layerTexture = (RERenderTexture *)self.layerTextures[self.curLayerIndex];
    [[REGLWrapper current] bindFramebufferOES: layerTexture.frameBuffer discardHint:false clear:false];
    
    NSInteger w = (NSInteger)self.bounds.size.width;
    NSInteger h = (NSInteger)self.bounds.size.height;
    GLubyte *data = (GLubyte*)malloc(4 * sizeof(GLubyte) * w * h);
    // Read pixel data from the framebuffer
    glPixelStorei(GL_PACK_ALIGNMENT, 4);
    glFinish();
    glReadPixels(0, 0, w, h, GL_RGBA, GL_UNSIGNED_BYTE, data);
    for (int y = 0; y < h; ++y) {
        for (int x = 0; x < w; ++x) {

            CGFloat alpha;
            alpha = (float)data[(y * w + x) * 4 + 3] / 255.0f;
            //has pixel
            if(alpha > EmptyAlpha){
                minX = MIN(minX, x);
                maxX = MAX(maxX, x);
                minY = MIN(minY, y);
                maxY = MAX(maxY, y);
            }
        }
    }
    free(data);
    
    DebugLog(@"minX %.1f, maxX %.1f, minY %.1f, maxY %.1f", minX, maxX, minY, maxY);
    
    //convert to Quatz Core
    NSInteger width = maxX - minX;
    if (maxX < minX) {
        width = 0;
    }

    NSInteger height = maxY - minY;
    if (maxY < minY) {
        height = 0;
    }
    
    CGRect rect = CGRectMake(minX, self.bounds.size.height - maxY, width, height);
    DebugLog(@"calculateLayerContentRect result %@", NSStringFromCGRect(rect));

    return  rect;
}

#pragma mark- Transform Canvas
- (void)transformCanvasReset{
    _canvasTranslate = CGPointZero;
    _canvasScale = 1.0;
    _canvasRotate = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = CATransform3DIdentity;
        self.layer.anchorPoint = CGPointMake(0.5, 0.5);
        self.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    } completion:^(BOOL finished) {
        [self.delegate willUpdateUIToolBars];
    }];
}
- (void)transformCanvasBegan{
    _canvasSrcTranslate = _canvasTranslate;
    _canvasSrcScale = _canvasScale;
    _canvasSrcRotate = _canvasRotate;
    DebugLog(@"transformCanvasBegan _canvasSrcTranslate %@ _canvasSrcRotate:%.2f _canvasSrcScale:%.2f", NSStringFromCGPoint(_canvasSrcTranslate) , _canvasSrcRotate, _canvasSrcScale);
}


- (void)snapRotate:(CGFloat)angle{
//    DebugLog(@"rotateImage angle:%.2f", angle);
    CGFloat snapDegree = 5;
    
    //和手势开始的旋转角度差大于一定角度，开始旋转画布
    if (fabsf(angle) <= M_PI * snapDegree / 180.0) {
        angle = 0;
    }
    
    //捕捉到垂直和水平方向
    CGFloat newRotate = (_canvasSrcRotate - angle) * (180.0 / M_PI);
//    DebugLog(@"newRotate %.1f", newRotate);
    
    CGFloat rotate;
    if (fabsf(fmodf(newRotate, 90)) < snapDegree) {
        if (newRotate < 0) {
            rotate = ceilf((newRotate / 90)) * 90;
        }
        else{
            rotate = floorf((newRotate / 90)) * 90;
        }
        _canvasRotate = rotate * (M_PI / 180.0);
    }
    else if (fabsf(90 - fmodf(newRotate, 90)) < snapDegree){
        if (newRotate < 0) {
            rotate = floorf((newRotate / 90)) * 90;
        }
        else{
            rotate = ceilf((newRotate / 90)) * 90;
        }
        _canvasRotate = rotate * (M_PI / 180.0);
    }
    else{
        _canvasRotate = _canvasSrcRotate - angle;
    }
    
    self.isRotateSnapFit = fabsf(fmodf(_canvasRotate, M_PI * 2)) < 0.0001;
}

- (void)snapFitScreen{
    CGFloat snapTranslateThresold = 20;
    if (self.isRotateSnapFit &&
        fabsf(self.layer.frame.origin.x) < snapTranslateThresold &&
        fabsf(self.layer.frame.origin.y) < snapTranslateThresold &&
        fabsf(self.layer.frame.size.width - self.bounds.size.width) < snapTranslateThresold &&
        fabsf(self.layer.frame.size.height - self.bounds.size.height) < snapTranslateThresold){
        
        _canvasTranslate = CGPointZero;
        _canvasScale = 1.0;
        _canvasRotate = 0;
        self.layer.transform = CATransform3DIdentity;
        self.layer.anchorPoint = CGPointMake(0.5, 0.5);
        self.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    }
}

- (void)freeTransformCanvasTranslate:(CGPoint)translation rotate:(float) angle scale:(float)scale{

    [self snapRotate:angle];
    
    _canvasScale = scale * _canvasSrcScale;
    
    //FIXME:根据屏幕的尺寸大小来设定，暂时按照一个百分比设定
    _canvasScale = MAX(CanvasScaleMinimum, _canvasScale);
    
    _canvasTranslate = CGPointMake(translation.x + _canvasSrcTranslate.x, translation.y + _canvasSrcTranslate.y);
    
    [self.layer setValue:[NSNumber numberWithFloat:_canvasScale] forKeyPath:@"transform.scale"];
    
    [self.layer setValue:[NSNumber numberWithFloat:_canvasRotate] forKeyPath:@"transform.rotation"];

    [self.layer setValue:[NSNumber numberWithFloat:_canvasTranslate.x] forKeyPath:@"transform.translation.x"];
    [self.layer setValue:[NSNumber numberWithFloat:_canvasTranslate.y] forKeyPath:@"transform.translation.y"];
    
//    [self snapFitScreen];
    
    [self.delegate willUpdateUITransformTranslate:_canvasTranslate rotate:_canvasRotate scale:_canvasScale];
}

#pragma mark- Transform Layer Image
//变换当前图层
- (void)beforeTransformImage:(UIImage*)uiImage{

    _state = PaintView_TouchTransformImage;
    
    //MARK:不加入undo redo commands
    ADTransformCommand *transformCommand = [[ADTransformCommand alloc]init];
    transformCommand.delegate = self;
    transformCommand.isLayer = false;
    self.transformCommand = transformCommand;
    
    //处理UIImage 尺寸过大的问题 如果图片尺寸大于屏幕尺寸，适配到屏幕大小
    self.toTransformImageTex = [RETexture textureFromUIImage:uiImage name:nil];
    float widthScale = 0; float heightScale = 0;
    if (self.toTransformImageTex.width > self.toTransformImageTex.height) {
        widthScale = (float)self.toTransformImageTex.width / (float)self.bounds.size.width;

        widthScale = MIN(widthScale, 1);
        heightScale = widthScale * ((float)self.toTransformImageTex.height / (float)self.toTransformImageTex.width);
    }
    else{
        heightScale = (float)self.toTransformImageTex.height / (float)self.bounds.size.height;
        heightScale = MIN(heightScale, 1);
        widthScale = heightScale * ((float)self.toTransformImageTex.width / (float)self.toTransformImageTex.height);
    }

    
//    DebugLog(@"width %d height %d", texInfo.width, texInfo.height);
//    DebugLog(@"widthScale %.1f heightScale %.1f", widthScale, heightScale);
    
    _imageScale = CGPointMake(widthScale, heightScale);
    _imageRotate = 0;
    _imageTranslate = CGPointZero;
    _anchorTranslate = CGPointZero;
    _anchorInverseTranslate = CGPointZero;
    
    //将导入的图片作为绘制来描画
    [self drawImageTransformedStart:self.toTransformImageTex.texID];
    
    [self resetUndoRedo];
}

- (void)beforeTransformLayer{
    _state = PaintView_TouchTransformLayer;
    
    //创建一个transformCommand
    ADTransformCommand *transformCommand = [[ADTransformCommand alloc]init];
    transformCommand.delegate = self;
    transformCommand.isLayer = true;
    self.transformCommand = transformCommand;
    [self.commandManager addCommand:transformCommand];
    ADPaintLayer *layer = self.paintData.layers[self.curLayerIndex];
    layer.dirty = true;
    
    float widthScale = 1;
    float heightScale = widthScale * (self.bounds.size.height / self.bounds.size.width);

    _imageScale = CGPointMake(widthScale, heightScale);
    _imageRotate = 0;
    _imageTranslate = CGPointZero;
    _anchorTranslate = CGPointZero;
    _anchorInverseTranslate = CGPointZero;
    
    _toTransformImageTex = self.curLayerTexture;

    //将当前图层作为绘制来描画
    [self drawCurLayerTransformed];

//    [self resetUndoRedo];
}

- (void)transformImageBeganAnchorPoint:(CGPoint)anchorPoint{
    _imageSrcTranslate = _imageTranslate;
    _imageSrcRotate = _imageRotate;
    _imageSrcScale = _imageScale;
    
    _anchorTranslate = CGPointMake(anchorPoint.x - _imageSrcTranslate.x, anchorPoint.y - _imageSrcTranslate.y);
    
    _anchorInverseTranslate = CGPointMake(-_anchorTranslate.x, -_anchorTranslate.y);
    
    DebugLog(@"transformImageBegan _imageSrcTranslate %@ _imageSrcRotate %1.f _imageSrcScale %@ _anchorTranslate %@", NSStringFromCGPoint(_imageSrcTranslate), _imageSrcRotate, NSStringFromCGPoint(_imageSrcScale), NSStringFromCGPoint(_anchorTranslate));
}

//-(void) transformImageLayerCancelled{
//    _transformedImageMatrix = GLKMatrix4Identity;
//    _state = PaintView_TouchNone;
//    
//    if (self.state == PaintView_TouchTransformImage) {
//        [self.toTransformImageTex destroy];
//        self.toTransformImageTex = nil;
//    }
//}

-(void) transformImageLayerDone{
//    _transformedImageMatrix = GLKMatrix4Identity;
    
    [self copyCurPaintedLayerToCurLayer];
    self.transformCommand = nil;
    
    //更新UI
//    [self uploadLayerDataAtIndex:self.curLayerIndex];
    
    //删除资源
    if (self.state == PaintView_TouchTransformImage) {
        [self.toTransformImageTex destroy];
        self.toTransformImageTex = nil;
    }
    
    //切换状态
    _state = PaintView_TouchNone;
}

- (void)drawCurLayerTransformed{
    CGFloat w = (float)(self.bounds.size.width*0.5);
    CGFloat h = (float)(self.bounds.size.height*0.5);
    GLKMatrix4 imageTransformMatrixT = GLKMatrix4MakeTranslation(_imageTranslate.x / w, -_imageTranslate.y / w, 0);
    GLKMatrix4 imageTransformMatrixR = GLKMatrix4MakeWithQuaternion(GLKQuaternionMakeWithAngleAndAxis(_imageRotate, 0, 0, 1));
    GLKMatrix4 imageTransformMatrixS = GLKMatrix4MakeScale(_imageScale.x, _imageScale.y, 1);
    GLKMatrix4 anchorTransformMatrixT = GLKMatrix4MakeTranslation(_anchorTranslate.x / w, -_anchorTranslate.y / w, 0);
    GLKMatrix4 anchorInverseTransformMatrixT = GLKMatrix4MakeTranslation(_anchorInverseTranslate.x / w, -_anchorInverseTranslate.y / h, 0);
    
    GLKMatrix4 mat = anchorInverseTransformMatrixT;
    mat = GLKMatrix4Multiply(imageTransformMatrixS, mat);
    mat = GLKMatrix4Multiply(imageTransformMatrixR, mat);
    mat = GLKMatrix4Multiply(anchorTransformMatrixT, mat);
    mat = GLKMatrix4Multiply(imageTransformMatrixT, mat);
    
    //project
    float aspect = (float)self.bounds.size.width / (float)self.bounds.size.height;
    self.transformCommand.transformedImageMatrix = GLKMatrix4Multiply(GLKMatrix4MakeScale(1, aspect, 1), mat);
    
    [self transformImageWithCommand:self.transformCommand];

    //更新渲染
    [self _updateRender];
    
}

- (void)drawImageTransformedStart:(GLuint)texture{
    [self drawImageTransformed:texture];

    [self copyCurPaintedLayerToCurLayer];
}
//将图片描画到笔刷Framebuffer中，然后进行正常图层合成。
- (void)drawImageTransformed:(GLuint)texture{
    CGFloat w = (float)(self.bounds.size.width*0.5);
    CGFloat h = (float)(self.bounds.size.height*0.5);
    GLKMatrix4 imageTransformMatrixT = GLKMatrix4MakeTranslation(_imageTranslate.x / w, -_imageTranslate.y / w, 0);
    GLKMatrix4 imageTransformMatrixR = GLKMatrix4MakeWithQuaternion(GLKQuaternionMakeWithAngleAndAxis(_imageRotate, 0, 0, 1));
    GLKMatrix4 imageTransformMatrixS = GLKMatrix4MakeScale(_imageScale.x, _imageScale.y, 1);
    GLKMatrix4 anchorTransformMatrixT = GLKMatrix4MakeTranslation(_anchorTranslate.x / w, -_anchorTranslate.y / w, 0);
    GLKMatrix4 anchorInverseTransformMatrixT = GLKMatrix4MakeTranslation(_anchorInverseTranslate.x / w, -_anchorInverseTranslate.y / h, 0);
    
    GLKMatrix4 mat = anchorInverseTransformMatrixT;
    mat = GLKMatrix4Multiply(imageTransformMatrixS, mat);
    mat = GLKMatrix4Multiply(imageTransformMatrixR, mat);
    mat = GLKMatrix4Multiply(anchorTransformMatrixT, mat);
    mat = GLKMatrix4Multiply(imageTransformMatrixT, mat);
    
    //project
    float aspect = (float)self.bounds.size.width / (float)self.bounds.size.height;
    self.transformCommand.transformedImageMatrix = GLKMatrix4Multiply(GLKMatrix4MakeScale(1, aspect, 1), mat);
    
    [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:false clear:true];
    
    [self drawQuad:_VAOScreenQuad transformMatrix:self.transformCommand.transformedImageMatrix texture2DPremultiplied:texture];
    
    //更新渲染
    [self _updateRender];
}

- (TransformInfo)freeTransformImageTranslate:(CGPoint)translation rotate:(float)rotate scale:(CGPoint)scale anchorPoint:(CGPoint)anchorPoint{
   
    _imageTranslate = CGPointMake(translation.x + _imageSrcTranslate.x, translation.y + _imageSrcTranslate.y);
    
    _imageRotate = rotate + _imageSrcRotate;
    
    _imageScale = CGPointMake(scale.x * _imageSrcScale.x, scale.y * _imageSrcScale.y);
    
    
    DebugLog(@"freeTransformImageTranslateFinal Tx:%.2f Ty:%.2f  R:%.1f  Sx:%.1f Sy:%.1f Ax:%.1f Ay:%.1f", _imageTranslate.x, _imageTranslate.y, _imageRotate, _imageScale.x, _imageScale.y, _anchorTranslate.x, _anchorTranslate.y);
    
    if (_state == PaintView_TouchTransformLayer) {
        [self drawCurLayerTransformed];
    }
    else if (_state == PaintView_TouchTransformImage) {
        [self drawImageTransformed:self.toTransformImageTex.texID];
    }
    
    TransformInfo transformInfo;
    transformInfo.translate = _imageTranslate;
    transformInfo.rotate = _imageRotate;
    transformInfo.scale = _imageScale;
    
    return transformInfo;
}

- (void)moveImage:(CGPoint)translation{
//    DebugLog(@"moveImage translation x:%.2f y:%.2f", translation.x, translation.y);
    
    _imageTranslate = CGPointMake(translation.x + _imageSrcTranslate.x, translation.y + _imageSrcTranslate.y);
    
    if (_state == PaintView_TouchTransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:self.toTransformImageTex.texID];
    }
}

- (void)rotateImage:(CGFloat)angle{
//    DebugLog(@"rotateImage angle:%.2f", angle);
    
    _imageRotate = angle + _imageSrcRotate;
    
    if (_state == PaintView_TouchTransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:self.toTransformImageTex.texID];
    }
}

- (void)scaleImage:(CGPoint)scale{
//    DebugLog(@"scaleImage scale:%.2f", scale);
    
    _imageScale = CGPointMake(scale.x * _imageSrcScale.x, scale.y * _imageSrcScale.y);
    
    if (_state == PaintView_TouchTransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:self.toTransformImageTex.texID];
    }
}


- (void)cancelInsertUIImageAtCurLayer{
    [EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:false clear:true];
    
    [self drawSquareQuadWithTexture2DPremultiplied:self.curLayerTexture.texID];
    
    //    [self copyTempLayerToCurLayer];
    //更新渲染
    [self _updateRender];
}

//在当前图层剪切下选择范围的图层


//指定位置插入UIImage
- (void)insertUIImageAtCurLayer:(UIImage*)uiImage {
    [self insertBlankLayerAtIndex:(self.curLayerIndex) transparent:true immediate:true];
    
    [self setCurLayerIndex:self.curLayerIndex + 1];
    //在空图层里插入临时可调整图片
    [self beforeTransformImage:uiImage];
}


- (CGPoint)imageScaleAnchor{
    GLKVector4 originCenter = GLKVector4Make(0, 0, 0, 1);
    GLKVector4 transformedAnchor = GLKMatrix4MultiplyVector4(self.transformCommand.transformedImageMatrix, originCenter);
    float x = transformedAnchor.x * 0.5 + 0.5;
    float y = 1.0f - (transformedAnchor.y * 0.5 + 0.5);

    CGPoint anchor = CGPointMake(x * self.bounds.size.width, y * self.bounds.size.height);
    DebugLog(@"anchor x:%.2f y:%.2f", anchor.x, anchor.y);
    
    return anchor;
}

#pragma mark- TransformCommandDelegate
- (void)transformImageWithCommand:(ADTransformCommand*)command{
    if (command.isUndoBaseWrapped) {
        if (command.isLayer) {
            [[REGLWrapper current] bindFramebufferOES:self.undoBaseTexture.frameBuffer discardHint:true clear:true];
            [self drawSquareQuadWithTexture2DPremultiplied:self.curPaintedLayerTexture.texID];
            
            [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:true clear:true];
            [self drawQuad:_VAOQuad transformMatrix:command.transformedImageMatrix texture2DPremultiplied:self.undoBaseTexture.texID];
        }
    }
    else{
        if (command.isLayer) {
            [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:false clear:true];
            
            [self drawQuad:_VAOQuad transformMatrix:command.transformedImageMatrix texture2DPremultiplied:self.curLayerTexture.texID];
        }
    }
}
- (void)willTransformImageWithCommand:(ADTransformCommand*)command{
    [self transformImageWithCommand:command];
    if(!command.isUndoBaseWrapped){
        [self copyCurPaintedLayerToCurLayer];
    }
}

#pragma mark- Opengl Draw Tools

#if DEBUG_VIEW_COLORALPHA
- (void) drawDebugScreenQuadWithTexture2DPremultiplied:(GLuint)texture{
	[EAGLContext setCurrentContext:[REGLWrapper current].context];
    
    glUseProgram(_programQuadDebugAlpha);
    self.lastProgram = _programQuadDebugAlpha;
    
    //texcoord and texture
    glActiveTexture(GL_TEXTURE0);    
    [[REGLWrapper current] bindTexture:texture];
    glUniform1i(_texQuadDebugUniform, 0);
    glUniform1f(_alphaQuadDebugUniform, 1);    
    
    [[REGLWrapper current] blendFunc:BlendFuncOpaque];
//    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE);
    
    [[REGLWrapper current] bindVertexArrayOES: _debugVertexArray];
	glDrawArrays(GL_TRIANGLES, 0, 6);
}
- (void) drawDebugScreenQuad2WithTexture2DPremultiplied:(GLuint)texture{
    
    glUseProgram(_programQuadDebugColor);
    self.lastProgram = _programQuadDebugColor;
    //texcoord and texture
    glActiveTexture(GL_TEXTURE0);
    [[REGLWrapper current] bindTexture:texture];
    glUniform1i(_texQuadDebugUniform, 0);
    glUniform1f(_alphaQuadDebugUniform, 1);
    
    //    glDisable(GL_BLEND);
    glEnable(GL_BLEND);

    [[REGLWrapper current] blendFunc:BlendFuncOpaque];
//    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE);
    
    [[REGLWrapper current] bindVertexArrayOES: _debugVertexArray2];
	glDrawArrays(GL_TRIANGLES, 0, 6);
    //    glEnable(GL_BLEND);
}
#endif


//draw brush texture to curPaintedTexture
- (void) drawQuad:(GLuint)quad brush:(ADBrushState*)brushState texture2D:(GLuint)texture alpha:(GLfloat)alpha{
    [[REGLWrapper current] useProgram:_programQuad uniformBlock:nil];
    
    if (!_lastProgramQuadTransformIdentity) {
        glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        _lastProgramQuadTransformIdentity = true;
    }
    
    if (self.lastProgramQuadTex != 0) {
        glUniform1i(_texQuadUniform, 0);
        self.lastProgramQuadTex = 0;
    }
    
    if (self.lastProgramQuadAlpha != alpha) {
        glUniform1f(_alphaQuadUniform, alpha);
        self.lastProgramQuadAlpha = alpha;
    }
    
    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:texture];

    //使用合成brush的blendMode
    ADBrush *brush = self.brushTypes[brushState.classId];
    [brush setBlendModeWithBrushState:brushState];

    [[REGLWrapper current] bindVertexArrayOES: quad];
	glDrawArrays(GL_TRIANGLES, 0, 6);
}

- (void)drawQuad:(GLuint)quad texture2D:(GLuint)texture premultiplied:(BOOL)premultiplied alpha:(GLfloat)alpha{

    [[REGLWrapper current] useProgram:_programQuad uniformBlock:nil];
    
    if (!_lastProgramQuadTransformIdentity) {
        glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
        _lastProgramQuadTransformIdentity = true;
    }
    
    if (self.lastProgramQuadTex != 0) {
        glUniform1i(_texQuadUniform, 0);
        self.lastProgramQuadTex = 0;
    }
    
    if (self.lastProgramQuadAlpha != alpha) {
        glUniform1f(_alphaQuadUniform, alpha);
        self.lastProgramQuadAlpha = alpha;
    }

    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:texture];

    if (premultiplied) {
        [[REGLWrapper current] blendFunc:BlendFuncAlphaBlendPremultiplied];
    }
    else{
        [[REGLWrapper current] blendFunc:BlendFuncAlphaBlend];
    }

    [[REGLWrapper current] bindVertexArrayOES: quad];

	glDrawArrays(GL_TRIANGLES, 0, 6);
}

- (void) drawQuad:(GLuint)quad transformMatrix:(GLKMatrix4)transformMatrix texture2DPremultiplied:(GLuint)texture{
    [[REGLWrapper current] useProgram:_programQuad uniformBlock:nil];
    
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, transformMatrix.m);
    _lastProgramQuadTransformIdentity = false;
    
    if (self.lastProgramQuadTex != 0) {
        glUniform1i(_texQuadUniform, 0);
        self.lastProgramQuadTex = 0;
    }
    
    if (self.lastProgramQuadAlpha != 1) {
        glUniform1f(_alphaQuadUniform, 1);
        self.lastProgramQuadAlpha = 1;
    }
    
    [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:texture];
    
    [[REGLWrapper current] setImageInterpolation:Interpolation_Linear];
    
    [[REGLWrapper current] blendFunc:BlendFuncAlphaBlendPremultiplied];
    
    [[REGLWrapper current] bindVertexArrayOES: quad];
	glDrawArrays(GL_TRIANGLES, 0, 6);
    
    [[REGLWrapper current] setImageInterpolationFinished];
    
}

- (void) drawSquareQuadWithTexture2DPremultiplied:(GLuint)texture{
    [self drawQuad:_VAOQuad texture2D:texture premultiplied:true alpha:1.0];
}

- (void) drawScreenQuadTransformMatrix:(GLKMatrix4)transformMatrix texture2DPremultiplied:(GLuint)texture{
    [self drawQuad:_VAOScreenQuad transformMatrix:transformMatrix texture2DPremultiplied:texture];
}
#pragma mark- snapshot
- (UIImage*)snapshotPaintToUIImage
{
	[EAGLContext setCurrentContext:[REGLWrapper current].context];//之前有丢失context的现象出现
    [[REGLWrapper current] bindFramebufferOES:self.curPaintedLayerTexture.frameBuffer discardHint:false clear:false];
    UIImage *image = [ADUltility snapshot:self Context:[REGLWrapper current].context InViewportSize:self.bounds.size ToOutputSize:CGSizeMake(self.viewGLSize, self.viewGLSize)];

    return image;
}
- (UIImage*)snapshotFramebufferToUIImage:(GLuint)framebuffer
{
//    DebugLogGLSnapshotStart
	[EAGLContext setCurrentContext:[REGLWrapper current].context];//之前有丢失context的现象出现
    [[REGLWrapper current] bindFramebufferOES: framebuffer discardHint:false clear:false];
    CGSize viewportSize = self.bounds.size;
    UIImage *image = [ADUltility snapshot:self Context:[REGLWrapper current].context InViewportSize:viewportSize ToOutputSize:viewportSize];
//    DebugLogGLSnapshotEnd
    return image;
}
- (UIImage*)snapshotScreenToUIImageOutputSize:(CGSize)size
{
	[EAGLContext setCurrentContext:[REGLWrapper current].context];//之前有丢失context的现象出现
    [[REGLWrapper current] bindFramebufferOES: _finalFramebuffer discardHint:false clear:false];
    UIImage *image = [ADUltility snapshot:self Context:[REGLWrapper current].context InViewportSize:self.bounds.size ToOutputSize:size];

    return image;
}


#pragma mark- Shader
- (GLuint)loadShaderPaintLayer:(NSString*)fragShaderName{
    GLuint program, vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    program = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuad" ofType:@"vsh"];
    if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderName = [@"Shaders/" stringByAppendingString:fragShaderName];
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:fragShaderName ofType:@"fsh"];
    if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader %@", fragShaderPathname);
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(program, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(program, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(program, GLKVertexAttribPosition, "Position");
    glBindAttribLocation(program, GLKVertexAttribTexCoord0, "Texcoord");
    // Link program.
    if (![[REGLWrapper current] linkProgram:program]) {
        DebugLog(@"Failed to link program: %d", program);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (program) {
            glDeleteProgram(program);
            program = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _texQuadUniform = glGetUniformLocation(program, "texture");
    _alphaQuadUniform = glGetUniformLocation(program, "alpha");
    _tranformImageMatrixUniform = glGetUniformLocation(program, "transformMatrix");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(program, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(program, fragShader);
        glDeleteShader(fragShader);
    }
    
    NSString* programLabel = [NSString stringWithFormat:@"program%@",fragShaderName];
    DebugLogGLLabel(GL_PROGRAM_OBJECT_EXT, program, 0, [programLabel UTF8String]);
    return program;
}

- (BOOL)loadShaderQuad
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programQuad = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuad" ofType:@"vsh"];
    if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuad" ofType:@"fsh"];
    if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader %@", fragShaderPathname);
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programQuad, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programQuad, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programQuad, GLKVertexAttribPosition, "Position");
    glBindAttribLocation(_programQuad, GLKVertexAttribTexCoord0, "Texcoord");
    // Link program.
    if (![[REGLWrapper current] linkProgram:_programQuad]) {
        DebugLog(@"Failed to link program: %d", _programQuad);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programQuad) {
            glDeleteProgram(_programQuad);
            _programQuad = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _texQuadUniform = glGetUniformLocation(_programQuad, "texture");
    _alphaQuadUniform = glGetUniformLocation(_programQuad, "alpha");
    _tranformImageMatrixUniform = glGetUniformLocation(_programQuad, "transformMatrix");

    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programQuad, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programQuad, fragShader);
        glDeleteShader(fragShader);
    }
    DebugLogGLLabel(GL_PROGRAM_OBJECT_EXT, _programQuad, 0, [@"programQuad" UTF8String]);
    return YES;
}

#if DEBUG_VIEW_COLORALPHA
- (BOOL)loadShaderQuadDebugAlpha
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programQuadDebugAlpha = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuadDebug" ofType:@"vsh"];
    if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuadDebugAlpha" ofType:@"fsh"];
    if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader %@", fragShaderPathname);
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programQuadDebugAlpha, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programQuadDebugAlpha, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programQuadDebugAlpha, GLKVertexAttribPosition, "Position");
    glBindAttribLocation(_programQuadDebugAlpha, GLKVertexAttribTexCoord0, "Texcoord");
    // Link program.
    if (![[REGLWrapper current] linkProgram:_programQuadDebugAlpha]) {
        DebugLog(@"Failed to link program: %d", _programQuadDebugAlpha);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programQuadDebugAlpha) {
            glDeleteProgram(_programQuadDebugAlpha);
            _programQuadDebugAlpha = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _texQuadDebugUniform = glGetUniformLocation(_programQuadDebugAlpha, "texture");
    _alphaQuadDebugUniform = glGetUniformLocation(_programQuadDebugAlpha, "alpha");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programQuadDebugAlpha, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programQuadDebugAlpha, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;
}

- (BOOL)loadShaderQuadDebugColor
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programQuadDebugColor = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuadDebug" ofType:@"vsh"];
    if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderQuadDebugColor" ofType:@"fsh"];
    if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader %@", fragShaderPathname);
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programQuadDebugColor, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programQuadDebugColor, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programQuadDebugColor, GLKVertexAttribPosition, "Position");
    glBindAttribLocation(_programQuadDebugColor, GLKVertexAttribTexCoord0, "Texcoord");
    // Link program.
    if (![[REGLWrapper current] linkProgram:_programQuadDebugColor]) {
        DebugLog(@"Failed to link program: %d", _programQuadDebugColor);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programQuadDebugColor) {
            glDeleteProgram(_programQuadDebugColor);
            _programQuadDebugColor = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _texQuadDebugUniform = glGetUniformLocation(_programQuadDebugAlpha, "texture");
    _alphaQuadDebugUniform = glGetUniformLocation(_programQuadDebugAlpha, "alpha");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programQuadDebugColor, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programQuadDebugColor, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;
}
#endif

#pragma mark- 测试用Test

@end
