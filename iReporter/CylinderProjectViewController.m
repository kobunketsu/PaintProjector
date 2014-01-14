//
//  CylinderProjectViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-21.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CylinderProjectViewController.h"
#import "PaintScreen.h"
#import "Ultility.h"

#define PaintFrameViewWidth 210
#define PaintFrameViewHeight 280

float cylinderProjectQuadVertexData[] =
{
    0.5f, 0, -0.5f,          1.0f, 0.0f,    //0
    -0.5f,0, -0.5f,          0.0f, 0.0f,    //1
//    0.5f, 0, 0.5f,         1.0f, 0.0f,      //2
    0.5f, 0, 0.5f,        1.0f, 1.0f,       //2
//    -0.5f,0, -0.5f,         0.0f, 1.0f,     //1
    -0.5f,0, 0.5f,        0.0f, 1.0f,       //3
};

GLushort cylinderProjectQuadVertexIndices[] =
{
    0, 1, 2, 2, 1, 3,
};
@interface CylinderProjectViewController ()

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
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
//        if (!self.context) {
//            DebugLog(@"Failed to create ES context");
//        }
        
        //根据ipad2的尺寸进行设定
        self.radius = 0.019;
        self.eye = GLKVector3Make(0, 0.4, -0.35);//(0, 0.3, -0.2625);
        self.eyeBottomTopBlend = 0.0;
        
        //设定虚拟平面
        self.imageWidth = 0.037;
        self.imageRatio = 1.3;
        self.imageCenterOnSurfHeight = 0.035;

        //创建辅助网格
//        self.grid = [[Grid alloc]init];
//        self.grid.rowCount = 10;
//        self.grid.columnCount = 10;
        
        //创建圆柱体
        self.cylinder = [[Cylinder alloc]init];
        self.cylinder.sides = 60;
        self.cylinder.radius = self.radius;
        self.cylinder.height = 0.06;
        
        self.toRotateImageAxisY = 0;
        self.rotationImageAxisY = 0;
        
        //    _projDirty = true;
        
        //显示
        self.showGrid = true;
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLog(@"[ viewWillAppear ]");
    //用于解决启动闪黑屏的问题
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"launchImage.png"]];
    
    [EAGLContext setCurrentContext:self.context];
}

- (void)viewDidAppear:(BOOL)animated{
    DebugLog(@"[ viewDidAppear ]");
    //screenmask遮罩问题
    self.screenMask.hidden = false;
    

}

-(void)viewWillDisappear:(BOOL)animated{
    DebugLog(@"[ viewWillDisappear ]");
}

-(void)viewDidDisappear:(BOOL)animated{
    DebugLog(@"[ viewDidDisappear ]");
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
//    [self.delegate createCylinderProjectEAGleContext:self];
    self.context = [self createBestEAGLContext];
    [self.context setDebugLabel:@"CylinderProjectView Context"];
    
    self.projectView.context = self.context;
    self.projectView.delegate = self;
    
    self.texMgr = [[TextureManager alloc]init];

    //设置状态
    self.state = CP_Projected;
    self.morphBlend = 0;
    self.alphaBlend = 0;
    self.projectAnimDuration = 1.0;
    self.curProjectAnimationTime = 0;
    self.unprojectAnimDuration = 0.3;
    self.curUnprojectAnimationTime = 0;
    self.viewBottomAnimDuration = 1.0;
    self.viewTopAnimDuration = 1.0;
    self.curViewTopAnimationTime = 0;
    self.curViewBottomAnimationTime = 0;
    self.lastMediaTime = CACurrentMediaTime();
    
    //设置描画相关参数
    [self updateImageInCylinder];
    
    [self updateProjectedQuadParams];
    
    [self updateRenderViewParams];
    
    [self setupGL];

    [self loadLogoWithAnimation:false];
    
//    [self anamorphicCurPaintFrameView];
//    [self anamorphVideo];
    
    //界面
    [self switchDownToolBarFrom:self.toolBar completion:nil to:self.categoryBar completion:nil];
    
//    [self flushAllUI];

    //交换长宽
    float width = self.paintFrameTableView.bounds.size.height;
    float height = self.paintFrameTableView.bounds.size.width;
    self.paintFrameTableView.bounds = CGRectMake(0, 0, width, height);
    self.paintFrameTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    
    //设置当前PaintFrameGroup PaintFrame
    [self setCurPaintFrameGroupByIndex:0];
    
    //关闭水平监测，查内存持续增长问题
    [self initMotionDetect];
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
-(void)insertNewPaintDocAtCurIndex{
    PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:self.curPaintFrameGroup.dirPath];
    [self insertPaintDocAtCurIndex:paintDoc];
}

-(void)insertCopyPaintDocAtCurIndex:(PaintDoc*)paintDoc{
    PaintDoc *newPaintDoc = [[PaintDocManager sharedInstance] clonePaintDoc:paintDoc];
    [self insertPaintDocAtCurIndex:newPaintDoc];
}

-(PaintDoc*)insertPaintDocAtCurIndex:(PaintDoc*)paintDoc{
    self.curPaintFrameGroup.curPaintIndex ++;
    [self.curPaintFrameGroup.paintDocs insertObject:paintDoc atIndex:self.curPaintFrameGroup.curPaintIndex];
    return paintDoc;
}

-(void)openPaintFrame:(PaintFrameView*)paintFrameView {
    if (self.paintScreenViewController == NULL) {
        self.paintScreenViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintScreen"];
        self.delegate = self.paintScreenViewController;
        self.paintScreenViewController.delegate = self;
    }
    
    //打开绘图面板动画，从cylinder的中心放大过度到paintScreenViewController
    DebugLog(@"presentViewController start");
    [self presentViewController:self.paintScreenViewController animated:true completion:^{
        DebugLog(@"presentViewController completed");
        [_delegate openDoc:paintFrameView.paintDoc];
    }];
}

- (IBAction)paintButtonTouchUp:(UIButton *)sender {
    [self openPaintFrame:self.curPaintFrameView];    
}

