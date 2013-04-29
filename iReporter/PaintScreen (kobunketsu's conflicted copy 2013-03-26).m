//
//  ViewController.m
//  draw2D
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PaintScreen.h"
//#import "PaintView.h"
#import "ShowPaint.h"
#import "SelectLayerContentViewController.h"

#define EditBrushSizeConfirmPixels 5
#define ChangeToolBarConfirmPixels 10
#pragma mark PaintRefView Assets
// Attribute index.
enum
{
    ATTRIB_VERTEX,
    ATTRIB_TEXCOORD,
    NUM_ATTRIBUTES
};
float quadVertexData[] = 
{
    0.5f, 0, -0.5f,          1.0f, 1.0f,
    -0.5f,0, -0.5f,          0.0f, 1.0f,
    0.5f, 0, 0.5f,         1.0f, 0.0f,
    0.5f, 0, 0.5f,        1.0f, 0.0f,
    -0.5f,0, -0.5f,         0.0f, 1.0f,
    -0.5f,0, 0.5f,        0.0f, 0.0f,
};

typedef struct {
    float Position[3];
    float Color[4];
    float TexCoord[2];
} Vertex;

//const Vertex Vertices[] = {
//    {{1, -1, 0}, {1, 1, 1, 1}, {1, 0}},
//    {{1, 1, 0}, {1, 1, 1, 1}, {1, 1}},
//    {{-1, 1, 0}, {1, 1, 1, 1}, {0, 1}},
//    {{-1, -1, 0}, {1, 1, 1, 1}, {0, 0}}
//};

//const GLubyte Indices[] = {
//    0, 1, 2,
//    2, 3, 0
//};
#pragma mark Paint Screen
@implementation PaintScreen
@synthesize delegate;
@synthesize context = _context;
@synthesize radiusSlider = _radiusSlider;
@synthesize eyeDropperButton = _eyeDropperButton;
@synthesize brushView;
@synthesize lpgrBrushView;
@synthesize pgrPaintView;
@synthesize pgrBrushView;
@synthesize lpgrColorSlots;
@synthesize colorButtons;
@synthesize pencilBrushToolBar;
@synthesize airBrushToolBar;
@synthesize paintUISecCollection = _paintUISecCollection;
@synthesize paintUIDefaultCollection = _paintUIDefaultCollection;
@synthesize paintRefView;
@synthesize btnRedo;
@synthesize btnUndo;
@synthesize testOpenGLView = _testOpenGLView;
@synthesize colorPickerView;
@synthesize paintColor = _paintColor;
@synthesize lpgrPaintView;
@synthesize brushTypeView = _brushTypeView;
@synthesize lblBrushRadius;
@synthesize lblBrushOpacity;
@synthesize btnAction;
@synthesize btnBrush;
@synthesize paintView = _paintView;

//InfColorPicker
@synthesize barView, squareView;
@synthesize barPicker, squarePicker;

//paintViewRef
@synthesize btnPaint;
@synthesize pgrPaintRefView;
@synthesize previewToolBar = _previewToolBar;
@synthesize activityIndicator = _activityIndicator;
@synthesize imageView = _imageView;
@synthesize btnRubber = _btnRubber;
@synthesize colorSlotsView = _colorSlotsView;
@synthesize paintColorView = _paintColorView;
@synthesize paintToolBar = _paintToolBar;
@synthesize brushDetailView = _brushDetailView;
@synthesize rootView = _rootView;
@synthesize debugView = _debugView;
@synthesize debugView2 = _debugView2;
@synthesize popoverController;
@synthesize colorPickerIndicatorMagnify = _colorPickerIndicatorMagnify;

@synthesize mainScreenViewController;
#pragma mark- 视图相关
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    //GLKView
    [delegate createPaintScreenEAGleContext:self];
    
    paintRefView.delegate = self;
    paintRefView.context = _context;
    paintRefView.drawableDepthFormat = GLKViewDrawableDepthFormat24;    
    _glkViewController = [[GLKViewController alloc]init];
    _glkViewController.delegate = self;
    _glkViewController.view = paintRefView;    
    [self setupGL];

    //paintViewSetup
    _paintView.delegate = self;
    _paintView.context = [[EAGLContext alloc]initWithAPI:[_context API] sharegroup:[_context sharegroup]];
    [_paintView initCustom];
    
    _paintViewAngleX = _curViewAngleX = _lastViewAngleX = 0;
    _paintViewAngleY = _curViewAngleY = _lastViewAngleY = M_PI_4;
    _eye = GLKVector3Make(0, 1.75, 0);
    _eyeToPaintViewCenterDistanceZ = _eyeToViewCenterDistanceZ = _eye.y / tanf(_curViewAngleY);    
    _minViewAngleY = DEGREES_TO_RADIANS(HumanEyeFOV * 0.5 * 1.1);
    _kHeightScale = _kWidthScale = 1.0;
    
    _isPaintMode = true;
//    _paintViewConfirmed = true;
    //设置初始画面为paintRefView
    _paintColor.backgroundColor = [UIColor whiteColor];
    btnPaint.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paintButton.jpg"]];    
//    _floorTextureInfo = [self loadTextureInfoFromImageName:@"blackboard.jpg"];    
    [self setUIMode:_isPaintMode];
    
    //Main tools
    //brush
    _pencil = [[Pencil alloc]initWithContext:_paintView.context Canvas:_paintView];
    _pencil.delegate = self;
    
    _rubber = [[Rubber alloc]initWithContext:_paintView.context Canvas:_paintView];
    _rubber.delegate = self;
    
    _pen = [[Pen alloc]initWithContext:_paintView.context Canvas:_paintView];
    _pen.delegate = self;    

    _chalk = [[Chalk alloc]initWithContext:_paintView.context Canvas:_paintView];
    _chalk.delegate = self;        

    _finger = [[Finger alloc]initWithContext:_paintView.context Canvas:_paintView];
    _finger.delegate = self;            
    
    //将笔刷种类加入brushTypeView中进行排版
    [_brushTypeView addBrushType:_pencil];
    [_brushTypeView addBrushType:_rubber];
    [_brushTypeView addBrushType:_pen];    
    [_brushTypeView addBrushType:_chalk];        
    [_brushTypeView addBrushType:_finger];            
    [_brushTypeView setNeedsLayout];
    
    _paintView.brushTypes = _brushTypeView.brushTypes;
    
    //设置当前笔刷
    [_paintView setBrush:_pencil];
    //设置当前笔刷显示
    _brushSecButton.brush = _rubber;
    [_brushSecButton setImage:_rubber.iconImage forState:UIControlStateNormal];
    
    
    _eyeDropper = [[EyeDropper alloc]initWithView:_paintView];
    _paintView.eyeDropper =  _eyeDropper;
    [_eyeDropperButton setImage:[UIImage imageNamed:@"eyedropper.png"] forState:   UIControlStateNormal]; 
    [_eyeDropperButton setImage:[UIImage imageNamed:@"eyedropperSelected.png"] forState:UIControlStateSelected];

    _viewState = Painting;

    _brushTypeView.hidden = true;

    //InfColorPicker
	_infColorPickerController = [ InfColorPickerController colorPickerViewController ];
    _infColorPickerController.barPicker = self.barPicker;
    _infColorPickerController.barPicker.rootView = self.rootView;
    _infColorPickerController.barPicker.indicatorMagnify = self.colorPickerIndicatorMagnify;
    _infColorPickerController.barView = self.barView;    
    _infColorPickerController.squareView = self.squareView;
    _infColorPickerController.squarePicker = self.squarePicker;
    _infColorPickerController.squarePicker.rootView = self.rootView;
    _infColorPickerController.squarePicker.indicatorMagnify = self.colorPickerIndicatorMagnify;
    [_infColorPickerController initAfterViewDidLoad];
    
    lpgrPaintView.delegate=self;
    [pgrBrushView requireGestureRecognizerToFail:lpgrPaintView];
    [pgrPaintView delaysTouchesBegan];
    
    //实现UndoRedo
    _redoEnable = false;
    
    [paintRefView bringSubviewToFront:pencilBrushToolBar];
    
    _curBrushToolBarIndex = 0;
    
    
    //测试Debug
//    [self.imageView setImage:[UIImage imageNamed:@"airBrushRadius16.png"]];    
}

