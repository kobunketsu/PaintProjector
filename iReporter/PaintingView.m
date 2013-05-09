#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>

#import "PaintingView.h"
#import "PaintLayer.h"

#define BUFFER_OFFSET(i) ((char *)NULL + (i))

// A class extension to declare private methods
@interface PaintingView (private)

- (BOOL)createFramebuffer;
- (void)destroyBuffers;

@end

@implementation PaintingView
@synthesize context = _context;
@synthesize brush = _brush;
@synthesize eyeDropper;
@synthesize brushTypes;
@synthesize isTransformOperating;
@synthesize isEyeDroppering;
@synthesize location;
@synthesize previousLocation;
@synthesize delegate;
@synthesize curTouch;
@synthesize paintingImage;
@synthesize brushingImage;
@synthesize paintTextureInfo;
@synthesize curPaintedLayerTexture = _tempLayerTexture;
@synthesize backgroundTexture = _backgroundTexture;
@synthesize finalRenderbuffer = _finalRenderbuffer;
@synthesize paintRefImage;
@synthesize paintData = _paintData;

//@synthesize backgroundTextureData;
// Implement this to override the default layer class (which is [CALayer class]).
// We do this so that our view will be backed by a layer that is capable of OpenGL ES rendering.
+ (Class) layerClass
{
	return [CAEAGLLayer class];
}

// The GL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder {
    if ((self = [super initWithCoder:coder])) {
		CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;

		eaglLayer.opaque = NO;//使用premuliplied方式和下层进行混合
		// In this application, we want to retain the EAGLDrawable contents after a call to presentRenderbuffer.
		eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
										[NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
		
        eaglLayer.backgroundColor = [UIColor clearColor].CGColor;

//        _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
//		if (!_context || ![EAGLContext setCurrentContext:_context])          {
//			return nil;
//		}

		// Make sure to start with a cleared buffer
        _state = PaintingView_Erase;
		
        //record and undo redo
        _undoCount = 0;
        _undoStack = [[PaintOperationStack alloc]initWithCapacity:UndoMaxCount*2];//是否要检测初始化失败
        _undoStack.delegate = self;
        _redoStack = [[PaintOperationStack alloc]initWithCapacity:UndoMaxCount*2];//是否要检测初始化失败

//        [self createBrushFramebuffer];
        
        //test for bug
	}
	
	return self;
}

-(BOOL)initCustom{
    if (!_context || ![EAGLContext setCurrentContext:_context]){
        return false;
    }

    [self createBrushFramebuffer];
    return true;
}
// If our view is resized, we'll be asked to layout subviews.
// This is the perfect opportunity to also update the framebuffer so that it is
// the same size as our display area.
-(void)layoutSubviews
{
    [EAGLContext setCurrentContext:_context];
    //删除之前的buffer
    [self destroyBuffers];

    [self createFramebuffer];
    [self createBrushFramebuffer];
    [self createQuadTexturebuffer];
    [self createUndoBaseFramebuffer];
    [self createUndoCheckFramebuffer];
    
    [self loadShaderQuad];
#if SIMPLE_LAYER
#else    
    _programPaintLayerBlendModeNormal = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeNormal"];
    _programPaintLayerBlendModeMultiply = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeMultiply"];
    _programPaintLayerBlendModeScreen = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeScreen"];
    _programPaintLayerBlendModeOverlay = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeOverlay"];
    _programPaintLayerBlendModeDarken = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeDarken"];
    _programPaintLayerBlendModeLighten = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeLighten"];
    _programPaintLayerBlendModeColorDodge = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeColorDodge"];
    _programPaintLayerBlendModeColorBurn = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeColorBurn"];
    _programPaintLayerBlendModeSoftLight = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeSoftLight"];
    _programPaintLayerBlendModeHardLight = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeHardLight"];
    _programPaintLayerBlendModeDifference = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeDifference"];
    _programPaintLayerBlendModeExclusion = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeExclusion"];
    _programPaintLayerBlendModeHue = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeHue"];
    _programPaintLayerBlendModeSaturation = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeSaturation"];
    _programPaintLayerBlendModeColor = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeColor"];
    _programPaintLayerBlendModeLuminosity = [self loadShaderPaintLayer:@"ShaderPaintLayerBlendModeLuminosity"];        
#endif
    
#if DEBUG_VIEW_COLORALPHA
    [self createDebugQuadVerticesbuffer];
    [self createDebugQuadVerticesbuffer2];
    [self loadShaderQuadDebugAlpha];
    [self loadShaderQuadDebugColor];
#endif


    // Create a texture from an image
    // First create a UIImage object from the data in a image file, and then extract the Core Graphics image
    // Set the view's scale factor
    self.contentScaleFactor = 1.0;
    
    // Clear the framebuffer the first time it is allocated
    if (_state == PaintingView_Erase) {
        [self erase];
        _state = PaintingView_Normal;
    }

    //重置混合模式
    glDisable(GL_DITHER);
    glEnable(GL_BLEND);
    glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);        		
    //打开文档
    if(_state == PaintingView_Open){
        [self open];
        _state = PaintingView_Normal;        
    }
    
    _curPaintOperation = [[PaintOperation alloc]initWithBrush:_brush];
    _curPaintOperation.delegate = self;
    [_undoStack push:_curPaintOperation];
    
//    [self copyScreenBufferToTexture:_undoBaseTexture];
}

- (void)setBackgroundUIImage:(UIImage*)uiImage{
    [EAGLContext setCurrentContext:_context];
    _backgroundTexture = [[TextureManager sharedInstance] loadTextureInfoFromUIImage:uiImage].name;
    [self updateRender];
}

- (void)setBackgroundImage:(NSString*)imagePath{
    [EAGLContext setCurrentContext:_context];
    _backgroundTexture = [[TextureManager sharedInstance] loadTextureInfoFromImagePath:imagePath reload:false].name;
    [self updateRender];    
}
#pragma mark- Buffer
- (BOOL)createUndoBaseFramebuffer{
    //创建frame buffer
    glGenFramebuffersOES(1, &_undoBaseFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _undoBaseFramebuffer);    
    //链接renderBuffer对象
    glGenTextures(1, &_undoBaseTexture);
    glBindTexture(GL_TEXTURE_2D, _undoBaseTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _undoBaseTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}   
    
	return YES;    
}
- (BOOL)createUndoCheckFramebuffer{
    //创建frame buffer
    glGenFramebuffersOES(1, &_undoCheckFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _undoCheckFramebuffer);
    //链接renderBuffer对象
    glGenTextures(1, &_undoCheckTexture);
    glBindTexture(GL_TEXTURE_2D, _undoCheckTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _undoCheckTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
	return YES;
}
- (BOOL)createDebugQuadVerticesbuffer{
//    float widthScale = (float)_brush.brushState.radius*2 / (float)self.frame.size.height;
//    float heightScale = (float)_brush.brushState.radius*2 / (float)self.frame.size.height;
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
    glBindVertexArrayOES(_debugVertexArray);
    
    glGenBuffers(1, &_debugVertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _debugVertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(debugQuadVertices), debugQuadVertices, GL_STREAM_DRAW);
    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);    
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
    
    return true;
}
- (BOOL)createDebugQuadVerticesbuffer2{
    //    float widthScale = (float)_brush.brushState.radius*2 / (float)self.frame.size.height;
    //    float heightScale = (float)_brush.brushState.radius*2 / (float)self.frame.size.height;
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
    glBindVertexArrayOES(_debugVertexArray2);
    
    glGenBuffers(1, &_debugVertexBuffer2);
    glBindBuffer(GL_ARRAY_BUFFER, _debugVertexBuffer2);
    glBufferData(GL_ARRAY_BUFFER, sizeof(debugQuadVertices2), debugQuadVertices2, GL_STREAM_DRAW);
    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
    
    return true;
}
- (BOOL)createQuadTexturebuffer{
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(quadVertices), quadVertices, GL_STREAM_DRAW);
    
	// Render the vertex array
    glEnableVertexAttribArray(GLKVertexAttribPosition);    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), 0);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);    
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(QuadVertex), BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
    
    return true;
}