- (IBAction)addButtonTouchUp:(UIButton *)sender {
    //完成操作前不可交互
//    sender.userInteractionEnabled = false;
    
    //从内存添加，插入新paintDoc到paintDocs中，
    [self insertNewPaintDocAtCurIndex];
    
    //插入新表单到表格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.paintFrameTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    [self tableView:self.paintFrameTableView didSelectRowAtIndexPath:indexPath];
    
    //放大画框开始绘制
    [self openPaintFrame:self.curPaintFrameView];
}

- (IBAction)copyButtonTouchUp:(UIButton *)sender {
    //插入拷贝paintDoc到paintDocs中，
    if (self.curPaintFrameView.paintDoc == nil) {
        DebugLog(@"No PaintDoc to copy!");
        return;
    }
    
    //从磁盘拷贝
    [self insertCopyPaintDocAtCurIndex:self.curPaintFrameView.paintDoc];
    
    //插入新表单到表格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.paintFrameTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    [self tableView:self.paintFrameTableView didSelectRowAtIndexPath:indexPath];
    
    //放大画框开始绘制
    [self openPaintFrame:self.curPaintFrameView];
}

- (IBAction)deleteButtonTouchUp:(UIButton *)sender {
    //TODO:从磁盘删除
    [[PaintDocManager sharedInstance] deletePaintDoc:self.curPaintFrameView.paintDoc];
    
    //从内存删除
    [self.curPaintFrameGroup.paintDocs removeObjectAtIndex:self.curPaintFrameGroup.curPaintIndex];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
    [self.paintFrameTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    if (self.curPaintFrameGroup.curPaintIndex == self.curPaintFrameGroup.paintDocs.count) {
        self.curPaintFrameGroup.curPaintIndex--;
    }
    
    [self.paintFrameTableView reloadData];
    
//    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
//    [self tableView:self.paintFrameTableView didSelectRowAtIndexPath:newIndexPath];
}

- (IBAction)categoryButtonTouchUp:(UIButton *)sender {
    [self reloadLogo];
    
    [self closePaintFrameViewsWithAnimation];

    [self switchDownToolBarFrom:self.toolBar completion:nil to:self.categoryBar completion:^{
    }];
}

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
- (IBAction)printButtonTouchUp:(UIButton *)sender {
    [self exportToAirPrint];
}

//设置当前用于显示的组(Document下的子目录)
- (void)setCurPaintFrameGroupByIndex:(int)groupIndex{
    PaintFrameViewGroup* paintFrameGroup = [[PaintFrameViewGroup alloc]initWithCapacity:1];
    paintFrameGroup.name = [NSString stringWithFormat:@"PaintFrameGroup_%d", groupIndex];
    paintFrameGroup.dirPath = [[PaintDocManager sharedInstance]directoryPath:groupIndex];
    //加载指定子目录下的PaintDoc
    paintFrameGroup.paintDocs = [[PaintDocManager sharedInstance]loadPaintDocsInDirectoryIndex:groupIndex];
    //设置当前画框源
    //如果paintFrameGroup下的数据源paintDocs为空，
    if (paintFrameGroup.paintDocs.count == 0) {
        paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = -1;
    }
    else{
        //        paintFrameGroup.curPaintFrame = self.curPaintFrameView;
        paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = 0;
    }
    self.curPaintFrameGroup = paintFrameGroup;
}

//打开画框显示
- (void)closePaintFrameViewsWithAnimation{
    DebugLog(@"closePaintFrameViewsWithAnimation visibleCells count %d", self.paintFrameTableView.visibleCells.count);
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.paintFrameTableView.alpha = 0;
        for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
            UIView *view = [cell.contentView.subviews objectAtIndex:0];
            view.frame = CGRectMake(view.frame.origin.x + view.frame.size.width * 0.5, view.frame.origin.y, 0, view.frame.size.height);
        }
        
    }completion:^(BOOL finished){
        self.paintFrameTableView.hidden = true;
    }];
}

- (void)openPaintFrameViewsWithAnimation{
    self.paintFrameTableView.hidden = false;
    [self.paintFrameTableView reloadData];

//    DebugLog(@"openPaintFrameViewsWithAnimation visibleCells count %d", self.paintFrameTableView.visibleCells.count);
    for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
//        DebugLog(@"openPaintFrameViewsWithAnimation PaintFrameTableView Cell %@", cell);
        UIView *view = [cell.contentView.subviews objectAtIndex:0];
        view.bounds = CGRectMake(0, 0, 0, PaintFrameViewHeight);
    }

    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.paintFrameTableView.alpha = 1;
        for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
//            DebugLog(@"openPaintFrameViewsWithAnimation PaintFrameTableView Cell After Anim %@", cell);
            UIView *view = [cell.contentView.subviews objectAtIndex:0];
            view.bounds = CGRectMake(0, 0, PaintFrameViewWidth, PaintFrameViewHeight);
        }
        
    }completion:^(BOOL finished){
        
    }];
}

- (IBAction)appCollectionButtonTouchUp:(UIButton *)sender {
    [self setCurPaintFrameGroupByIndex:0];
    
    [self openPaintFrameViewsWithAnimation];
    
    self.paintButton.hidden = true;
    [self switchDownToolBarFrom:self.categoryBar completion:nil to:self.toolBar completion:^{

    }];
}

- (IBAction)myArtworkButtonTouchUp:(UIButton *)sender {
    [self setCurPaintFrameGroupByIndex:1];
    
    [self openPaintFrameViewsWithAnimation];
    
    self.paintButton.hidden = true;
    [self switchDownToolBarFrom:self.categoryBar completion:nil to:self.toolBar completion:^{

    }];
    
}

- (IBAction)worldCollectionButtonTouchUp:(UIButton *)sender {
}

- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:^{
    }];
}

- (void)rotateViewInAxisX:(float)percent{
    self.eyeBottomTopBlend = MIN(1, MAX(0, self.toEyeBottomTopBlend + percent));
}

