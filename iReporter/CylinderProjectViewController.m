//
//  CylinderProjectViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-21.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CylinderProjectViewController.h"
#import "Resources.h"
#import "PaintScreenTransitionManager.h"

@interface CylinderProjectViewController ()

@property (assign, nonatomic)float toTranslateImageX;//圆柱体中图片横向移动
@property (assign, nonatomic)float translateImageX;//圆柱体中图片横向移动
//VC切换动画效果管理器
@property (nonatomic) PaintScreenTransitionManager *transitionManager;
@end

@implementation CylinderProjectViewController

//core motion

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    DebugLog(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)setupInputParams{
    //根据ipad2的尺寸进行设定
    self.inputCylinderRadius = 0.019;
    //设定虚拟平面
    self.inputCylinderImageWidth = 0.037;
    self.inputCylinderImageCenterOnSurfHeight = 0.035; //default 0.035

}

-(void)initSceneCameras{
    float eyeTopZ = -0.065;
    self.eyeBottom = GLKVector3Make(0, 0.4, -0.35);//GLKVector3Make(0, 0.4, -0.35)
    //顶视图视口比例
    self.eyeTopAspect = fabsf(self.projectView.bounds.size.width / (self.projectView.bounds.size.height + ToSeeCylinderTopPixelOffset));
    
    Camera.mainCamera.name = @"mainCamera";
    Camera.mainCamera.position = self.eyeBottom;
    Camera.mainCamera.focus = GLKVector3Make(0, 0, eyeTopZ);
       
    //如果中心点反向，则up向量反向
    if (Camera.mainCamera.focus.z >= 0) {
        Camera.mainCamera.up = GLKVector3Make(0, 0, -1);
    }
    else{
        Camera.mainCamera.up = GLKVector3Make(0, 0, 1);
    }
    Camera.mainCamera.nearClip = NearClipDistance;
    Camera.mainCamera.farClip = FarClipDistance;
    Camera.mainCamera.aspect = self.eyeTopAspect;
    Camera.mainCamera.fov = GLKMathDegreesToRadians(29);
    Camera.mainCamera.backgroundColor = GLKVector4Make(90.0/255.0, 230.0/255.0, 71.0 / 255.0, 1);
    Camera.mainCamera.cullingMask = Culling_Everything;
    self.bottomCameraProjMatrix = Camera.mainCamera.projMatrix;
    
    self.eyeTop = GLKVector3Make(0, -self.eyeBottom.z, eyeTopZ);
    float orthoWidth = DeviceWidth;
    float orthoHeight = DeviceWidth / self.eyeTopAspect;
    
    self.topCamera = [[Camera alloc]initOrthorWithPosition:self.eyeTop
                                                        focus:GLKVector3Make(0, 0, eyeTopZ)
                                                           up:GLKVector3Make(0, 0, 1)
                                                   orthoWidth:orthoWidth
                                                  orthoHeight:orthoHeight
                                                     nearClip:NearClipDistance
                                                      farClip:FarClipDistance];
    
    self.topCamera.name = @"topCamera";
    RenderTexture *renderTex = [[RenderTexture alloc]initWithWidth:1024 height:1024];
    [renderTex create];
    self.topCamera.targetTexture = renderTex;
    self.topCamera.cullingMask = Culling_Reflection;

    //add camera by rendering sequence
    [self.curScene addCamera:self.topCamera];
    [self.curScene addCamera:Camera.mainCamera];
    
    self.eyeBottomTopBlend = 0.0;
}