- (void)viewDidUnload
{
    [self setPaintView:nil];
    [self setBtnAction:nil];
    [self setLpgrPaintView:nil];
    [self setBtnBrush:nil];
    [self setBrushView:nil];
    [self setPgrPaintView:nil];
    [self setPgrBrushView:nil];
    [self setLblBrushRadius:nil];
    [self setLblBrushOpacity:nil];
    [self setBrushTypeView:nil];
    [self setLpgrColorSlots:nil];
    [self setLpgrBrushView:nil];
    [self setColorButtons:nil];
    [self setBtnRedo:nil];
    [self setPencilBrushToolBar:nil];
    [self setAirBrushToolBar:nil];
    [self setBtnRedo:nil];
    [self setBtnUndo:nil];
    [self setPaintRefView:nil];
    [self setBtnPaint:nil];
    [self setPgrPaintRefView:nil];
    [self setPreviewToolBar:nil];
    [self setTestOpenGLView:nil];
    [self setActivityIndicator:nil];
    [self setImageView:nil];
    [self setBtnRubber:nil];
    [self setColorPickerView:nil];
    [self setPaintColor:nil];
    [self setColorSlotsView:nil];
    [self setPaintColorView:nil];
    [self setPaintUISecCollection:nil];
    [self setPaintToolBar:nil];
    [self setPaintUIDefaultCollection:nil];
    [self setPaintUIDefaultCollection:nil];
    [self setBrushDetailView:nil];
    [self setRootView:nil];
    [self setDebugView:nil];
    [self setDebugView2:nil];
    [self setColorPickerIndicatorMagnify:nil];
    [self setRadiusSlider:nil];
    [self setEyeDropperButton:nil];
    [self setLayerButtonTapped:nil];
    [self setBrushSecButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self tearDownGL];
    if ([EAGLContext currentContext] == paintRefView.context) {
        [EAGLContext setCurrentContext:nil];
    }
    paintRefView.context = nil; 
    _glkViewController = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //    if ([[segue identifier] isEqualToString:@"showPaint"]) {
    //        
    //        UIViewController *viewController = [segue destinationViewController];
    //
    //        ShowPaint *view = (ShowPaint*)viewController.view;
    //        [view setSourcePaintView:paintView];
    //        [viewController.view setNeedsDisplay];
    //    }
    if ([[segue identifier] isEqualToString:@"selectLayerContent"]) {    
        SelectLayerContentViewController *viewController = [segue destinationViewController];   
        viewController.delegate = self;
        //        viewController.paintScreen = self;
    }
}
#pragma mark- 手势 Gestures
- (IBAction)handlePanPaintColorButton:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [sender locationInView:sender.view];
//        CGPoint locationInRootView = [sender.view convertPoint:location toView:_rootView];        
        CGPoint locationInRootView = CGPointMake(sender.view.superview.frame.origin.x + location.x, sender.view.superview.frame.origin.y + location.y);
        for (UIButton* colorButton in colorButtons) {
//            CGRect rectInRootView = [colorButton convertRect:colorButton.frame toView:_rootView];
            CGRect rectInRootView = CGRectMake(colorButton.superview.frame.origin.x + colorButton.frame.origin.x, colorButton.superview.frame.origin.y + colorButton.frame.origin.y, colorButton.frame.size.width, colorButton.frame.size.height);
            if(CGRectContainsPoint(rectInRootView, locationInRootView)){
                colorButton.backgroundColor = sender.view.backgroundColor;
//                NSLog(@"location is x:%.1f y:%.1f", locationInRootView.x, locationInRootView.y);
//                NSLog(@"cgrect is x:%.1f y:%.1f", rectInRootView.origin.x, rectInRootView.origin.y);                
                break;
            }
        }
    }
}

- (IBAction)handlePinchPaintRefView:(UIPinchGestureRecognizer *)sender {
    if (_isPaintMode) {
        [HandleGestureRecognizer handleScale:sender];    
    }
    else {
    }
}

- (IBAction)handlePinchPaintView:(UIPinchGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        _paintView.isPinchOperating = true;
        
//        if ([sender numberOfTouches]==2) {
//            CALayer* layer = [sender.view layer];              
//            CGPoint touch0 = [sender locationOfTouch:0 inView:paintView];
//            CGPoint touch1 = [sender locationOfTouch:1 inView:paintView];
//            CGPoint touchCenter = CGPointMake((touch0.x+touch1.x)*0.5, (touch0.y+touch1.y)*0.5);
//            
//            NSLog(@"touch0 x:%.1f y:%.1f", touch0.x, touch0.y);        
//            
//            _scaleAnchorPoint = CGPointMake(touchCenter.x / (sender.view.frame.size.width ), touchCenter.y / (sender.view.frame.size.height));
////            NSLog(@"layer new anchor point x:%.1f y:%.1f", _scaleAnchorPoint.x, _scaleAnchorPoint.y);
////            CGPoint ap = [layer anchorPoint];
////            NSLog(@"layer old anchor point x:%.1f y:%.1f", ap.x, ap.y);
////            [layer setAnchorPoint:_scaleAnchorPoint];               
//        }
       
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        //在currentScale=1的情况下，缩小view会切换到主界面
        float curScale = [[[sender.view layer] valueForKeyPath: @"transform.scale"] floatValue];
        if(curScale <= 1.0 && sender.scale < 1.0){
            [self saveToDoc];
//            NSLog(@"Swtich to main screen view");
            [self closeCurPaintFrame];
        }
        
        return;
    }

    [HandleGestureRecognizer handleScale:sender];
}