- (void)rotateImageInCylinder:(float)angle{
    self.rotationImageAxisY = self.toRotateImageAxisY + angle;
}
- (IBAction)handlePanCylinderProjectView:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.toRotateImageAxisY = self.rotationImageAxisY;
            self.toEyeBottomTopBlend = self.eyeBottomTopBlend;
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [sender translationInView:sender.view];
            if (self.state == CP_Paint) {
                if (fabsf(translation.x) - fabsf(translation.y) > 5) {
                    self.state = CP_RotateViewAxisX;
                }
                else if(fabsf(translation.y) - fabsf(translation.x) < 5){
                    self.state = CP_RotateImage;
                }
            }
            else if (self.state == CP_RotateViewAxisX){
                float percent = (translation.x / sender.view.bounds.size.width);
                [self rotateViewInAxisX:percent];
            }
            else if (self.state == CP_RotateImage){
                float angle = (translation.y / sender.view.bounds.size.height) * M_PI;
                [self rotateImageInCylinder:angle];
            }
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
- (void)updateImageInCylinder{
    
    //限制眼睛取值范围
    float eyeZ = MIN(self.eye.z, -self.radius);
    self.eye = GLKVector3Make(self.eye.x, self.eye.y, eyeZ);
    
    float dist = sqrtf( self.eye.x * self.eye.x + self.eye.z * self.eye.z);
    float cosEyeXZ =  self.eye.x / dist;
    
    //setup image width and image height
    self.imageWidth = MAX(0, MIN(self.imageWidth, self.radius * 2));
    self.imageHeight = self.imageWidth * self.imageRatio;
    
    //cylinder  x*x + z*z = r*r; --> x*x + pow((x*tan), 2)
    float rayOnSurfX = cosEyeXZ * self.radius;
    float rayOnSurfZ = - sinf(acosf(cosEyeXZ)) * self.radius;
    
    //1.find image center on the cylinder surface
    self.imageCenterOnSurf = GLKVector3Make(rayOnSurfX, self.imageCenterOnSurfHeight, rayOnSurfZ);
    
    //2.find image center on the flow in the cylinder y axis
    GLKVector3 vEyeToImageCenter = GLKVector3Subtract(self.imageCenterOnSurf, self.eye);
    GLKVector3 vEyeToImageCenterNormalized = GLKVector3Normalize(vEyeToImageCenter);
    float imageCenterY = (self.radius * self.eye.y + self.eye.z * self.imageCenterOnSurf.y) / (self.eye.z + self.radius);
    GLKVector3 imageCenter = GLKVector3Make(0, imageCenterY, 0);
    
    //3.find four corners for image
    GLKVector3 vRight = GLKVector3Make(vEyeToImageCenterNormalized.z, 0, -vEyeToImageCenterNormalized.x);
    vRight = GLKVector3Normalize(vRight);
    GLKVector3 vUp = GLKVector3CrossProduct(vEyeToImageCenterNormalized, vRight);
    
    //adjust
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(self.imageWidth, 0, self.imageHeight);

    float radian =  acosf(GLKVector3DotProduct(GLKVector3Make(0, 1, 0), GLKVector3MultiplyScalar( vEyeToImageCenterNormalized, -1.0f)));
    GLKMatrix4 rotateMatrix = GLKMatrix4MakeRotation(radian, 1, 0, 0);
    GLKMatrix4 rotateAxisYMatrix = GLKMatrix4MakeRotation(-M_PI, vUp.x, vUp.y, vUp.z);
//    rotateMatrix = GLKMatrix4RotateWithVector3(rotateMatrix, self.rotationImageAxisY, vUp);
    
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(imageCenter.x, imageCenter.y, imageCenter.z);
    
    self.worldMatrix = GLKMatrix4Multiply(translateMatrix, GLKMatrix4Multiply(rotateMatrix, GLKMatrix4Multiply(rotateAxisYMatrix, scaleMatrix)));

}


- (void)updateProjectedQuadParams{
    //投影视图视口比例
    self.projSrcAspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
//    DebugLog(@"_aspect: %.2f", _projSrcAspect);
    
    //顶视图视口比例
    self.eyeTopAspect = fabsf(self.projectView.bounds.size.width / self.projectView.bounds.size.height);
//    DebugLog(@"_eyeTopAspect: %.2f", _eyeTopAspect);
    
    
//    //使用最远距离,最近距离作为输入参数
//    float angleFar = atan2f(_eye.y, self.farDistance);
//    float angleNear = atan2f(_eye.y, self.nearDistance);
//    self.fovY = (angleNear - angleFar);
//    float fovYHalf = self.fovY * 0.5;
   
    self.projNear = GLKVector3Make(0, 0, 1);
    self.projFar = GLKVector3Make(0, 0, -6);
    self.projCenter = GLKVector3Lerp(self.projNear, self.projFar, 0.5);
    
//    float angleFocus = angleNear - fovYHalf;
//    float focusDistance = _eye.y / tanf(angleFocus);
//    _projFocus = GLKVector3Make(sinf(_paintViewAngleX) * focusDistance, 0, -cosf(_paintViewAngleX) * focusDistance);
    
    //实际地面绘制长宽
    self.projHeight = self.projNear.z - self.projFar.z;
    self.projWidth = 10;
 
    //    DebugLog(@"_projHeight:%.1f", _projHeight);
    //    DebugLog(@"_projWith:%.1f", _projWidth);
    //    DebugLog(@"_projFar x:%.1f y:%.1f z:%.1f", _projFar.x, _projFar.y, _projFar.z);
    //    DebugLog(@"_projNear x:%.1f y:%.1f z:%.1f", _projNear.x, _projNear.y, _projNear.z);
    
    //update UI
//    self.fovYLabel.text = [NSString stringWithFormat:@"FOV: %.1f D", RADIANS_TO_DEGREES(self.fovY)];
//    self.projWidthLabel.text = [NSString stringWithFormat:@"Width: %.1f M", _projWidth];
//    self.projHeightLabel.text = [NSString stringWithFormat:@"Depth: %.1f M", _projHeight];
}