- (BOOL)createBrushFramebuffer{
    //创建frame buffer
    glGenFramebuffersOES(1, &_brushFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
    //链接renderBuffer对象
    glGenTextures(1, &_brushTexture);
    glBindTexture(GL_TEXTURE_2D, _brushTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _brushTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
	return YES;
}



- (BOOL)createFramebuffer
{
	// Generate IDs for a framebuffer object and a color renderbuffer
    if (_finalFramebuffer==0) {
        glGenFramebuffersOES(1, &_finalFramebuffer);
    }
    if (_finalRenderbuffer==0) {
        glGenRenderbuffersOES(1, &_finalRenderbuffer);
    }
	
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, _finalRenderbuffer);
	// This call associates the storage for the current render buffer with the EAGLDrawable (our CAEAGLLayer)
	// allowing us to draw into a buffer that will later be rendered to screen wherever the layer is (which corresponds with our view).
	[_context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(id<EAGLDrawable>)self.layer];
	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, _finalRenderbuffer);
	
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &_backingWidth);
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &_backingHeight);
	
	// For this sample, we also need a depth buffer, so we'll create and attach one via another renderbuffer.
//	glGenRenderbuffersOES(1, &depthRenderbuffer);
//	glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
//	glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, _backingWidth, _backingHeight);
//	glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
	
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
	
	return YES;
}

// Clean up any buffers we have allocated.
- (void)destroyBuffers
{
    [self tearDownScreenQuadBuffer];
    
   
    if(_finalFramebuffer){
        glDeleteFramebuffersOES(1, &_finalFramebuffer);
        _finalFramebuffer = 0;
        checkGL
    }
    
    if(_finalRenderbuffer){
        glDeleteRenderbuffersOES(1, &_finalRenderbuffer);
        _finalRenderbuffer = 0;
        checkGL
    }
	
    
	if(_depthRenderbuffer)
	{
		glDeleteRenderbuffersOES(1, &_depthRenderbuffer);
		_depthRenderbuffer = 0;
        checkGL
	}
    
    for(int i = 0; i< _layerTextureInfos.count;++i){
        GLKTextureInfo* texInfo = [_layerTextureInfos objectAtIndex:i];
        
        GLuint name = texInfo.name;
        glDeleteTextures(1, &name);
        _curLayerTexture = 0;
        checkGL
    }
    
    for(int i = 0; i< _layerFramebuffers.count;++i){
        NSNumber* number = [_layerFramebuffers objectAtIndex:i];
        
        GLuint layerFramebuffer = (GLuint)number.intValue;
        glDeleteFramebuffersOES(1, &layerFramebuffer);
        _curLayerFramebuffer = 0;
        checkGL
    }
    
    if(_tempLayerFramebuffer){
        glDeleteFramebuffersOES(1, &_tempLayerFramebuffer);
        _tempLayerFramebuffer = 0;
        checkGL
    }
    
    if(_tempLayerTexture){
        glDeleteTextures(1, &_tempLayerTexture);
        _tempLayerTexture = 0;
        checkGL
    }
    
#if SIMPLE_LAYER
#else
    if(_blendLayerFramebuffer){
        glDeleteFramebuffersOES(1, &_blendLayerFramebuffer);
        _blendLayerFramebuffer = 0;
        checkGL
    }
    
    if(_blendLayerTexture){
        glDeleteTextures(1, &_blendLayerTexture);
        _blendLayerTexture = 0;
        checkGL
    }
    
    if(_composedLayerFramebuffer){
        glDeleteFramebuffersOES(1, &_composedLayerFramebuffer);
        _composedLayerFramebuffer = 0;
        checkGL
    }
    
    if(_composedLayerTexture){
        glDeleteTextures(1, &_composedLayerTexture);
        _composedLayerTexture = 0;
        checkGL
    }
#endif
    
    if(_backgroundTexture){
        glDeleteTextures(1, &_backgroundTexture);
        _backgroundTexture = 0;
        checkGL
    }

    
    if(_brushFramebuffer){
        glDeleteFramebuffersOES(1, &_brushFramebuffer);
        _brushFramebuffer = 0;
        checkGL
    }
    
    if (_brushTexture) {
        glDeleteTextures(1, &_brushTexture);
        _brushTexture = 0;
        checkGL
    }

    if(_undoBaseFramebuffer){
        glDeleteFramebuffersOES(1, &_undoBaseFramebuffer);
        _undoBaseFramebuffer = 0;
        checkGL
    }

    if (_undoBaseTexture) {    
        glDeleteTextures(1, &_undoBaseTexture);
        _undoBaseTexture = 0;
        checkGL
    }
    
    if(_undoCheckFramebuffer){
        glDeleteFramebuffersOES(1, &_undoCheckFramebuffer);
        _undoCheckFramebuffer = 0;
        checkGL
    }
    if (_undoCheckTexture) {
        glDeleteTextures(1, &_undoCheckTexture);
        _undoCheckTexture = 0;
        checkGL
    }
    
    if (_debugVertexBuffer) {
        glDeleteBuffers(1, &_debugVertexBuffer);
        _debugVertexBuffer = 0;
        checkGL
    } 
    if (_debugVertexArray) {
        glDeleteVertexArraysOES(1, &_debugVertexArray);
        _debugVertexArray = 0;
        checkGL
    }
    
    if (_debugVertexBuffer2) {
        glDeleteBuffers(1, &_debugVertexBuffer2);
        _debugVertexBuffer2 = 0;
        checkGL
    }
    if (_debugVertexArray2) {
        glDeleteVertexArraysOES(1, &_debugVertexArray2);
        _debugVertexArray2 = 0;
        checkGL
    }
    
//    GLuint _importedImageTexName = _toTransformImageTex.name;
//    glDeleteTextures(1, &_importedImageTexName);
    
    glDeleteTextures(1, &_toTransformImageTex);
}
- (void)releaseUndoRedo{
    _undoStack = nil;
    _redoStack = nil;
    _curPaintOperation = nil;
}
- (void)releaseResource{
	if([EAGLContext currentContext] == _context)
	{
		[EAGLContext setCurrentContext:nil];
	}
    
    [self destroyBuffers];
    if(_programQuad){
        glDeleteProgram(_programQuad);
        _programQuad = 0;
    }

    [self releaseUndoRedo];
}
// Releases resources when they are not longer needed.
- (void) dealloc
{
    [self releaseResource];
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
// Handles the start of a touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //非绘制操作
    if([touches count]>1 || isTransformOperating)
        return;
    
    //开始绘制，关闭所有打开的UI
    [delegate paintViewTouchBegan];

	CGRect				bounds = [self bounds];
    UITouch*	touch = [touches anyObject];
	firstTouch = YES;
	// Convert touch point from UIView referential to OpenGL one (upside-down flip)
	location = [touch locationInView:self];
	location.y = bounds.size.height - location.y;

    if (isEyeDroppering) {
        [delegate eyeDropStart];
        [self eyeDropColor];
    }
    else {
        [self startDraw];
    }

}

// Handles the continuation of a touch.
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{  
    if([touches count]>1 || isTransformOperating)
        return;
    
	CGRect				bounds = [self bounds];
	UITouch*			touch = [touches anyObject];
		
	// Convert touch point from UIView referential to OpenGL one (upside-down flip)
	if (firstTouch) {
		firstTouch = NO;
	}
    
    location = [touch locationInView:self];
    location.y = bounds.size.height - location.y;
	previousLocation = [touch previousLocationInView:self];
	previousLocation.y = bounds.size.height - previousLocation.y;
    
    if (isEyeDroppering) {
        [self eyeDropColor];
    }
    else {
        [self draw];
    }

}

// Handles the end of a touch event when the touch is a tap.
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded!");
    if ([touches count]>1) {
        return;
    }
    
    if (isTransformOperating) {
        isTransformOperating = false;
        return;
    }    
    
	CGRect	bounds = [self bounds];
    NSLog(@"touchesEnded count %d", [touches count]);
    UITouch*	touch = [[touches allObjects]objectAtIndex:0];
    
	if (firstTouch) {
		firstTouch = NO;
	}
    previousLocation = [touch previousLocationInView:self];
    previousLocation.y = bounds.size.height - previousLocation.y;
    
    if (isEyeDroppering) {
        [delegate eyeDropEnd];
    }
    else {
        [self draw];    
        
        [self endDraw];
    }

}