- (IBAction)handlePanPaintRefView:(UIPanGestureRecognizer *)sender {

        switch (sender.state ) {
            case UIGestureRecognizerStateBegan:
                _lastViewAngleX = _curViewAngleX;
                _lastViewAngleY = _curViewAngleY;
                break;
            case UIGestureRecognizerStateEnded:
                
                break;            
            default:
                break;
        } 
        
    if (_isPaintMode) {
        [HandleGestureRecognizer handleMove:sender];
    }
    else {
        if (sender.numberOfTouches<2) {
            CGPoint translation = [sender translationInView:sender.view];
            _curViewAngleX = _lastViewAngleX + translation.x * 0.01;
            _curViewAngleY = _lastViewAngleY + translation.y * 0.01;
        }
    }
    
}

- (IBAction)handlePanPaintView:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan && sender.numberOfTouches == 2) {
        _paintView.isPanOperating = true;
        return;
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        if (_colorPickerViewHiddenTemp) {
            _colorPickerViewHiddenTemp = false;            
            [colorPickerView setHidden:false];
        }        
        return;
    }
   
    if (sender.numberOfTouches<2 && sender.numberOfTouches>0) {
        if(CGRectContainsPoint(colorPickerView.frame, [sender locationInView:sender.view]) && ![colorPickerView isHidden]) {
            _colorPickerViewHiddenTemp = true; 
            [colorPickerView setHidden:true];
        }        
      
        return;
    }
    [HandleGestureRecognizer handleMove:sender];
}

- (IBAction)handleTapPaintView:(UITapGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"paintView tapped!");
        if(_viewState == EditingBrush || _viewState == EditingColorPicker){
            for (UIView* uiView in _paintUISecCollection){
                if(!uiView.hidden){
                    uiView.hidden = true;
                }
            }
            _viewState = Painting;
        }

        else if(_viewState == Painting)
        {
            [self toggleAllPaintUI];
        }

    }
}

- (IBAction)handleLongPressPaintView:(UILongPressGestureRecognizer *)sender{
//    switch (sender.state) {
//        case UIGestureRecognizerStateBegan:
//            _curBrush.isDrawing = false;
//            _paintView.eyeDropper.isDrawing = true;
//            _paintView.eyeDropper.position = _paintView.touchPoint;
//            break;
//        case UIGestureRecognizerStateEnded:
//            _curBrush.isDrawing = false;            
//            _paintView.eyeDropper.isDrawing = false;             
//            break;            
//        default:
//            break;
//    }
//   
//    [_paintView setNeedsDisplay];
}


- (IBAction)handleLongPressColorSlot:(UILongPressGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
//            _isEditingColorSlot = true;
            if (_LongPressGRColorSlotCount<1) {
                _LongPressGRColorSlotCount ++;
                NSLog(@"LongPressGRColorSlotCount: %d", _LongPressGRColorSlotCount);
                
                //单色选色模式
            }
            else{
                //双色渐变选色模式
            }
            
            [colorPickerView setHidden:false];
            colorPickerView.sourceView = sender.view;
            _infColorPickerController.resultColor = sender.view.backgroundColor;//覆盖当前笔刷色

            break;
        case UIGestureRecognizerStateEnded:
            break;            
        default:
            break;
    }    
}

- (IBAction)handlePanBrushView:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            _viewState = Painting;
            break;
            
        default:
            break;
    }

    if(_viewState == EditingBrushSize){
        CGPoint translation = [sender translationInView:sender.view];
        _paintView.brush.brushState.radius += translation.x * 0.05;
        _paintView.brush.brushState.radius = MIN(MAX(_paintView.brush.brushState.radius, 1), brushView.bounds.size.height * 0.5 - 2);
        
        lblBrushRadius.text = [NSString stringWithFormat:@"Radius : %.1f", _paintView.brush.brushState.radius] ;
        
        [brushView setNeedsDisplay];
    }
    else if(_viewState == EditingBrushOpacity){
        CGPoint translation = [sender translationInView:sender.view];
        _paintView.brush.brushState.opacity -= translation.y * 0.001;
        _paintView.brush.brushState.opacity = MIN(MAX(_paintView.brush.brushState.opacity, 0), 1);
        
        lblBrushOpacity.text = [NSString stringWithFormat:@"Opacity : %.2f", _paintView.brush.brushState.opacity] ;
        
        [brushView setNeedsDisplay];
    }
    else {
        CGPoint translation = [sender translationInView:sender.view];
        if((fabsf(translation.x) > fabsf(translation.y)) && (fabsf(translation.x)>EditBrushSizeConfirmPixels))
        {
            _viewState = EditingBrushSize;
        }
        else if ((fabsf(translation.y) > fabsf(translation.x)) && (fabsf(translation.y)>EditBrushSizeConfirmPixels)) {
            _viewState = EditingBrushOpacity;
        }
    }
}

- (IBAction)handleTapBrushView:(UITapGestureRecognizer *)sender {

}