- (void)updateRenderViewParams{
//    DebugLog(@"[   setupTopViewParams  ]");
    
    //计算视图顶部观察点
//    float fovY = DEGREES_TO_RADIANS(45);
//    float heightFovY = self.projHeight * 0.5 / tanf(fovY * 0.5);
//    float heightFovX = self.projWidth * 0.5 / (tanf(fovY * 0.5) * self.projSrcAspect);
    
//    self.eyeTop = GLKVector3Make(self.projCenter.x, MAX(heightFovX, heightFovY), self.projCenter.z);
    self.eyeTop = GLKVector3Make(0.0, -self.eye.z, -0.065);
    self.eyeBottom = self.eye;
    
    GLKVector3 up;
    if (self.eyeBottomTopBlend >= 1.0) {
//        up = GLKVector3Normalize(GLKVector3Subtract(self.projFar, self.projNear));
        //设备在宽屏模式下效果更佳
        up = GLKVector3Make(0, 0, 1);
        
    }
    else{
        up = GLKVector3Make(0, 0, 1);
    }
    
    //    DebugLog(@"up x:%.1f y:%.1f z:%.1f", up.x, up.y, up.z);
    
    GLKVector3 eye, center;
    float orthorWidth, orthorHeight;
    
//    float orthorWidth = self.projWidth;
//    float orthorHeight = self.projHeight;
//    if(_state == ZoomIn)
//    {
//        //        DebugLog(@"Magnifying _magnifyT %.2f", _magnifyT);
//        eye = GLKVector3Lerp(_eyeTop, _eyeZoomInTop, _zoomInT);
//        center = GLKVector3Lerp(_projCenter, _zoomInCenter, _zoomInT);
//        orthorWidth = _projWidth * (1 - _zoomInT) + self.gridRealSize * _zoomInT;
//        orthorHeight = _projHeight * (1 - _zoomInT) + self.gridRealSize * _zoomInT;
//    }
//    else if (_state == Zoomed)
//    {
//        //        DebugLog(@"Zoomed _magnifyT %.2f", _magnifyT);
//        eye = _eyeZoomInTop;
//        center = _zoomInCenter;
//        orthorWidth = self.gridRealSize;
//        orthorHeight = self.gridRealSize;
//        
//    }
//    else if(_state == ZoomOut)
//    {
//        //        DebugLog(@"ZoomOut _unMagnifyT %.2f", _unMagnifyT);
//        eye = GLKVector3Lerp(_eyeZoomInTop, _eyeTop, _zoomOutT);
//        center = GLKVector3Lerp(_zoomInCenter, _projCenter, _zoomOutT);
//        orthorWidth =  self.gridRealSize * (1 - _zoomOutT) + _projWidth * _zoomOutT;
//        orthorHeight =  self.gridRealSize * (1 - _zoomOutT) + _projHeight * _zoomOutT;
//    }
//    else if(_state == Projecting || _state == UnProjecting)
//    {
//        //当前观察点(在最佳观察点与顶部观察点之间lerp)
//        eye = GLKVector3Lerp(_eye, _eyeTop, _eyeT);
//        center = GLKVector3Lerp(_projFocus, _projCenter, _eyeT);
//    }
//    if(_state == CP_Projected)
//    {
//        eye = self.eyeTop;
//        center = self.projCenter;
//        orthorWidth = self.projWidth;
//        orthorHeight = self.projHeight;
//        
//    }


    
    //计算绘制图片的矩阵
//    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(self.projWidth, 1, self.projHeight);
//    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(self.projCenter.x, self.projCenter.y, self.projCenter.z);
//    GLKMatrix4 worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);

    //test
    eye = GLKVector3Lerp(self.eyeBottom, self.eyeTop, self.eyeBottomTopBlend);
    center = GLKVector3Make(0.0, 0, self.eyeTop.z);
    
    //如果中心点反向，则up向量反向
    if (center.z >= 0) {
        up.z *= -1;
    }
    //    DebugLog(@"eye x:%.1f y:%.1f z:%.1f", eye.x, eye.y, eye.z);
    //    DebugLog(@"center x:%.1f y:%.1f z:%.1f", center.x, center.y, center.z);
    
    GLKMatrix4 viewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, center.x, center.y, center.z, up.x, up.y, up.z);
    GLKMatrix4 reflViewMatrix  = GLKMatrix4MakeLookAt(self.eyeTop.x, self.eyeTop.y, self.eyeTop.z, center.x, center.y, center.z, up.x, up.y, up.z);
    
    //test
    orthorWidth = DeviceWidth;
    orthorHeight = orthorWidth / (self.view.bounds.size.width / self.view.bounds.size.height);
    //改为正交矩阵
//    DebugLog(@"projectionMatrix left %.1f right %.1f bottom %.1f top %.1f", -orthorWidth * 0.5, orthorWidth * 0.5, -orthorHeight * 0.5, orthorHeight * 0.5);
    GLKMatrix4 projectionOrthoMatrix = GLKMatrix4MakeOrtho(-orthorWidth * 0.5, orthorWidth * 0.5, -orthorHeight * 0.5, orthorHeight * 0.5,  NearClipDistance, FarClipDistance);
    
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(29), self.eyeTopAspect, NearClipDistance, FarClipDistance);
    
//    self.wvpMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);
//    self.worldMatrix = worldMatrix;    
    self.viewProjMatrix = GLKMatrix4Multiply(projectionMatrix, viewMatrix);
    self.viewProjOrthoMatrix = GLKMatrix4Multiply(projectionOrthoMatrix, viewMatrix);
    self.perspectiveToOrthoBlend = self.eyeBottomTopBlend;
    self.viewProjMatrix = [Ultility MatrixLerpFrom:self.viewProjMatrix to:self.viewProjOrthoMatrix blend:self.eyeBottomTopBlend];
//    DebugLog(@"eyeTopBottomBlend %.1f", self.eyeTopBottomBlend);
    self.reflViewProjMatrix = GLKMatrix4Multiply(projectionMatrix, reflViewMatrix);
    

//    bool isInvertible = true;
//    _viewProjInverseMatrix = GLKMatrix4Invert(GLKMatrix4Multiply(projectionMatrix, viewMatrix), &isInvertible);
    
    
    //通过modelViewProjection 将单位1的向量转换到projection space(-1, 1),在通过屏幕viewport，得到实际1米 * measureScale在屏幕上的Size大小
