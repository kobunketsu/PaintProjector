//
//  PaintProjectViewController.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintProjectViewController.h"
#import <OpenGLES/EAGLDrawable.h>
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

@synthesize context = _context;
@synthesize delegate;
@synthesize effect = _effect;
@synthesize glkViewController = _glkViewController;

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
    
    
    [delegate createPaintProjectEAGleContext:self];
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
	// Do any additional setup after loading the view.
    _projectView.context = self.context;
    _projectView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    _projectView.delegate = self;

    //覆盖farDistanceSlider的数值
//    self.farDistanceSlider.minimumValue = (tanhf(DEGREES_TO_RADIANS(HumanEyeFOV* 0.5)) * _eye.y) / (float)FarDistanceMax;
//    NSLog(@"farDistanceSlider minimumValue %.2f", self.farDistanceSlider.minimumValue);
    
    [self setupRealQuadParams];

    [self setupPaintProjectParams];
    
    [self setupGL];
    
    
    //UI
    //旋转heigtSlider为垂直
    CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI * 0.5);
    _heightSlider.transform = trans;
}

- (void)initPaint:(PaintingView*)paintView viewAngle:(float)angle{
    _finalRenderbuffer = paintView.finalRenderbuffer;
    _paintTexture = paintView.curPaintedLayerTexture;
    _bgTexture = paintView.backgroundTexture;
    
//    _curViewAngleY = _lastViewAngleY = angle;
//    _minViewAngleY = DEGREES_TO_RADIANS(HumanEyeFOV * 0.5 * 1.1);
    
    _manHeight = 1.75;
    _eye = GLKVector3Make(0, _manHeight, 0);
    _eyeT = 0;
    
    _projDirty = false;
    
    //显示
    _showBackground = true;
    _showGrid = true;
    
    //动画
    _state = Projecting;
    _projectPaintAnimDuration = 1.0;
    _unprojectPaintAnimDuration = 1.0;

    _magnifyT = 0;
    _unMagnifyT = 0;
    _magnifyPaintAnimDuration = 0.3;
    _unMagnifyPaintAnimDuration = 0.3;
    _lastMediaTime = CACurrentMediaTime();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 工具栏
- (IBAction)close:(UIButton *)sender {
    _state = UnProjecting;
}

//初始化 贴图 参数
- (IBAction)adjustEyeSliderSlide:(UISlider *)sender {
    _eyeT = sender.value;
    
    _projDirty = true;
}

- (IBAction)farDistanceSliderSlide:(UISlider *)sender {
//    float value = MAX(sender.value, sender.minimumValue);
//
    _farDistance = sender.value * FarDistanceMax;
    _farDistance = MAX(_farDistance, tanhf(DEGREES_TO_RADIANS(HumanEyeFOV* 0.5)) * _eye.y);
    
    self.farDistanceLabel.text = [NSString stringWithFormat:@"Far Distance %.1f", _farDistance];
//    NSLog(@"farDistance %.1f", _farDistance);
    _projDirty = true;
}

- (IBAction)heightSliderSlide:(UISlider *)sender {
    _manHeight = sender.value * EyeHeightMax;
    _heightLabel.text = [NSString stringWithFormat:@"Height %.1f", _manHeight];
    float valueY = _heightSlider.frame.origin.y + (1 - _heightSlider.value) * _heightSlider.frame.size.height;
    CGRect rect = CGRectMake(_heightLabel.frame.origin.x, valueY, _heightLabel.frame.size.width, _heightLabel.frame.size.height);
    _heightLabel.frame = rect;
    _eye.y = _manHeight;
    _projDirty = true;    
}

- (IBAction)showBackgroundButtonTapped:(UIButton *)sender {
    _showBackground = !_showBackground;
}

- (IBAction)showGridButtonTapped:(UIButton *)sender {
    _showGrid = !_showGrid;
}

- (IBAction)exportButtonTapped:(UIButton *)sender {
    [self ExportToEmail];
}


#pragma mark- 导出 Export
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
        NSLog(@"Mail has cancelled");
    if(result == MFMailComposeResultSaved)
        NSLog(@"Mail has saved");
    
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark- 放大缩小显示
- (void)unMagnifyGridView{
    _state = UnMagnifying;
}
- (void)magnifyGridView:(CGPoint)location{

    //从屏幕坐标转换到世界坐标
    
    //step1.转换到projection坐标 x: -1~1 y:-1~1
    float x = (location.x - _projectView.frame.size.width * 0.5) / (_projectView.frame.size.width * 0.5);
    float y = -(location.y - _projectView.frame.size.height * 0.5) / (_projectView.frame.size.height * 0.5);
//    NSLog(@"projection space x:%.2f, y:%.2f", x, y);

    //求出射线于远裁减面的焦点，求出射线于地面的交点
    GLKVector4 projFarPos = GLKVector4Make(x*FarClipDistance, y*FarClipDistance, FarClipDistance, FarClipDistance);
    GLKVector4 worldFarPos = GLKMatrix4MultiplyVector4(_viewProjInverseMatrix, projFarPos);
    GLKVector3 eyeRay = GLKVector3Normalize(GLKVector3Subtract(GLKVector3Make(worldFarPos.x, worldFarPos.y, worldFarPos.z), _eyeTop));
    float k = -_eyeTop.y / eyeRay.y;
    GLKVector3 worldPos = GLKVector3Add(_eyeTop, GLKVector3MultiplyScalar(eyeRay, k));
//    NSLog(@"worldPos x:%.2f, y:%.2f z:%.2f", worldPos.x, worldPos.y, worldPos.z);
    
    if(worldPos.z > _projNear.z || worldPos.z < _projFar.z){
        return;
    }
    
    //找到在那块地面范围内
    if (useFeet)
    {
    }
    else
    {
        _magnifyCenter.x = floorf(worldPos.x) + 0.5;
        _magnifyCenter.z = ceilf(worldPos.z - _projNear.z) - 0.5 + _projNear.z ;
        
        float heightFovY = 1 * 0.5 / tanf(DEGREES_TO_RADIANS(HumanEyeFOV*0.5));
        float heightFovX = 1 * 0.5 / (tanf(DEGREES_TO_RADIANS(HumanEyeFOV*0.5)) * _projAspect);
        _eyeMagTop = GLKVector3Make(_magnifyCenter.x, MAX(heightFovX, heightFovY), _magnifyCenter.z);
        
    }
    NSLog(@"_magnifyCenter x:%.2f, y:%.2f z:%.2f", _magnifyCenter.x, _magnifyCenter.y, _magnifyCenter.z);
    NSLog(@"_eyeMagTop x:%.2f, y:%.2f z:%.2f", _eyeMagTop.x, _eyeMagTop.y, _eyeMagTop.z);    
    
    //准备开始放大动画
    _state = Magnifying;
}
#pragma mark- 手势
- (IBAction)handleTapPaintProjectViewGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded ) {
        if(_state == Magnified){
            [self unMagnifyGridView];
        }
        else if(_state == Projected){
            [self magnifyGridView:[sender locationInView:_projectView]];
        }

    }
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
////    NSLog(@"Debug: RealHeight: %.2f meters ScreenToRealScale: %.2f", realHeight, _kHeightScale);
//    [_projectView setContentScaleFactor:_kHeightScale];
//}
//