- (IBAction)handlePanBrushToolBar:(UIPanGestureRecognizer *)sender {
    UIView* view = sender.view;
    CGPoint translation = [sender translationInView:sender.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
//            [pencilBrushToolBar setUserInteractionEnabled:false];
//            [airBrushToolBar setUserInteractionEnabled:false];
            for (BrushToolBar *brushToolBar in _paintUISecCollection) {
                [brushToolBar setUserInteractionEnabled:false];
            }            
            if(_viewState != EditingBrush && !brushView.isHidden){//确认颜色选择，如果不在编辑笔刷状态下 关闭预览窗口 不改当前笔刷颜色
//                [self toggleBrushPreview];
            }
            else if (_viewState == EditingBrush && !brushView.isHidden) {//在编辑状态下 更新颜色
                //todo:
//                brushView.color = self.resultColor = sender.backgroundColor;
            }            
            break;
        case UIGestureRecognizerStateEnded:
            [UIView animateWithDuration:0.25
                             animations:^{

                                 if (translation.x < -ChangeToolBarConfirmPixels && translation.y < ChangeToolBarConfirmPixels && _curBrushToolBarIndex < BrushType_Max - 2) {
                                     [view setFrame:CGRectMake(view.frame.origin.x-view.frame.size.width*0.5, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                                     _curBrushToolBarIndex++;
                                 }
                                 else if (translation.x > ChangeToolBarConfirmPixels && translation.y < ChangeToolBarConfirmPixels && _curBrushToolBarIndex > 0){
                                     [view setFrame:CGRectMake(view.frame.origin.x+view.frame.size.width*0.5, view.frame.origin.y, view.frame.size.width, view.frame.size.height)];
                                     _curBrushToolBarIndex--;
                                 }
                                 [self changeBrush];                                 
                             } 
                             completion:^(BOOL finished){
                                 for (BrushToolBar *brushToolBar in _paintUISecCollection) {
                                     [brushToolBar setUserInteractionEnabled:true];
                                 }
                             }];
           
            break;
    }    
}

#pragma mark- 手势代理 Gestures Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

#pragma mark- 绘图界面 Paint UI Operation
- (void)changeBrush{
    //初始化brush里的参数 (数组放的顺序不对)
    //    UIView *brushTooBar = [paintUICollection objectAtIndex:_curBrushToolBarIndex];
    //    _curBrush.brushType = brushTooBar.tag;
    
    _pencil.brushType = _curBrushToolBarIndex;
}
- (void)setBrushPreview:(bool)enable{
    //    if (brushView.hidden) {
    //        [brushView setHidden:!brushView.hidden];
    //    }
    brushView.hidden = !enable;
    _viewState = enable ? PreviewBrush : Painting;
}
//- (void)toggleBrushPreview{
//    [self setBrushPreview:!_isPreviewBrush];
//}

- (void)toggleBrushToolViews{
    if (_viewState == EditingBrush) {
        brushView.hidden = true;
        _brushTypeView.hidden = true;
        _viewState = Painting;
    }    
    else if(_viewState != EditingBrush){
        brushView.hidden = false;
        _brushTypeView.hidden = false;
        _viewState = EditingBrush;
    }

}

- (IBAction)editBrush:(UIButton *)sender {
    //选定笔刷种类
    [self toggleBrushToolViews];
    [brushView setNeedsDisplay];
}



- (IBAction)selectColor:(SelectColorButton *)sender {
    [self setBrushPreview:true];         
    _infColorPickerController.resultColor = brushView.color = sender.backgroundColor;

    [brushView setNeedsDisplay];
}

- (IBAction)selectColorConfirmed:(SelectColorButton *)sender {
        [_paintView.brush setColor:sender.backgroundColor];
        [self setBrushPreview:false];
        brushView.color = _infColorPickerController.resultColor = self.paintColor.backgroundColor =sender.backgroundColor;
}

- (IBAction)selectBrushRadius:(UIButton *)sender {
    _paintView.brush.brushState.radius = sender.tag;
    _radiusSlider.value = (float)sender.tag;
    lblBrushRadius.text = [NSString stringWithFormat:@"Radius : %.0f", _paintView.brush.brushState.radius];
    [brushView setNeedsDisplay];
}

- (IBAction)slideBrushRadius:(UISlider *)sender {
    _paintView.brush.brushState.radius = sender.value;
    lblBrushRadius.text = [NSString stringWithFormat:@"Radius : %.0f", _paintView.brush.brushState.radius];
    [brushView setNeedsDisplay];    
}

- (IBAction)slideBrushOpacity:(UISlider *)sender {
    _paintView.brush.brushState.opacity = (float)sender.value / 100.0f;
    lblBrushOpacity.text = [NSString stringWithFormat:@"Opacity : %.2f", _paintView.brush.brushState.opacity];
    [brushView setNeedsDisplay];     
}

- (IBAction)selectBrushType:(UIButton *)sender {
//    paintView.brush.brushType ++;    
//    if (paintView.brush.brushType > BrushType_Max-2) {
//        paintView.brush.brushType = 0;
//    }
}

- (IBAction)selectRubber:(UIButton *)sender {
    [_paintView setBrush:_rubber];
}
- (IBAction)syncBrushView:(id)sender {
    brushView.color = _infColorPickerController.resultColor;
    [brushView setNeedsDisplay];    
}

- (IBAction)showPaint:(id)sender {
//    [paintView testSave];
}

- (IBAction)showNextImage:(UIBarButtonItem *)sender {
    if (_currentImageIndex >= [_imageArray count]) {
        _currentImageIndex = 0;
    }
    
//    _paintView.curTestImage = [_imageArray objectAtIndex:_currentImageIndex++];
    [_paintView setNeedsDisplay];
}




- (IBAction)eraserButtonTapped:(UIButton *)sender {
}

#pragma mark- 导出 Export
//TODO:实现代理
- (void)exportToAirPrint{
    UIImage *image = [_paintView snapshotToUIImage];
    //convert UIImage to NSData to add it as attachment
    NSData *data = UIImagePNGRepresentation(image);
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if  (pic && [UIPrintInteractionController canPrintData: data] ) {
        
        pic.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [NSString stringWithFormat:@"image%@", image.hash];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printingItem = data;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
            
            if (!completed && error)
                NSLog(@"FAILED! due to error in domain %@ with error code %u",error.domain, error.code);
        };
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//            [pic presentFromBarButtonItem:self.printButton animated:YES completionHandler:completionHandler];
            [pic presentFromRect:CGRectMake(0, self.view.frame.size.height - 66, 66, 66) inView:self.view animated:true completionHandler:completionHandler];
        } else {
            [pic presentAnimated:YES completionHandler:completionHandler];
        }
    }
}