- (void)createCylinder{
    //create cylinder
    ShaderCylinder *shaderCylinder = [[ShaderCylinder alloc]init];
    Material *matMain = [[Material alloc]initWithShader:shaderCylinder];
    Texture *texMain = [[Texture alloc]init];
    texMain.texID = [TextureManager loadTextureInfoFromImageName:@"cylinderMain.png" reload:false].name;
    matMain.mainTexture = texMain;
    CylinderMesh *mesh = [[CylinderMesh alloc]initWithRadius:self.inputCylinderRadius sides:60 height:0.068];
    [mesh create];
    MeshFilter *meshFilter = [[MeshFilter alloc]initWithMesh:mesh];
    MeshRenderer *meshRenderer = [[MeshRenderer alloc]initWithMeshFilter:meshFilter];
    meshRenderer.material = matMain;
    
    //cap
//    BaseEffect *effect = [[BaseEffect alloc]init];
    ShaderNoLitTexture *shaderNoLitTex = [[ShaderNoLitTexture alloc]init];
    Material *matCap = [[Material alloc]initWithShader:shaderNoLitTex];
    Texture *texCap = [[Texture alloc]init];
    texCap.texID = [TextureManager loadTextureInfoFromImageName:@"cylinderCap.png" reload:false].name;
    matCap.mainTexture = texCap;
    [meshRenderer.materials addObject:matCap];
    
    Cylinder *cylinder = [[Cylinder alloc]init];
    cylinder.name = @"cylinder";
    cylinder.renderer = meshRenderer;
    cylinder.layerMask = Layer_Default;
    cylinder.eye = Camera.mainCamera.position;
    cylinder.reflectionTex = self.topCamera.targetTexture;
    cylinder.reflectionTexUVSpace = GLKVector4Make(self.topCamera.focus.x - self.topCamera.orthoWidth * 0.5,
                                                   self.topCamera.focus.y - self.topCamera.orthoHeight * 0.5 + self.topCamera.position.z,
                                                   self.topCamera.orthoWidth,
                                                   self.topCamera.orthoHeight);
    meshRenderer.delegate = cylinder;
    self.cylinder = cylinder;
    [self.curScene addEntity:cylinder];
    
}

- (void)createCylinderProject{
    ShaderCylinderProject *shaderCylinderProject = [[ShaderCylinderProject alloc]init];
    Material *matCylinderProject = [[Material alloc]initWithShader:shaderCylinderProject];
    matCylinderProject.mainTexture = self.paintTexture;
    PlaneMesh *planeMesh = [[PlaneMesh alloc]initWithRow:100 column:100];
    [planeMesh create];
    MeshFilter *meshFilter = [[MeshFilter alloc]initWithMesh:planeMesh];
    MeshRenderer *meshRenderer = [[MeshRenderer alloc]initWithMeshFilter:meshFilter];
    meshRenderer.material = matCylinderProject;
    
    CylinderProject *cylinderProject = [[CylinderProject alloc]init];
    cylinderProject.name = @"cylinderProject";
    cylinderProject.renderer = meshRenderer;
    cylinderProject.radius = self.inputCylinderRadius;
    cylinderProject.eye = Camera.mainCamera.position;
    cylinderProject.imageWidth = self.inputCylinderImageWidth;
    cylinderProject.imageCenterOnSurfHeight = self.inputCylinderImageCenterOnSurfHeight;
    cylinderProject.imageRatio = self.view.bounds.size.height / self.view.bounds.size.width;
    cylinderProject.layerMask = Layer_Reflection;
    meshRenderer.delegate = cylinderProject;
    self.cylinderProject = cylinderProject;
    [self.curScene addEntity:cylinderProject];
    
}

- (void)setupScene {
    
    DebugLog(@"init Scene");
    Scene *scene = [[Scene alloc]init];
    self.curScene = scene;
    
    DebugLog(@"init Scene Cameras");
    [self initSceneCameras];
    
    //设定输入图片参数
    if (self.paintDoc != nil) {
        self.paintTexture = [[Texture alloc]init];
        self.paintTexture.texID = [TextureManager loadTextureInfoFromFileInDocument:self.paintDoc.thumbImagePath reload:true].name;
    }
    
    DebugLog(@"init Scene Entities ");
    [self createCylinderProject];
    
    [self createCylinder];
    
    [self initOtherParams];
    
    [self.curScene flushAll];
    DebugLog(@"init Scene finished");
    
    DebugLog(@"updateRenderViewParams");
    [self updateRenderViewParams];
}