//    if (_state == Projected) {
//        GLKVector4 unitVec = GLKVector4Make(1.0 * self.measureScale, 0, 0, 1);//worldMatrix Identity
//        GLKVector4 unitHVec = GLKMatrix4MultiplyVector4(projectionMatrix, GLKMatrix4MultiplyVector4(viewMatrix, unitVec));
//        GLKVector4 unitScreenVec = GLKVector4Make(unitHVec.x / unitHVec.w, unitHVec.y / unitHVec.w, unitHVec.z / unitHVec.w, unitHVec.w / unitHVec.w);
//        //        DebugLog(@"unitScreenVec x:%.2f y:%.2f z:%.2f w:%.2f", unitScreenVec.x, unitScreenVec.y, unitScreenVec.z, unitScreenVec.w);
//        self.gridPointSize = (unitScreenVec.x * 0.5) * self.view.bounds.size.width;
//        if (useFeet) {
//            self.gridPointSize = self.gridPointSize * self.measureScale;
//        }
//        //        DebugLog(@"gridPointSize %.2f", self.gridPointSize);
//    }
    
    
    //更新Matrix
    GLKVector4 reflectionTexUVSpace = GLKVector4Make(-orthorWidth * 0.5, -orthorHeight * 0.5 - 0.07, orthorWidth, orthorHeight);
    [self.cylinder updateMatrixView:viewMatrix projection:projectionMatrix projectionOrtho:projectionOrthoMatrix perspectiveOrthoBlend:self.perspectiveToOrthoBlend eye:eye reflectionTexUVSpace:reflectionTexUVSpace];
//    [self.grid updateMatrixView:viewMatrix projection:projectionMatrix];
}
#pragma mark- 更新
-(void) updateParamsForDraw{
    [self updateImageInCylinder];
    
    //计算投影长宽等参数
    [self updateProjectedQuadParams];
    
    //计算渲染矩阵
    [self updateRenderViewParams];
    
//    [self readNextMovieFrame];

}

- (void)glkViewControllerUpdate:(GLKViewController *)controller{
    //更新动画状态
    float curMediaTime = CACurrentMediaTime();
    float timeDelta = curMediaTime - self.lastMediaTime;
    
    //重新设置投影地面的参数
    [self updateParamsForDraw];

    //动画中禁止所有交互操作
    if(self.state == CP_Projecting){
        //start to project
        if ([self updateProjectFinished:timeDelta]) {
            self.curProjectAnimationTime = 0;
            self.state = CP_Projected;
            
            //run completion block
            [self allViewUserInteractionEnable:true];
        }

    }
    else if(self.state == CP_UnProjecting){
        if ([self updateUnprojectFinished:timeDelta]) {
            self.curUnprojectAnimationTime = 0;
            self.state = CP_Paint;
            
            //run completion block
            if (_unprojectCompletionBlock) {
                _unprojectCompletionBlock();
            }

        }

    }
    else if(self.state == CP_PitchingToTopView){
        if ([self updateViewTopFinished:timeDelta]) {
            self.curViewTopAnimationTime = 0;
            self.state = CP_Projected;
            //run completion block
//            [self allViewUserInteractionEnable:true];
        }

    }
    else if(self.state == CP_PitchingToBottomView){
        if ([self updateViewBottomFinished:timeDelta]) {
            self.curViewBottomAnimationTime = 0;
            self.state = CP_Projected;
            //run completion block
//            [self allViewUserInteractionEnable:true];
        }
    }
    else {
    }
    
    self.lastMediaTime = curMediaTime;
    
//    DebugLog(@"self.curPaintFrameView.frame %@", self.curPaintFrameView);

}
#pragma mark- 绘图
- (void)drawReflectionView:(GLKView *)view{
    //使用投影Shader技术绘制地面
#if DEBUG
    glPushGroupMarkerEXT(0, "drawReflection");
#endif
    glClearColor(0.0, 0.0, 0.0, 1.0f);
    [self.glWrapper bindFramebufferOES:_reflectionFramebuffer discardHint:true clear:true];
    glViewport(0, 0, view.bounds.size.height, view.bounds.size.height);
    //清背景
    
    glUseProgram(_programProject);
    glUniform1i(_paintTextureUniform, 0);
    glUniformMatrix4fv(_viewProjMatrixUniform, 1, 0, self.reflViewProjMatrix.m);
    glUniformMatrix4fv(_worldMatrixUniform, 1, 0, self.worldMatrix.m);
    glUniform3f(_eyeUniform, self.eye.x, self.eye.y, self.eye.z);
    glUniform1f(_radiusUniform, self.radius);
    glUniform1f(_morphBlendUniform, self.morphBlend);
    glUniform1f(_alphaBlendUniform, self.alphaBlend);
    
    //绘制投影地面
    [self.glWrapper bindVertexArrayOES:_vertexArray];
    
    [self.glWrapper activeTexSlot:GL_TEXTURE0 bindTexture:_paintTexture];
    
    glDrawElements(GL_TRIANGLES, self.meshRow * self.meshColumn * 2 * 3, GL_UNSIGNED_SHORT, 0);
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)drawOffScreenView:(GLKView *)view{
    [self prepareDrawOffScreen:view];
    
    [self drawAnamorphicImage];
    
    [self.cylinder draw];
    
    //绘制参考线
    if (self.showGrid) {
//        [self.grid draw];
    }
}
- (void)prepareDrawOffScreen:(GLKView *)view{
#if DEBUG
    glPushGroupMarkerEXT(0, "beforeDraw");
#endif
    [self.projectView bindDrawable];
    self.glWrapper.lastFramebuffer = 2;//? what is screen renderbuffer
    glClearColor(90.0/255.0, 230.0 / 255.0, 71.0 / 255.0, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)drawAnamorphicImage{
#if DEBUG
    glPushGroupMarkerEXT(0, "Draw Anamorphic Image");
#endif
    glUseProgram(_programProject);
    glUniform1i(_paintTextureUniform, 0);
    glUniformMatrix4fv(_viewProjMatrixUniform, 1, 0, self.viewProjMatrix.m);
    glUniformMatrix4fv(_worldMatrixUniform, 1, 0, self.worldMatrix.m);
    glUniform3f(_eyeUniform, self.eye.x, self.eye.y, self.eye.z);
    glUniform1f(_radiusUniform, self.radius);
    glUniform1f(_morphBlendUniform, self.morphBlend);
    glUniform1f(_alphaBlendUniform, self.alphaBlend);
    
    //绘制投影地面
    [self.glWrapper bindVertexArrayOES:_vertexArray];
    
    [self.glWrapper activeTexSlot:GL_TEXTURE0 bindTexture:_paintTexture];
    
    glDrawElements(GL_TRIANGLES, self.meshRow * self.meshColumn * 2 * 3, GL_UNSIGNED_SHORT, 0);
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    //将反射绘制到render target中，用于采样
        [self drawReflectionView:view];
    
        [self drawOffScreenView:view];
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

-(void)deleteReflectionFramebuffer{
    RELEASE_FRAMEBUFFER(_reflectionFramebuffer)

    RELEASE_TEXTURE(_reflectionTex)
}

- (BOOL)createRefelctionFramebuffer{
    //创建frame buffer
    glGenFramebuffersOES(1, &_reflectionFramebuffer);
    [self.glWrapper bindFramebufferOES:_reflectionFramebuffer discardHint:false clear:false];
#if DEBUG
    glLabelObjectEXT(GL_FRAMEBUFFER_OES, _reflectionFramebuffer, 0, [@"reflectionFramebuffer" UTF8String]);
#endif
    //链接renderBuffer对象
    glGenTextures(1, &_reflectionTex);
    [self.glWrapper bindTexture:_reflectionTex];
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, _reflectionTex, 0, [@"reflectionTex" UTF8String]);
#endif
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  1024, 1024, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    glFramebufferTexture2DOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_TEXTURE_2D, _reflectionTex, 0);
    
    
    const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
    glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    glClear(GL_COLOR_BUFFER_BIT);
    
    
    [self.glWrapper bindTexture:0];

	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
		return NO;
	}
    
	return YES;
}

