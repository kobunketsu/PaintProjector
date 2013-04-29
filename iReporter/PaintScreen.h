//
//  PaintScreen.h
//  iReporter
//
//  Created by 文杰 胡 on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

//名称:
//描述:
//功能:

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MessageUI/MessageUI.h>
//UI
#import "BrushView.h"
#import "SelectColorButton.h"
#import "SelectBrushButton.h"
#import "InfColorPickerController.h"
#import "InfColorBarPicker.h"
#import "InfColorSquarePicker.h"
#import "InfColorPickerIndicatorMagnify.h"
#import "UndoGestureRecognizer.h"
#import "UndoButton.h"
#import "BrushToolBar.h"
//#import "GLProgram.h"
#import "ShowPaintOnPlane.h"
#import "ShowPaintOnPlaneViewController.h"
#import "PaintProjectView.h"
#import "PaintProjectViewController.h"
//Other ViewController
#import "SelectLayerContentViewController.h"
#import "PaintProjectViewController.h"
//@class PaintView;
#import "PaintingView.h"
#import "BrushTypeButton.h"
#import "BrushTypeView.h"
#import "ColorPickerView.h"
//Object
#import "Brush.h"
#import "Pen.h"
#import "Pencil.h"
#import "Chalk.h"
#import "Finger.h"
#import "EyeDropper.h"
//help method
#import "Ultility.h"
#import "ShaderUltility.h"
#import "HandleGestureRecognizer.h"
@class CustomTouchUIView;
#import "MainScreenViewController.h"
#import "CameraOverlayView.h"
#import "CameraOverlayViewController.h"
//File
@class PaintDoc;
@class LayerManagerView;
#import "LayerBlendModeTableViewController.h"
#import "ImportViewController.h"
#import "ExportViewController.h"
//记录各种状态
typedef NS_ENUM(NSInteger, PaintScreenViewState) {
    PaintScreen_Normal,
    PaintScreen_PreviewBrush,
    PaintScreen_EditingBrush,
    PaintScreen_EditingBrushSize,
    PaintScreen_EditingBrushOpacity,
    PaintScreen_PickColor,
    PaintScreen_EditingLayer,
    PaintScreen_TransformImage,
};

typedef NS_ENUM(NSInteger, TransformImageState) {
    TransformImage_Free,
    TransformImage_Move,
    TransformImage_Rotate,
    TransformImage_Scale,
};

@protocol PaintScreenDelegate
- (void) createPaintScreenEAGleContext:(PaintScreen*)paintScreen;
- (void) closePaintDoc:(PaintDoc*)paintDoc;
- (void) paintBGChanged:(NSString*)bgImageName;
- (void) stopDetectCameraMotion;

@end