// Handles the end of a touch event.
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	// If appropriate, add code necessary to save the state of the application.
	// This application is not saving state.
}


#pragma mark-
//drawFinalTextureToRenderbuffe

#if SIMPLE_LAYER
- (void)updateRender{
    NSLog(@"== UpdateRender ==");
    [EAGLContext setCurrentContext:_context];
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    //合成图层
    for (int i = 0; i < _paintData.layers.count; ++i) {
        [self drawLayerAtIndex:i];
    }

    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
    NSLog(@"== UpdateRender End ==");
}

#else
- (void)updateRender{
    NSLog(@"== UpdateRender ==");
    [EAGLContext setCurrentContext:_context];

    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _composedLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    //合成图层
    for (int i = 0; i < _paintData.layers.count; ++i) {
        [self drawLayerAtIndex:i];

        NSLog(@"copy _composedLayerTexture %d to _blendLayerTex %d", _composedLayerTexture, _blendLayerTexture);
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _blendLayerFramebuffer);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        [self drawScreenQuadWithTexture2DPremultiplied:_composedLayerTexture];
        
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _composedLayerFramebuffer);
    }
    

    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    [self drawScreenQuadWithTexture2DPremultiplied:_composedLayerTexture];
    
    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
    NSLog(@"== UpdateRender End ==");    
}
#endif

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
//    NSLog(@"swap Framebuffer:%d to Painted %d Texture:%d to Painted %d", _curLayerFramebuffer, _curPaintedLayerFramebuffer, _curLayerTexture, _curPaintedLayerTexture);
//}

//将临时buffer的内容拷贝到当前层
- (void)copyCurLayerToTempLayer{
    [EAGLContext setCurrentContext:_context];
    
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glClear(GL_COLOR_BUFFER_BIT);
    
    [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
    NSLog(@"copyCurLayer: %d ToTempLayer: %d", _curLayerTexture, _tempLayerTexture);
}

- (void)copyTempLayerToCurLayer{
    [EAGLContext setCurrentContext:_context];
    
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glClear(GL_COLOR_BUFFER_BIT);
    
    [self drawScreenQuadWithTexture2DPremultiplied:_tempLayerTexture];
    NSLog(@"copyTempLayerTex: %d ToCurLayerTex: %d",_tempLayerTexture, _curLayerTexture);
}

- (void)copyScreenBufferToTexture:(GLuint)texture{
    glBindTexture(GL_TEXTURE_2D, texture);
    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, 1024, 1024);
}

//-(void)drawRect:(CGRect)rect{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    if (self.isUndoDrawing) {//用上次描画touch down按下时保存下来的image覆盖context
//        CGImageRef undoImage = [_undoStack lastUndoImage];
//        CGContextDrawImage(ctx, self.bounds, undoImage);
//        self.isUndoDrawing = false;
//    }
//    else if (self.isRedoDrawing) {
//        CGImageRef redoImage = [_redoStack pop];
//        if (redoImage!=nil) {
//            [_undoStack push:redoImage];
////            CGContextDrawImage(cacheContext, self.bounds, redoImage);//保证下次touchBegan tempImage取道最新的cacheContext
//            CGContextDrawImage(ctx, self.bounds, redoImage);
//
//        }
//        self.isRedoDrawing = false;
//
//        //禁止redo功能
//        if ([_redoStack size]==0) {
//            [delegate redoDisabled];
//        }
//
//    }
//}


- (void) clearData
{
    int count = _paintData.layers.count;
    for (int i = count-1; i >= 0; i--) {
        [self deleteLayerAtIndex:i];
    }
    [self insertBlankLayerAtIndex:-1 transparent:false];
//
//    
//	[EAGLContext setCurrentContext:_context];
//    
//	//clear all paint layer
//    for (int i = 0; i < _paintData.layers.count; ++i) {
//        NSNumber* num = [_layerFramebuffers objectAtIndex:i];
//        GLuint layerFramebuffer = (GLuint)num.intValue;
//        glBindFramebufferOES(GL_FRAMEBUFFER_OES, layerFramebuffer);
//        glClearColor(0.0, 0.0, 0.0, 0.0);
//        glClear(GL_COLOR_BUFFER_BIT);
//    }
//    //	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curLayerFramebuffer);
//    //	glClearColor(0.0, 0.0, 0.0, 0.0);
//    //	glClear(GL_COLOR_BUFFER_BIT);
//    
//	// Clear the buffer
//	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
//	glClearColor(0.0, 0.0, 0.0, 0.0);
//	glClear(GL_COLOR_BUFFER_BIT);
//    
//    [self updateRender];

}

// Erases the screen
- (void) erase
{
	[EAGLContext setCurrentContext:_context];
    
	//clear all paint layer
    for (int i = 0; i < _paintData.layers.count; ++i) {
        NSNumber* num = [_layerFramebuffers objectAtIndex:i];
        GLuint layerFramebuffer = (GLuint)num.intValue;
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, layerFramebuffer);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
    }
//	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curLayerFramebuffer);
//	glClearColor(0.0, 0.0, 0.0, 0.0);
//	glClear(GL_COLOR_BUFFER_BIT);
    
	// Clear the buffer
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
	glClearColor(0.0, 0.0, 0.0, 0.0);
	glClear(GL_COLOR_BUFFER_BIT);
    
    [self updateRender];
    
    
    //清空undo redo
}



- (void)eyeDropColor{
    [EAGLContext setCurrentContext:_context];
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
    
    GLubyte *data = (GLubyte*)malloc(4 * sizeof(GLubyte));
    // Read pixel data from the framebuffer
    glPixelStorei(GL_PACK_ALIGNMENT, 4);
    glReadPixels(location.x, location.y, 1, 1, GL_RGBA, GL_UNSIGNED_BYTE, data);
    CGFloat components[4];
    components[0] = (float)data[0] / 255.0f;
    components[1] = (float)data[1] / 255.0f;
    components[2] = (float)data[2] / 255.0f;
    components[3] = 1.0f;
    NSLog(@"eyeDropColor R:%.2f G:%.2f B:%.2f A:%.2f", components[0], components[1], components[2], components[3]);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, components);
    UIColor* uiColor = [UIColor colorWithCGColor:color];
    [_brush setColor:uiColor];
    [delegate eyeDropping:CGPointMake(location.x, self.frame.size.height - location.y) Color:uiColor];
    CGColorSpaceRelease(colorSpaceRef);
    CGColorRelease(color);
}


- (void)setBrush:(Brush *)brush{
    _brush = brush;
    [delegate brushChanged:brush];
}

#pragma mark- Draw
- (void)startDraw{
    NSLog(@"startDraw!");
    
    [_brush startDraw:location];
    
    [EAGLContext setCurrentContext:_context];
    
//    [self swapCurLayerFramebufferTexture];
    
    if (_brush.brushState.brushId != 4) {
        //在吸取屏幕颜色的brush吸取颜色之后，切换到brushFramebuffer
        //clear brushFramebuffer
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
    }
    else {
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curLayerFramebuffer);
    }
    
    //undo redo
    [_redoStack clear];
    [delegate redoDisabled];
    _curPaintOperation = [[PaintOperation alloc]initWithBrush:_brush];
    _curPaintOperation.delegate = self;
    [_undoStack push:_curPaintOperation];
    
    //启动绘画，如果有长按，会在长按识别发生时关闭
    _brush.isDrawing = true;
    //把之前的绘图结果画到底板用于混合
    //    if (self.paintRefImage!=nil) {
    //        GLubyte * texData = [Ultility loadTextureDataFromUIImage:self.paintRefImage];
    //        [self drawScreenQuadWithTextureData:texData];
    //    }    
}

- (void)prepareDraw:(int)brushId
{
//    NSLog(@"brushId:%d", brushId);
    if (brushId != 4) {
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
    }
    else {
        //上帧的内容是finalTexturebuffer的内容
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _curLayerFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
    }
}

