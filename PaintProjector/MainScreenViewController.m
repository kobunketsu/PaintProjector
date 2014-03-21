//
//  MainScreenViewController.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-5.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "MainScreenViewController.h"
//import for delegate
#import "PaintScreen.h"
#import "PaintDoc.h"
#import "PaintDocManager.h"

float paintQuadVertexData[] =
{
    0.5f, 0, -0.5f,          1.0f, 1.0f,
    -0.5f,0, -0.5f,          0.0f, 1.0f,
    0.5f, 0, 0.5f,         1.0f, 0.0f,
    0.5f, 0, 0.5f,        1.0f, 0.0f,
    -0.5f,0, -0.5f,         0.0f, 1.0f,
    -0.5f,0, 0.5f,        0.0f, 0.0f,
};
@interface MainScreenViewController ()
<
PaintScreenDelegate,
PaintingViewDelegate
>

@end

@implementation MainScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
       
        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if (!self.context) {
            DebugLog(@"Failed to create ES context");
        }
        //初始化绘图环境
        [self setupGL];    
        _worldMatrixArray = [[NSMutableArray alloc]init];
        _camera = [[Camera alloc]init];        

        [self initialPaintFrames];

        
        _lastMediaTime = 0;    
        _toSnapPaintFrame = false;
        //    _snapPaintFrameAnimationTime = 0.3;
        _curSnapPaintFrameAnimationTime = 0;

        _openPaintCamAnimPinchedPer = 0;
        _pinchGRScaleAccum = 1;
        _pinchGRScaleAccumBase = 1;     
        
        _toUpdateOpenPaintFrameAnim = false;
        _toUpdateClosePaintFrameAnim = false;    
        _paintFrameOpened = false;
        //    _openPaintFrameAnimationTime = 0.3;    
        _curOpenPaintFrameAnimationTime = 0;
        _curClosePaintFrameAnimationTime = 0;             
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;    
    view.delegate = self;    
    
    //display
    [_camera setPosition:GLKVector3Make(0, 1.75, 0)];
    [_camera setFocus:GLKVector3Make(0, 0, -2)];
    [_camera setUp:GLKVector3Make(0, 1, 0)];
    [_camera setAspect:fabsf(self.view.bounds.size.width / self.view.bounds.size.height)];
    [_camera setFov:GLKMathDegreesToRadians(HumanEyeFOV)]; 
    [_camera setNearClip:0.001];
    [_camera setFarClip:6.0f];
    
    _cameraPositionAnimSrc = _camera.position;
    _cameraTargetAnimSrc = _camera.focus;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark- Opengles Shader相关
- (void)setupGL {
    [EAGLContext setCurrentContext:_context];
    
    [self loadShaders];
    
    glEnable(GL_DEPTH_TEST);
    
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(paintQuadVertexData), paintQuadVertexData, GL_STATIC_DRAW);
    
    //    glGenBuffers(1, &_indexBuffer);
    //    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    //    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
    
}
- (void)tearDownGL {
    [EAGLContext setCurrentContext:_context];
    RELEASE_BUFFER(_vertexBuffer)
    RELEASE_VERTEXARRAY(_vertexArray)
    RELEASE_PROGRAM(_program)
}
- (BOOL)loadShaders
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _program = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderPaintFrame" ofType:@"vsh"];
    if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderPaintFrame" ofType:@"fsh"];
    if (![[ShaderManager sharedInstance] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_program, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_program, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_program, GLKVertexAttribPosition, "position");
    glBindAttribLocation(_program, GLKVertexAttribTexCoord0, "texcoord");
    
    // Link program.
    if (![[ShaderManager sharedInstance] linkProgram:_program]) {
        DebugLog(@"Failed to link program: %d", _program);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_program) {
            glDeleteProgram(_program);
            _program = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _viewProjMatrixUniform = glGetUniformLocation(_program, "viewProjectionMatrix");
    _worldMatrixUniform = glGetUniformLocation(_program, "worldMatrix");    
    _paintTexUniform = glGetUniformLocation(_program, "paintTex");
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_program, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_program, fragShader);
        glDeleteShader(fragShader);
    }
#if DEBUG
    glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, _program, 0, [@"program" UTF8String]);