- (void)exportToEmail{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    [picker setSubject:@"write your subject here"];
    
    UIImage *image = [_paintView snapshotToUIImage];
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
#pragma mark- 导入 Import

#pragma mark- 图层 Layer

#pragma mark- 取消操作 Undo Redo
- (IBAction)UndoDraw:(UndoButton *)sender {

}

- (IBAction)touchUpInsideRedoButton:(UIButton *)sender {
    [_paintView redoDraw];
}
- (IBAction)RedoDraw:(UIButton *)sender {
    
}
- (IBAction)touchUpOutsideUndoButton:(UndoButton *)sender {
}

- (IBAction)touchUpInsideUndoButton:(UndoButton *)sender forEvent:(UIEvent *)event {
    [_paintView undoDraw];
    _redoEnable = true;
}

- (IBAction)showRedoButton:(UndoButton *)sender {
    if (_redoEnable && btnRedo.isHidden) {
        [btnRedo setHidden:false];
    }
}
#pragma mark- 笔刷种类代理 BrushTypeView Delegate (Refresh UI)
-(void)selectBrush:(id)sender{
    BrushTypeButton* button = (BrushTypeButton*)sender;
    [_paintView setBrush:button.brush];
    [_paintView.brush setColor:_paintColor.backgroundColor];
    _brushTypeView.hidden = true;
}
    
#pragma mark- 笔刷代理 Brush Delegate (Refresh UI)
- (void) brushColorChanged:(UIColor*)color{
    _paintColor.backgroundColor =  color;
}
#pragma mark- 绘图界面代理 PaintingView Delegate (Refresh UI)
-(void)redoDisabled{
    _redoEnable = false;
}
-(void)paintColorChanged:(UIColor*) resultColor{
    _paintColor.backgroundColor = resultColor;
}
- (void) brushChanged:(Brush*) brush{
    brushView.brush = brush;
    [btnBrush setImage:brush.iconImage forState:UIControlStateNormal];

}
- (void) paintViewTouchBegan{
    
    for (UIView* uiView in _paintUISecCollection){
        uiView.hidden = true;
    }
    
    
    if (![colorPickerView isHidden]) {
        [_paintView.brush setColor:_infColorPickerController.resultColor];
        if (!colorPickerView.locked) {
            [colorPickerView setHidden:true];
        }
    }

//    if (!colorPickerView.locked) {
//    _brushDetailView.hidden = true;
//    _brushTypeView.hidden = true;
//    }
    _viewState = Painting;
}

- (void) touchMoving:(CGPoint)point{
//    brushView.hidden = false;
//    brushView.center = CGPointMake(point.x, self.view.frame.size.height - point.y);
}

- (void) eyeDropStart{
    _colorPickerIndicatorMagnify.hidden = false;
}

- (void) eyeDropping:(CGPoint)point Color:(UIColor *)uiColor{
    _colorPickerIndicatorMagnify.center = CGPointMake(point.x, point.y - _colorPickerIndicatorMagnify.frame.size.height*0.5);
    _colorPickerIndicatorMagnify.backgroundColor = uiColor;
}

- (void) eyeDropEnd{
    _colorPickerIndicatorMagnify.hidden = true;
    _paintView.isEyeDroppering = false;
    _eyeDropperButton.selected = false;
}

#pragma mark- 绘图投影代理PaintProjectViewControllerDelegate
- (void) createPaintProjectEAGleContext:(PaintProjectViewController*)viewController{
    viewController.context = [[EAGLContext alloc]initWithAPI:[_context API] sharegroup:[_context sharegroup]];
}

#pragma mark- 选取背景色 SelectLayerContent Delegate

- (void) selectLayerContent:(UIImage*)image{
    //save paintView backgroundimage to paint frame background image
    NSString* bgImageName = [NSString stringWithFormat:@"Image_%d.jpg", image.hash];
    [Ultility saveUIImage:image ToJPGInDocument:bgImageName];    
    _paintView.paintFrame.bgImageName = bgImageName;
    [delegate paintBGChanged:bgImageName];
    
    [_paintView setBackgroundImage:[Ultility getPathInApp:bgImageName]];
    

}
#pragma mark- 取色界面 Pick Color UI Operation
- (IBAction)colorSlotsSwitchTapped:(UIButton *)sender {
    [_colorSlotsView setHidden:![_colorSlotsView isHidden]];
}

- (IBAction)colorPickerSwitchTapped:(UIButton *)sender {
    if(colorPickerView.sourceView!=NULL){
        colorPickerView.sourceView.backgroundColor = _infColorPickerController.resultColor;
        if(colorPickerView.sourceView == _paintColorView){
            [_paintView.brush setColor:_infColorPickerController.resultColor];
        }
    }
    
    colorPickerView.hidden = true;
    colorPickerView.locked = false;
    _viewState = Painting;
}
- (IBAction)colorPickerLockTapped:(UIButton *)sender {
    colorPickerView.locked = !colorPickerView.locked;
}

- (IBAction)paintColorButtonTapped:(UIButton *)sender {
//    [_paintColorView setHidden:true];
//    [_colorSlotsView setHidden:true];
    [colorPickerView setHidden:false];
    colorPickerView.sourceView = _paintColorView;
    _viewState = EditingColorPicker;
}

//------------------------------------------------------------------------------
#pragma mark- 取色器 InfColorPicker IB actions
//------------------------------------------------------------------------------

- (IBAction) takeBarValue: (InfColorBarPicker*) sender
{
    [_infColorPickerController takeBarValue:sender];
}

//-----------------------------------------------------------------------
- (IBAction) takeSquareValue: (InfColorSquarePicker*) sender
{
    [_infColorPickerController takeSquareValue:sender];
}

#pragma mark- 工具栏
- (void)setUIMode:(bool)isPaintMode{
    if (isPaintMode){
        //切换视窗
        [paintRefView setHidden:true]; 
        [_previewToolBar setHidden:true];
        pgrPaintRefView.enabled = false;        
        
        [_paintView setHidden:false];
        _paintView.userInteractionEnabled = true;
//        UIImage* paintRefViewImage = [Ultility snapshot:paintRefView WithContext:_context WithSize:paintRefView.frame.size];
//        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)paintView.layer;
//        eaglLayer.backgroundColor = [UIColor colorWithPatternImage:[Ultility flipImageVertically:paintRefViewImage]].CGColor; 
        
        
        //打开绘图工具栏
        for (UIView* uiView in _paintUIDefaultCollection){
            [uiView setHidden:false];
        }        
        
        btnPaint.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"viewButton.jpg"]];
        
        //_modelViewProjectionMatrix will be restored by current view angle
        _curViewAngleX = _paintViewAngleX;
        _curViewAngleY = _paintViewAngleY;
        
        //开始更新绘图
        [_paintView setNeedsDisplay];
    }
    else{
        //关闭绘图层
        [_paintView setHidden:true];
        _paintView.userInteractionEnabled = false;
        
        //关闭绘图工具栏
        for (UIView* uiView in _paintUISecCollection){
            [uiView setHidden:true];
        }
        [_previewToolBar setHidden:false];        
        pgrPaintRefView.enabled = true;

        
        //将摄像机切换到从上往下的摄像机，将投影image保存下来        
        btnPaint.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paintButton.jpg"]];
        
        //初始化绘图结果
        [paintRefView setHidden:false];                
        [EAGLContext setCurrentContext:_context];
        if (!_paintView.paintingImage){
            return;
        }
        NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithBool:YES],
                                  GLKTextureLoaderOriginBottomLeft, 
                                  nil];    
        NSError * error;
        UIImage* paintImageFlip = [Ultility flipImageVertically:_paintView.paintingImage];
        //释放之前操作的内存
        GLuint name = _paintTextureInfo.name;
        glDeleteTextures(1, &name);
        _paintTextureInfo = [GLKTextureLoader textureWithCGImage:paintImageFlip.CGImage options:options error:&error];
        
        //开始更新绘图        
        [paintRefView setNeedsDisplay];        
    }    
}
- (void)switchUIMode{
    _isPaintMode = !_isPaintMode;
    //手势
    //调整相关UI
    [self setUIMode:_isPaintMode];

}
- (IBAction)togglePaint:(UIButton *)sender {
    if(!_paintViewConfirmed){
        _paintViewAngleX = _curViewAngleX;
        _paintViewAngleY = _curViewAngleY;        
        _eyeToPaintViewCenterDistanceZ = _eyeToViewCenterDistanceZ;
        _paintMVPMatrix = _modelViewProjectionMatrix;        
        //截取视角作为绘画的底
        _paintView.paintRefImage = [Ultility snapshot:paintRefView Context:_context InViewportSize:_paintView.frame.size ToOutputSize:CGSizeMake(UndoImageSize,UndoImageSize)];
        _paintViewConfirmed = true;
    }
    
    [self switchUIMode];
}