- (void) draw{
    //    BNRTimeBlock (^{//测试运行速度
	[EAGLContext setCurrentContext:_context];
    
    [self prepareDraw:_brush.brushState.brushId];
    
    //笔刷属性 移动到选择ui交互上
    [_brush prepare];
    
    //渲染笔触到brushFramebuffer上
    [_brush renderLineFromPoint:previousLocation toPoint:location];
    
    //合成finalFramebuffer结果
    [self afterDraw];
    
    //记录绘图信息
    [_curPaintOperation addPathPointStart:previousLocation End:location];
    
#if DEBUG_VIEW_COLORALPHA
    //小窗口检测buffer内容
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
    [self drawDebugScreenQuadWithTexture2DPremultiplied:_tempLayerTexture];
    [self drawDebugScreenQuad2WithTexture2DPremultiplied:_tempLayerTexture];
    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
#endif
    
    //代理
    [delegate touchMoving:location];
}

- (void)afterDraw{
    if (![_brush.typeName isEqual: @"finger"]) {
        //绑定最终显示buffer
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);    

        [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
        NSLog(@"draw curLayerTexture %d on curPaintedLayerFramebuffer %d Tex %d", _curLayerTexture, _tempLayerFramebuffer, _tempLayerTexture);
        
        [self drawScreenQuadWithTexture2D:_brushTexture Alpha:_brush.brushState.opacity];
        
//        [self copyTempLayerToCurLayer];
        
        [self updateRender];
     
    }
    else{
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
        
        //图层相关
        [self updateRender];
    }
}
- (void)endDraw{
    //如果绘制记录满Undo次数一倍，则把截屏的结果记录到undoCheckImage中，用于之后的交换
    if ([_undoStack size] == UndoMaxCount) {
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _undoCheckFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        [self drawScreenQuadWithTexture2DPremultiplied:_tempLayerTexture];
        //        [self copyScreenBufferToTexture:(_undoCheckTexture)];
        
    }
    //如果绘制记录满Undo次数两倍，则在undoCheckImage的结果作为undoBaseImage，用于之后的Undo描画基准，并清空Undo描画基准前的所有UndoOperation
    else if ([_undoStack size] == UndoMaxCount*2) {
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _undoBaseFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        [self drawScreenQuadWithTexture2DPremultiplied:_undoCheckTexture];
        
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _undoCheckFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        [self drawScreenQuadWithTexture2DPremultiplied:_tempLayerTexture];
        //        [self copyScreenBufferToTexture:(_undoCheckTexture)];
        glViewport(0, 0, self.frame.size.width, self.frame.size.height);
        
        //删除undoBaseImage之前的paint operation
        for (int i=0; i<UndoMaxCount-1; ++i) {
            PaintOperation* op = [_undoStack pop_reverse];
//            NSLog(@"PaintOperation object:%@ inStack:%@", op, self);
            op = nil;
        }
    }
    
    //    [self swapFinalTextureFramebuffer];
    //    [self copyScreenBufferToTexture:(_paintTexturebuffer)];
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);

    //将临时buffer的内容拷贝到当前层
    [self copyTempLayerToCurLayer];

    //更新UI
    [delegate layerDirtyAtIndex:_curLayerIndex];
    
    
    _brush.isDrawing = false;
    //    _eyeDropper.isDrawing = false;
}


#pragma mark- Undo Redo
/*机制 记录形式为: UndoMaxCount = 4
 (PaintOp)UndoBaseImage PaintOp PaintOp PaintOp PaintOp(UndoCheckPointImage<-> UndoBaseImage) PaintOp PaintOp PaintOp PaintOp(Current <->UndoCheckPointImage)
 */
- (void)undoDraw{
    if ([_undoStack size] <=1) {//初始化中保留一个初始image
        return;
    }
    //把undoStack的顶层的内容推到redoStack中
    [_redoStack push:[_undoStack pop]];
    
    //以_undoBaseTexture为基准，从stack头取出所有Operation playback renderLineFromPoint
    [EAGLContext setCurrentContext:_context];
//    [self swapCurLayerFramebufferTexture];
    
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
	glClear(GL_COLOR_BUFFER_BIT);
    //_undoBaseTexture是黑底混合的图，使用ONE ONE_MINUS_SRCALPHA混合
    [self drawScreenQuadWithTexture2DPremultiplied:_undoBaseTexture];
    
    //    NSLog(@"paint undo base image");
    for (int i = 1; i < [_undoStack size];++i) {
        PaintOperation* op = (PaintOperation*)[[_undoStack allPaintOperations]objectAtIndex:i];
        
        [self prepareDraw:op.brushState.brushId];
        
        if (op.brushState.brushId != 4) {
            glClearColor(0.0, 0.0, 0.0, 0.0);
            glClear(GL_COLOR_BUFFER_BIT);
            
            [op draw];
            //            NSLog(@"paint undo operation %@", (id)op);
            
            glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
            [self drawScreenQuadWithTexture2D:_brushTexture Alpha:op.brushState.opacity];
        }
        else {
            [op draw];
        }
    }
    
    [self updateRender];
    
    //    [self swapFinalTextureFramebuffer];
    //    [self copyScreenBufferToTexture:(_paintTexturebuffer)];
}
- (void)redoDraw{
    if ([_redoStack size] == 0) {
        return;
    }
    
    PaintOperation* op = [_redoStack pop];
    if (op!=nil) {
        [_undoStack push:op];
    }
    
    [EAGLContext setCurrentContext:_context];
    
//    [self swapCurLayerFramebufferTexture];
    
    [self prepareDraw:op.brushState.brushId];
    
    if (op.brushState.brushId != 4) {
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        
        [op draw];
        
        //put offscreen undo result to screen
        // Display the buffer
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
        glViewport(0, 0, UndoImageSize, UndoImageSize);
        glClearColor(0.0, 0.0, 0.0, 0.0);
        glClear(GL_COLOR_BUFFER_BIT);
        
        [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
        [self drawScreenQuadWithTexture2D:_brushTexture Alpha:op.brushState.opacity];
    }
    else {
        [op draw];
    }
    
    [self updateRender];
    
    //    [self swapFinalTextureFramebuffer];
    //    [self copyScreenBufferToTexture:(_paintTexturebuffer)];
    
    
    //禁止redo功能
    if ([_redoStack size]==0) {
        [delegate redoDisabled];
    }
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
//            NSLog(@"Error: Create folder failed %@", undoImagesDir);
//
//    NSString* path = [NSString stringWithFormat:@"undoImages/image%d.png", _undoCount++];
//    [_undoStack push:path];     
//}

#pragma mark- Undo Redo delegate
- (void)topElementAdded:(id)object{
    NSString* path = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:object];
    if( ![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        self.paintingImage = [Ultility snapshot:self Context:_context InViewportSize:self.frame.size ToOutputSize:CGSizeMake(UndoImageSize, UndoImageSize)];

        [Ultility saveUIImage: self.paintingImage  ToPNGInDocument:(NSString*)object];         

    }
}

- (void)bottomElementRemoved:(id)object{
    [Ultility deletePNGInDocument:(NSString*)object];
}

- (void)topElementRemoved:(id)object{}

- (void)allElementRemoved{}

#pragma mark- Paint Frame
- (void)uploadDataAtIndex:(int)index{
    //TODO: 隐藏其他图层，截取当前图层
    NSNumber* num = [_layerFramebuffers objectAtIndex:index];
    GLuint layerFramebuffer = [num intValue];
    UIImage* image = [self snapshotFramebufferToUIImage:layerFramebuffer];
    PaintLayer* layer =  [_paintData.layers objectAtIndex:index];
    layer.data = nil;
    layer.data = UIImagePNGRepresentation(image);
}

- (void)uploadLayerDataAtIndex:(int)index{
    NSNumber* num = [_layerFramebuffers objectAtIndex:index];
    GLuint layerFramebuffer = num.intValue;
    UIImage* image = [self snapshotFramebufferToUIImage:layerFramebuffer];
    
    PaintLayer* layer =  [_paintData.layers objectAtIndex:index];
    layer.data = UIImagePNGRepresentation(image);
}

- (void)uploadLayerDatas{
    //更新层的内容
    for (int i =0; i < _paintData.layers.count; ++i) {
        PaintLayer* layer = [_paintData.layers objectAtIndex:i];
        if (layer.dirty == true) {
            [self uploadLayerDataAtIndex:i];
            layer.dirty = false;
        }
    }
}

- (void)close{
    [self destroyBuffers];

	if([EAGLContext currentContext] == _context)
	{
		[EAGLContext setCurrentContext:nil];
	}
    
    _undoStack = nil;
    _redoStack = nil;
}
- (void)toOpen:(PaintData*)data{
    //如果data是nil, _paintData无法保存paintDoc的data数据
    _paintData = data;
    _state = PaintingView_Open;    
}

//打开文件
- (void)open{
    //新文档，创建新的paintData
    if(_paintData==nil){
        _paintData = [[PaintData alloc]initWithTitle:@"newDoc"];
        NSLog(@"New Data!");
        //添加默认图层
        PaintLayer* paintLayer = [PaintLayer createBlankLayerWithSize:self.frame.size transparent:false];
        [_paintData.layers addObject:paintLayer];
        //更新PaintScreen下的paintDoc数据
    }

    //创建临时绘制层
    [self createTempLayerFramebufferTexture];
#if SIMPLE_LAYER
#else
    //创建临时混合层
    [self createBlendLayerFramebufferTexture];
    [self createComposedLayerFramebufferTexture];
#endif
    
    //从paintData创建显示用的layer texture
    [self createLayerFramebufferTextures];
    [self setCurLayerIndex:0];
    
    //copy to undo
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _undoBaseFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    [self drawScreenQuadWithTexture2DPremultiplied:_tempLayerTexture];
    
    [self updateRender];
}
#pragma mark- Paint Operation Delegate

- (void) prepareBrushState:(BrushState*)brushState FromPoint:(CGPoint)startPoint{
    Brush *brush = [brushTypes objectAtIndex:brushState.brushId];
    [brush startDraw:startPoint];
    [brush prepareWithBrushState:brushState];
}
- (void) drawFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId{
    Brush *brush = [brushTypes objectAtIndex:brushId];    
    [brush renderLineFromPoint:start toPoint:end];
}

- (void) endDrawPaintOperation{

}

#pragma mark- Layer

//创建图层
- (BOOL)createLayerFramebufferTextures{
    _layerTextureInfos = [[NSMutableArray alloc]init];
    _layerFramebuffers = [[NSMutableArray alloc]init];
    for (int i=0; i < _paintData.layers.count; ++i) {
        PaintLayer* layer = [_paintData.layers objectAtIndex:i];
        
        GLuint layerFramebuffer = 0;
        glGenFramebuffersOES(1, &layerFramebuffer);
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, layerFramebuffer);
        GLKTextureInfo* texInfo = [[TextureManager sharedInstance]loadTextureInfoFromData:layer.data];
        NSLog(@"load layerTexture %d layerData:%d width:%d height:%d", texInfo.name, (id)layer.data, texInfo.width, texInfo.height);
        glBindTexture(GL_TEXTURE_2D, texInfo.name);
        glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, texInfo.name, 0);
        glBindTexture(GL_TEXTURE_2D,0);
        
        if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
        {
            NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
            return NO;
        }
        
        NSNumber* layerFramebufferNum = [NSNumber numberWithInt:layerFramebuffer];
        [_layerFramebuffers addObject:layerFramebufferNum];
        [_layerTextureInfos addObject:texInfo];

    }

    return true;
}