#endif
    return YES;
}
#pragma mark- UI
- (IBAction)openButtonTapped:(UIButton *)sender {
    _toUpdateOpenPaintFrameAnim = true;
    _openPaintCamAnimPinchedPer = 0;
    _openPaintFrameAnimationTimeLeft = _openPaintFrameAnimationTime;
    _curOpenPaintFrameAnimationTime = 0;
}
#pragma mark- 手势处理
- (IBAction)handlePanGRMainScreenView:(UIPanGestureRecognizer *)sender {
    if(_paintFrameOpened)return;
    
    if(sender.state == UIGestureRecognizerStateBegan){
        _isPanHorizonal = false;
        _isPanVertical = false;  
        
        [self resetUpdatePanGRMainScreenViewEndAnim];
        
        _panOffsetInWorld = GLKVector3Make(0, 0, 0);
        for (PaintFrame* paintFrame in _allPaintFrames) {
            paintFrame.translateBeforePanGR = paintFrame.translate;                      
        }
    }
    
    CGPoint translation = [sender translationInView:sender.view];    
    if (_isPanHorizonal){
        _panOffsetInWorld= GLKVector3Make(translation.x*GestureTranslateScaleX, 0, 0);
        for (PaintFrame* paintFrame in _allPaintFrames) {
            paintFrame.translate = GLKVector3Add(paintFrame.translateBeforePanGR, _panOffsetInWorld);
        }
    }
    else if (_isPanVertical){
        _panOffsetInWorld= GLKVector3Make(0, 0, translation.y*GestureTranslateScaleY);
        for (PaintFrame* paintFrame in _curPaintFrameGroup.paintFrameHeap.contents) {
            paintFrame.translate = GLKVector3Add(paintFrame.translateBeforePanGR, _panOffsetInWorld);
        }        
    }    
    else{
        if((fabsf(translation.x) > fabsf(translation.y)) && (fabsf(translation.x)>PanGRModeConfirmPixels))
        {
            _isPanHorizonal = true;
            _isPanVertical = false;
        }
        else if ((fabsf(translation.y) > fabsf(translation.x)) && (fabsf(translation.y)>PanGRModeConfirmPixels)) {
            _isPanVertical = true;
            _isPanHorizonal = false;            
        }        
    }
    
    //define final paintframe translate, focus on one paintframe
    if (sender.state == UIGestureRecognizerStateEnded) {
        //开始补正位置
        _toSnapPaintFrame = true;
        for (PaintFrame* paintFrame in _curPaintFrameGroup.paintFrameHeap.contents) {
            paintFrame.translateAfterPanGR = paintFrame.translate;
        }        
        _curSnapPaintFrameAnimationTime = 0;
        
//        DebugLog(@"PanGREnd _offsetAccumInWorld x:%.2f z:%.2f Add _panOffsetInWorld x:%.2f z:%.2f", _offsetAccumInWorld.x, _offsetAccumInWorld.z, _panOffsetInWorld.x, _panOffsetInWorld.z);                                    
        _offsetAccumInWorld = GLKVector3Add(_offsetAccumInWorld, _panOffsetInWorld);
        //x:左右张 z:前后张
        if (_isPanHorizonal) {
            _snapAnimOffsetInWorld.z = 0;            
            if(_offsetAccumInWorld.x > 0){
                _panAndSnapOffsetInWorld.x = ceilf(_offsetAccumInWorld.x / _paintQuadWidth) * _paintQuadWidth;
                _snapAnimOffsetInWorld.x = _panAndSnapOffsetInWorld.x - _offsetAccumInWorld.x;
            }
            else {
                _panAndSnapOffsetInWorld.x= floorf(_offsetAccumInWorld.x / _paintQuadWidth) * _paintQuadWidth;
                _snapAnimOffsetInWorld.x = _panAndSnapOffsetInWorld.x - _offsetAccumInWorld.x;
            }
        }
        
        else if (_isPanVertical) {
            _snapAnimOffsetInWorld.x = 0;
            if(_offsetAccumInWorld.z > 0){
                _panAndSnapOffsetInWorld.z = ceilf(_offsetAccumInWorld.z / _paintQuadHeight) * _paintQuadHeight;
                _snapAnimOffsetInWorld.z = _panAndSnapOffsetInWorld.z - _offsetAccumInWorld.z;
            }
            else {
                _panAndSnapOffsetInWorld.z = floorf(_offsetAccumInWorld.z / _paintQuadHeight) * _paintQuadHeight;
                _snapAnimOffsetInWorld.z = _panAndSnapOffsetInWorld.z - _offsetAccumInWorld.z;
            }
        }
        
//        DebugLog(@"PanGREnd cal _snapAnimOffsetInWorld x:%.2f z:%.2f", _snapAnimOffsetInWorld.x, _snapAnimOffsetInWorld.z);                
        //        DebugLog(@"_panOffsetInWorld:%.2f", _panOffsetInWorld.z);                
    }
}