- (void)initGLState{
    glViewport(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    glEnable(GL_BLEND);
    [self.glWrapper blendFunc:BlendFuncAlphaBlend];
    
//    glEnable(GL_DEPTH_TEST);
}

- (void)setupGL {
    _glWrapper = [[GLWrapper alloc]init];
    
    [EAGLContext setCurrentContext:self.context];
    
    [self createRefelctionFramebuffer];
    
    [self loadShaderProjectQuad];
    
    [self createModelProjectQuad];

    [self.cylinder setupGLWrapper:self.glWrapper texMgr:self.texMgr reflectionTex:_reflectionTex];
    
//    [self.grid setupGL];
    
    [self initGLState];
}

- (void)projectImageTearDownGL {
    RELEASE_BUFFER(_vertexBuffer);

    RELEASE_BUFFER(_indexBuffer);

    RELEASE_VERTEXARRAY(_vertexArray);

    RELEASE_PROGRAM(self.programProject);
}

- (void)tearDownGL {
    
    [EAGLContext setCurrentContext:self.context];
    
//    [self.projectView deleteDrawable];
    
    [self deleteReflectionFramebuffer];
    
    [self projectImageTearDownGL];
    
    [self.cylinder tearDownGL];
    
//    [self.grid tearDownGL];
    
    [self.texMgr destroyTextures];
}

//加载投影在地面上的面的模型
- (BOOL)createModelProjectQuad{
    self.meshRow = 50;
    self.meshColumn = 50;
    
    //绑定gpu
    glGenVertexArraysOES(1, &_vertexArray);
    [self.glWrapper bindVertexArrayOES:_vertexArray];
#if DEBUG
    glLabelObjectEXT(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexArray, 0, "projectQuad");
#endif
    //根据row column创建mesh数据
    int vertRow = self.meshRow + 1;
    int vertColumn = self.meshColumn + 1;
    int vertLength = vertRow * vertColumn * 9;
    int indicesLength = self.meshRow * self.meshColumn * 3 * 2;
    float *meshVertices = (float*)malloc(vertLength * sizeof(float));
    short *meshIndices = (short*)malloc(indicesLength * sizeof(short));
    int fadeRow = 5;
    int fadeColumn = 2;
    
    for (int i=0; i < vertRow; i++) {
        for (int j=0; j < vertColumn; j++) {
            int index = i * vertColumn + j;
            //position
            meshVertices[index*9] = (float)j / (float)self.meshColumn - 0.5f;
            meshVertices[index*9 + 1] = 0;
            meshVertices[index*9 + 2] = (float)i / (float)self.meshRow - 0.5f;
            //uv
            meshVertices[index*9 + 3] = (float)j / (float)self.meshColumn;
            meshVertices[index*9 + 4] = 1.0f - (float)i / (float)self.meshRow;
            //color
            //外围的点是半透明
            meshVertices[index*9 + 5] = 1.0f;
            meshVertices[index*9 + 6] = 1.0f;
            meshVertices[index*9 + 7] = 1.0f;
            meshVertices[index*9 + 8] = 1.0f;
            
            if(i < fadeRow){
                meshVertices[index*9 + 8] *= (float)i / (float)fadeRow;
            }
            else if(i > vertRow - fadeRow){
                meshVertices[index*9 + 8] *= (float)(vertRow - i - 1) / (float)fadeRow;
            }
            
            if(j < fadeColumn){
                meshVertices[index*9 + 8] *= (float)j / (float)fadeColumn;
            }
            else if(j > vertColumn - fadeColumn){
                meshVertices[index*9 + 8] *= (float)(vertColumn - j - 1) / (float)fadeColumn;
            }
        }
    }
    
    for(int i = 0; i < self.meshRow; ++i)
    {
        for(int j = 0; j < self.meshColumn; ++j)
        {
            int index = i * self.meshColumn + j;
            int vertIndex = i * vertColumn + j;
            meshIndices[index*6] = vertIndex;
            meshIndices[index*6 + 1] = vertIndex+1;
            meshIndices[index*6 + 2] = vertIndex + vertColumn;
            
            meshIndices[index*6 + 3] = vertIndex + 1;
            meshIndices[index*6 + 4] = vertIndex + vertColumn + 1;
            meshIndices[index*6 + 5] = vertIndex + vertColumn;
        }
    }
    
    glGenBuffers(1, &_indexBuffer);
    [self.glWrapper bindElementBuffer:_indexBuffer];

#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _indexBuffer, 0, "indexBufferProjectQuad");
#endif
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(short) * indicesLength, meshIndices, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_vertexBuffer);
    [self.glWrapper bindBuffer:_vertexBuffer];
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _vertexBuffer, 0, "vertexBufferProjectQuad");
#endif
    glBufferData(GL_ARRAY_BUFFER, sizeof(float) * vertLength, meshVertices, GL_STATIC_DRAW);

    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 36, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 36, BUFFER_OFFSET(12));
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 36, BUFFER_OFFSET(20));
    [self.glWrapper bindVertexArrayOES:0];
    
    free(meshVertices);
    free(meshIndices);
    
    return YES;
}