@interface PaintScreen : UIViewController
<UIGestureRecognizerDelegate, 
GLKViewDelegate, 
GLKViewControllerDelegate,
UIImagePickerControllerDelegate, 
UINavigationControllerDelegate,
MFMailComposeViewControllerDelegate,
UIPrintInteractionControllerDelegate,
PaintingViewDelegate, 
BrushDelegate, 
BrushTypeViewDelegate, 
SelectLayerContentDelegate,
MainScreenViewControllerDelegate,
PaintProjectViewControllerDelegate,
LayerBlendModeTableViewControllerDelegate
>
{
    //文件File
    PaintDoc *_paintDoc;    //当前打开的Doc文件
    
    //painting transfer
    float _camShotPitch;
    
    //controller
    MainScreenViewController* _mainScreenViewController;
    PaintingView * _paintView;
    
    //UI    
    Rubber* _rubber;
    Pencil *_pencil;
    Pen *_pen;    
    Chalk *_chalk;
    Finger *_finger;
    Brush* _curBrush;
    int    _curBrushToolBarIndex;
    EyeDropper *_eyeDropper;
    InfColorPickerController * _infColorPickerController;    

    PaintScreenViewState _state;
    
    //变换
    TransformImageState _transformImageState;
    CGPoint _transformAnchor;
    float _transformPointToAnchorLength;
    float _transformPointToAnchorArc;
    
    BOOL    _redoEnable;
    BOOL    _colorSlotsViewHiddenTemp;
    BOOL    _colorSlotsViewHidden;    
    BOOL    _paintColorViewHiddenTemp;
    BOOL    _brushButtonHiddenTemp;    
    BOOL    _colorPickerViewHiddenTemp;
    
    //手势
    int _LongPressGRColorSlotCount;     //记录双指长按
    NSMutableArray* _LongPressGRColorSlots;
    
    //测试3d效果用
    NSArray*    _imageArray;
    int _currentImageIndex;
    GLKTextureInfo* _paintTextureInfo;
    
    //paintView
    CGFloat currentTranslateX;
    CGFloat currentTranslateY;    
    CGFloat currentScale;  
    CGPoint _scaleAnchorPoint;
    
    //paintViewRef
    GLKViewController *_glkViewController;
    EAGLContext * _context;    
    GLuint _vertexBuffer;
    GLuint _indexBuffer;
    GLuint _vertexArray;
    
    float _rotation;
    float _curViewAngleX;
    float _curViewAngleY;
    float _lastViewAngleX;    
    float _lastViewAngleY;
    float _maxViewAngleX;
    float _minViewAngleY;
    float _paintViewAngleX;
    float _paintViewAngleY;    
    GLKVector3 _eye;
    float realHeight;
    float realWidth;
    float _kHeightScale;
    float _kWidthScale;
    float _eyeToViewCenterDistanceZ;
    float _eyeToPaintViewCenterDistanceZ; 
    GLKMatrix4 _modelViewProjectionMatrix;
    GLKMatrix4 _saveTextureMVPMatrix;//用来记录拉伸texture的    
    GLKMatrix4 _paintMVPMatrix;//用来记录拉伸texture的
    
    GLKTextureInfo * _floorTextureInfo;
//    GLKTextureInfo * _photoTextureInfo;    
    GLuint _modelViewProjMatrixUniform;
    GLuint _baseTextureUniform;    
    GLuint _baseTexScaleUniform;        
    GLuint _paintTextureUniform;
    GLuint _paintTexScaleUniform;    
    GLuint _paintMVPMatrixUniform;    
    GLuint _programProject;
    
    BOOL _isPaintMode;
    BOOL _paintViewConfirmed;

    //save texture render buffer
    GLuint _storeFramebuffer;
    GLuint _storeRenderbuffer;
    UIImage* _paintImageOnPlane;
    
    //layer
//    int _curLayerIndex;             //当前图层索引号
    bool _islayerImageViewMoving;   //手势移动图层
    NSMutableArray* _layerImageViews;//图层集
    float _layerImageViewOriginY;   //图层底中心点Y
    float _layerImageViewHeight;    //图层底高度
    float _layerImageButtonHeight;  //图层按钮高度
    float _layerImageButtonWidth;  //图层按钮宽度
    int   _layerIndexOffset;     //图层拖拽偏移位
    UIPopoverController* _sharedPopoverController;  //图层混合弹出控制器
    
    //import
}