- (IBAction)handlePinchGRMainScreenView:(UIPinchGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateBegan){
        _pinchGRScaleAccumBase = _pinchGRScaleAccum;
    }
    else if(sender.state == UIGestureRecognizerStateEnded) {
        //在手势结束时确定是进行打开操作还是关闭操作
        if(_pinchGROpenOrClose){
            //确定是否需要进行动画补偿
            _openPaintFrameAnimationTimeLeft = _openPaintFrameAnimationTime * (1-_openPaintCamAnimPinchedPer);  
            _closePaintFrameAnimationTimeLeft = _openPaintFrameAnimationTime - _openPaintFrameAnimationTimeLeft;            
            //            DebugLog(@"PinchGREnd Set _openPaintFrameAnimationTimeLeft:%.2f", _openPaintFrameAnimationTimeLeft);                
            _toUpdateOpenPaintFrameAnim = true;
        }
        else {
            _closePaintFrameAnimationTimeLeft = _openPaintFrameAnimationTime * _openPaintCamAnimPinchedPer;  
            _openPaintFrameAnimationTimeLeft = _openPaintFrameAnimationTime - _closePaintFrameAnimationTimeLeft;
            //            DebugLog(@"PinchGREnd Set _closePaintFrameAnimationTimeLeft:%.2f", _closePaintFrameAnimationTimeLeft);                            
            _toUpdateClosePaintFrameAnim = true;
        }        
        
    }
    
    _pinchGROpenOrClose =  sender.scale >1;    
    _pinchGRScaleAccum = _pinchGRScaleAccumBase + (sender.scale - 1);
    //    DebugLog(@"_pinchGRScaleAccum:%.1f", _pinchGRScaleAccum);    
    _openPaintCamAnimPinchedPer = MIN(_pinchGRScaleAccum/PinchGRMaxScaleForCameraAnim , 1.0);
    _openPaintCamAnimPinchedPer = MAX(0, _openPaintCamAnimPinchedPer);
    [self setCameraAnimState:_openPaintCamAnimPinchedPer];
}


#pragma mark- 手势后的动画补足
-(bool)updateOpenPaintFrameAnimation:(float)timeDelta{
//    DebugLog(@"_openPaintFrameAnimationTimeLeft:%.2f", _openPaintFrameAnimationTimeLeft);    
        
    if(_openPaintFrameAnimationTimeLeft - (_curOpenPaintFrameAnimationTime + timeDelta) <= 0.0f){        
        timeDelta = _openPaintFrameAnimationTimeLeft - _curOpenPaintFrameAnimationTime;
        _curOpenPaintFrameAnimationTime += timeDelta;

    }
    else{
        _curOpenPaintFrameAnimationTime += timeDelta;        
    }
    float percentage;
    if(_openPaintFrameAnimationTimeLeft==0){
        percentage = 1.0;
    }
    else {
        percentage = _openPaintCamAnimPinchedPer + (1-_openPaintCamAnimPinchedPer) * (_curOpenPaintFrameAnimationTime / _openPaintFrameAnimationTimeLeft);
    }

//    DebugLog(@"_openPaintCamAnimPinchedPer:%.2f", _openPaintCamAnimPinchedPer);    
//    DebugLog(@"percentage:%.2f", percentage);
    [self setCameraAnimState:percentage];
    
    if(1.0 - percentage < 0.001){
        _curOpenPaintFrameAnimationTime = 0;
//        _openPaintFrameAnimationTimeLeft = 0;
        _pinchGRScaleAccum = PinchGRMaxScaleForCameraAnim;
        _paintFrameOpened = true;
        return true;        
    }
    else{
        return false;            
    }

}

-(bool)updateClosePaintFrameAnimation:(float)timeDelta{
//    DebugLog(@"_closePaintFrameAnimationTimeLeft:%.2f", _closePaintFrameAnimationTimeLeft);    
    
    if(_closePaintFrameAnimationTimeLeft - (_curClosePaintFrameAnimationTime + timeDelta) <= 0.0f){        
        timeDelta = _closePaintFrameAnimationTimeLeft - _curClosePaintFrameAnimationTime;
        _curClosePaintFrameAnimationTime += timeDelta;  
    }
    else{
        _curClosePaintFrameAnimationTime += timeDelta;        
    }
    
    float percentage = _openPaintCamAnimPinchedPer - _openPaintCamAnimPinchedPer * (_curClosePaintFrameAnimationTime / _closePaintFrameAnimationTimeLeft);
    [self setCameraAnimState:percentage];
    
    if(percentage < 0.001){
                
        _curClosePaintFrameAnimationTime = 0;
//        _closePaintFrameAnimationTimeLeft = 0;
        _pinchGRScaleAccum = 0;
        _paintFrameOpened = false;
        return true;        
    }
    else{
        return false;            
    }
}

