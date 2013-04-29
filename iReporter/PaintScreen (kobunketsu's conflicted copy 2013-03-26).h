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

typedef NS_ENUM(NSInteger, PaintScreenViewState) {
    Painting,
    PreviewBrush,
    EditingBrush,
    EditingBrushSize,
    EditingBrushOpacity,
    EditingColorPicker,
    EditingColorSlot,
};

@protocol PaintScreenDelegate
- (void) createPaintScreenEAGleContext:(PaintScreen*)paintScreen;
- (void) closePaintFrame:(PaintFrame*)paintFrame;
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
PaintProjectViewControllerDelegate
>
{
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

    PaintScreenViewState _viewState;
    
    BOOL    _redoEnable;
 
    BOOL    _colorPickerViewHiddenTemp;
    
    //手势
    int _LongPressGRColorSlotCount;     //记录双指长按
    
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
- (IBAction)handlePanBrushToolBar:(UIPanGestureRecognizer *)sender;
- (IBAction)editBrush:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *layerButtonTapped;
- (IBAction)fingerButtonTapped:(BrushTypeButton *)sender;
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
@property (strong, nonatomic) IBOutlet BrushTypeButton *brushSecButton;
@property (strong, nonatomic) IBOutlet UIButton *btnRedo;
@property (strong, nonatomic) IBOutlet UndoButton *btnUndo;
@property (strong, nonatomic) IBOutlet BrushView *brushView;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrBrushView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pgrPaintView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *pgrBrushView;
@property (strong, nonatomic) IBOutletCollection(UILongPressGestureRecognizer) NSArray *lpgrColorSlots;
@property (strong, nonatomic) IBOutletCollection(SelectColorButton) NSArray *colorButtons;
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
@property (strong, nonatomic) IBOutlet UIView *debugView;
@property (strong, nonatomic) IBOutlet UIView *debugView2;
@property (strong, nonatomic) UIPopoverController *popoverController;
@property (strong, nonatomic) IBOutlet InfColorPickerIndicatorMagnify *colorPickerIndicatorMagnify;
@property (strong, nonatomic) IBOutlet UISlider *radiusSlider;
@property (strong, nonatomic) IBOutlet UIButton *eyeDropperButton;


- (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName;
- (GLKTextureInfo *)loadTextureInfoFromCGImageRef:(CGImageRef)cgImage;

- (void)setupSaveTextureMatrix;
//- (void)selectLayerContent:(NSString*)imageName;
@end
