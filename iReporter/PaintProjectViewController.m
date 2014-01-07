//
//  PaintProjectViewController.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintProjectViewController.h"
#import <OpenGLES/EAGLDrawable.h>
#import "Ultility.h"

float paintProjectQuadVertexData[] =
{
    0.5f, 0, -0.5f,          1.0f, 1.0f,
    -0.5f,0, -0.5f,          0.0f, 1.0f,
    0.5f, 0, 0.5f,         1.0f, 0.0f,
    0.5f, 0, 0.5f,        1.0f, 0.0f,
    -0.5f,0, -0.5f,         0.0f, 1.0f,
    -0.5f,0, 0.5f,        0.0f, 0.0f,
};


@interface PaintProjectViewController ()

@end

@implementation PaintProjectViewController

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
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    //创建glkViewController
    _glkViewController = [[GLKViewController alloc]init];
    _glkViewController.view = _projectView;
    _glkViewController.delegate = self;
    // then add the glkview as the subview of the parent view
//    [self.view addSubview:_myGlkViewController.view];
    // add the glkViewController as the child of self
    [self addChildViewController:_glkViewController];
    [_glkViewController didMoveToParentViewController:self];
    
    
    [self.delegate createPaintProjectEAGleContext:self];
    if (!self.context) {
        DebugLog(@"Failed to create ES context");
    }
    
	// Do any additional setup after loading the view.
    _projectView.context = self.context;
    _projectView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    _projectView.delegate = self;

    //覆盖farDistanceSlider的数值
//    self.farDistanceSlider.minimumValue = (tanhf(DEGREES_TO_RADIANS(HumanEyeFOV* 0.5)) * _eye.y) / (float)FarDistanceMax;
//    DebugLog(@"farDistanceSlider minimumValue %.2f", self.farDistanceSlider.minimumValue);
    
    //初始化输入参数
    self.nearDistance = 1;
    self.nearDistanceStepper.value = self.nearDistance;
    self.nearDistanceLabel.text = [NSString stringWithFormat:@"Near %.1f", self.nearDistance];
    self.farDistance = 10;
    self.farDistanceStepper.value = self.farDistance;
    self.farDistanceLabel.text = [NSString stringWithFormat:@"Far %.1f", self.farDistance];
    self.nearDistanceSlider.value = self.nearDistance / self.farDistance;    
    self.heightSlider.value = _eye.y;
    self.heightStepper.value = _eye.y;
    self.heightLabel.text = [NSString stringWithFormat:@"Height %.1f", _eye.y];
    
    //计算内部参数
    [self setupProjectedQuadParams];

    [self setupGridParams];
    
    [self setupPaintProjectParams];
    
    [self setupTopViewParams];
    
    //设置描画相关参数
    [self setupGL];

    //UI
    //旋转heigtSlider为垂直
    CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI * 0.5);
    self.heightSlider.transform = trans;

    //初始化 n*n 个UIView在projectView下
    [self refreshGridButtons];
    [self drawProjectViewRange];
}


- (void)initPaint:(PaintingView*)paintView viewAngle:(float)angle{
    _finalRenderbuffer = paintView.finalRenderbuffer;
    //截取texture
    UIImage *image = [paintView snapshotScreenToUIImageOutputSize:paintView.bounds.size];
    _texMgr = [[TextureManager alloc]init];
    _paintTexture = [self.texMgr loadTextureInfoFromUIImage:image].name;
    _bgTexture = paintView.backgroundTexture;
    
//    _curViewAngleY = _lastViewAngleY = angle;
//    _minViewAngleY = DEGREES_TO_RADIANS(HumanEyeFOV * 0.5 * 1.1);
    
    _manHeight = 1.75;
    _eye = GLKVector3Make(0, _manHeight, 0);
    _eyeT = 1;
    
    _projDirty = true;
    
    //显示
    _showBackground = true;
    _showGrid = true;
    
    //动画
    _state = Projected;
    _projectPaintAnimDuration = 1.0;
    _unprojectPaintAnimDuration = 1.0;

    _zoomInT = 0;
    _zoomOutT = 0;
    _zoomInPaintAnimDuration = 0.3;
    _zoomOutPaintAnimDuration = 0.3;
    _lastMediaTime = CACurrentMediaTime();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 工具栏
- (IBAction)close:(UIButton *)sender {
    _state = Paint;
//    _state = UnProjecting;
}

//初始化 贴图 参数
- (IBAction)adjustEyeSliderSlide:(UISlider *)sender {
    _eyeT = sender.value;
    
    _projDirty = true;
}

- (IBAction)farDistanceTextFieldEdited:(UITextField *)sender {
    
}

- (IBAction)farDistanceStepperValueChanged:(UIStepper *)sender {
    self.farDistance = sender.value;
    self.nearDistanceSlider.value = self.nearDistance / self.farDistance;
    
    self.farDistanceLabel.text = [NSString stringWithFormat:@"Far %.1f", self.farDistance];
    //    DebugLog(@"farDistance %.1f", _farDistance);
    _projDirty = true;
    [self refreshGridButtons];
    [self drawProjectViewRange];
}

- (IBAction)nearDistanceStepperValueChanged:(UIStepper *)sender {
    self.nearDistance = MIN(sender.value, self.farDistance);
    self.nearDistanceSlider.value = self.nearDistance / self.farDistance;
    
    self.nearDistanceLabel.text = [NSString stringWithFormat:@"Near %.1f", self.nearDistance];
    //    DebugLog(@"nearDistance %.1f", self.nearDistance);
    _projDirty = true;
    [self refreshGridButtons];
    [self drawProjectViewRange];
}

- (IBAction)viewHeightStepperValueChanged:(UIStepper *)sender {
    sender.value = MIN(sender.value, EyeHeightMax);
    _eye.y = sender.value;
    self.heightSlider.value = sender.value / EyeHeightMax;
    self.heightLabel.text = [NSString stringWithFormat:@"Height %.1f", _eye.y];
    
    _projDirty = true;
    [self refreshGridButtons];
    [self drawProjectViewRange];
}

- (IBAction)zoomOutButtonTouchUp:(UIButton *)sender {
    if(_state == Zoomed){
        [self zoomOutGridViewWithAnimation:true];
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{

        } completion:^(BOOL finished) {
            for (UIButton *button in self.projectView.subviews) {
                button.hidden = false;
                //                button.alpha = 1;
                //                button.userInteractionEnabled = true;
            }
            self.zoomOutButton.hidden = true;
        }];
    }
}