-(bool)updateOpenPaintFramAnimFinished:(float)timeDelta{
//    DebugLog(@"Trying to Open!=======================================");        
    if(_openPaintCamAnimPinchedPer <= 1.0){//open full
//        DebugLog(@"Continue to Open!=======================================");                    
        if([self updateOpenPaintFrameAnimation:timeDelta]){
//            DebugLog(@"OpenCurPaintFrameAnim Finished!=======================================");
            //解决presentViewController的卡的问题
            [self performSelector:@selector(openPaintFrame) withObject:nil afterDelay:0.1];
            return true;
        }
    }
    else{//close 
//        DebugLog(@"Back to Close!=======================================");                                
        return [self updateClosePaintFrameAnimation:timeDelta];
    }    
    return false;
}

-(bool)updateClosePaintFrameAnimFinished:(float)timeDelta{
//    DebugLog(@"Trying to Close!=======================================");        
//    if(_openPaintCamAnimPinchedPer < 0.9 && _openPaintCamAnimPinchedPer > 0.0){//open full
//        DebugLog(@"Continue to Close!=======================================");                                
        return [self updateClosePaintFrameAnimation:timeDelta];                
//    }
//    else{//close 
//        DebugLog(@"Back to Open!=======================================");                                            
//        return [self updateOpenPaintFrameAnimation:timeDelta];
//    }    
}

-(bool)updatePinchGRMainScreenViewEndAnimation:(float)timeDelta{
    return false;
}

- (bool)updatePanGRPaintFrameAnimFinished:(float)timeDelta{

    if(_snapPaintFrameAnimationTime - (_curSnapPaintFrameAnimationTime + timeDelta) < 0.0f){
        timeDelta = _snapPaintFrameAnimationTime - _curSnapPaintFrameAnimationTime;
        _curSnapPaintFrameAnimationTime += timeDelta;
    }
    else {
        _curSnapPaintFrameAnimationTime += timeDelta;
    }

    float animPercentage = (_curSnapPaintFrameAnimationTime / _snapPaintFrameAnimationTime);            
//    DebugLog(@"UpdatePanGR animPercentage:%.2f ", animPercentage);
    GLKVector3 animOffsetDelta = GLKVector3MultiplyScalar(_snapAnimOffsetInWorld, timeDelta / _snapPaintFrameAnimationTime);    
    if(_isPanVertical){
        for (PaintFrame* paintFrame in _curPaintFrameGroup.paintFrameHeap.contents) {   
            [paintFrame setTranslate:(GLKVector3Add(paintFrame.translate, animOffsetDelta))];
        }        
    }
    else if (_isPanHorizonal){
        for (PaintFrame* paintFrame in _allPaintFrames){   
            [paintFrame setTranslate:(GLKVector3Add(paintFrame.translate, animOffsetDelta))];
        }        
    }


//    DebugLog(@"UpdatePanGR _offsetAccumInWorld:%.2f add animOffsetDelta:%.2f", _offsetAccumInWorld.z, animOffsetDelta.z);    
    _offsetAccumInWorld = GLKVector3Add(_offsetAccumInWorld, animOffsetDelta);//纪录前一次pan自动补正的偏移
    
    if(fabsf(1.0 - animPercentage < 0.0001)){
        return true;
    }
    else {
        return false;
    }
}