- (IBAction)selFloorTexButtonTapped:(UIButton *)sender {
    
}

- (IBAction)saveToDiskButtonTapped:(UIButton *)sender {

    [EAGLContext setCurrentContext:_context];        
    [self setupSaveTextureMatrix];         
    //frame buffer指向off screen
    //        glBindFramebufferOES(GL_FRAMEBUFFER_OES, _storeFramebuffer);
    //normal rendering
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    glBindVertexArrayOES(_vertexArray);
    
    // Render the object again with ES2
    glUseProgram(_programProject);
    
    glActiveTexture(GL_TEXTURE0); 
    glBindTexture(GL_TEXTURE_2D, _floorTextureInfo.name);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glUniform1i(_baseTextureUniform, 0);
    
    glActiveTexture(GL_TEXTURE1); 
    glBindTexture(GL_TEXTURE_2D, _paintTextureInfo.name);
    glUniform1i(_paintTextureUniform, 1);   
    
    glUniformMatrix4fv(_modelViewProjMatrixUniform, 1, 0, _modelViewProjectionMatrix.m);
    glUniformMatrix4fv(_paintMVPMatrixUniform, 1, 0, _paintMVPMatrix.m);
    glUniform1f(_baseTexScaleUniform, 1.0);  
    glDrawArrays(GL_TRIANGLES, 0, 6); 
    
    //截取opengl纹理
//    BNRTimeBlock (^{//测试运行速度                
    [self.activityIndicator startAnimating];    
        _paintImageOnPlane = [Ultility flipImageVertically:[Ultility snapshot:paintRefView Context:_context InViewportSize:paintRefView.frame.size ToOutputSize:paintRefView.frame.size]];
    [self.activityIndicator stopAnimating];
//    });        

    //将图片保存下来        
    //    NSString *path = @"public.png";
    //    [Ultility saveUIImage:[UIImage imageWithCGImage:_paintImageOnPlane] ToPNGInDocument:path];
    
    //更新了贴图后把paintView内容清楚
    //        _paintTextureInfo = nil;
    
    //恢复到之前的窗口
    _modelViewProjectionMatrix = _paintMVPMatrix;    

    
    //frame buffer指回screen
    //        glBindFramebufferOES(GL_FRAMEBUFFER_OES, 0);
    [paintRefView setContentScaleFactor:1];
    
    //显示新的view controller
    ShowPaintOnPlaneViewController* viewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"showPaintOnPlaneViewController"];
    viewController.paintImage = _paintImageOnPlane;
    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController animated:YES completion:nil];
    viewController.lbWidth.text = [NSString stringWithFormat:@"Width : %.1f Meter", realWidth];
    viewController.lbLength.text = [NSString stringWithFormat:@"Length : %.1f Meter", realHeight];
    

}

- (IBAction)savePaintImageButtonTapped:(UIButton *)sender {
//    [Ultility saveUIImage:[UIImage imageWithCGImage:(paintView.paintingImage)] ToPNGInDocument:@"/myImage.png"];
}

//NSString *const kGPUProjectImageVertexShaderString = SHADER_STRING
//(
// attribute vec3 position;
// attribute vec2 inputTextureCoordinate;
// attribute vec4 color;
// 
// varying vec2 textureCoordinate;
//// varying vec4 proPosition;
// 
// uniform mat4 viewProjMatrix;
// void main()
// {
//     vec4 pos = vec4(position,1);
//     gl_Position = viewProjMatrix * pos;
////     gl_Position = position * viewProjMatrix;
//     textureCoordinate = inputTextureCoordinate.xy;
//     //将vertex转入视窗矩阵
//
////     proPosition = position * viewProjMatrix;
// }
//);
//
//NSString *const kGPUProjectImageFragmentShaderString = SHADER_STRING
//(
// varying highp vec2 textureCoordinate;
// 
// uniform sampler2D inputImageTexture;
//
// void main()
// {
//     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
//     
//     gl_FragColor = vec4(1,0,0,1);
// }
// );
- (IBAction)debugButtonTapped:(UIButton *)sender {
    [self.debugView layer].contents = (__bridge id)(_paintView.brushingImage.CGImage);
    [self.debugView2 layer].contents = (__bridge id)(_paintView.paintingImage.CGImage);
}

- (IBAction)takePhotoButtonTapped:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

- (IBAction)pickPhotoButtonTapped:(id)sender {
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

- (IBAction)pickImageInApp:(id)sender {
//    self presentModalViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
}

- (IBAction)clearPaintButtonTapped:(id)sender {
    [_paintView erase];
}

- (IBAction)eyeDropperButtonTapped:(id)sender {
    _paintView.isEyeDroppering = true;
    //set on state image
    UIButton* button = (UIButton*)sender;
    button.selected = true;
}
- (void)saveToDoc{
    //NSLog(@"Save Image");
    [Ultility saveUIImage:[_paintView snapshotPaintToUIImage] ToPNGInDocument:_paintView.paintFrame.paintImageName];
    //save to plist
}
- (IBAction)saveToDocButtonTapped:(UIButton *)sender {
    [self saveToDoc];
}

- (IBAction)saveAndCloseButtonTapped:(UIButton *)sender {
    [self saveToDoc];
    [self closeCurPaintFrame];
}

- (IBAction)projectPaintButtonTapped:(UIButton *)sender {
    //显示新的view controller
    PaintProjectViewController* viewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"paintProjectViewController"];
    viewController.delegate = self;
    [viewController initPaint:_paintView viewAngle:_curViewAngleY];
    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController animated:true completion:^{

    }];
}


- (IBAction)fingerButtonTapped:(BrushTypeButton *)sender {
    //交换备用笔刷
    Brush* tempBrush = sender.brush;
    
    sender.brush = _paintView.brush;
    [sender setImage:sender.brush.iconImage forState:UIControlStateNormal];

    brushView.brush = tempBrush;
    _paintView.brush = tempBrush;
    _paintView.brush.color = _paintColor.backgroundColor;
    [btnBrush setImage:_paintView.brush.iconImage forState:UIControlStateNormal];
}

- (IBAction)importButtonTapped:(UIButton *)sender {
}

- (IBAction)exportButtonTapped:(UIButton *)sender {
    //test
    [self exportToEmail];
//    [self exportToAirPrint];
}