- (void)setupRealQuadParams{
    //投影视图视口比例    
    _projAspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
//    _projAspect = fabsf(_projectView.bounds.size.width / _projectView.bounds.size.height);
    NSLog(@"_aspect: %.2f", _projAspect);

    
    //顶视图视口比例
    _eyeTopAspect = fabsf(_projectView.bounds.size.width / _projectView.bounds.size.height);
    NSLog(@"_aspect: %.2f", _eyeTopAspect);
    
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
    
    
    //使用最远距离作为输入参数
    float fovYHalf = DEGREES_TO_RADIANS(HumanEyeFOV* 0.5) ;
    _projFar = GLKVector3Make(sinf(_paintViewAngleX) * _farDistance, 0, -cosf(_paintViewAngleX) * _farDistance);
    float angleFar = atan2f(_eye.y, _farDistance);
    float angleNear = angleFar + DEGREES_TO_RADIANS(HumanEyeFOV);
    float nearDistance = _eye.y / tanf(angleNear);
    _projNear = GLKVector3Make(sinf(_paintViewAngleX) * nearDistance, 0, -cosf(_paintViewAngleX) * nearDistance);
    _projCenter = GLKVector3Lerp(_projNear, _projFar, 0.5);
    float angleFocus = angleNear - DEGREES_TO_RADIANS(HumanEyeFOV * 0.5);
    float focusDistance = _eye.y / tanf(angleFocus);
    _projFocus = GLKVector3Make(sinf(_paintViewAngleX) * focusDistance, 0, -cosf(_paintViewAngleX) * focusDistance);
    
    //实际地面绘制长宽
    _projHeight = fabsf(_farDistance - nearDistance);
    float tanFovXHalf =tanf(fovYHalf) * _projAspect;
    _projWidth = _projHeight * tanFovXHalf * 2;
    
    
    NSLog(@"_projHeight:%.1f", _projHeight);
    NSLog(@"_projWith:%.1f", _projWidth);
    NSLog(@"_projFar x:%.1f y:%.1f z:%.1f", _projFar.x, _projFar.y, _projFar.z);
    NSLog(@"_projNear x:%.1f y:%.1f z:%.1f", _projNear.x, _projNear.y, _projNear.z);
    
}