-(void)resetUpdatePanGRMainScreenViewEndAnim{
    //中断之前可能有的动画状态    
    if (_toSnapPaintFrame) {
        _toSnapPaintFrame = false;
        _curSnapPaintFrameAnimationTime = 0;
    } 
    else {
        _offsetAccumInWorld = GLKVector3Make(0, 0, 0);
    }
}
- (void)update{
    float curMediaTime = CACurrentMediaTime();
    float timeDelta = curMediaTime - _lastMediaTime;     
    
    if(_toSnapPaintFrame){
        if([self updatePanGRPaintFrameAnimFinished:timeDelta]){//animation finished
            if (_isPanVertical) {        
                if(_offsetAccumInWorld.z>0){
                    [self AddLastPaintFrame];                            
                }
                else {
                    [self AddFirstPaintFrame];
                }
            }
            else if (_isPanHorizonal) {
                if(_offsetAccumInWorld.x>0){
                    [self AddFirstPaintFrameGroup];                            
                }
                else {
                    [self AddLastPaintFrameGroup];
                }
                [self setCurPaintFrameGroup];                
            }
            
            _toSnapPaintFrame = false;                                                    
//            _offsetAccumInWorld = GLKVector3Make(0, 0, 0);
//            DebugLog(@"setCurPaintFrame Finished!=========================================");
        }
    }
    
    if (_toUpdateOpenPaintFrameAnim) {
//        DebugLog(@"After PinchPaintFrame Updating Started!=======================================");
        if([self updateOpenPaintFramAnimFinished:timeDelta]){//animation finished
            _toUpdateOpenPaintFrameAnim = false;            
        }    
    }
    
    if (_toUpdateClosePaintFrameAnim) {
//        DebugLog(@"After PinchPaintFrame Updating Started!=======================================");
        if([self updateClosePaintFrameAnimFinished:timeDelta]){//animation finished
            _toUpdateClosePaintFrameAnim = false;            
        }    
    }    
    
    _lastMediaTime = curMediaTime;                
}

- (void)setCameraAnimState:(float)percentage{
    //    DebugLog(@"percentage:%.2f", percentage);        
    GLKVector3 cameraTargetAnimVector = GLKVector3Subtract(_cameraTargetAnimDest, _cameraTargetAnimSrc);
    [_camera setFocus:GLKVector3Add(GLKVector3MultiplyScalar(cameraTargetAnimVector, percentage), _cameraTargetAnimSrc)];
    //    DebugLog(@"camera target x:%.2f y:%.2f z:%.2f", _camera.target.x, _camera.target.y, _camera.target.z);
    
    GLKVector3 cameraPositionAnimVector = GLKVector3Subtract(_cameraPositionAnimDest, _cameraPositionAnimSrc);
    [_camera setPosition:GLKVector3Add(GLKVector3MultiplyScalar(cameraPositionAnimVector, percentage), _cameraPositionAnimSrc)];    
    //    DebugLog(@"camera position x:%.2f y:%.2f z:%.2f", _camera.position.x, _camera.position.y, _camera.position.z);    
}

#pragma mark- 绘图
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    [EAGLContext setCurrentContext:_context];
//    glViewport(0, 0, view.frame.size.width, view.frame.size.height);
    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    // Render the object again with ES2
    glUseProgram(_program);
    
    glBindVertexArrayOES(_vertexArray);
    glUniformMatrix4fv(_viewProjMatrixUniform, 1, 0, _camera.viewProjMatrix.m);
    for (PaintFrame* paintFrame in _allPaintFrames) {
        glUniformMatrix4fv(_worldMatrixUniform, 1, 0, paintFrame.worldMatrix.m);
        //        DebugLog(@"paintFrame translate x:%.2f y:%.2f z:%.2f", paintFrame.translate.x, paintFrame.translate.y, paintFrame.translate.z);
        //texture
        if(paintFrame.paintTexture!=0){
            glActiveTexture(GL_TEXTURE0);
            glBindTexture(GL_TEXTURE_2D, paintFrame.paintTexture);
        }
        
        glDrawArrays(GL_TRIANGLES, 0, 6);
        
//        if([paintFrame.name isEqualToString:_curPaintFrameGroup.curPaintFrame.name]){
//            DebugLog(@"Drawing PaintFrame %@ paintTexture:%d", paintFrame.name, paintFrame.paintTexture);
//        }
    }
}
#pragma mark- 图片导航相关
- (void)setCurPaintFrameGroup{
    float movedCount = _panAndSnapOffsetInWorld.x / _paintQuadWidth;
    _curPaintGroupIndex = _lastPaintGroupIndex - movedCount;
    if (_curPaintGroupIndex<0) {
        _curPaintGroupIndex = [[PaintDocManager sharedInstance] directoryCount] + _curPaintGroupIndex;
    }
    else if(_curPaintGroupIndex > [[PaintDocManager sharedInstance] directoryCount] - 1){
        _curPaintGroupIndex = _curPaintGroupIndex - [[PaintDocManager sharedInstance] directoryCount];
    }
    
    _lastPaintGroupIndex = _curPaintGroupIndex;
    DebugLog(@"_curPaintFrameIndex:%d", _curPaintGroupIndex);

}