-(void)initOtherParams{
    //设置动画
    self.state = CP_Projected;
    
    self.viewBottomAnimDuration = 1.0;
    self.viewTopAnimDuration = 1.0;
    self.curViewTopAnimationTime = 0;
    self.curViewBottomAnimationTime = 0;
    self.lastMediaTime = CACurrentMediaTime();
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLog(@"[ viewWillAppear ]");
    //用于解决启动闪黑屏的问题
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"launchImage2.png"]];
    
    DebugLog(@"setupInputParams");
    [self setupInputParams];
    
    [self setupGL];
    
    [self setupScene];
    
    //run completion block
    [self allViewUserInteractionEnable:true];
}

- (void)viewDidAppear:(BOOL)animated{
    DebugLog(@"[ viewDidAppear ]");
    //screenmask遮罩问题
//    self.screenMask.hidden = false;
}

-(void)viewWillDisappear:(BOOL)animated{
    DebugLog(@"[ viewWillDisappear ]");
}

-(void)viewDidDisappear:(BOOL)animated{
    DebugLog(@"[ viewDidDisappear ]");
    [self tearDownGL];
}

- (void)viewDidLoad
{
    DebugLog(@"[ viewDidLoad ]");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //通知注册事件对app退到后台进行响应
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(willResignActiveNotification:)
     name:UIApplicationWillResignActiveNotification
     object:nil];
    
    [self allViewUserInteractionEnable:true];
    
    //创建glkViewController
    self.glkViewController = [[GLKViewController alloc]init];
    self.glkViewController.view = self.projectView;
    self.glkViewController.delegate = self;
    // then add the glkview as the subview of the parent view
    //    [self.view addSubview:_myGlkViewController.view];
    // add the glkViewController as the child of self
    [self addChildViewController:self.glkViewController];
    [self.glkViewController didMoveToParentViewController:self];
    

    //创建context
    self.context = [self createBestEAGLContext];
    [self.context setDebugLabel:@"CylinderProjectView Context"];
    
    self.projectView.context = self.context;
    self.projectView.delegate = self;
    
    [TextureManager initialize];

    //TODO: 关闭水平监测，查内存持续增长问题
//    [self initMotionDetect];
}

- (void)viewDidUnload{
    DebugLog(@"[ viewDidUnload ]");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    DebugLog(@"[ dealloc ]");
}


#pragma mark- 主程序
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(void)willResignActiveNotification:(id)sender{
//    DebugLog(@"willResignActiveNotification sender:%@", sender);
    self.playTime = [self.player currentTime];
}
-(void)didEnterBackgroundNotification{
    DebugLog(@"didEnterBackgroundNotification");
}
#pragma mark- 工具栏

- (IBAction)galleryButtonTouchUp:(id)sender {
    //do some work
    [self.delegate willTransitionToGallery];
}

- (IBAction)printButtonTouchUp:(UIButton *)sender {
    [self exportToAirPrint];
}

- (IBAction)shareButtonTouchUp:(UIButton *)sender {
}

- (IBAction)paintButtonTouchUp:(UIButton *)sender {
    [self openPaintDoc:self.paintDoc];
}

#pragma mark- 操作主屏幕CylinderProject View
- (void)rotateViewInAxisX:(float)percent{
    self.eyeBottomTopBlend = MIN(1, MAX(0, self.toEyeBottomTopBlend + percent));
}

- (IBAction)handlePanCylinderProjectView:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
//            self.toEyeBottomTopBlend = self.eyeBottomTopBlend;
            self.toTranslateImageX = self.translateImageX;
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [sender translationInView:sender.view];
//            if (self.state == CP_Paint) {
//                if (fabsf(translation.x) - fabsf(translation.y) > 5) {
//                    self.state = CP_RotateViewAxisX;
//                }
//                if(fabsf(translation.x) - fabsf(translation.y) > 5){
//                    self.state = CP_RotateImage;
//                }
//            }
//            else if (self.state == CP_RotateViewAxisX){
//                float percent = (translation.x / sender.view.bounds.size.width);
//                [self rotateViewInAxisX:percent];
//            }
//            if (self.state == CP_RotateImage){
//                float angle = (translation.x / sender.view.bounds.size.width) * M_PI;
//                [self rotateImageInCylinder:angle];
//            }
            
            self.translateImageX = self.toTranslateImageX - translation.x * 0.0001;
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.state = CP_Projected;
        }
            break;
        default:
            break;
    }
}

#pragma mark- 绘图设置