- (void)toggleAllPaintUI{
    for (UIView* uiView in _paintUIDefaultCollection){
        uiView.hidden = !uiView.hidden;
    }
    for (UIView* uiView in _paintUISecCollection){
        if(!uiView.hidden){
            uiView.hidden = true;
        }
    }
}
#pragma mark- 绘图背景 PaintRefView Methods

- (void)setupGL {
    [EAGLContext setCurrentContext:paintRefView.context];
    
    [self loadShaders];
    
    glEnable(GL_DEPTH_TEST);
    
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(quadVertexData), quadVertexData, GL_STATIC_DRAW);
    
//    glGenBuffers(1, &_indexBuffer);
//    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
//    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(ATTRIB_VERTEX);
    glVertexAttribPointer(ATTRIB_VERTEX, 3, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(ATTRIB_TEXCOORD);
    glVertexAttribPointer(ATTRIB_TEXCOORD, 2, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);

}
- (void)tearDownGL {
    
    [EAGLContext setCurrentContext:paintRefView.context];
    
    glDeleteBuffers(1, &_vertexBuffer);
    glDeleteVertexArraysOES(1, &_vertexArray);
    
    if (_programProject) {
        glDeleteProgram(_programProject);
        _programProject = 0;
    }  
}
#pragma mark - 转换GLKViewControllerDelegate
- (void)setupSaveTextureFrameBuffer{
//    CAEAGLLayer* myEAGLLayer = (CAEAGLLayer*) paintRefView.layer;
//    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable: myEAGLLayer];    
    //创建frame buffer
    glGenFramebuffersOES(1, &_storeFramebuffer);
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, _storeFramebuffer);    
    //创建render buffer
    glGenRenderbuffersOES(1, &_storeRenderbuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, _storeRenderbuffer);
    //给renderBuffer分配内存
    size_t width = _paintView.bounds.size.width * _kHeightScale;
    size_t height = _paintView.bounds.size.height * _kHeightScale;
    glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_RGBA8_OES, width, height);        
    //链接renderBuffer对象
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES,   GL_RENDERBUFFER_OES, _storeRenderbuffer);
}

- (void)setupSaveTextureMatrix{
    //定义边界点坐标为 (xt)
    //T = t*t; X = x*x; A = cosf(halfFov) * cosf(halfFov); H ＝ eye.y * eye.y
    float fovHalf = DEGREES_TO_RADIANS(HumanEyeFOV* 0.5) ;
    float A = cosf(fovHalf) * cosf(fovHalf);
    float D = _eyeToPaintViewCenterDistanceZ * _eyeToPaintViewCenterDistanceZ;
    float H = _eye.y * _eye.y;
    
    float a = D*D - A*D*D - A*D*H;
    float b = 2*D*H;
    float c = H*H - A*D*H - A*H*H;
    
    float result1 = sqrtf((b*b-4*a*c)/(4*a*a)) - b/(2*a);
    float result2 = -sqrtf((b*b-4*a*c)/(4*a*a)) - b/(2*a);    
    float d1 = _eyeToPaintViewCenterDistanceZ * result1;
    float d2 = _eyeToPaintViewCenterDistanceZ * result2;
    realHeight = fabsf(d2 - d1);
    GLKVector3 far = GLKVector3Make(sinf(_paintViewAngleX) * d1, 0, -cosf(_paintViewAngleX) * d1);
    GLKVector3 near = GLKVector3Make(sinf(_paintViewAngleX) * d2, 0, -cosf(_paintViewAngleX) * d2);
    GLKVector3 viewCenter = GLKVector3Make((near.x+far.x)*0.5, (near.y+far.y)*0.5, (near.z+far.z)*0.5);
    GLKVector3 eye = GLKVector3Make(viewCenter.x, 1.5, viewCenter.z);
    GLKVector3 up = GLKVector3Normalize(GLKVector3Subtract(far, near));
    
    
    float aspect = fabsf(paintRefView.bounds.size.width / paintRefView.bounds.size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakeOrtho(-0.5*realHeight*aspect, 0.5*realHeight*aspect, 0.5*realHeight, -0.5*realHeight, 0.01, 100); 
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(20, 1, 30);
    GLKMatrix4 worldMatrix = scaleMatrix;
    GLKMatrix4 modelViewMatrix  = GLKMatrix4MakeLookAt(eye.x, eye.y, eye.z, viewCenter.x, viewCenter.y, viewCenter.z, up.x, up.y, up.z);
    
    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, worldMatrix);

    // Compute the model view matrix for the object rendered with ES2
    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix);    
    
    //计算截图放大的比例
    realWidth = realHeight * aspect;
    float r = _eyeToPaintViewCenterDistanceZ - d2;
    float screenViewHeight = sinf(_paintViewAngleY) * r * 2;
    _kHeightScale = realHeight / screenViewHeight;
    
    //viewport有尺寸限制，要将_kScreenToReal限制在尺寸限制内
    GLuint dims[2];
    glGetIntegerv(GL_MAX_VIEWPORT_DIMS, (GLint*)&dims[0]);      
    if (paintRefView.bounds.size.height*_kHeightScale>dims[1]) {
        _kHeightScale = dims[1] / paintRefView.bounds.size.height;
    }
    
//    NSLog(@"Debug: RealHeight: %.2f meters ScreenToRealScale: %.2f", realHeight, _kHeightScale);
    [paintRefView setContentScaleFactor:_kHeightScale];
}

- (void)setupMVPMatrix{
    float aspect = fabsf(paintRefView.bounds.size.width / paintRefView.bounds.size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(HumanEyeFOV), aspect, 0.01f, 100.0f);    
    
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(20, 1, 30);
    GLKMatrix4 worldMatrix = scaleMatrix;

    //定义最远距离
    if(_curViewAngleY < _minViewAngleY){
        _curViewAngleY = _minViewAngleY;
    }
    _eyeToViewCenterDistanceZ = _eye.y / tanf(_curViewAngleY);
    float x = sinf(_curViewAngleX) * _eyeToViewCenterDistanceZ;
    float z = cosf(_curViewAngleX) * _eyeToViewCenterDistanceZ;    
    GLKVector3 viewCenter = GLKVector3Make(x, 0, -z);
    GLKMatrix4 modelViewMatrix  = GLKMatrix4MakeLookAt(_eye.x, _eye.y, _eye.z, viewCenter.x, viewCenter.y, viewCenter.z, 0, 1, 0);
    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, worldMatrix);
    
    // Compute the model view matrix for the object rendered with ES2
    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix); 
}

- (void)glkViewControllerUpdate:(GLKViewController *)controller {
    [self setupMVPMatrix];
}