- (void)setCurPaintFrame {
    float movedCount = _panAndSnapOffsetInWorld.z / _paintQuadHeight;
    [_curPaintFrameGroup moveToPaintIndex:movedCount];    
    _curPaintFrameGroup.curPaintFrame = [_curPaintFrameGroup.paintFrameHeap.contents objectAtIndex:1];    
    [self setCameraAnimParam:_curPaintFrameGroup.curPaintFrame];
}

- (void)AddLastPaintFrame{
    int index = _curPaintFrameGroup.curPaintIndex + _curPaintFrameGroup.paintFrameHeap.capacity;

    PaintDoc* paintDoc;
    if (_curPaintFrameGroup.paintDocs.count == 0) {
        paintDoc = nil;
    }
    else{
        index = (int)fmodf((float)index, (float)(_curPaintFrameGroup.paintDocs.count));
        paintDoc = [_curPaintFrameGroup.paintDocs objectAtIndex:index];
    }

    PaintFrame * lastPF = [_curPaintFrameGroup.paintFrameHeap.contents objectAtIndex:_curPaintFrameGroup.paintFrameHeap.capacity-1];
    
    //用docPath初始化画框
    PaintFrame * pf = [[PaintFrame alloc]initWithContext:_context paintDoc:paintDoc];

    //设置画框位置    
    [pf setScale:GLKVector3Make(_paintQuadWidth, 1, _paintQuadHeight)];
    [pf setTranslate:GLKVector3Make(lastPF.translate.x, 0, lastPF.translate.z - _paintQuadHeight)];

    
    [_allPaintFrames removeObject:[_curPaintFrameGroup.paintFrameHeap.contents objectAtIndex:0]];
    [_curPaintFrameGroup push:pf];
    [self setCurPaintFrame];        
    [_allPaintFrames addObject:pf];

    //显示画框
    [pf loadForDisplay:false];
}

- (void)AddFirstPaintFrame{
    int index = _curPaintFrameGroup.curPaintIndex - 1;
    if (index < 0) {
        index = _curPaintFrameGroup.paintDocs.count - 1;
    }
    else if (index > _curPaintFrameGroup.paintDocs.count - 1){
        index = 0;
    }
    
    
    PaintDoc* paintDoc;
    if (_curPaintFrameGroup.paintDocs.count == 0) {
        paintDoc = nil;
    }
    else{
        paintDoc = [_curPaintFrameGroup.paintDocs objectAtIndex:index];
    }
    
    PaintFrame * lastPF = [_curPaintFrameGroup.paintFrameHeap.contents objectAtIndex:0];
    //用docPath初始化画框
    PaintFrame * pf = [[PaintFrame alloc]initWithContext:_context paintDoc:paintDoc];
    
    //设置画框位置
    [pf setScale:GLKVector3Make(_paintQuadWidth, 1, _paintQuadHeight)];            
    [pf setTranslate:GLKVector3Make(lastPF.translate.x, 0, lastPF.translate.z + _paintQuadHeight)];
    
    [_allPaintFrames removeObject:[_curPaintFrameGroup.paintFrameHeap.contents lastObject]];
    [_curPaintFrameGroup push_reverse:pf];    
    [self setCurPaintFrame];
    [_allPaintFrames addObject:pf];
    
    //显示画框
    [pf loadForDisplay:false];    
}



- (void)AddLastPaintFrameGroup{
    int index = _curPaintGroupIndex + (int)floorf(_paintFrameGroupHeap.capacity*0.5)+1;
    int dirCount = [[PaintDocManager sharedInstance] directoryCount];
    if(dirCount == 0){
        index = -1;
    }
    else{
        index = (int)fmodf((float)index, (float)dirCount);
    }


    DebugLog(@"AddLastPaintFrameGroup PaintGroupIndex:%d", index);
    
    PaintFrameGroup* firstPaintFrameGroup = [_paintFrameGroupHeap.contents objectAtIndex:0];
    for (PaintFrame* pf in firstPaintFrameGroup.paintFrameHeap.contents) {
        [_allPaintFrames removeObject:pf];
    }
    DebugLog(@"_allPaintFrames remove paintFrameGroup %@", firstPaintFrameGroup.name);
    
    PaintFrameGroup* lastPaintFrameGroup = [self AddPaintFrameGroupAtIndex:_paintFrameGroupHeap.capacity-1 fromDirectoryIndex:index];
    
    [_paintFrameGroupHeap push:lastPaintFrameGroup];
    
    _curPaintFrameGroup = [_paintFrameGroupHeap.contents objectAtIndex:(floorf)(_paintFrameGroupHeap.contents.count)*0.5];    
}