//加载投影在地面上的面的Shader
- (BOOL)loadShaderProjectQuad
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programProject = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderCylinderProject" ofType:@"vsh"];
    if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderCylinderProject" ofType:@"fsh"];
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

    glBindAttribLocation(_programProject, GLKVertexAttribTexCoord0, "texcoord");
    
    glBindAttribLocation(_programProject, GLKVertexAttribColor, "color");
    
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
//    self.wvpMatrixUniform = glGetUniformLocation(_programProject, "wvpMatrix");
    
    self.viewProjMatrixUniform = glGetUniformLocation(_programProject, "viewProjMatrix");

    self.worldMatrixUniform = glGetUniformLocation(_programProject, "worldMatrix");
    
    self.radiusUniform = glGetUniformLocation(_programProject, "radius");

    self.eyeUniform = glGetUniformLocation(_programProject, "eye");

    self.morphBlendUniform = glGetUniformLocation(_programProject, "morphBlend");
    
    self.alphaBlendUniform = glGetUniformLocation(_programProject, "alphaBlend");
    
    self.paintTextureUniform = glGetUniformLocation(_programProject, "paintTex");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programProject, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programProject, fragShader);
        glDeleteShader(fragShader);
    }
#if DEBUG
    glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, _programProject, 0, [@"programProject" UTF8String]);
#endif
    return YES;
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

- (BOOL) updateProjectFinished:(float)timeDelta{
    self.curProjectAnimationTime += timeDelta;
    self.morphBlend = self.curProjectAnimationTime / self.projectAnimDuration;
    self.morphBlend = MIN(1, self.morphBlend);
    self.morphBlend = sinf(self.morphBlend * M_PI_2);//ease in out
    
    self.alphaBlend  =1.0;
    return self.morphBlend >= 1.0;
}

- (BOOL) updateUnprojectFinished:(float)timeDelta{
    self.curUnprojectAnimationTime += timeDelta;
    self.alphaBlend = 1.0 - self.curUnprojectAnimationTime / self.unprojectAnimDuration;
    self.alphaBlend = MAX(0, self.alphaBlend);
    self.alphaBlend = sinf(self.alphaBlend * M_PI_2);//ease in out
    
    self.morphBlend = 1.0;
    return self.alphaBlend <= 0.0;
}

- (BOOL) updateViewTopFinished:(float)timeDelta{
    self.curViewTopAnimationTime += timeDelta;
    self.eyeBottomTopBlend = self.curViewTopAnimationTime / self.viewTopAnimDuration;
    self.eyeBottomTopBlend = MIN(1, self.eyeBottomTopBlend);
    self.eyeBottomTopBlend = sinf(self.eyeBottomTopBlend * M_PI_2);//ease in out
    
    return self.eyeBottomTopBlend >= 1.0;
}

- (BOOL) updateViewBottomFinished:(float)timeDelta{
    self.curViewBottomAnimationTime += timeDelta;
    self.eyeBottomTopBlend = 1.0 - self.curViewBottomAnimationTime / self.viewBottomAnimDuration;
    self.eyeBottomTopBlend = MAX(0, self.eyeBottomTopBlend);
    self.eyeBottomTopBlend = sinf(self.eyeBottomTopBlend * M_PI_2);//ease in out
    return self.eyeBottomTopBlend <= 0.0;
}


#pragma mark- 核心变换
//主题Logo
- (void)loadLogoWithAnimation:(BOOL)anim{
    self.paintTexture = [self.texMgr loadTextureInfoFromImageName:@"AnamorphicTitle.png" reload:false].name;
    
    if (anim) {
        [self startImageProjectAnim];
    }
    else{
        self.alphaBlend = 1.0;
        self.morphBlend = 1.0;
    }

}
- (void)reloadLogo{
    _unprojectCompletionBlock = ^(void){
        _paintTexture = [self.texMgr loadTextureInfoFromImageName:@"AnamorphicTitle.png" reload:false].name;
        
        [self startImageProjectAnim];
    };
    
    [self startImageUnProjectAnim];
}