- (IBAction)testButtonTouchUp:(UIButton *)sender {
//    int row = (floorf(self.gridHeightCount * 0.5));
//    int column = (floorf( self.gridWidthCount* 0.5));
//    DebugLog(@"[   testButtonTouchUp row %d column %d  ]", row, column);
    [self showGridAtRow:self.testRowStepper.value Column:self.testColStepper.value];
}

- (IBAction)testRowStepperValueChanged:(id)sender {
    self.fovYLabel.text = [NSString stringWithFormat:@"%f", self.testRowStepper.value];
}

- (IBAction)testColStepperValueChanged:(id)sender {
    self.testColLabel.text = [NSString stringWithFormat:@"%f", self.testColStepper.value];
}

- (IBAction)farDistanceSliderSlide:(UISlider *)sender {
//    float value = MAX(sender.value, sender.minimumValue);
//
//    sender.value = MIN(sender.value, tanhf(DEGREES_TO_RADIANS(HumanEyeFOV* 0.5)) * _eye.y / FarDistanceMax);
    self.farDistance = sender.value * FarDistanceMax;
    self.farDistanceStepper.value = self.farDistance;
    self.farDistanceLabel.text = [NSString stringWithFormat:@"Far %.1f M", self.farDistance];
//    DebugLog(@"farDistance %.1f", _farDistance);
    _projDirty = true;
    [self refreshGridButtons];
    [self drawProjectViewRange];
}

- (IBAction)nearDistanceSliderSlide:(UISlider *)sender {
//    if (sender.value >= 0.99) {
//        return;
//    }
    self.nearDistance = sender.value * self.farDistance;
    self.nearDistanceStepper.value = self.nearDistance;
    self.nearDistanceLabel.text = [NSString stringWithFormat:@"Near %.1f M", self.nearDistance];
    //    DebugLog(@"nearDistance %.1f", self.nearDistance);
    _projDirty = true;
    [self refreshGridButtons];
    [self drawProjectViewRange];
}

- (IBAction)heightSliderSlide:(UISlider *)sender {
    _manHeight = sender.value * EyeHeightMax;
    _heightLabel.text = [NSString stringWithFormat:@"Height %.1f M", _manHeight];
//    float valueY = _heightSlider.frame.origin.y + (1 - _heightSlider.value) * _heightSlider.frame.size.height;
//    CGRect rect = CGRectMake(_heightLabel.frame.origin.x, valueY, _heightLabel.frame.size.width, _heightLabel.frame.size.height);
//    _heightLabel.frame = rect;
    _eye.y = _manHeight;
    _projDirty = true;
    [self refreshGridButtons];
    [self drawProjectViewRange];
}

- (void)setShowGrid:(bool)showGrid{
    _showGrid = showGrid;
    for (UIButton *button in self.projectView.subviews) {
        button.hidden = !_showGrid;
    }
}

- (IBAction)showGridButtonTapped:(UIButton *)sender {
    self.showGrid = !self.showGrid;
}

- (IBAction)exportButtonTapped:(UIButton *)sender {
    [self ExportToEmail];
//    [self exportGridsToLibrary];
}


#pragma mark- 导出 Export
- (void) saveGridImages{
    // fill array of names
//    self.gridImageIndices = [[NSMutableArray alloc]  initWithCapacity:self.projectView.subviews.count];
//    for (int i = 0; i < self.projectView.subviews.count; ++i) {
//        NSNumber *num = [NSNumber numberWithInt:i];
//        [self.gridImageIndices addObject:num];
//    }
    self.gridImageIndex = 0;
    self.progressView.progress = 0;
    
    [self saveNextGridImage];
}

- (void) saveNextGridImage{
    // copy a wallpaper and remove from the array
    if (self.gridImageIndex < self.projectView.subviews.count) {
    //将任务同步添加到队列中
//    dispatch_sync(saveUIImageQueque, ^{

        [self showGridAtIndex:self.gridImageIndex];
        
        UIImage *image = [Ultility snapshot:self.projectView Context:self.context InViewportSize:self.projectView.bounds.size ToOutputSize:self.projectView.bounds.size];

        UIImageWriteToSavedPhotosAlbum(image, self, @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:), nil);
//    });
        
    }        
}

- (void) savedPhotoImage:(UIImage*)image didFinishSavingWithError: (NSError *)error contextInfo: (void *)contextInfo{
    if (error) {
        DebugLog(@"Error save image %d %@", self.gridImageIndex, [error localizedDescription]);
    }
    else{
        DebugLog(@"image %d didFinishSaving", self.gridImageIndex);
        //更新UI
//        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressLabel.text = [NSString stringWithFormat:@"%d / %d", self.gridImageIndex, self.projectView.subviews.count];
            self.progressView.progress = (float)(self.gridImageIndex + 1) / (float)self.projectView.subviews.count;
//        });
        
        self.gridImageIndex ++;
        
        //继续处理
        if (self.gridImageIndex < self.projectView.subviews.count) {
            [self saveNextGridImage];
        }
        else{
            //视窗切回
            [self zoomOutGridViewWithAnimation:false];
            //完成
            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Grid images saved" delegate:nil cancelButtonTitle:@"ОК" otherButtonTitles:nil];
            [errorAlert show];
        }
    }
}