- (void)AddFirstPaintFrameGroup{
    int index = _curPaintGroupIndex - (int)floorf(_paintFrameGroupHeap.capacity*0.5) - 1;
    if (index < 0) {
        index = [[PaintDocManager sharedInstance] directoryCount] - 1;
    }

    PaintFrameGroup* lastPaintFrameGroup = [_paintFrameGroupHeap.contents lastObject];
    for (PaintFrame* pf in lastPaintFrameGroup.paintFrameHeap.contents) {
        [_allPaintFrames removeObject:pf];
//        DebugLog(@"_allPaintFrames removeObject:%@", lastPaintFrameGroup);
    }
    
    PaintFrameGroup* firstPaintFrameGroup = [self AddPaintFrameGroupAtIndex:0 fromDirectoryIndex:index];

    [_paintFrameGroupHeap push_reverse:firstPaintFrameGroup];
    
    _curPaintFrameGroup = [_paintFrameGroupHeap.contents objectAtIndex:(floorf)(_paintFrameGroupHeap.contents.count)*0.5]; 
}


//将App/Documents/的指定子目录位置下所有PaintDoc 加入到指定画框组下
- (PaintFrameGroup*)AddPaintFrameGroupAtIndex:(int)frameGroupIndex fromDirectoryIndex:(int)paintDirectoryIndex{
    
    PaintFrameGroup* paintFrameGroup = [[PaintFrameGroup alloc]initWithCapacity:7];
    paintFrameGroup.name = [NSString stringWithFormat:@"PaintFrameGroup_%d", paintDirectoryIndex];
    paintFrameGroup.dirPath = [[PaintDocManager sharedInstance]directoryPath:paintDirectoryIndex];    
    //加载指定子目录下的PaintDoc
    paintFrameGroup.paintDocs = [[PaintDocManager sharedInstance]loadPaintDocsInDirectoryIndex:paintDirectoryIndex];

    
    //遍历画框列，创建画框 初始化PaintDoc
    for (int j=0; j < paintFrameGroup.paintFrameHeap.capacity; ++j) {
        PaintFrame* pf;
        //如果目录下没有paintDoc,或者paintDoc的数量小于画框组的容量，则没有paintDoc的绘制空画框
        if (paintFrameGroup.paintDocs == nil || paintFrameGroup.paintDocs.count == 0 || j > paintFrameGroup.paintDocs.count - 1) {
            
            pf = [[PaintFrame alloc]initWithContext:_context paintDoc:nil];
        }
        else{//用paintDoc初始化画框
            PaintDoc* paintDoc = [paintFrameGroup.paintDocs objectAtIndex:j];
            
            pf = [[PaintFrame alloc]initWithContext:_context paintDoc:paintDoc];
        }


        
        //设置画框位置
        [pf setScale:GLKVector3Make(_paintQuadWidth, 1, _paintQuadHeight)];
        float x = _paintQuadWidth*(float)(frameGroupIndex - (floorf)(_paintFrameGroupHeap.capacity*0.5)) ;
        float y = -_paintQuadHeight*(j-1) -1;
        [pf setTranslate:GLKVector3Make(x, 0, y)];
        //        DebugLog(@"set paintFrame %@ pos x:%.2f y:%.2f", pf.name, x, y);
        
        //注册到画框列及所有画框集中
        [paintFrameGroup.paintFrameHeap push:pf];
        [_allPaintFrames addObject:pf];
        
        //test
        pf.name = [NSString stringWithFormat:@"Group%d_Paint_%d",frameGroupIndex, j];
        
        //显示画框
        [pf loadForDisplay:false];
    }
    
    return paintFrameGroup;
}


- (void)setCameraAnimParam:(PaintFrame*)paintFrame{
    _cameraTargetAnimDest = paintFrame.translate;
    float height = _paintQuadHeight*0.5 / tanf(GLKMathDegreesToRadians(HumanEyeFOV*0.5));
    _cameraPositionAnimDest = GLKVector3Make(paintFrame.translate.x, height, paintFrame.translate.z);
    
    //    DebugLog(@"_cameraPositionAnimDest x:%.2f y:%.2f z:%.2f", _cameraPositionAnimDest.x, _cameraPositionAnimDest.y, _cameraPositionAnimDest.z);
    //    DebugLog(@"_cameraTargetAnimDest x:%.2f y:%.2f z:%.2f", _cameraTargetAnimDest.x, _cameraTargetAnimDest.y, _cameraTargetAnimDest.z);
}

#pragma mark- 打开关闭
NSInteger Sort_Comparer(id id1, id id2, void *context)
{
    // Sort Function
    return ([(NSString*)id1 compare:(NSString*)id2]); 
}