//在project plane上生成图片
-(void)anamorphImage:(NSString*)imagePathInDoc{
    _unprojectCompletionBlock = ^(void){
        _paintTexture = [self.texMgr loadTextureInfoFromFileInDocument:imagePathInDoc reload:true].name;
        
        [self startImageProjectAnim];
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
    
    RELEASE_TEXTURE(_paintTexture);

    self.paintTexture = [self.texMgr loadTextureInfoFromCGImage:newImage].name;
    
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
        self.paintTexture = [self.texMgr loadTextureInfoFromUIImage:image].name;
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
        //隐藏界面
        self.paintFrameTableView.hidden = true;
    }
    else if (self.playState == PS_Playing) {
        [self pauseVideo];
        self.paintFrameTableView.hidden = false;
    }
    else if (self.playState == PS_Pause) {
        [self playVideo];
        self.paintFrameTableView.hidden = true;        
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

#pragma mark- ZBar
//- (IBAction)scan:(id)sender {
//    ZBarReaderViewController * reader = [ZBarReaderViewController new];
//    reader.readerDelegate = self;
//    ZBarImageScanner * scanner = reader.scanner;
//    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
//    reader.showsZBarControls = YES;
//    reader.cameraDevice = UIImagePickerControllerCameraDeviceFront;
//    reader.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
//    [self presentViewController:reader animated:YES completion:nil];
//}
//
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
//    ZBarSymbol * symbol;
//    for(symbol in results)
//        break;
//    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    _label.text = symbol.data;
//}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    DebugLog(@"numberOfSectionsInTableView");
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    DebugLog(@"numberOfRowsInSection: %d",self.curPaintFrameGroup.paintDocs.count);
    return self.curPaintFrameGroup.paintDocs.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DebugLog(@"cellForRowAtIndexPath row:%d", indexPath.row);
    
//    static NSString *CellIdentifier = @"PaintFrameViewCell";
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    DebugLog(@"PaintFrameTableView Cell %@", cell);
    if (cell == nil) {
//        DebugLog(@"PaintFrameTableView Cell nil");
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //显式设置成clear color
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
//
        //创建PaintFrameView
        int offsetX = (int)((self.paintFrameTableView.frame.size.width / 3.0 - PaintFrameViewWidth) * 0.5);
        int offsetY = (int)((self.paintFrameTableView.frame.size.height - PaintFrameViewHeight) * 0.5);
        PaintFrameView *paintFrameView = [[PaintFrameView alloc]initWithFrame:CGRectMake(offsetX, offsetY, PaintFrameViewWidth, PaintFrameViewHeight)];
        [cell.contentView addSubview:paintFrameView];
    }
    else{
    }
    
    //重载
    PaintFrameView *paintFrameView = [cell.contentView.subviews objectAtIndex:0];
    PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:indexPath.row];
    [paintFrameView setPaintDoc:paintDoc];
    [paintFrameView loadForDisplay];
    
    //acc
    paintFrameView.accessibilityLabel = paintDoc.docPath;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width / 3.0;
}

-(void)anamorphicCurPaintFrameView{
    [self anamorphImage:self.curPaintFrameView.paintDoc.thumbImagePath];
    
//    if ([self.curPaintFrameView isKindOfClass:[PaintFrameView class]]) {
//        [self anamorphImage:self.curPaintFrameView.paintDoc.thumbImagePath];
//        self.paintButton.hidden = false;
//        self.playButton.hidden = true;
//    }
//    else{
//        self.paintButton.hidden = true;
//        self.playButton.hidden = false;
//    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    int index = indexPath.row;
    DebugLog(@"didSelectRowAtIndexPath %d", index);

    UITableViewCell *cell = [self tableView:self.paintFrameTableView cellForRowAtIndexPath:indexPath];

    self.curPaintFrameView = (PaintFrameView*)[cell.contentView.subviews objectAtIndex:0];
    self.curPaintFrameGroup.curPaintIndex = index;

    //生成anamorphic image or video
    [self anamorphicCurPaintFrameView];


    //选择后横向缩起来
//    int offsetX = (int)((self.paintFrameTableView.frame.size.width / 3.0 - PaintFrameViewWidth) * 0.5);
//    int offsetY = (int)((self.paintFrameTableView.frame.size.height - PaintFrameViewHeight) * 0.5);
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.curPaintFrameView.bounds = CGRectMake(0, 0, 0, PaintFrameViewHeight);
        self.curPaintFrameView.alpha = 0;
        
//        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
//        rotationAndPerspectiveTransform.m34 = 1.0 / -500;
//        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 15.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
//        view.layer.transform = rotationAndPerspectiveTransform;
//        [view setNeedsLayout];
        
    } completion:^(BOOL finished) {
        self.paintButton.hidden = false;
//        DebugLog(@"didSelectRow animation completed");
    }];

}

#pragma mark- PaintFrame
//- (void)reloadPaintFrameViews{
//    if (self.curPaintFrameGroup.paintDocs != nil) {
//        //将paintDoc逐个加载到画框集中
//        for (int viewIndex=0; viewIndex < self.paintFrameViews.count; ++viewIndex) {
//            PaintFrameView *paintFrameView =[self.paintFrameViews objectAtIndex:viewIndex];
//            int docIndex = self.curPaintFrameGroup.curPaintIndex + viewIndex;
//            if (docIndex < self.curPaintFrameGroup.paintDocs.count) {
//                PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:docIndex];
//                [paintFrameView setPaintDoc:paintDoc];
//                [paintFrameView loadForDisplay];
//            }
//        }
//    }
//}

#pragma mark- 绘画代理PaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup{
    return [self createBestEAGLContext];
//    return [[EAGLContext alloc]initWithAPI:[_context API] sharegroup:[_context sharegroup]];
}

- (void) closePaintDoc:(PaintDoc *)paintDoc{
    [self.paintScreenViewController dismissViewControllerAnimated:false completion:^{
//        float scale = self.view.bounds.size.width / self.curPaintFrameView.bounds.size.width;
//        [self.rootView.layer setValue:[NSNumber numberWithFloat:scale] forKeyPath:@"transform.scale"];
//        DebugLog(@"closePaintDoc rootView Scale: %.1f", scale);

        self.curPaintFrameView.paintDoc = paintDoc;
        
        //刷新当前画架内容
        [self anamorphicCurPaintFrameView];
        
        //更新画框内容
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.curPaintFrameGroup.curPaintIndex inSection:0];
        UITableViewCell *cell = [self.paintFrameTableView cellForRowAtIndexPath:indexPath];
        PaintFrameView *paintFrameView = [cell.contentView.subviews objectAtIndex:0];
        if (paintFrameView == NULL) {
            [self.paintFrameTableView reloadData];
        }
        else{
            [paintFrameView  loadForDisplay];
        }
        
        [self tableView:self.paintFrameTableView didSelectRowAtIndexPath:indexPath];
        
//        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            [self.rootView.layer setValue:[NSNumber numberWithFloat:1.0] forKeyPath:@"transform.scale"];
//        } completion:^(BOOL finished) {
//            
//        }];
        
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