- (IBAction)handlePanPaintColorButton:(UIPanGestureRecognizer *)sender;
- (IBAction)handlePinchPaintRefView:(UIPinchGestureRecognizer *)sender;
- (IBAction)handlePinchPaintView:(UIPinchGestureRecognizer *)sender;
- (IBAction)handlePanPaintRefView:(UIPanGestureRecognizer *)sender;
- (IBAction)handlePanPaintView:(UIPanGestureRecognizer *)sender;
- (IBAction)handleTapPaintView:(UITapGestureRecognizer *)sender;
- (IBAction)handleLongPressPaintView:(UILongPressGestureRecognizer *)sender;
- (IBAction)handleLongPressColorSlot:(UILongPressGestureRecognizer *)sender;
- (IBAction)handlePanBrushView:(UIPanGestureRecognizer *)sender;
- (IBAction)handleTapBrushView:(UITapGestureRecognizer *)sender;
//- (IBAction)handlePanBrushToolBar:(UIPanGestureRecognizer *)sender;
- (IBAction)editBrush:(UIButton *)sender;
- (IBAction)fingerButtonTapped:(UIButton *)sender;
- (IBAction)importButtonTapped:(UIButton *)sender;
- (IBAction)exportButtonTapped:(UIButton *)sender;
- (IBAction)selectColor:(SelectColorButton *)sender;
- (IBAction)selectColorConfirmed:(SelectColorButton *)sender;
- (IBAction)selectBrushRadius:(UIButton *)sender;
- (IBAction)slideBrushRadius:(UISlider *)sender;
- (IBAction)slideBrushOpacity:(UISlider *)sender;
- (IBAction)selectBrushType:(SelectBrushButton *)sender;
- (IBAction)selectRubber:(UIButton *)sender;
- (IBAction)UndoDraw:(UndoButton *)sender;
- (IBAction)touchUpInsideRedoButton:(UIButton *)sender;
- (IBAction)touchUpOutsideUndoButton:(UndoButton *)sender;
- (IBAction)touchUpInsideUndoButton:(UndoButton *)sender forEvent:(UIEvent *)event;
- (IBAction)RedoDraw:(UIButton *)sender;
- (IBAction)showRedoButton:(UndoButton *)sender;
- (IBAction)syncBrushView:(id)sender;
- (IBAction)showPaint:(id)sender;
- (IBAction)showNextImage:(UIBarButtonItem *)sender;
- (IBAction)colorSlotsSwitchTapped:(UIButton *)sender;
- (IBAction)colorPickerSwitchTapped:(UIButton *)sender;

//InfColorPicker
- (IBAction)takeBarValue: (InfColorBarPicker*) sender;
- (IBAction)takeSquareValue: (InfColorSquarePicker*) sender;
- (IBAction)togglePaint:(UIButton *)sender;
- (IBAction)selFloorTexButtonTapped:(UIButton *)sender;
- (IBAction)saveToDiskButtonTapped:(UIButton *)sender;      //转换透视图
- (IBAction)savePaintImageButtonTapped:(UIButton *)sender;

- (IBAction)debugButtonTapped:(UIButton *)sender;
- (IBAction)takePhotoButtonTapped:(id)sender;
- (IBAction)pickPhotoButtonTapped:(id)sender;
- (IBAction)pickImageInApp:(id)sender;
- (IBAction)clearPaintButtonTapped:(id)sender;
- (IBAction)eyeDropperButtonTapped:(id)sender;
- (IBAction)saveToDocButtonTapped:(UIButton *)sender;
- (IBAction)saveAndCloseButtonTapped:(UIButton *)sender;
- (IBAction)projectPaintButtonTapped:(UIButton *)sender;
- (IBAction)layerButtonTapped:(UIButton *)sender;
- (IBAction)createLayerButtonTapped:(UIButton *)sender;
- (IBAction)transformImageDoneTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;
- (IBAction)freeTransformButtonTapped:(UIButton *)sender;
- (IBAction)moveButtonTapped:(UIButton *)sender;
- (IBAction)rotateButtonTapped:(UIButton *)sender;
- (IBAction)scaleButtonTapped:(UIButton *)sender;