//-(void)loadPaintsFromPlist{
//    //从save.plist读取保存文件列表
//    _plistPath = [[NSBundle mainBundle] pathForResource:@"Save" ofType:@"plist"];  
//    _paintFolders = [[NSMutableArray alloc]initWithContentsOfFile:_plistPath];
//    DebugLog(@"Loaded Save.plist:%@ content:%@", _plistPath, _paintFolders);
//
//    
//}
//
//-(void)savePaintsToPlist{
//    if([_paintFolders writeToFile:_plistPath atomically:false]){
////        DebugLog(@"Saved to Save.plist %@", _paintFolders);
//        
//        NSString* path = [[NSBundle mainBundle] pathForResource:@"Save" ofType:@"plist"];          
//        NSMutableArray* testArray = [[NSMutableArray alloc]initWithContentsOfFile:path];
//        DebugLog(@"Saved Save.plist:%@", testArray);
//    }
//    else {
//        DebugLog(@"Failed to Save to Save.plist");
//    }
//    
//}
-(void)loadPaintDocs{
    [[PaintDocManager sharedInstance] loadPaintDocs];
}

//初始化所有画框
-(void)initialPaintFrames{
    _paintFrameGroupHeap = [[Heap alloc]initWithCapacity:7];
    _allPaintFrames = [[NSMutableArray alloc]init];
    _paintQuadWidth = 1;
    _paintQuadHeight = 1.3333;
    _arrayRow = 7;
    _arrayColumn = 1;
    
    //遍历Application Document文件夹，加载所有PaintDoc文件头
//    [PaintDocManager loadPaintDocs];
    
    //创建空的paintFrameGroup,推入paintFrameGroupArray
    for (int i=0; i < _paintFrameGroupHeap.capacity; ++i) {
        PaintFrameGroup* pf = [self AddPaintFrameGroupAtIndex:i fromDirectoryIndex:i];
        [_paintFrameGroupHeap push:pf];        
    }
    
    _lastPaintGroupIndex = _curPaintGroupIndex = floorf(_paintFrameGroupHeap.contents.count*0.5);        
    _curPaintFrameGroup = [_paintFrameGroupHeap.contents objectAtIndex:_curPaintGroupIndex];

    //设置当前画框
    [self setCurPaintFrame];
}

//打开当前画框
-(void)openPaintFrame {
    self.paintScreenVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintScreen"];        
    self.delegate = self.paintScreenVC;
    self.paintScreenVC.delegate = self;

    //如果paintDoc为空，则新建一个paintDoc
    if(_curPaintFrameGroup.curPaintFrame.paintDoc == NULL){
        _curPaintFrameGroup.curPaintFrame.paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:_curPaintFrameGroup.dirPath];
    }
    
    //打开绘图面板
    [self presentViewController:self.paintScreenVC animated:false completion:^{
        [self.delegate openDoc:_curPaintFrameGroup.curPaintFrame.paintDoc];
        DebugLog(@"Open PaintFrame:%@ thumbImagePath:%@", _curPaintFrameGroup.curPaintFrame.name, _curPaintFrameGroup.curPaintFrame.paintDoc.thumbImagePath);
    }];
}

#pragma mark- 绘画代理PaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup{
    return [[EAGLContext alloc]initWithAPI:[_context API] sharegroup:[_context sharegroup]];
}

- (void) closePaintDoc:(PaintDoc *)paintDoc{
    _curPaintFrameGroup.curPaintFrame.paintDoc = paintDoc;
    
    //刷新当前PaintFrame中的Paint内容
    [_curPaintFrameGroup.curPaintFrame loadForDisplay:true];
    
    [self.paintScreenVC dismissViewControllerAnimated:true completion:^{
//        [self.paintScreenVC.paintView destroyBuffers];
        _toUpdateClosePaintFrameAnim = true;//?
        _openPaintCamAnimPinchedPer = 1.0;
        _closePaintFrameAnimationTimeLeft = _openPaintFrameAnimationTime;
        _curClosePaintFrameAnimationTime = 0;
    }];
}

- (void)paintBGChanged:(NSString *)bgImageName{
//    NSMutableDictionary* paintList = [_paintFolders objectAtIndex:_curPaintGroupIndex];
//    [paintList setObject:bgImageName forKey:_curPaintFrameGroup.curPaintFrame.paintImageName];
//    [self savePaintsToPlist];
}

- (void) stopDetectCameraMotion{
    
}

@end