- (void)setupPaintProjectParams{
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(_projWidth, 1, _projHeight);
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(_projCenter.x, _projCenter.y, _projCenter.z);
    GLKMatrix4 worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);
    GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(_eye.x, _eye.y, _eye.z, _projFocus.x, _projFocus.y, _projFocus.z, 0, 1, 0);
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(viewMatrix, worldMatrix);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(HumanEyeFOV), _projAspect, NearClipDistance, FarClipDistance);
    _paintMVPMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
}

- (void)setupLineParams{
    
    //计算视图顶部观察点
    float heightFovY = _projHeight * 0.5 / tanf(DEGREES_TO_RADIANS(HumanEyeFOV*0.5));
    float heightFovX = _projWidth * 0.5 / (tanf(DEGREES_TO_RADIANS(HumanEyeFOV*0.5)) * _projAspect);
    
    _eyeTop = GLKVector3Make(_projCenter.x, MAX(heightFovX, heightFovY), _projCenter.z);
    GLKVector3 up;
    if (_eyeT >= 1.0) {
        up = GLKVector3Normalize(GLKVector3Subtract(_projFar, _projNear));
    }
    else{
        up = GLKVector3Make(0, 1, 0);
    }
    
    GLKVector3 eye, center;
    if(_state == Magnifying)
    {
        eye = GLKVector3Lerp(_eyeTop, _eyeMagTop, _magnifyT);
        center = GLKVector3Lerp(_projCenter, _magnifyCenter, _magnifyT);
    }
    else if (_state == Magnified)
    {
        eye = _eyeMagTop;
        center = _magnifyCenter;
    }
    else if(_state == UnMagnifying)
    {
        eye = GLKVector3Lerp(_eyeMagTop, _eyeTop, _unMagnifyT);
        center = GLKVector3Lerp(_magnifyCenter, _projCenter, _unMagnifyT);
    }
    else if(_state == Projecting || _state == UnProjecting)
    {
        //当前观察点(在最佳观察点与顶部观察点之间lerp)
        eye = GLKVector3Lerp(_eye, _eyeTop, _eyeT);
        center = GLKVector3Lerp(_projFocus, _projCenter, _eyeT);
    }
    else if(_state == Projected)
    {
        eye = _eyeTop;
        center = _projCenter;
    }
    
    //计算绘制矩阵
    GLKMatrix4 worldMatrix = GLKMatrix4Identity;
    GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(viewMatrix, worldMatrix);
    
    self.effect.transform.modelviewMatrix = modelViewMatrix;
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(HumanEyeFOV), _projAspect, NearClipDistance, FarClipDistance);
    self.effect.transform.projectionMatrix = projectionMatrix;
}

- (void)setupTopViewParams{

    //计算视图顶部观察点
    float heightFovY = _projHeight * 0.5 / tanf(DEGREES_TO_RADIANS(HumanEyeFOV*0.5));
    float heightFovX = _projWidth * 0.5 / (tanf(DEGREES_TO_RADIANS(HumanEyeFOV*0.5)) * _projAspect);
    
    _eyeTop = GLKVector3Make(_projCenter.x, MAX(heightFovX, heightFovY), _projCenter.z);
    GLKVector3 up;
    if (_eyeT >= 1.0) {
        up = GLKVector3Normalize(GLKVector3Subtract(_projFar, _projNear));
        NSLog(@"up x:%.1f y:%.1f z:%.1f", up.x, up.y, up.z);
    }
    else{
        up = GLKVector3Make(0, 1, 0);
    }
    
    
    GLKVector3 eye, center;
    if(_state == Magnifying)
    {
        eye = GLKVector3Lerp(_eyeTop, _eyeMagTop, _magnifyT);
        center = GLKVector3Lerp(_projCenter, _magnifyCenter, _magnifyT);
    }
    else if (_state == Magnified)
    {
        eye = _eyeMagTop;
        center = _magnifyCenter;
    }
    else if(_state == UnMagnifying)
    {
        eye = GLKVector3Lerp(_eyeMagTop, _eyeTop, _unMagnifyT);
        center = GLKVector3Lerp(_magnifyCenter, _projCenter, _unMagnifyT);
    }
    else if(_state == Projecting || _state == UnProjecting)
    {
        //当前观察点(在最佳观察点与顶部观察点之间lerp)
        eye = GLKVector3Lerp(_eye, _eyeTop, _eyeT);
        center = GLKVector3Lerp(_projFocus, _projCenter, _eyeT);
    }
    else if(_state == Projected)
    {
        eye = _eyeTop;
        center = _projCenter;
    }

    
    //计算绘制矩阵
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(_projWidth, 1, _projHeight);
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(_projCenter.x, _projCenter.y, _projCenter.z);
    GLKMatrix4 worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);
    GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(viewMatrix, worldMatrix);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(HumanEyeFOV), _projAspect, NearClipDistance, FarClipDistance);
    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
    bool isInvertible = true;
    _viewProjInverseMatrix = GLKMatrix4Invert(GLKMatrix4Multiply(projectionMatrix, viewMatrix), &isInvertible);
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