- (void)exportGridsToLibrary{
    //创建一个串行队列
//    dispatch_queue_t saveUIImageQueque = dispatch_queue_create("com.WenjieHu.ProjectPaint.saveUIImageQueque", NULL);
    
    //批量导出图片至库
    [self saveGridImages];
}
- (void)ExportToEmail{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    [picker setSubject:@"write your subject here"];
    
    UIImage* image = [self snapshotToUIImage];
    
    //convert UIImage to NSData to add it as attachment
    NSData *imageData = UIImagePNGRepresentation(image);
    
    //this is how to attach any data in mail, remember mimeType will be different
    //for other data type attachment.
    
    [picker addAttachmentData:imageData mimeType:@"image/png" fileName:@"image.png"];
    
    //showing MFMailComposerView here
    [self presentModalViewController:picker animated:YES];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(result == MFMailComposeResultCancelled)
        DebugLog(@"Mail has cancelled");
    if(result == MFMailComposeResultSaved)
        DebugLog(@"Mail has saved");
    
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark- 放大缩小显示
- (void)zoomOutGridViewWithAnimation:(BOOL)isAnimation{
    if (isAnimation) {
        _state = ZoomOut;
    }
    else{
        _state = Projected;
        //直接更新
        [self updateParamsForDraw];
    }

}

- (void)zoomInGridView:(CGPoint)location withAnimation:(BOOL)isAnimation{
    //从屏幕坐标转换到世界坐标
    //step1.转换到projection坐标 x: -1~1 y:-1~1
    float x = (location.x - _projectView.bounds.size.width * 0.5) / (_projectView.bounds.size.width * 0.5);
    float y = -(location.y - _projectView.bounds.size.height * 0.5) / (_projectView.bounds.size.height * 0.5);
//    DebugLog(@"projection space x:%.2f, y:%.2f", x, y);
    

    //求出射线于远裁减面的焦点，求出射线于地面的交点
//    GLKVector4 projFarPos = GLKVector4Make(x*FarClipDistance, y*FarClipDistance, FarClipDistance, FarClipDistance);
//    GLKVector4 worldFarPos = GLKMatrix4MultiplyVector4(_viewProjInverseMatrix, projFarPos);
//    DebugLog(@"worldFarPos x:%.2f, y:%.2f z:%.2f", worldFarPos.x, worldFarPos.y, worldFarPos.z);
//    DebugLog(@"_eyeTop x:%.2f, y:%.2f z:%.2f", _eyeTop.x, _eyeTop.y, _eyeTop.z);
//    GLKVector3 eyeRay = GLKVector3Normalize(GLKVector3Subtract(GLKVector3Make(worldFarPos.x, worldFarPos.y, worldFarPos.z), _eyeTop));
//    float k = -_eyeTop.y / eyeRay.y;
//    GLKVector3 worldPos = GLKVector3Add(_eyeTop, GLKVector3MultiplyScalar(eyeRay, k));
//    DebugLog(@"_projNear z:%.2f", _projNear.z);
//    DebugLog(@"ray cast worldPos x:%.2f, y:%.2f z:%.2f", worldPos.x, worldPos.y, worldPos.z);
    
    GLKVector3 worldPos;
    worldPos.x = x * _projWidth * 0.5;
    worldPos.y = 0;
    worldPos.z = -(y * 0.5 + 0.5) * _projHeight + _projNear.z;
//    DebugLog(@"ray cast worldPos x:%.2f, y:%.2f z:%.2f", worldPos.x, worldPos.y, worldPos.z);
    
    if(worldPos.z > _projNear.z || worldPos.z < _projFar.z){
        DebugLog(@"Out of paint area!");
//        return;
    }
    
    //找到在那块地面范围内
    if (useFeet)
    {
    }
    else
    {
        _zoomInCenter.x = worldPos.x;
        _zoomInCenter.z = worldPos.z;
        
        float heightFovY = 1 * 0.5 / tanf(self.fovY * 0.5);
        float heightFovX = 1 * 0.5 / (tanf(self.fovY * 0.5) * _projSrcAspect);
        _eyeZoomInTop = GLKVector3Make(_zoomInCenter.x, MAX(heightFovX, heightFovY), _zoomInCenter.z);
    }
//    DebugLog(@"_zoomInCenter x:%.2f, y:%.2f z:%.2f", _zoomInCenter.x, _zoomInCenter.y, _zoomInCenter.z);
//    DebugLog(@"_eyeMagTop x:%.2f, y:%.2f z:%.2f", _eyeMagTop.x, _eyeMagTop.y, _eyeMagTop.z);
    
    //准备开始放大动画
    if (isAnimation) {
        _state = ZoomIn;
    }
    else{
        _state = Zoomed;
        //直接更新
        [self updateParamsForDraw];
    }
}
#pragma mark- 手势
- (IBAction)handleTapPaintProjectViewGesture:(UITapGestureRecognizer *)sender {
//    if (sender.state == UIGestureRecognizerStateEnded ) {
//        if(_state == Zoomed){
//            [self unMagnifyGridView];
//        }
//        else if(_state == Projected){
//            [self magnifyGridView:[sender locationInView:_projectView]];
//        }
//
//    }
}


#pragma mark- 设置观察
//从顶视图向下正交保存贴图矩阵
//- (void)setupSaveTextureParams{
//    //计算实际地面长度
//    
//    //定义边界点坐标为 (xt)
//    //T = t*t; X = x*x; A = cosf(halfFov) * cosf(halfFov); H ＝ eye.y * eye.y
//    float fovHalf = DEGREES_TO_RADIANS(HumanEyeFOV* 0.5) ;
//    float A = cosf(fovHalf) * cosf(fovHalf);
//    float D = _eyeToPaintViewCenterDistanceZ * _eyeToPaintViewCenterDistanceZ;
//    float H = _eye.y * _eye.y;
//    
//    float a = D*D - A*D*D - A*D*H;
//    float b = 2*D*H;
//    float c = H*H - A*D*H - A*H*H;
//    
//    float result1 = sqrtf((b*b-4*a*c)/(4*a*a)) - b/(2*a);
//    float result2 = -sqrtf((b*b-4*a*c)/(4*a*a)) - b/(2*a);
//    float d1 = _eyeToPaintViewCenterDistanceZ * result1;
//    float d2 = _eyeToPaintViewCenterDistanceZ * result2;
//    
//    _realHeight = fabsf(d2 - d1);
//    
//    //计算视图顶部观察点
//    GLKVector3 far = GLKVector3Make(sinf(_paintViewAngleX) * d1, 0, -cosf(_paintViewAngleX) * d1);
//    GLKVector3 near = GLKVector3Make(sinf(_paintViewAngleX) * d2, 0, -cosf(_paintViewAngleX) * d2);
//    GLKVector3 viewCenter = GLKVector3Make((near.x+far.x)*0.5, (near.y+far.y)*0.5, (near.z+far.z)*0.5);
//    GLKVector3 eye = GLKVector3Make(viewCenter.x, 1.5, viewCenter.z);
//    GLKVector3 up = GLKVector3Normalize(GLKVector3Subtract(far, near));
//    
//    //计算绘制矩阵
//    float aspect = fabsf(_projectView.bounds.size.width / _projectView.bounds.size.height);
//    GLKMatrix4 projectionMatrix = GLKMatrix4MakeOrtho(-0.5*_realHeight*aspect, 0.5*_realHeight*aspect, 0.5*_realHeight, -0.5*_realHeight, 0.01, 100);
//    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(20, 1, 30);
//    GLKMatrix4 worldMatrix = scaleMatrix;
//    GLKMatrix4 modelViewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, viewCenter.x, viewCenter.y, viewCenter.z, up.x, up.y, up.z);
//    
//    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, worldMatrix);
//    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
//    
//    //计算截图放大的比例
//    _realWidth = _realHeight * aspect;
//    float r = _eyeToPaintViewCenterDistanceZ - d2;
//    float screenViewHeight = sinf(_paintViewAngleY) * r * 2;
//    _kHeightScale = _realHeight / screenViewHeight;
//    
//    //viewport有尺寸限制，要将_kScreenToReal限制在尺寸限制内
//    GLuint dims[2];
//    glGetIntegerv(GL_MAX_VIEWPORT_DIMS, (GLint*)&dims[0]);
//    if (_projectView.bounds.size.height*_kHeightScale>dims[1]) {
//        _kHeightScale = dims[1] / _projectView.bounds.size.height;
//    }
//    
////    DebugLog(@"Debug: RealHeight: %.2f meters ScreenToRealScale: %.2f", realHeight, _kHeightScale);
//    [_projectView setContentScaleFactor:_kHeightScale];
//}
//


//计算实际地面长度
//    if(_curViewAngleY < _minViewAngleY){
//        _curViewAngleY = _minViewAngleY;
//    }
//    _eyeToPaintViewCenterDistanceZ = _eye.y / tanf(_curViewAngleY);
//    float x = sinf(_curViewAngleX) * _eyeToPaintViewCenterDistanceZ;
//    float z = cosf(_curViewAngleX) * _eyeToPaintViewCenterDistanceZ;
//    _projFocus = GLKVector3Make(x, 0, -z);
//
//    //定义边界点坐标为 (xt)
//    //T = t*t; X = x*x; A = cosf(halfFov) * cosf(halfFov); H ＝ eye.y * eye.y
//    float fovYHalf = DEGREES_TO_RADIANS(HumanEyeFOV* 0.5) ;
//    float A = cosf(fovYHalf) * cosf(fovYHalf);
//    float D = _eyeToPaintViewCenterDistanceZ * _eyeToPaintViewCenterDistanceZ;
//    float H = _eye.y * _eye.y;
//
//    float a = D*D - A*D*D - A*D*H;
//    float b = 2*D*H;
//    float c = H*H - A*D*H - A*H*H;
//
//    float result1 = sqrtf((b*b-4*a*c)/(4*a*a)) - b/(2*a);
//    float result2 = -sqrtf((b*b-4*a*c)/(4*a*a)) - b/(2*a);
//    float d1 = _eyeToPaintViewCenterDistanceZ * result1;
//    float d2 = _eyeToPaintViewCenterDistanceZ * result2;
//
//    //实际地面绘制长宽
//    _projHeight = fabsf(d2 - d1);
//    float tanFovXHalf =tanf(fovYHalf) * _aspect;
//    _projWidth = _projHeight * tanFovXHalf * 2;
//
//    _projFar = GLKVector3Make(sinf(_paintViewAngleX) * d1, 0, -cosf(_paintViewAngleX) * d1);
//    _projNear = GLKVector3Make(sinf(_paintViewAngleX) * d2, 0, -cosf(_paintViewAngleX) * d2);
//    _projCenter = GLKVector3Lerp(_projNear, _projFar, 0.5);


- (void)setupProjectedQuadParams{
    //投影视图视口比例    
    _projSrcAspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
//    _projAspect = fabsf(_projectView.bounds.size.width / _projectView.bounds.size.height);
    DebugLog(@"_aspect: %.2f", _projSrcAspect);

    
    //顶视图视口比例
    _eyeTopAspect = fabsf(_projectView.bounds.size.width / _projectView.bounds.size.height);
    DebugLog(@"_eyeTopAspect: %.2f", _eyeTopAspect);
 
    //使用最远距离,最近距离作为输入参数
    float angleFar = atan2f(_eye.y, self.farDistance);
    float angleNear = atan2f(_eye.y, self.nearDistance);
    self.fovY = (angleNear - angleFar);
    float fovYHalf = self.fovY * 0.5;

    _projFar = GLKVector3Make(sinf(_paintViewAngleX) * self.farDistance, 0, -cosf(_paintViewAngleX) * self.farDistance);
    _projNear = GLKVector3Make(sinf(_paintViewAngleX) * self.nearDistance, 0, -cosf(_paintViewAngleX) * self.nearDistance);
    _projCenter = GLKVector3Lerp(_projNear, _projFar, 0.5);
    float angleFocus = angleNear - fovYHalf;
    float focusDistance = _eye.y / tanf(angleFocus);
    _projFocus = GLKVector3Make(sinf(_paintViewAngleX) * focusDistance, 0, -cosf(_paintViewAngleX) * focusDistance);
    
    //实际地面绘制长宽
    _projHeight = fabsf(self.farDistance - self.nearDistance);
    float tanFovXHalf =tanf(fovYHalf) * _projSrcAspect;
    _projWidth = self.farDistance * tanFovXHalf * 2;
   
  
//    DebugLog(@"_projHeight:%.1f", _projHeight);
//    DebugLog(@"_projWith:%.1f", _projWidth);
//    DebugLog(@"_projFar x:%.1f y:%.1f z:%.1f", _projFar.x, _projFar.y, _projFar.z);
//    DebugLog(@"_projNear x:%.1f y:%.1f z:%.1f", _projNear.x, _projNear.y, _projNear.z);
    
    //update UI
    self.fovYLabel.text = [NSString stringWithFormat:@"FOV: %.1f D", RADIANS_TO_DEGREES(self.fovY)];
    self.projWidthLabel.text = [NSString stringWithFormat:@"Width: %.1f M", _projWidth];
    self.projHeightLabel.text = [NSString stringWithFormat:@"Depth: %.1f M", _projHeight];
}

- (void)setupPaintProjectParams{
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(_projWidth, 1, _projHeight);
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(_projCenter.x, _projCenter.y, _projCenter.z);
    GLKMatrix4 worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);
    GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(_eye.x, _eye.y, _eye.z, _projFocus.x, _projFocus.y, _projFocus.z, 0, 1, 0);
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(viewMatrix, worldMatrix);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(self.fovY, _projSrcAspect, NearClipDistance, FarClipDistance);
    _paintMVPMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
}