- (void)updateRenderViewParams{
    Camera.mainCamera.position = GLKVector3Lerp(self.eyeBottom, self.eyeTop, self.eyeBottomTopBlend);
    GLKMatrix4 matrix = [Ultility MatrixLerpFrom:self.bottomCameraProjMatrix to:self.topCamera.projMatrix blend:self.eyeBottomTopBlend];
    Camera.mainCamera.projMatrix = matrix;
}

#pragma mark- 更新
- (void)glkViewControllerUpdate:(GLKViewController *)controller{
//    DebugLog(@"glkViewControllerUpdate");
    
    //更新动画状态
    float curMediaTime = CACurrentMediaTime();
    float timeDelta = curMediaTime - self.lastMediaTime;
    
    //重新设置投影地面的参数
    [self updateRenderViewParams];
    
    [self.curScene update];

    //动画中禁止所有交互操作
    if(self.state == CP_Projecting){
        //start to project
        [self.cylinderProject updateProjectFinished:timeDelta completion:^{
            self.state = CP_Projected;
            
            //run completion block
            [self allViewUserInteractionEnable:true];
        }];
    }
    else if(self.state == CP_UnProjecting){
        [self.cylinderProject updateUnprojectFinished:timeDelta completion:^{
            self.state = CP_Paint;
            
            //run completion block
            if (_unprojectCompletionBlock) {
                _unprojectCompletionBlock();
            }
        }];
    }
    else if(self.state == CP_PitchingToTopView){
        [self updateViewTopFinished:timeDelta completion:^{
            self.state = CP_Projected;
            
            //run completion block
//            [self allViewUserInteractionEnable:true];
        }];
    }
    else if(self.state == CP_PitchingToBottomView){
        [self updateViewBottomFinished:timeDelta completion:^{
            self.state = CP_Projected;
            
            //run completion block
//            [self allViewUserInteractionEnable:true];
        }];
    }
    
    self.lastMediaTime = curMediaTime;
}


- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [self.curScene render];
}

#pragma mark- Opengles Shader相关
-(EAGLContext *)createBestEAGLContext{
    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (context == nil) {
        context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if(context == nil){
            DebugLog(@"Failed to create ES context");
        }
    }
    
    return context;
}