- (BOOL) updateUnMagnifyPaintFinished:(float)timeDelta{
    _curUnMagnifyPaintAnimationTime += timeDelta;
    _unMagnifyT = _curUnMagnifyPaintAnimationTime / _unMagnifyPaintAnimDuration;
    _unMagnifyT = MIN(1, _unMagnifyT);
    
    return _unMagnifyT >= 1.0;
}

- (BOOL) updateMagnifyPaintFinished:(float)timeDelta{
    _curMagnifyPaintAnimationTime += timeDelta;
    _magnifyT = _curMagnifyPaintAnimationTime / _magnifyPaintAnimDuration;
    _magnifyT = MIN(1, _magnifyT);
    
    return _magnifyT >= 1.0;
}

#pragma mark- 绘图
- (void)glkViewControllerUpdate:(GLKViewController *)controller{
    //重新设置投影地面的参数
    if(_projDirty){
        [self loadRefLine];
        [self setupRealQuadParams];
        
        //计算绘图投影矩阵
        [self setupPaintProjectParams];

        //计算渲染矩阵
        [self setupTopViewParams];
        
        _projDirty = false;
    }

    float curMediaTime = CACurrentMediaTime();
    float timeDelta = curMediaTime - _lastMediaTime;
    
    if(_state == Projecting){
        _projDirty = true;
        if ([self updateProjectPaintFinished:timeDelta]) {
            _curProjectPaintAnimationTime = 0;
            _state = Projected;
            _projDirty = false;
        }
    }
    
    else if(_state == UnProjecting){
        _projDirty = true;
        if ([self updateUnprojectPaintFinished:timeDelta]) {
            _curUnprojectPaintAnimationTime = 0;
            _state = Normal;
            _projDirty = false;            
            [self dismissViewControllerAnimated:true completion:^{
            }];
        }
    }
    
    else if(_state == Magnifying){
        _projDirty = true;        
        if ([self updateMagnifyPaintFinished:timeDelta]) {
            _curMagnifyPaintAnimationTime = 0;
            _state = Magnified;
            _projDirty = false;            
        }
    }
    
    else if(_state == UnMagnifying){
        _projDirty = true;
        if ([self updateUnMagnifyPaintFinished:timeDelta]) {
            _curUnMagnifyPaintAnimationTime = 0;
            _state = Projected;
            _projDirty = false;
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
- (void)drawGrid{
    [self.effect prepareToDraw];
    
    glBindVertexArrayOES(_vertexLineArray);
    
    [self setupLineParams];
    //    glUniformMatrix4fv(_modelViewProjMatrixUniform, 1, 0, _lineMVPMatrix.m);
    
    //    glDrawArrays(GL_LINES, 0, 4);
    glDrawArrays(GL_LINES, 0, _count);
    
}
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [EAGLContext setCurrentContext:_context];
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _finalRenderbuffer);
    //偏移数值公式未验证
    float offset = -(self.view.frame.size.height - view.frame.size.height) * 0.5;
    glViewport(0, offset, self.view.frame.size.width, self.view.frame.size.height);
    glClearColor(0.5f, 0.6f, 0.7f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    //使用投影Shader技术绘制地面
    [self drawPaint];

    //绘制参考线
    
    //使用ShaderLine技术绘制地面
    if (_showGrid) {
        [self drawGrid];
    }
    [_context presentRenderbuffer:GL_RENDERBUFFER_OES];
}


#pragma mark- Opengles Shader相关
- (void)setupGL {
    //init states
    [EAGLContext setCurrentContext:_context];
//    glEnable(GL_DEPTH_TEST);

    self.effect = [[GLKBaseEffect alloc] init];    
//    [self loadLineShaders];
    
    [self loadProjectShaders];

    [self loadRefLine];
    
    [self loadQuadModel];
}

- (void)tearDownGL {
    
    [EAGLContext setCurrentContext:self.context];
    
    glDeleteBuffers(1, &_vertexBuffer);
    
    glDeleteBuffers(1, &_vertexLineBuffer);
    
    glDeleteVertexArraysOES(1, &_vertexArray);
    
    glDeleteVertexArraysOES(1, &_vertexLineArray);
    
    self.effect = nil;

    _programProject = 0;
    
}

- (BOOL)loadRefLine{
    if (!glIsVertexArrayOES(_vertexLineArray)) {
        glGenVertexArraysOES(1, &_vertexLineArray);
    }
    glBindVertexArrayOES(_vertexLineArray);

    if (!glIsBuffer(_vertexLineBuffer)) {
        glGenBuffers(1, &_vertexLineBuffer);
    }
    glBindBuffer(GL_ARRAY_BUFFER, _vertexLineBuffer);
    
    //根据公尺还是英尺来决定数量
    float measureScale = 1;
    if (useFeet) {
        _widthCount = floorf(_projWidth*InchScale) + 1;
        _heightCount = floorf(_projHeight*InchScale) + 1;
        measureScale = 1.0 / (float)InchScale;
    }
    else{
        _widthCount = floorf(_projWidth) + 1;
        _heightCount = floorf(_projHeight) + 1;
    }
//    NSLog(@"_widthCount:%d  _heightCount:%d", _widthCount, _heightCount);
    _count = (_widthCount + _heightCount)*2;

    if (_vertexLineData != NULL) {
        free(_vertexLineData);
    }

    _vertexLineData = malloc(_count * sizeof(LineVertex));
    //横线
    for (int i = 0; i < _heightCount; ++i) {
        _vertexLineData[i*2].Position[0] = -_widthCount * 0.5;
        _vertexLineData[i*2].Position[1] = 0;
        _vertexLineData[i*2].Position[2] = _projNear.z - i * measureScale;
        
        _vertexLineData[i*2+1].Position[0] = _widthCount * 0.5;
        _vertexLineData[i*2+1].Position[1] = 0;
        _vertexLineData[i*2+1].Position[2] = _projNear.z - i * measureScale;
    }
    //纵线    
    for (int i = 0; i < _widthCount; ++i) {
        _vertexLineData[_heightCount*2 + i*2].Position[0] = (i - floorf(_widthCount* 0.5)) * measureScale;
        _vertexLineData[_heightCount*2 + i*2].Position[1] = 0;
        _vertexLineData[_heightCount*2 + i*2].Position[2] = _projNear.z;
        
        _vertexLineData[_heightCount*2 + i*2+1].Position[0] = (i - floorf(_widthCount* 0.5)) * measureScale;
        _vertexLineData[_heightCount*2 + i*2+1].Position[1] = 0;
        _vertexLineData[_heightCount*2 + i*2+1].Position[2] = _projFar.z;
    }
    

    glBufferData(GL_ARRAY_BUFFER, sizeof(LineVertex)*_count, _vertexLineData, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(LineVertex), BUFFER_OFFSET(0));
    
    glBindVertexArrayOES(0);
    
    return YES;
}

- (BOOL)loadQuadModel{
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
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderPaintProject" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderPaintProject" ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader");
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
    if (![ShaderUltility linkProgram:_programProject]) {
        NSLog(@"Failed to link program: %d", _programProject);
        
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
    checkGL
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

- (BOOL)loadLineShaders
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programLine = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderLine" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderLine" ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programLine, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programLine, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programLine, GLKVertexAttribPosition, "position");
    
    // Link program.
    if (![ShaderUltility linkProgram:_programLine]) {
        NSLog(@"Failed to link program: %d", _programLine);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programLine) {
            glDeleteProgram(_programLine);
            _programLine = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _modelViewProjMatrixUniform = glGetUniformLocation(_programLine, "modelViewProjectionMatrix");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programLine, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programLine, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;
}

- (void)viewDidUnload {
    [self setProjectSlider:nil];

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