- (BOOL)createTempLayerFramebufferTexture{
    //创建frame buffer
    glGenFramebuffersOES(1, &_tempLayerFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    //链接renderBuffer对象
    glGenTextures(1, &_tempLayerTexture);
    glBindTexture(GL_TEXTURE_2D, _tempLayerTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _tempLayerTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
    NSLog(@"createTempLayerFramebuffer: %d Texture: %d", _tempLayerFramebuffer, _tempLayerTexture);
	return YES;
}
#if SIMPLE_LAYER
#else
- (BOOL)createBlendLayerFramebufferTexture{
    //创建frame buffer
    glGenFramebuffersOES(1, &_blendLayerFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _blendLayerFramebuffer);
    //链接renderBuffer对象
    glGenTextures(1, &_blendLayerTexture);
    glBindTexture(GL_TEXTURE_2D, _blendLayerTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _blendLayerTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
    NSLog(@"createBlendLayerFramebuffer: %d Texture: %d", _blendLayerFramebuffer, _blendLayerTexture);
    
    //初始化
    glClearColor(1.0, 1.0, 1.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
	return YES;
}
- (BOOL)createComposedLayerFramebufferTexture{
    //创建frame buffer
    glGenFramebuffersOES(1, &_composedLayerFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _composedLayerFramebuffer);
    //链接renderBuffer对象
    glGenTextures(1, &_composedLayerTexture);
    glBindTexture(GL_TEXTURE_2D, _composedLayerTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _composedLayerTexture, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
    NSLog(@"createComposedLayerFramebufferTexture: %d Texture: %d", _composedLayerFramebuffer, _composedLayerTexture);
    
    //初始化
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
	return YES;
}
#endif
- (int)curLayerIndex {
    return _curLayerIndex;
}

//设置当前图层
- (void)setCurLayerIndex:(int)newValue {
    if (newValue < 0) {
        return;
    }
    
    _curLayerIndex = newValue;
    NSNumber* layerFramebuffer = [_layerFramebuffers objectAtIndex:_curLayerIndex];
    _curLayerFramebuffer = (GLuint)[layerFramebuffer intValue];
    GLKTextureInfo* texInfo = [_layerTextureInfos objectAtIndex:_curLayerIndex];
    _curLayerTexture = texInfo.name;
    
    NSLog(@"Set _curLayerIndex: %d _curLayerFramebuffer: %d _curLayerTexture: %d ", _curLayerIndex, _curLayerFramebuffer, _curLayerTexture);
    
    //将当前层内容拷贝到临时绘制层种
    [self copyCurLayerToTempLayer];
}

//插入图层
- (void)insertBlankLayerAtIndex:(int)index transparent:(bool)transparent{
    NSLog(@"insertLayerAtIndex: %d", index);
//数据
    //layer
    PaintLayer *layer = [PaintLayer createBlankLayerWithSize:self.frame.size transparent:transparent];
    [_paintData.layers insertObject:layer atIndex:index+1];
    
    //texture
    GLKTextureInfo* texInfo = [[TextureManager sharedInstance]loadTextureInfoFromData:layer.data];
    NSLog(@"load layerTexture %d layerData:%d", texInfo.name, (id)layer.data);    
    [_layerTextureInfos insertObject:texInfo atIndex:index+1];
    
    //framebuffer
    GLuint layerFramebuffer = 0;
    glGenFramebuffersOES(1, &layerFramebuffer);
    NSLog(@"gen layerFramebuffer %d", layerFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, layerFramebuffer);
    glBindTexture(GL_TEXTURE_2D, texInfo.name);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, texInfo.name, 0);
    glBindTexture(GL_TEXTURE_2D,0);
    
    if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
    {
        NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
    }
    
    NSNumber* layerFramebufferNum = [NSNumber numberWithInt:layerFramebuffer];
    [_layerFramebuffers insertObject:layerFramebufferNum atIndex:index+1];
    
    //layer index
    [self setCurLayerIndex:index + 1];
    
//显示
    [self updateRender];
}

- (void)deleteLayerAtIndex:(int)index{
    NSLog(@"deleteLayerAtIndex: %d", index);
//数据    
    //layer
    [_paintData.layers removeObjectAtIndex:index];
    
    //texture
    GLKTextureInfo* texInfo = [_layerTextureInfos objectAtIndex:index];
    GLuint tex = texInfo.name;
    glDeleteTextures(1, &tex);
    [_layerTextureInfos removeObject:texInfo];
    
    //framebuffer
    NSNumber* num = [_layerFramebuffers objectAtIndex:index];
    GLuint layerFramebuffer = [num intValue];
    glDeleteFramebuffersOES(1, &layerFramebuffer);
    [_layerFramebuffers removeObject:num];
    
    //layer index
    if (_curLayerIndex == index){
        [self setCurLayerIndex:(index-1)];
    }
    
    NSLog(@"_curLayerIndex is %d", _curLayerIndex);
    
//显示
    [self updateRender];
}

- (void)moveLayerUpFromIndex:(int)fromIndex ToIndex:(int)toIndex{
    PaintLayer* layer = [_paintData.layers objectAtIndex:fromIndex];
    [_paintData.layers removeObject:layer];
    [_paintData.layers insertObject:layer atIndex:toIndex];
    
    NSNumber* num = [_layerFramebuffers objectAtIndex:fromIndex];
    [_layerFramebuffers removeObject:num];
    [_layerFramebuffers insertObject:num atIndex:toIndex];

    GLKTextureInfo* texInfo = [_layerTextureInfos objectAtIndex:fromIndex];
    [_layerTextureInfos removeObject:texInfo];
    [_layerTextureInfos insertObject:texInfo atIndex:toIndex];
}

- (void)moveLayerDownFromIndex:(int)fromIndex ToIndex:(int)toIndex{
    PaintLayer* layer = [_paintData.layers objectAtIndex:fromIndex];
    [_paintData.layers insertObject:layer atIndex:toIndex+1];
    [_paintData.layers removeObjectAtIndex:fromIndex];
    
    NSNumber* num = [_layerFramebuffers objectAtIndex:fromIndex];
    [_layerFramebuffers insertObject:num atIndex:toIndex+1];
    [_layerFramebuffers removeObjectAtIndex:fromIndex];

    GLKTextureInfo* texInfo = [_layerTextureInfos objectAtIndex:fromIndex];
    [_layerTextureInfos insertObject:texInfo atIndex:toIndex+1];
    [_layerTextureInfos removeObjectAtIndex:fromIndex];

}

//绘制图层
- (void)drawLayerAtIndex:(int)index{
    PaintLayer* layer = [_paintData.layers objectAtIndex:index];

    //隐藏层不绘制
    if(layer.visible == false) return;
    
    //如果是当前绘图层
    if (_curLayerIndex == index) {
        //_paintTexturebuffer是黑底混合的图，使用ONE ONE_MINUS_SRCALPHA混合
        NSLog(@"drawLayerAtIndex: %d Texture: %d Current Painted!", index, _tempLayerTexture);
#if SIMPLE_LAYER
        [self drawLayerWithTex:_tempLayerTexture Blend:layer.blendMode];
#else
        [self drawLayerTex:_tempLayerTexture blendWithTex:_blendLayerTexture blendMode:layer.blendMode];
#endif

    }
    else{
        GLKTextureInfo* texInfo = [_layerTextureInfos objectAtIndex:index];
        NSLog(@"drawLayerAtIndex: %d Texture: %d", index, texInfo.name);
#if SIMPLE_LAYER
        [self drawLayerWithTex:texInfo.name Blend:layer.blendMode];
#else
        [self drawLayerTex:texInfo.name blendWithTex:_blendLayerTexture blendMode:layer.blendMode];
#endif

    }
    
}


//混合当前图层和下个图层
#if SIMPLE_LAYER
- (void) drawLayerWithTex:(GLuint)texture Blend:(CGBlendMode)blendMode{
	[EAGLContext setCurrentContext:_context];
    glUseProgram(_programQuad);
    //texcoord and texture
    if (glIsTexture(texture)) {
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, texture);
    }
    else {
        NSLog(@"texture %d is invalid!", texture);
    }
    
    glUniform1i(_texQuadUniform, 0);
    glUniform1f(_alphaQuadUniform, 1);
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
    
    glEnable(GL_BLEND);

    switch (blendMode) {
        case kLayerBlendModeNormal:
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
        case kLayerBlendModeMultiply:
            glBlendFuncSeparate(GL_DST_COLOR, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
        case kLayerBlendModeAdd:
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
        case kLayerBlendModeScreen:
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
    }

    
    glBindVertexArrayOES(_vertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);
    
}
#else

- (void) drawLayerTex:(GLuint)srcTex blendWithTex:(GLuint)dstTex blendMode:(LayerBlendMode)blendMode{
    NSLog(@"drawLayerTex: %d blendWithTex: %d", srcTex, dstTex);
	[EAGLContext setCurrentContext:_context];
    
    switch (blendMode) {
        case kLayerBlendModeNormal:
            glUseProgram(_programPaintLayerBlendModeNormal);
            break;
        case kLayerBlendModeMultiply:
            glUseProgram(_programPaintLayerBlendModeMultiply);
            break;
        case kLayerBlendModeScreen:
            glUseProgram(_programPaintLayerBlendModeScreen);
            break;
        case kLayerBlendModeOverlay:
            glUseProgram(_programPaintLayerBlendModeOverlay);
            break;
        case kLayerBlendModeDarken:
            glUseProgram(_programPaintLayerBlendModeDarken);
            break;
        case kLayerBlendModeLighten:
            glUseProgram(_programPaintLayerBlendModeLighten);
            break;
        case kLayerBlendModeColorDodge:
            glUseProgram(_programPaintLayerBlendModeColorDodge);
            break;
        case kLayerBlendModeColorBurn:
            glUseProgram(_programPaintLayerBlendModeColorBurn);
            break;
        case kLayerBlendModeSoftLight:
            glUseProgram(_programPaintLayerBlendModeSoftLight);
            break;
        case kLayerBlendModeHardLight:
            glUseProgram(_programPaintLayerBlendModeHardLight);
            break;
        case kLayerBlendModeDifference:
            glUseProgram(_programPaintLayerBlendModeDifference);
            break;
        case kLayerBlendModeExclusion:
            glUseProgram(_programPaintLayerBlendModeExclusion);
            break;
        case kLayerBlendModeHue:
            glUseProgram(_programPaintLayerBlendModeHue);
            break;
        case kLayerBlendModeSaturation:
            glUseProgram(_programPaintLayerBlendModeSaturation);
            break;
        case kLayerBlendModeColor:
            glUseProgram(_programPaintLayerBlendModeColor);
            break;
        case kLayerBlendModeLuminosity:
            glUseProgram(_programPaintLayerBlendModeLuminosity);
            break;
        default:
            break;
    }


    //texcoord and texture
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, srcTex);
    
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, dstTex);
    
    glUniform1i(_srcTexUniform, 0);
    glUniform1i(_dstTexUniform, 1);
    
    glDisable(GL_BLEND);
//    glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    
    glBindVertexArrayOES(_vertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);
    
    glEnable(GL_BLEND);
    
}
#endif

- (void)setCurLayerBlendMode:(LayerBlendMode)blendMode{
    PaintLayer* layer = [_paintData.layers objectAtIndex:_curLayerIndex];
    layer.blendMode = blendMode;
    
    [self updateRender];
}
#pragma mark- Transform
//变换当前图层
- (void)transformCurLayer{
    _state = PaintingView_TransformLayer;
    
    float widthScale = 1;
    float heightScale = widthScale * (self.frame.size.height / self.frame.size.width);
    _imageTransformMatrixS = GLKMatrix4MakeScale(widthScale, heightScale, 1);
    _imageTransformQuaternionR = GLKQuaternionIdentity;
    _imageTransformMatrixT = GLKMatrix4Identity;
    _toTransformImageTex = _curLayerTexture;
    
    //将当前图层作为绘制来描画
    [self drawCurLayerTransformed];
}
- (void)transformImageBegan{
    _imageToTransformMatrixT = _imageTransformMatrixT;
    _imageToTransformQuaternionR = _imageTransformQuaternionR;
    _imageToTransformMatrixS = _imageTransformMatrixS;
}

-(void) transformImageDone{
    _transformedImageMatrix = GLKMatrix4Identity;
    [self copyTempLayerToCurLayer];
    
    //更新UI
    [self uploadLayerDataAtIndex:_curLayerIndex];
    
    _state = PaintingView_Normal;    
}

- (void)drawCurLayerTransformed{
    
    _transformedImageMatrix = GLKMatrix4Multiply(_imageTransformMatrixT, GLKMatrix4Multiply(GLKMatrix4MakeWithQuaternion(_imageTransformQuaternionR), _imageTransformMatrixS));
    
    //project
    float aspect = (float)self.frame.size.width / (float)self.frame.size.height;
    _transformedImageMatrix = GLKMatrix4Multiply(GLKMatrix4MakeScale(1, aspect, 1), _transformedImageMatrix);
    
    [EAGLContext setCurrentContext:_context];
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self drawQuadTransformMatrix:_transformedImageMatrix texture2DPremultiplied:_curLayerTexture];
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
//    [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
    
    //剪切正在编辑的Image原来的位置
//    glBlendFuncSeparate(GL_ZERO, GL_ONE_MINUS_SRC_ALPHA, GL_ZERO, GL_ONE_MINUS_SRC_ALPHA);
//    [self drawScreenQuadWithTexture2DPremultiplied:texture];
    
    [self drawScreenQuadWithTexture2D:_brushTexture Alpha:1];
    
    //    [self copyTempLayerToCurLayer];
    //更新渲染
    [self updateRender];
    
}

//将图片描画到笔刷Framebuffer中，然后进行正常图层合成。
- (void)drawImageTransformed:(GLuint)texture{
    _transformedImageMatrix = GLKMatrix4Multiply(_imageTransformMatrixT, GLKMatrix4Multiply(GLKMatrix4MakeWithQuaternion(_imageTransformQuaternionR), _imageTransformMatrixS));
    
    //project
    float aspect = (float)self.frame.size.width / (float)self.frame.size.height;
    _transformedImageMatrix = GLKMatrix4Multiply(GLKMatrix4MakeScale(1, aspect, 1), _transformedImageMatrix);
    
    [EAGLContext setCurrentContext:_context];
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _brushFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self drawQuadTransformMatrix:_transformedImageMatrix texture2DPremultiplied:texture];
    
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
    
   
    [self drawScreenQuadWithTexture2D:_brushTexture Alpha:1];
    
//    [self copyTempLayerToCurLayer];
    //更新渲染
    [self updateRender];

}