- (void)initGLState{
    glViewport(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    glEnable(GL_BLEND);
    glEnable(GL_CULL_FACE);
    glCullFace(GL_BACK);
    
    [GLWrapper.current blendFunc:BlendFuncAlphaBlend];
    
}

- (void)setupGL {
    DebugLog(@"setupGL");
    
    [GLWrapper initialize];
    
    [EAGLContext setCurrentContext:self.context];
    [self initGLState];
    
    [Resources initialize];

    Display.main = [[Display alloc]initWithGLKView:self.projectView];
}

- (void)tearDownGL {
    DebugLog(@"tearDownGL");
    
    [GLWrapper destroy];
    
    [EAGLContext setCurrentContext:self.context];
    
    [Resources unloadAllAsset];
    
    [TextureManager destroy];
    
    Display.main = nil;
    
    Camera.mainCamera = nil;
}

#pragma mark- UI动画
- (void)allViewUserInteractionEnable:(BOOL)enable{
    for (UIView* view in self.allViews) {
        view.userInteractionEnabled = enable;
    }
}

- (void)switchDownToolBarFrom:(DownToolBar*)fromView completion: (void (^) (void))block1 to:(DownToolBar*)toView completion: (void (^) (void)) block2{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (fromView != NULL) {
            fromView.center = CGPointMake(fromView.center.x, self.view.bounds.size.height + fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        if (block1 != NULL) {
            block1();
        }
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (toView != NULL) {
                toView.center = CGPointMake(toView.center.x, self.view.bounds.size.height - toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            if (block2 != NULL) {
                block2();
            }
        }];
    }];
}


- (void) updateViewTopFinished:(float)timeDelta completion: (void (^)(void))completion{
    self.curViewTopAnimationTime += timeDelta;
    self.eyeBottomTopBlend = self.curViewTopAnimationTime / self.viewTopAnimDuration;
    self.eyeBottomTopBlend = MIN(1, self.eyeBottomTopBlend);
    self.eyeBottomTopBlend = sinf(self.eyeBottomTopBlend * M_PI_2);//ease in out
    
    if(self.eyeBottomTopBlend >= 1.0){
        self.curViewTopAnimationTime = 0;
        completion();
    }
}

- (void) updateViewBottomFinished:(float)timeDelta completion: (void (^)(void))completion{
    self.curViewBottomAnimationTime += timeDelta;
    self.eyeBottomTopBlend = 1.0 - self.curViewBottomAnimationTime / self.viewBottomAnimDuration;
    self.eyeBottomTopBlend = MAX(0, self.eyeBottomTopBlend);
    self.eyeBottomTopBlend = sinf(self.eyeBottomTopBlend * M_PI_2);//ease in out
    if(self.eyeBottomTopBlend <= 0.0){
        self.curViewBottomAnimationTime = 0;
        completion();
    }
}

#pragma mark- 核心变换
-(void)viewPaintDoc:(PaintDoc*)paintDoc{
    self.paintDoc = paintDoc;
    //TODO:导致CylinderProject dismiss后不能被release
    //TODO:当新建图片时thumbImage为nil,而thumbImagePath有数值
    [self viewImage:paintDoc.thumbImagePath];
}

//主题Logo
//- (void)loadLogoWithAnimation:(BOOL)anim{
//    self.paintTexture = [TextureManager loadTextureInfoFromImageName:@"AnamorphicTitle.png" reload:false].name;
//    
//    if (anim) {
//        [self startImageProjectAnim];
//    }
//    else{
//        self.alphaBlend = 1.0;
//        self.morphBlend = 1.0;
//    }
//}

- (void)reloadLogo{
    __weak typeof(self) weakSelf = self;
    _unprojectCompletionBlock = ^(void){
        weakSelf.paintTexture.texID = [TextureManager loadTextureInfoFromImageName:@"AnamorphicTitle.png" reload:false].name;
        
        [weakSelf startImageProjectAnim];
    };
    
    [self startImageUnProjectAnim];
}


//在project plane上生成图片
-(void)closeImage{
    [self startImageUnProjectAnim];    
}

-(void)viewImage:(NSString*)imagePathInDoc{
    __weak typeof(self) weakSelf = self;
    _unprojectCompletionBlock = ^(void){
        weakSelf.paintTexture.texID = [TextureManager loadTextureInfoFromFileInDocument:imagePathInDoc reload:true].name;
        
        [weakSelf startImageProjectAnim];
    };
    
    [self startImageUnProjectAnim];
}

//在project plane上生成视频影像
-(void)anamorphVideo{
    NSURL *url = [[NSBundle mainBundle]
                  URLForResource: @"Collection/jerryfish1" withExtension:@"mov"];
    
    self.asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    
    [self generateImage];
    //投影转换
    [self startImageProjectAnim];
    self.playState = PS_Stopped;
}
#pragma mark- 视频
- (IBAction)playbackButtonTouchUp:(UIButton *)sender {
    [self.player play];
}

- (void)textureFromSampleBuffer:(CMSampleBufferRef)sampleBuffer {
    
//    glBindTexture(GL_TEXTURE_2D, self.paintTexture);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
//    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

    CVImageBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
//    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 520, 520, 0, GL_BGRA, GL_UNSIGNED_BYTE, CVPixelBufferGetBaseAddress(pixelBuffer));
    uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    size_t width = CVPixelBufferGetWidth(pixelBuffer);
    size_t height = CVPixelBufferGetHeight(pixelBuffer);

    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef newContext = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef newImage = CGBitmapContextCreateImage(newContext);
    
    /*We release some components*/
    CGContextRelease(newContext);
    CGColorSpaceRelease(colorSpace);
    
    self.paintTexture.texID = [TextureManager loadTextureInfoFromCGImage:newImage].name;
    
    CGImageRelease(newImage);
}

-(UIImage *)imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer{
    
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer.
    CVPixelBufferLockBaseAddress(imageBuffer,0);
    
    // Get the number of bytes per row for the pixel buffer.
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height.
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // Create a device-dependent RGB color space.
    static CGColorSpaceRef colorSpace = NULL;
    if (colorSpace == NULL) {
        colorSpace = CGColorSpaceCreateDeviceRGB();
        if (colorSpace == NULL) {
            // Handle the error appropriately.
            return nil;
        }
    }
    
    // Get the base address of the pixel buffer.
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    // Get the data size for contiguous planes of the pixel buffer.
    size_t bufferSize = CVPixelBufferGetDataSize(imageBuffer);
    
    // Create a Quartz direct-access data provider that uses data we supply.
    CGDataProviderRef dataProvider =
    CGDataProviderCreateWithData(NULL, baseAddress, bufferSize, NULL);
    // Create a bitmap image from data supplied by the data provider.
    CGImageRef cgImage =
    CGImageCreate(width, height, 8, 32, bytesPerRow,
                  colorSpace, kCGImageAlphaNoneSkipFirst | kCGBitmapByteOrder32Little,
                  dataProvider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    
    // Create and return an image object to represent the Quartz image.
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
    
    return image;
}

- (void) readNextMovieFrame
{
    //readNextMovieFrame
    switch (self.assetReader.status) {
        case AVAssetReaderStatusReading:{
//            DebugLog(@"AVAssetReaderStatusReading");
            AVAssetReaderTrackOutput * output = [self.assetReader.outputs objectAtIndex:0];
            CMSampleBufferRef sampleBuffer = [output copyNextSampleBuffer];
            if (sampleBuffer)
            {
                [self textureFromSampleBuffer:sampleBuffer];
                
                CMSampleBufferInvalidate(sampleBuffer);
                CFRelease(sampleBuffer);
                sampleBuffer = NULL;
            }
            else{
                //退到后台会导致output copyNextSampleBuffer null
                DebugLog(@"no sampleBuffer");
            }
        }
            break;
        case AVAssetReaderStatusCompleted:{
            DebugLog(@"AVAssetReaderStatusCompleted");
            self.assetReader = nil;
            
            //loop循环播放
            dispatch_async(dispatch_get_main_queue(),^{
                [self readMovie];
            });
        }
        case AVAssetReaderStatusFailed:{
            DebugLog(@"AVAssetReaderStatusFailed: %@", [self.assetReader.error description]);
            //退到后台会导致Failed
            self.assetReader = nil;
            
            //loop循环播放
            dispatch_async(dispatch_get_main_queue(),^{
                [self readMovie];
            });
        }
            break;                                    
        case AVAssetReaderStatusCancelled:{
            self.assetReader = nil;
        }
            break;            
        default:
            break;
    }
}

- (void)readMovie{
    NSArray *tracks = [self.asset tracksWithMediaType:AVMediaTypeVideo];
    if (tracks.count == 1) {
        AVAssetTrack *track = [tracks objectAtIndex:0];
        NSMutableDictionary* videoSettings = [[NSMutableDictionary alloc] init];
        [videoSettings setObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        //audio
//        [videoSettings setObject:[NSNumber numberWithInt:kCVPixelFormatType_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        AVAssetReaderTrackOutput *output = [[AVAssetReaderTrackOutput alloc]initWithTrack:track outputSettings:videoSettings];
        NSError * error = nil;
        self.assetReader = [[AVAssetReader alloc]initWithAsset:self.asset error:&error];
        if (error){
            DebugLog(@"Error loading file: %@", [error localizedDescription]);
        }
        
        [self.assetReader addOutput:output];
        //test
        Float64 durationSeconds = CMTimeGetSeconds([self.asset duration]);
        self.assetReader.timeRange = CMTimeRangeMake(CMTimeMakeWithSeconds(durationSeconds * 0.67, 24), CMTimeMakeWithSeconds((durationSeconds/3.0), 24));
        
        if ([self.assetReader startReading]) {
            self.playState = PS_Playing;
            [self.playButton setIsPlaying:true];
        }
        else{
            DebugLog(@"assetReader startReading failed");
        }
    }
    //audio
    NSError *error;
    
    AVKeyValueStatus status = [self.asset statusOfValueForKey:@"tracks" error:&error];
    
    if (status == AVKeyValueStatusLoaded) {
        self.playerItem = [AVPlayerItem playerItemWithAsset:self.asset];
        [self.playerItem addObserver:self forKeyPath:@"status"
                             options:0 context:&ItemStatusContext];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(playerItemDidReachEnd:)
                                                     name:AVPlayerItemDidPlayToEndTimeNotification
                                                   object:self.playerItem];
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        [self.player play];
    }
    else {
        // You should deal with the error appropriately.
        DebugLog(@"The asset's tracks were not loaded:\n%@", [error localizedDescription]);
    }
    
//    NSArray *soundTracks = [self.asset tracksWithMediaType:AVMediaTypeAudio];
//    if (soundTracks.count >=1) {
//        AVAssetTrack *soundTrack = [soundTracks objectAtIndex:0];
//
//    }
}

//截取静态图片
-(void)generateImage{
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:self.asset];
    
//    Float64 durationSeconds = CMTimeGetSeconds([self.asset duration]);
//    CMTime midpoint = CMTimeMakeWithSeconds(durationSeconds/2.0, 600);
    CMTime midpoint = CMTimeMakeWithSeconds( 0.0, 600);
    NSError *error;
    CMTime actualTime;
    
    CGImageRef halfWayImage = [imageGenerator copyCGImageAtTime:midpoint actualTime:&actualTime error:&error];
    
    if (halfWayImage != NULL) {
        
        NSString *actualTimeString = (__bridge NSString *)CMTimeCopyDescription(NULL, actualTime);
        NSString *requestedTimeString = (__bridge NSString *)CMTimeCopyDescription(NULL, midpoint);
        DebugLog(@"Got halfWayImage: Asked for %@, got %@", requestedTimeString, actualTimeString);
        
        // Do something interesting with the image.
        UIImage *image = [UIImage imageWithCGImage:halfWayImage];
        self.paintTexture.texID = [TextureManager loadTextureInfoFromUIImage:image].name;
//        self.testImageView.backgroundColor = [UIColor colorWithPatternImage:image];
        
        CGImageRelease(halfWayImage);
    }
}

-(void)startImageProjectAnim{
    //close previous image projection
    self.state = CP_Projecting;
    [self allViewUserInteractionEnable:false];
}

-(void)startImageUnProjectAnim{
    //close previous image projection
    self.state = CP_UnProjecting;
    [self allViewUserInteractionEnable:false];
}

- (void)playVideo{
    [self.asset loadValuesAsynchronouslyForKeys:@[@"tracks"] completionHandler:^() {
        dispatch_async(dispatch_get_main_queue(),^{
            [self readMovie];
        });
    }];

}
- (void)stopVideo{
    [self.asset loadValuesAsynchronouslyForKeys:@[@"tracks"] completionHandler:^() {
        dispatch_async(dispatch_get_main_queue(),^{
            [self readMovie];
        });
    }];
    
}

- (void)pauseVideo{
    [self.assetReader cancelReading];
    [self.player pause];
    self.playState = PS_Pause;
    [self.playButton setIsPlaying:false];
}

- (IBAction)playButtonTouchUp:(UIButton *)sender {
    if (self.playState == PS_Stopped) {
        [self playVideo];
    }
    else if (self.playState == PS_Playing) {
        [self pauseVideo];
    }
    else if (self.playState == PS_Pause) {
        [self playVideo];
    }
}

- (void)flushAllUI {
    if(self.eyeBottomTopBlend > 0.0){
        self.topViewButton.hidden = true;
        self.sideViewButton.hidden = false;
    }
    else{
        self.topViewButton.hidden = false;
        self.sideViewButton.hidden = true;
    }
//    [self syncPlayUI];
}
- (void)syncPlayUI {
    if ((self.player.currentItem != nil) &&
        ([self.player.currentItem status] == AVPlayerItemStatusReadyToPlay)) {
        self.playButton.enabled = YES;
    }
    else {
        self.playButton.enabled = NO;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    
    if (context == &ItemStatusContext) {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [self syncPlayUI];
                       });
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object
                           change:change context:context];
    return;
}
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    [self.player seekToTime:kCMTimeZero];
}