- (void)setupTopViewParams{
    DebugLog(@"[   setupTopViewParams  ]");
    
    //计算视图顶部观察点
    float heightFovY = _projHeight * 0.5 / tanf(self.fovY * 0.5);
    float heightFovX = _projWidth * 0.5 / (tanf(self.fovY * 0.5) * _projSrcAspect);
    
    _eyeTop = GLKVector3Make(_projCenter.x, MAX(heightFovX, heightFovY), _projCenter.z);
    GLKVector3 up;
    if (_eyeT >= 1.0) {
        up = GLKVector3Normalize(GLKVector3Subtract(_projFar, _projNear));
    }
    else{
        up = GLKVector3Make(0, 1, 0);
    }

//    DebugLog(@"up x:%.1f y:%.1f z:%.1f", up.x, up.y, up.z);    
    
    GLKVector3 eye, center;
    float orthorWidth = _projWidth;
    float orthorHeight = _projHeight;
    if(_state == ZoomIn)
    {
//        DebugLog(@"Magnifying _magnifyT %.2f", _magnifyT);
        eye = GLKVector3Lerp(_eyeTop, _eyeZoomInTop, _zoomInT);
        center = GLKVector3Lerp(_projCenter, _zoomInCenter, _zoomInT);
        orthorWidth = _projWidth * (1 - _zoomInT) + self.gridRealSize * _zoomInT;
        orthorHeight = _projHeight * (1 - _zoomInT) + self.gridRealSize * _zoomInT;
    }
    else if (_state == Zoomed)
    {
//        DebugLog(@"Zoomed _magnifyT %.2f", _magnifyT);
        eye = _eyeZoomInTop;
        center = _zoomInCenter;
        orthorWidth = self.gridRealSize;
        orthorHeight = self.gridRealSize;
        
    }
    else if(_state == ZoomOut)
    {
//        DebugLog(@"ZoomOut _unMagnifyT %.2f", _unMagnifyT);
        eye = GLKVector3Lerp(_eyeZoomInTop, _eyeTop, _zoomOutT);
        center = GLKVector3Lerp(_zoomInCenter, _projCenter, _zoomOutT);
        orthorWidth =  self.gridRealSize * (1 - _zoomOutT) + _projWidth * _zoomOutT;
        orthorHeight =  self.gridRealSize * (1 - _zoomOutT) + _projHeight * _zoomOutT;
    }
//    else if(_state == Projecting || _state == UnProjecting)
//    {
//        //当前观察点(在最佳观察点与顶部观察点之间lerp)
//        eye = GLKVector3Lerp(_eye, _eyeTop, _eyeT);
//        center = GLKVector3Lerp(_projFocus, _projCenter, _eyeT);
//    }
    else if(_state == Projected)
    {
        eye = _eyeTop;
        center = _projCenter;
        orthorWidth = _projWidth;
        orthorHeight = _projHeight;
        
    }
    //如果中心点反向，则up向量反向
    if (center.z >= 0) {
        up.z *= -1;
    }
//    DebugLog(@"eye x:%.1f y:%.1f z:%.1f", eye.x, eye.y, eye.z);
//    DebugLog(@"center x:%.1f y:%.1f z:%.1f", center.x, center.y, center.z);
    
    //计算绘制图片的矩阵
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(_projWidth, 1, _projHeight);
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(_projCenter.x, _projCenter.y, _projCenter.z);
    GLKMatrix4 worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);
    GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(viewMatrix, worldMatrix);
    //改为正交矩阵
    DebugLog(@"projectionMatrix left %.1f right %.1f bottom %.1f top %.1f", -orthorWidth * 0.5, orthorWidth * 0.5, -orthorHeight * 0.5, orthorHeight * 0.5);
    float orthorSize = MAX(orthorWidth, orthorHeight);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakeOrtho(-orthorSize * 0.5, orthorSize * 0.5, -orthorHeight * 0.5, orthorSize - orthorHeight * 0.5,  NearClipDistance, FarClipDistance);