- (void)cancelInsertUIImageAtCurLayer{
    [EAGLContext setCurrentContext:_context];
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    glViewport(0, 0, UndoImageSize, UndoImageSize);
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self drawScreenQuadWithTexture2DPremultiplied:_curLayerTexture];
    
    //    [self copyTempLayerToCurLayer];
    //更新渲染
    [self updateRender];
}

//在当前图层剪切下选择范围的图层


//指定位置插入UIImage
- (void)insertUIImageAtCurLayer:(UIImage*)uiImage {
    GLKTextureInfo* texInfo = [[TextureManager sharedInstance] loadTextureInfoFromUIImage:uiImage];
    _toTransformImageTex = texInfo.name;
    
    float widthScale = (float)texInfo.width / (float)self.frame.size.width;
    float heightScale = widthScale * ((float)texInfo.height / (float)texInfo.width);
    _imageTransformMatrixS = GLKMatrix4MakeScale(widthScale, heightScale, 1);
    _imageTransformQuaternionR = GLKQuaternionIdentity;
    _imageTransformMatrixT = GLKMatrix4Identity;
 
    //将导入的图片作为绘制来描画
    [self drawImageTransformed:_toTransformImageTex];

}
- (void)freeTransformImageTranslate:(CGPoint)translation rotate:(float) angle scale:(float)scale{
//    NSLog(@"moveImage translation x:%.2f y:%.2f", translation.x, translation.y);    
    GLKMatrix4 translationMatrx = GLKMatrix4MakeTranslation(translation.x / (float)(self.frame.size.width*0.5), -translation.y / (float)(self.frame.size.width*0.5), 0);
    
    _imageTransformMatrixT = GLKMatrix4Multiply(translationMatrx, _imageToTransformMatrixT);
    
//    NSLog(@"rotateImage angle:%.2f", angle);
    GLKQuaternion rotationMatrx = GLKQuaternionMakeWithAngleAndAxis(angle, 0, 0, 1);
    
    _imageTransformQuaternionR = GLKQuaternionMultiply(rotationMatrx, _imageToTransformQuaternionR);
    
//    NSLog(@"scaleImage scale:%.2f", scale);
    GLKMatrix4 scaleMatrx = GLKMatrix4MakeScale(scale, scale, 1);
    
    _imageTransformMatrixS = GLKMatrix4Multiply(scaleMatrx, _imageToTransformMatrixS);
    
    if (_state == PaintingView_TransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:_toTransformImageTex];
    }
}