#pragma mark- UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.transitionManager.isPresenting = YES;
    return self.transitionManager;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.transitionManager.isPresenting = NO;
    return self.transitionManager;
}

#pragma mark- 绘画代理PaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup{
    return [self createBestEAGLContext];
}

- (void) closePaintDoc:(PaintDoc *)paintDoc{
    [self.paintScreenVC dismissViewControllerAnimated:false completion:^{
        //刷新当前画架内容
        [self viewPaintDoc:self.paintDoc];
    }];
}

#pragma mark-
-(void)openPaintDoc:(PaintDoc*)paintDoc {
    self.paintDoc = paintDoc;
    self.paintScreenVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintScreen"];
    self.paintScreenVC.delegate = self;
    self.paintScreenVC.transitioningDelegate = self;
    
    //打开绘图面板动画，从cylinder的中心放大过度到paintScreenViewController
    [self presentViewController:self.paintScreenVC animated:true completion:^{
        [self.paintScreenVC openDoc:self.paintDoc];
    }];
}

- (IBAction)sideViewButtonTouchUp:(UIButton *)sender {
    self.sideViewButton.hidden = true;
    self.topViewButton.hidden = false;
    self.state = CP_PitchingToBottomView;
}

- (IBAction)topViewButtonTouchUp:(UIButton *)sender {
    self.topViewButton.hidden = true;
    self.sideViewButton.hidden = false;
    self.state = CP_PitchingToTopView;
}