//    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(HumanEyeFOV), _projAspect, NearClipDistance, FarClipDistance);
    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
    bool isInvertible = true;
    _viewProjInverseMatrix = GLKMatrix4Invert(GLKMatrix4Multiply(projectionMatrix, viewMatrix), &isInvertible);
    
    //通过modelViewProjection 将单位1的向量转换到projection space(-1, 1),在通过屏幕viewport，得到实际1米 * measureScale在屏幕上的Size大小
    if (_state == Projected) {
        GLKVector4 unitVec = GLKVector4Make(1.0 * self.measureScale, 0, 0, 1);//worldMatrix Identity
        GLKVector4 unitHVec = GLKMatrix4MultiplyVector4(projectionMatrix, GLKMatrix4MultiplyVector4(viewMatrix, unitVec));
        GLKVector4 unitScreenVec = GLKVector4Make(unitHVec.x / unitHVec.w, unitHVec.y / unitHVec.w, unitHVec.z / unitHVec.w, unitHVec.w / unitHVec.w);
//        DebugLog(@"unitScreenVec x:%.2f y:%.2f z:%.2f w:%.2f", unitScreenVec.x, unitScreenVec.y, unitScreenVec.z, unitScreenVec.w);
        self.gridPointSize = (unitScreenVec.x * 0.5) * self.view.bounds.size.width;
        if (useFeet) {
            self.gridPointSize = self.gridPointSize * self.measureScale;
        }
//        DebugLog(@"gridPointSize %.2f", self.gridPointSize);
    }
}