- (void)moveImage:(CGPoint)translation{
//    NSLog(@"moveImage translation x:%.2f y:%.2f", translation.x, translation.y);
    
    GLKMatrix4 translationMatrx = GLKMatrix4MakeTranslation(translation.x / (float)(self.frame.size.width*0.5), -translation.y / (float)(self.frame.size.width*0.5), 0);
    
    _imageTransformMatrixT = GLKMatrix4Multiply(translationMatrx, _imageToTransformMatrixT);
    
    if (_state == PaintingView_TransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:_toTransformImageTex];        
    }
}

- (void)rotateImage:(float)angle{
//    NSLog(@"rotateImage angle:%.2f", angle);
    
    GLKQuaternion rotationMatrx = GLKQuaternionMakeWithAngleAndAxis(angle, 0, 0, 1);
    
    _imageTransformQuaternionR = GLKQuaternionMultiply(rotationMatrx, _imageToTransformQuaternionR);
    
    if (_state == PaintingView_TransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:_toTransformImageTex];
    }
}

- (void)scaleImage:(float)scale{
//    NSLog(@"scaleImage scale:%.2f", scale);
    
    GLKMatrix4 scaleMatrx = GLKMatrix4MakeScale(scale, scale, 1);
    
    _imageTransformMatrixS = GLKMatrix4Multiply(scaleMatrx, _imageToTransformMatrixS);
    
    if (_state == PaintingView_TransformLayer) {
        [self drawCurLayerTransformed];
    }
    else{
        [self drawImageTransformed:_toTransformImageTex];
    }
}


- (CGPoint)imageScaleAnchor{
    GLKVector4 originCenter = GLKVector4Make(0, 0, 0, 1);
    GLKVector4 transformedAnchor = GLKMatrix4MultiplyVector4(_transformedImageMatrix, originCenter);
    float x = transformedAnchor.x * 0.5 + 0.5;
    float y = 1.0f - (transformedAnchor.y * 0.5 + 0.5);

    CGPoint anchor = CGPointMake(x * self.frame.size.width, y * self.frame.size.height);
    NSLog(@"anchor x:%.2f y:%.2f", anchor.x, anchor.y);
    
    return anchor;
}
#pragma mark- Opengl Draw Tools
typedef struct {
    float Position[3];
    float TexCoord[2];
    float Color[4];    
} QuadVertex;

QuadVertex quadVertices[] = {
    {{1.0f, -1.0f, 0.0},{1.0f, 0.0f}},
    {{-1.0f, -1.0f, 0.0},{ 0.0f, 0.0f}},
    {{1.0f, 1.0f, 0.0},{1.0f, 1.0f}},
    {{1.0f, 1.0f, 0.0},{1.0f, 1.0f}},
    {{-1.0f, -1.0f, 0.0},{0.0f, 0.0f}},
    {{-1.0f, 1.0f, 0.0},{0.0f, 1.0f}}   
};

- (void) tearDownScreenQuadBuffer{
    if (_vertexBuffer) {
        glDeleteBuffers(1, &_vertexBuffer);
        _vertexBuffer = 0;
    }
    if (_vertexArray) {
        glDeleteVertexArraysOES(1, &_vertexArray);
        _vertexArray = 0;
    }  
}
#if DEBUG_VIEW_COLORALPHA
- (void) drawDebugScreenQuadWithTexture2DPremultiplied:(GLuint)texture{
	[EAGLContext setCurrentContext:_context];
    
    glUseProgram(_programQuadDebugAlpha);
    //texcoord and texture
    glActiveTexture(GL_TEXTURE0);    
    glBindTexture(GL_TEXTURE_2D, texture);
    glUniform1i(_texQuadDebugUniform, 0);
    glUniform1f(_alphaQuadDebugUniform, 1);    
    
//    glDisable(GL_BLEND);
    glEnable(GL_BLEND);
    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE);