#pragma mark- 打印Print
- (void)exportToAirPrint{
    //TODO:转换到顶视图，在放圆柱体的位置画上圈，并打印
    
    UIImage *image = [Ultility snapshot:self.projectView Context:self.context InViewportSize:self.projectView.bounds.size ToOutputSize:self.projectView.bounds.size];
    
    //convert UIImage to NSData to add it as attachment
    NSData *data = UIImagePNGRepresentation(image);
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if  (pic && [UIPrintInteractionController canPrintData: data] ) {
        
        pic.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [NSString stringWithFormat:@"image%lu", (unsigned long)image.hash];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printingItem = data;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
            
            if (!completed && error)
                DebugLog(@"FAILED! due to error in domain %@ with error code %u",error.domain, error.code);
        };
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            //            [pic presentFromBarButtonItem:self.printButton animated:YES completionHandler:completionHandler];
            [pic presentFromRect:self.printButton.frame inView:self.toolBar animated:true completionHandler:completionHandler];
        } else {
            [pic presentAnimated:YES completionHandler:completionHandler];
        }
    }
}
#pragma mark- 陀螺仪代理MotionDelegate
- (void)initMotionDetect{
    self.motionManager = [[CMMotionManager alloc]init];
    NSOperationQueue *aQueue=[[NSOperationQueue alloc]init];
    if (!self.motionManager.deviceMotionAvailable) {
        //pop message box
        DebugLog(@"motion manager not available!");
    }
    
    self.motionManager.deviceMotionUpdateInterval = 0.033;
    if (![self.motionManager isDeviceMotionActive]) {
        [self.motionManager startDeviceMotionUpdatesToQueue:aQueue withHandler:
         ^(CMDeviceMotion *motion, NSError *error){
             if (motion) {
//                 DebugLog(@"attitude yaw: %.1f  pitch: %.1f  roll: %.1f", motion.attitude.yaw, motion.attitude.pitch, motion.attitude.roll);
                 
                 //监测未在动画中到角度的变化到固定值
                 if (self.state == CP_Projected){
                     if (motion.attitude.pitch < 0.1 && self.lastPitch >= 0.1  && self.eyeBottomTopBlend <1.0) {
                         self.state = CP_PitchingToTopView;
                     }
                     else if (motion.attitude.pitch >= 0.1 && self.lastPitch < 0.1 && self.eyeBottomTopBlend > 0.0){
                         self.state = CP_PitchingToBottomView;
                     }
                 }

                 self.lastPitch = motion.attitude.pitch;

//                 UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
//                 DebugLog(@"UIDeviceOrientation %d", deviceOrientation);
//                 dispatch_async(dispatch_get_main_queue(), ^{
//                     self.eyeTopBottomBlend = MIN(MAX(0, 1 - (self.lastPitch / M_PI_2)), 1) ;
//                 });
             }
         }];
        
    }
}

@end