#pragma mark- 动画
- (BOOL) updateProjectPaintFinished:(float)timeDelta{
    _curProjectPaintAnimationTime += timeDelta;
    _eyeT = _curProjectPaintAnimationTime / _projectPaintAnimDuration;
    _eyeT = MIN(1, _eyeT);
    _projectSlider.value = _eyeT;
    
    return _eyeT >= 1.0;
}

- (BOOL) updateUnprojectPaintFinished:(float)timeDelta{
    _curUnprojectPaintAnimationTime += timeDelta;
    _eyeT = 1.0 - _curUnprojectPaintAnimationTime / _unprojectPaintAnimDuration;
    _eyeT = MAX(0, _eyeT);
    
    _projectSlider.value = _eyeT;

    return _eyeT <= 0.0;
}

- (BOOL) updateZoomOutPaintFinished:(float)timeDelta{
    _curZoomOutPaintAnimationTime += timeDelta;
    _zoomOutT = _curZoomOutPaintAnimationTime / _zoomOutPaintAnimDuration;
    _zoomOutT = MIN(1, _zoomOutT);
    
    return _zoomOutT >= 1.0;
}

- (BOOL) updateZoomInPaintFinished:(float)timeDelta{
    _curZoomInPaintAnimationTime += timeDelta;
    _zoomInT = _curZoomInPaintAnimationTime / _zoomInPaintAnimDuration;
    _zoomInT = MIN(1, _zoomInT);
    
    return _zoomInT >= 1.0;
}

#pragma mark- 绘图
- (void)showGridAtRow:(int)row Column:(int)column{
    UIButton *button = [self.projectView.subviews objectAtIndex: (self.gridWidthCount * row + column)];
    [self zoomInGridView:button.center withAnimation:false];

    [self drawOffScreenView:self.projectView];
}
- (void)showGridAtIndex:(int)index{
    DebugLog(@"[   showGridAtIndex %d   ]", index);
    UIButton *button = [self.projectView.subviews objectAtIndex: index];
    [self zoomInGridView:button.center withAnimation:false];

    [self drawOffScreenView:self.projectView];
}

- (void)gridButtonTouchUp:(id)sender{
    UIButton *button = (UIButton*)sender;
    button.backgroundColor = [UIColor clearColor];
    button.alpha = 1;
    DebugLog(@"button.center x:%.2f y:%.2f", button.center.x, button.center.y);
    
    if(_state == Zoomed){
        [self zoomOutGridViewWithAnimation:true];
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            for (UIButton *button in self.projectView.subviews) {
                button.alpha = 1;
                button.userInteractionEnabled = true;
            }
        } completion:^(BOOL finished) {
            
        }];
    }
    else if(_state == Projected){
        [self zoomInGridView:button.center withAnimation:true];
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            for (UIButton *button in self.projectView.subviews) {
                button.hidden = true;
//                button.alpha = 0;
//                button.userInteractionEnabled = false;
            }
        } completion:^(BOOL finished) {
            self.zoomOutButton.hidden = false;
        }];
    }
}

- (void)gridButtonTouchDown:(id)sender{
    UIButton *button = (UIButton*)sender;
    button.backgroundColor = [UIColor greenColor];
    button.alpha = 0.5;
}