//    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ZERO);            
    
    glBindVertexArrayOES(_debugVertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);
//    glEnable(GL_BLEND);
}
- (void) drawDebugScreenQuad2WithTexture2DPremultiplied:(GLuint)texture{
	[EAGLContext setCurrentContext:_context];
    
    glUseProgram(_programQuadDebugColor);
    //texcoord and texture
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, texture);
    glUniform1i(_texQuadDebugUniform, 0);
    glUniform1f(_alphaQuadDebugUniform, 1);
    
    //    glDisable(GL_BLEND);
    glEnable(GL_BLEND);
    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE);
    //    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ZERO);
    
    glBindVertexArrayOES(_debugVertexArray2);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);
    //    glEnable(GL_BLEND);
}
#endif


- (void) drawQuadTransformMatrix:(GLKMatrix4)transformMatrix texture2DPremultiplied:(GLuint)texture{
	[EAGLContext setCurrentContext:_context];
    glUseProgram(_programQuad);
    //texcoord and texture
    if (glIsTexture(texture)) {
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, texture);
    }
    else {
        NSLog(@"texture %d is invalid!", texture);
    }
    
    glUniform1i(_texQuadUniform, 0);
    glUniform1f(_alphaQuadUniform, 1);
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, transformMatrix.m);
    
    glEnable(GL_BLEND);
    glBlendFuncSeparate(GL_ONE, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    
    glBindVertexArrayOES(_vertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);
    
}

- (void) drawScreenQuadWithTexture2DPremultiplied:(GLuint)texture{
	[EAGLContext setCurrentContext:_context];
    glUseProgram(_programQuad);
    //texcoord and texture
    if (glIsTexture(texture)) {
        glActiveTexture(GL_TEXTURE0);    
        glBindTexture(GL_TEXTURE_2D, texture);
    }
    else {
        NSLog(@"texture %d is invalid!", texture);
    }

    glUniform1i(_texQuadUniform, 0);
    glUniform1f(_alphaQuadUniform, 1);
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
    
    glEnable(GL_BLEND);
    glBlendFuncSeparate(GL_ONE, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);            
    
    glBindVertexArrayOES(_vertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);

}

- (void) drawScreenQuadWithTexture2D:(GLuint)texture{
	[EAGLContext setCurrentContext:_context];
    glUseProgram(_programQuad);
    //texcoord and texture
    if (glIsTexture(texture)) {
        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, texture);
    }
    else {
        NSLog(@"texture %d is invalid!", texture);
    }
    
    glUniform1i(_texQuadUniform, 0);
    glUniform1f(_alphaQuadUniform, 1);
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
    
    glEnable(GL_BLEND);
    glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    
    glBindVertexArrayOES(_vertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);
    
}
- (void) drawScreenQuadWithTexture2D:(GLuint)texture Alpha:(GLfloat)alpha{
	[EAGLContext setCurrentContext:_context];
    glUseProgram(_programQuad);
    //texcoord and texture
    glActiveTexture(GL_TEXTURE0);    
    glBindTexture(GL_TEXTURE_2D, texture);    
    glUniform1i(_texQuadUniform, 0);
    glUniform1f(_alphaQuadUniform, alpha);
    glUniformMatrix4fv(_tranformImageMatrixUniform, 1, false, GLKMatrix4Identity.m);
    
    [_brush setBlendMode];
    
    glBindVertexArrayOES(_vertexArray);
    
	glDrawArrays(GL_TRIANGLES, 0, 6);   
}

- (void) drawScreenQuadWithTextureData:(GLubyte*)data{
}

- (UIImage*)snapshotFramebufferToUIImage:(GLuint)framebuffer
{
	[EAGLContext setCurrentContext:_context];//之前有丢失context的现象出现
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, framebuffer);
    CGSize viewportSize = CGSizeMake(UndoImageSize, UndoImageSize);
    return [Ultility snapshot:self Context:_context InViewportSize:viewportSize ToOutputSize:viewportSize];
}

- (UIImage*)snapshotPaintToUIImage
{
	[EAGLContext setCurrentContext:_context];//之前有丢失context的现象出现
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _tempLayerFramebuffer);
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    return [Ultility snapshot:self Context:_context InViewportSize:self.frame.size ToOutputSize:CGSizeMake(UndoImageSize, UndoImageSize)];
}

- (UIImage*)snapshotScreenToUIImage
{
	[EAGLContext setCurrentContext:_context];//之前有丢失context的现象出现
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _finalFramebuffer);
    glViewport(0, 0, self.frame.size.width, self.frame.size.height);
    return [Ultility snapshot:self Context:_context InViewportSize:self.frame.size ToOutputSize:self.frame.size];
}

-(GLuint) createBrushWithImage: (NSString*)brushName
{
    
    GLuint          brushTexture = 0;
    CGImageRef      brushImage;
    CGContextRef    brushContext;
    GLubyte         *brushData;
    size_t          width, height;
    
    //initialize brush image
    brushImage = [UIImage imageNamed:brushName].CGImage;
    
    // Get the width and height of the image
    width = CGImageGetWidth(brushImage);
    height = CGImageGetHeight(brushImage);
    
    //make the brush texture and context
    if(brushImage) {
        // Allocate  memory needed for the bitmap context
        brushData = (GLubyte *) calloc(width * height, sizeof(GLubyte));
        // We are going to use brushData1 to make the final texture
//        brushData1 = (GLubyte *) calloc(width * height *4, sizeof(GLubyte));
        // Use  the bitmatp creation function provided by the Core Graphics framework. 
        
        CGColorSpaceRef brushColorSpace = CGColorSpaceCreateDeviceGray();
        brushContext = CGBitmapContextCreate(brushData, width, height, 8, width , brushColorSpace, kCGImageAlphaOnly);
        CGColorSpaceRelease(brushColorSpace);
        // After you create the context, you can draw the  image to the context.
        CGContextDrawImage(brushContext, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), brushImage);
        // You don't need the context at this point, so you need to release it to avoid memory leaks.
        CGContextRelease(brushContext);
        
        // Use OpenGL ES to generate a name for the texture.
        glGenTextures(1, &brushTexture);
        // Bind the texture name. 
        glBindTexture(GL_TEXTURE_2D, brushTexture);
        // Set the texture parameters to use a minifying filter and a linear filer (weighted average)
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        // Specify a 2D texture image, providing the a pointer to the image data in memory
        glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, width, height, 0, GL_ALPHA, GL_UNSIGNED_BYTE, brushData);
        // Release  the image data; it's no longer needed
        free(brushData);
    }
    return brushTexture;
}

#pragma mark- Shader
- (GLuint)loadShaderPaintLayer:(NSString*)fragShaderName{
    GLuint program, vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    program = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuad" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:fragShaderName ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader %@", fragShaderPathname);
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
    if (![ShaderUltility linkProgram:program]) {
        NSLog(@"Failed to link program: %d", program);
        
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
    _srcTexUniform = glGetUniformLocation(program, "srcTex");
    _dstTexUniform = glGetUniformLocation(program, "dstTex");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(program, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(program, fragShader);
        glDeleteShader(fragShader);
    }
    
    return program;
}

- (BOOL)loadShaderQuad
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programQuad = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuad" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuad" ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader %@", fragShaderPathname);
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
    if (![ShaderUltility linkProgram:_programQuad]) {
        NSLog(@"Failed to link program: %d", _programQuad);
        
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
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuadDebug" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuadDebugAlpha" ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader %@", fragShaderPathname);
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
    if (![ShaderUltility linkProgram:_programQuadDebugAlpha]) {
        NSLog(@"Failed to link program: %d", _programQuadDebugAlpha);
        
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
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuadDebug" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader %@", vertShaderPathname);
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderQuadDebugColor" ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader %@", fragShaderPathname);
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
    if (![ShaderUltility linkProgram:_programQuadDebugColor]) {
        NSLog(@"Failed to link program: %d", _programQuadDebugColor);
        
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

@end