-(void)paintRefView:(GLKView *)view drawInRect:(CGRect)rect{
    //normal rendering
    [EAGLContext setCurrentContext:_context];        
    
    glClearColor(0.65f, 0.65f, 0.65f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    
    glBindVertexArrayOES(_vertexArray);
    
    // Render the object again with ES2
    glUseProgram(_programProject);
    glEnable(GL_BLEND);
    glActiveTexture(GL_TEXTURE0); 
    glBindTexture(GL_TEXTURE_2D, _floorTextureInfo.name);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glUniform1i(_baseTextureUniform, 0);
    
    if(_paintTextureInfo!=NULL){
    glActiveTexture(GL_TEXTURE1); 
    glBindTexture(GL_TEXTURE_2D, _paintTextureInfo.name);        
    }
    
    glUniform1i(_paintTextureUniform, 1);   
    glUniformMatrix4fv(_modelViewProjMatrixUniform, 1, 0, _modelViewProjectionMatrix.m);
    glUniformMatrix4fv(_paintMVPMatrixUniform, 1, 0, _paintMVPMatrix.m);
    glUniform1f(_baseTexScaleUniform, 1.0);
    if (_isPaintMode || !_paintTextureInfo) {
        glUniform1f(_paintTexScaleUniform, 0.0);
    }
    else {
        glUniform1f(_paintTexScaleUniform, 1.0);
    }
    
    //    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);        
    glDrawArrays(GL_TRIANGLES, 0, 6); 
}

#pragma mark - 主界面MainScreenViewControllerDelegate
-(void) closeCurPaintFrame{
    [_paintView close];
    [delegate closePaintFrame:_paintView.paintFrame];
//    NSLog(@"Paint Frame Closed");    
}
- (void) paintFrameOpened:(PaintFrame*)paintFrame{
    [_paintView toOpen:paintFrame];
//    NSLog(@"Paint Frame Opened");    
}

#pragma mark - 编译Shader OpenGL ES 2 shader compilation

- (BOOL)loadShaders
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programProject = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderProject" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderProject" ofType:@"fsh"];
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
    glBindAttribLocation(_programProject, ATTRIB_VERTEX, "position");
    glBindAttribLocation(_programProject, ATTRIB_TEXCOORD, "texcoord");
    
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
    _paintMVPMatrixUniform = glGetUniformLocation(_programProject, "paintMVPMatrix");
    _baseTextureUniform = glGetUniformLocation(_programProject, "inputImageTexture");
    _paintTextureUniform = glGetUniformLocation(_programProject, "inputPaintTexture"); 
    _baseTexScaleUniform = glGetUniformLocation(_programProject, "fBaseTexScale"); 
    _paintTexScaleUniform = glGetUniformLocation(_programProject, "fPaintTexScale");     
    
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

#pragma mark- 拍照 Take Photo 
- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                   usingDelegate: (id <UIImagePickerControllerDelegate,
                                                   UINavigationControllerDelegate>) ctrlDelegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera] == NO)
        || (ctrlDelegate == nil)
        || (controller == nil))
        return NO;
    
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // Displays a control that allows the user to choose picture or
    // movie capture, if both are available:
//    cameraUI.mediaTypes =
//    [UIImagePickerController availableMediaTypesForSourceType:
//     UIImagePickerControllerSourceTypeCamera];
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
    
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    cameraUI.allowsEditing = NO;
    
    cameraUI.showsCameraControls = YES;
    
    //添加自定义信息层
//    CameraOverlayViewController* overlayViewController = [[CameraOverlayViewController alloc] initWithNibName:@"CameraOverlayViewController" bundle:nil];  
    CameraOverlayViewController* overlayViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"CameraOverlayViewController"];
    
    overlayViewController.view.backgroundColor = [UIColor clearColor];//设定透明背景色  
    
    cameraUI.cameraOverlayView = overlayViewController.view;
    
    cameraUI.delegate = ctrlDelegate;
//    [self addChildViewController:cameraUI];
    
    [controller presentModalViewController: cameraUI animated: YES];
    return YES;
}
#pragma mark- 取图片 UIImagePickerControllerDelegate  
// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {

    [self dismissModalViewControllerAnimated: YES];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave, *PaintBgImage;
    
    // Handle a still image capture
    if (CFStringCompare ((__bridge CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        //获得图像
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        //设置图像为背景并保存
        NSString* bgImageName ;
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            
            //记录照相时的参数
            if (picker.cameraOverlayView!=NULL) {
                CameraOverlayView* camOverlayView = (CameraOverlayView*)picker.cameraOverlayView;
                _camShotPitch = camOverlayView.shotPitch;
                NSLog(@"Cam Shot Pitch Radian:%.3f", _camShotPitch);
                //        [delegate stopDetectCameraMotion];
            }
            
            // Save the new image (original or edited) to the Camera Roll
//            ALAssetsLibrary* library = [[ALAssetsLibrary alloc]init];
//            [library writeImageToSavedPhotosAlbum:imageToSave.CGImage orientation:ALAssetOrientationUp completionBlock:^(NSURL *assetURL, NSError *error){
//                if (error) {
//                    NSLog(@"error");
//                }
//                else {
//                    NSString* imageURL = [NSString stringWithFormat:@"%@",assetURL];                    
//                    NSLog(@"url %@", imageURL);
//                }
//            }];
//            library = nil;
            


            [self dismissModalViewControllerAnimated: YES];            
            
//            PaintBgImage = imageToSave;
            //portrait mode rotate photo 90 degree
//            PaintBgImage = [[UIImage alloc] initWithCGImage: imageToSave.CGImage scale: 1.0 orientation: UIImageOrientationLeft];   
        }
        else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
//            PaintBgImage = imageToSave;
            if (self.popoverController) {
                [self.popoverController dismissPopoverAnimated:true];
            }            
        }
        
        //将照相机的摄像结果保存到Document目录中
        bgImageName = [NSString stringWithFormat:@"Image_%d.jpg", imageToSave.hash];
        [Ultility saveUIImage:imageToSave ToJPGInDocument:bgImageName];
        
        //调整照片，显示在背景底图
        PaintBgImage = [Ultility resizeImage:imageToSave toSize:_paintView.frame.size];
        [_paintView setBackgroundUIImage:PaintBgImage];
        
        //保存背景名，保存到plist中
//        NSString* bgImagePath = [Ultility getPathInApp:bgImageName];
        _paintView.paintFrame.bgImageName = bgImageName;
        [delegate paintBGChanged:bgImageName];
    }
}

- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) ctrlDelegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (ctrlDelegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
        imagePicker.allowsEditing = NO;
        imagePicker.delegate = self;
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        self.popoverController = popover;
        //popoverController.delegate = self;
        
        [popover presentPopoverFromRect:CGRectMake(0, 0, 1, 1) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        return YES;
    }else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Error accessing photo library!" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
        return NO;
    }

}


@end