- (void)refreshGridButtons{
    
    //网格数量发生变化，重置网格
    if (self.projectView.subviews.count != self.gridHeightCount * self.gridWidthCount) {
        for (UIButton *button in self.projectView.subviews) {
            [button removeFromSuperview];
        }
        for (int i = 0; i < self.gridHeightCount; ++i) {
            for (int j = 0; j < self.gridWidthCount; ++j) {
                
                float x = (j - self.gridWidthCount * 0.5) * self.gridPointSize + self.view.bounds.size.width * 0.5;
                float y = self.projectView.bounds.size.height - (self.gridHeightCount - i) * self.gridPointSize;
                CGRect frame = CGRectMake(x, y, self.gridPointSize, self.gridPointSize);
//                DebugLog(@"frame x:%.2f y:%.2f w:%.2f h:%.2f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
                UIButton *button = [[UIButton alloc]initWithFrame:frame];
                [button addTarget:self action:@selector(gridButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
                [button addTarget:self action:@selector(gridButtonTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
                [button addTarget:self action:@selector(gridButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
                [button addTarget:self action:@selector(gridButtonTouchCancel:) forControlEvents:UIControlEventTouchCancel];

                button.layer.borderWidth = 1;
                button.layer.borderColor = [UIColor greenColor].CGColor;
                [self.projectView addSubview:button];
            }
        }
    }
    //只移动位置，改变大小
    else{
        for (int i = 0; i < self.gridHeightCount; ++i) {
            for (int j = 0; j < self.gridWidthCount; ++j) {
                
                float x = (j - self.gridWidthCount * 0.5) * self.gridPointSize + self.view.bounds.size.width * 0.5;
                float y = self.projectView.bounds.size.height - (self.gridHeightCount - i) * self.gridPointSize;
                CGRect frame = CGRectMake(x, y, self.gridPointSize, self.gridPointSize);
//                DebugLog(@"frame x:%.2f y:%.2f w:%.2f h:%.2f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
                UIButton *button = [self.projectView.subviews objectAtIndex:(i * self.gridWidthCount + j)];
                button.frame = frame;
            }
        }
    }
    
    for (UIButton *button in self.projectView.subviews) {
        button.hidden = !_showGrid;
    }
 
}

-(void) updateParamsForDraw{
    //计算投影长宽等参数
    [self setupProjectedQuadParams];
    
    //基于投影参数计算网格参数
    [self setupGridParams];
    
    //计算绘图投影矩阵
    [self setupPaintProjectParams];
    
    //计算渲染矩阵
    [self setupTopViewParams];
    
}
- (void)glkViewControllerUpdate:(GLKViewController *)controller{
    //重新设置投影地面的参数
    if(_projDirty){
        [self updateParamsForDraw];
        _projDirty = false;
    }

    //更新动画状态
    float curMediaTime = CACurrentMediaTime();
    float timeDelta = curMediaTime - _lastMediaTime;
    
    if(_state == Projecting){
        _projDirty = true;
        if ([self updateProjectPaintFinished:timeDelta]) {
            _curProjectPaintAnimationTime = 0;
            _state = Projected;
//            _projDirty = false;
        }
    }
    
    else if(_state == UnProjecting){
        _projDirty = true;
        if ([self updateUnprojectPaintFinished:timeDelta]) {
            _curUnprojectPaintAnimationTime = 0;
            _state = Paint;
//            _projDirty = false;            
            [self dismissViewControllerAnimated:true completion:^{
            }];
        }
    }
    else if(_state == Paint){
        [self dismissViewControllerAnimated:true completion:^{
        }];
    }
    
    else if(_state == ZoomIn){
        _projDirty = true;        
        if ([self updateZoomInPaintFinished:timeDelta]) {
            _curZoomInPaintAnimationTime = 0;
            _state = Zoomed;

        }
    }
    
    else if(_state == ZoomOut){
        _projDirty = true;
        if ([self updateZoomOutPaintFinished:timeDelta]) {
            _curZoomOutPaintAnimationTime = 0;
            _state = Projected;
        }
    }
    
    _lastMediaTime = curMediaTime;
}

/*绘制方法:
step1.从观察角度绘制地面, 地面长宽根据视角自适应
*/
- (void)drawBackground{
    
}
- (void)drawPaint{
    glUseProgram(_programProject);
    
    //绘制投影地面
    glBindVertexArrayOES(_vertexArray);
    glEnable(GL_BLEND);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, _bgTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glUniform1i(_baseTextureUniform, 0);
    
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, _paintTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    
    glUniform1i(_paintTextureUniform, 1);
    glUniformMatrix4fv(_modelViewProjMatrixUniform, 1, 0, _modelViewProjectionMatrix.m);
    glUniformMatrix4fv(_paintMVPMatrixUniform, 1, 0, _paintMVPMatrix.m);
    
    float baseTexScale = _showBackground ? 1.0 : 0.0f;
    glUniform1f(_baseTexScaleUniform, baseTexScale);
    
    glDrawArrays(GL_TRIANGLES, 0, 6);
}


- (void)drawProjectViewRange{
    //绘制视域
    CGRect viewHeightSliderTrackRect = [self.heightSlider trackRectForBounds:self.heightSlider.bounds];
    CGRect viewHeightSliderThumbRect = [self.heightSlider thumbRectForBounds:self.heightSlider.bounds trackRect:viewHeightSliderTrackRect value:self.heightSlider.value];
    CGPoint viewHeightSliderThumbRectCenter = CGPointMake(viewHeightSliderThumbRect.origin.x + viewHeightSliderThumbRect.size.width * 0.5, viewHeightSliderThumbRect.origin.y + viewHeightSliderThumbRect.size.height * 0.5);
    CGPoint viewHeightPoint = [self.projectViewRange convertPoint:viewHeightSliderThumbRectCenter fromView:self.heightSlider];
    DebugLog(@"viewHeightPoint x:%.1f y:%.1f", viewHeightPoint.x, viewHeightPoint.y);
    
    CGRect projectNearSliderTrackRect = [self.nearDistanceSlider trackRectForBounds:self.nearDistanceSlider.bounds];
    CGRect projectNearSliderThumbRect = [self.nearDistanceSlider thumbRectForBounds:self.nearDistanceSlider.bounds trackRect:projectNearSliderTrackRect value:self.nearDistanceSlider.value];
    CGPoint projectNearSliderThumbRectCenter = CGPointMake(projectNearSliderThumbRect.origin.x + projectNearSliderThumbRect.size.width * 0.5, projectNearSliderThumbRect.origin.y + projectNearSliderThumbRect.size.height * 0.5);
    CGPoint projectNearPoint = [self.projectViewRange convertPoint:projectNearSliderThumbRectCenter fromView:self.nearDistanceSlider];
    DebugLog(@"projectNearPoint x:%.1f y:%.1f", projectNearPoint.x, projectNearPoint.y);
    
    CGPoint projectFarPoint = CGPointMake(self.nearDistanceSlider.center.x + self.nearDistanceSlider.bounds.size.width * 0.5, self.nearDistanceSlider.center.y);
    DebugLog(@"projectFarPoint x:%.1f y:%.1f", projectFarPoint.x, projectFarPoint.y);
    
    self.projectViewRange.viewHeightPoint = viewHeightPoint;
    self.projectViewRange.projectNearPoint = projectNearPoint;
    self.projectViewRange.projectFarPoint = projectFarPoint;
    [self.projectViewRange setNeedsDisplay];
}
- (void)drawOffScreenView:(GLKView *)view{
    [EAGLContext setCurrentContext:_context];
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _finalRenderbuffer);

    //为了让整个拉伸的图片能在view里能显示出来，根据投影的长宽比来调整viewport的大小。
//    float projAspect = _projWidth / _projHeight;
//    float viewportWidth, viewportHeight;
//    if(projAspect > 1.0){
//        viewportWidth = view.bounds.size.width;
//        viewportHeight = viewportWidth / projAspect;
//    }
//    else {
//        viewportHeight = view.bounds.size.height;
//        viewportWidth = viewportHeight * projAspect;
//    }
//    float offsetX = (view.bounds.size.width - viewportWidth) * 0.5;
//    float offsetY = (view.bounds.size.height - viewportHeight) * 0.5;
//    glViewport(offsetX, offsetY, viewportWidth, viewportHeight);
    glViewport(0, 0, view.bounds.size.width, view.bounds.size.height);
    //清背景
    glClearColor(0.5f, 0.6f, 0.7f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    //使用投影Shader技术绘制地面
    [self drawPaint];
    
    //绘制参考线
    
    //使用ShaderLine技术绘制地面
    //    if (_showGrid) {
    //        [self drawGrid];
    //    }
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [self drawOffScreenView:view];
    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
}


#pragma mark- Opengles Shader相关
- (void)setupGL {
    //init states
    [EAGLContext setCurrentContext:_context];
    
    [self loadProjectShaders];
    
    [self loadProjectQuadModel];
}

- (void)tearDownGL {
    RELEASE_BUFFER(_vertexBuffer)
    
    RELEASE_VERTEXARRAY(_vertexArray)

    _programProject = 0;
    
}

- (void)setupGridParams{
    //根据公尺还是英尺来决定数量
    if (useFeet) {
        self.gridWidthCount = ceilf(_projWidth*InchScale);
        self.gridWidthCount = self.gridWidthCount % 2 == 0 ? self.gridWidthCount : self.gridWidthCount + 1;
        self.gridHeightCount = ceilf(_projHeight*InchScale);
        self.measureScale = 1.0 / (float)InchScale;
        self.gridRealSize = 1.0 * self.measureScale;
    }
    else{
        self.gridWidthCount = ceilf(_projWidth);
        self.gridWidthCount = self.gridWidthCount % 2 == 0 ? self.gridWidthCount : self.gridWidthCount + 1;
        self.gridHeightCount = ceilf(_projHeight);
        self.measureScale = 1.0;
        self.gridRealSize = 1.0;
    }
}


- (BOOL)loadProjectQuadModel{
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(paintProjectQuadVertexData), paintProjectQuadVertexData, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
    
    return YES;    
}

- (BOOL)loadProjectShaders
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programProject = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderPaintProject" ofType:@"vsh"];
    if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderPaintProject" ofType:@"fsh"];
    if (![[ShaderManager sharedInstance] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programProject, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programProject, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programProject, GLKVertexAttribPosition, "position");
//    glBindAttribLocation(_programProject, GLKVertexAttribTexCoord0, "texcoord");
    
    // Link program.
    if (![[ShaderManager sharedInstance] linkProgram:_programProject]) {
        DebugLog(@"Failed to link program: %d", _programProject);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programProject) {
            glDeleteProgram(_programProject);
            _programProject = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _modelViewProjMatrixUniform = glGetUniformLocation(_programProject, "modelViewProjectionMatrix");
    
    _paintMVPMatrixUniform = glGetUniformLocation(_programProject, "paintMVPMatrix");
    _baseTextureUniform = glGetUniformLocation(_programProject, "inputImageTexture");
    _paintTextureUniform = glGetUniformLocation(_programProject, "inputPaintTexture");
    _baseTexScaleUniform = glGetUniformLocation(_programProject, "fBaseTexScale");
//    _paintTexScaleUniform = glGetUniformLocation(_programProject, "fPaintTexScale");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programProject, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programProject, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;
}


- (void)viewDidUnload {
    [self tearDownGL];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
    self.context = nil;
    
    [self setFarDistanceSlider:nil];
    [self setFarDistanceLabel:nil];
    [self setHeightSlider:nil];
    [self setHeightLabel:nil];
    [self setProjectView:nil];
    [self setProjectSlider:nil];

    [super viewDidUnload];
}

- (UIImage*)snapshotToUIImage
{
    [EAGLContext setCurrentContext:_context];
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _finalRenderbuffer);
    glViewport(0, 0, _projectView.frame.size.width, _projectView.frame.size.height);
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    //使用投影Shader技术绘制地面
    [self drawPaint];
    
//    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
    
    return [Ultility snapshot:_projectView Context:_context InViewportSize:_projectView.frame.size ToOutputSize:_projectView.frame.size];
}
@end