@property (nonatomic, assign) id delegate;
@property (retain, nonatomic) MainScreenViewController *mainScreenViewController;
@property (nonatomic, retain) EAGLContext *context;
@property (strong, nonatomic) IBOutlet UIView *testOpenGLView;
@property (strong, nonatomic) IBOutlet ColorPickerView *colorPickerView;
@property (strong, nonatomic) IBOutlet UIButton *paintColor;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrPaintView;
@property (strong, nonatomic) IBOutlet PaintingView *paintView;
@property (strong, nonatomic) IBOutlet BrushTypeView *brushTypeView;
@property (strong, nonatomic) IBOutlet UILabel *lblBrushRadius;
@property (strong, nonatomic) IBOutlet UILabel *lblBrushOpacity;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnAction;
@property (strong, nonatomic) IBOutlet SelectBrushButton *btnBrush;
@property (strong, nonatomic) IBOutlet UIButton *btnRedo;
@property (strong, nonatomic) IBOutlet UndoButton *btnUndo;
@property (strong, nonatomic) IBOutlet BrushView *brushView;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrBrushView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pgrPaintView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pgrBrushView;
@property (strong, nonatomic) IBOutletCollection(UILongPressGestureRecognizer) NSArray *lpgrColorSlots;
@property (strong, nonatomic) IBOutletCollection(SelectColorButton) NSMutableArray *colorButtons;//所有颜色槽
@property (strong, nonatomic) IBOutlet BrushToolBar *pencilBrushToolBar;
@property (strong, nonatomic) IBOutlet BrushToolBar *airBrushToolBar;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *paintUISecCollection;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *paintUIDefaultCollection;
@property (strong, nonatomic) IBOutlet GLKView *paintRefView;
//InfColorPickerController 
@property( retain, nonatomic ) IBOutlet InfColorBarView* barView;
@property( retain, nonatomic ) IBOutlet InfColorSquareView* squareView;
@property( retain, nonatomic ) IBOutlet InfColorBarPicker* barPicker;
@property( retain, nonatomic ) IBOutlet InfColorSquarePicker* squarePicker;
//paintViewRef
@property (strong, nonatomic) IBOutlet UIButton *btnPaint;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pgrPaintRefView;
@property (weak, nonatomic)   IBOutlet UIView *previewToolBar;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *btnRubber;
@property (strong, nonatomic) IBOutlet UIView *colorSlotsView;
@property (strong, nonatomic) IBOutlet UIView *paintColorView;
@property (strong, nonatomic) IBOutlet UIView *paintToolBar;
@property (strong, nonatomic) IBOutlet UIView *brushDetailView;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (strong, nonatomic) IBOutlet UIScrollView *layersScrollView;
@property (strong, nonatomic) IBOutlet LayerManagerView *layersView;
@property (strong, nonatomic) IBOutlet UIView *debugView;
@property (strong, nonatomic) IBOutlet UIView *debugView2;
@property (strong, nonatomic) UIPopoverController *popoverController;
@property (strong, nonatomic) IBOutlet InfColorPickerIndicatorMagnify *colorPickerIndicatorMagnify;
@property (strong, nonatomic) IBOutlet UISlider *radiusSlider;
@property (strong, nonatomic) IBOutlet UIButton *eyeDropperButton;
@property (strong, nonatomic) IBOutlet UIButton *createLayerButton;
@property (strong, nonatomic) IBOutlet UIScrollView *colorSlotsScrollView;
@property (strong, nonatomic) IBOutlet UIButton *layerButton;
@property (strong, nonatomic) IBOutlet UIButton *projectButton;
@property (strong, nonatomic) IBOutlet UIButton *importButton;
@property (strong, nonatomic) IBOutlet UIButton *exportButton;
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelTransformButton;
@property (strong, nonatomic) IBOutlet UIButton *freeTransformButton;
@property (strong, nonatomic) IBOutlet UIButton *moveTransformButton;
@property (strong, nonatomic) IBOutlet UIButton *rotateTransformButton;
@property (strong, nonatomic) IBOutlet UIButton *scaleTransformButton;
@property (strong, nonatomic) IBOutlet UIButton *transformDoneButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *transformToolButtons;
@property (strong, nonatomic) IBOutlet UIView *transformToolBar;
@property (strong, nonatomic) IBOutlet UIView *mainToolBar;
@property (strong, nonatomic) IBOutlet UIView *anchorView;


- (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName;
- (GLKTextureInfo *)loadTextureInfoFromCGImageRef:(CGImageRef)cgImage;

- (void)setupSaveTextureMatrix;
//- (void)selectLayerContent:(NSString*)imageName;
- (int)curLayerIndex;

- (void)setCurLayerIndex:(int)newValue;

@end
