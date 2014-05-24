//
//  PaintScreen.h
//  PaintProjector
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
#import "AnchorView.h"
#import "BrushView.h"
#import "ColorButton.h"
#import "ColorSaveToSlotView.h"
#import "RadiusSlider.h"
#import "RadiusButton.h"
#import "TopToolBar.h"
#import "DownToolBar.h"
#import "RadiusIndicatorView.h"
#import "EyeDropperButton.h"
#import "SelectBrushButton.h"
#import "InfColorPickerController.h"
#import "InfColorBarPicker.h"
#import "InfColorSquarePicker.h"
#import "InfColorPickerIndicatorMagnify.h"
#import "EyeDropperIndicatorView.h"
#import "UndoButton.h"
#import "RedoButton.h"
#import "ClearButton.h"
#import "BrushToolBar.h"

//Other ViewController
//#import "CylinderProjectViewController.h"
//@class PaintView;
#import "PaintingView.h"
#import "BrushTypeButton.h"
#import "BrushPropertyViewController.h"
#import "PaintColorButton.h"
#import "BrushTypeScrollView.h"
#import "ColorPickerView.h"
#import "OpacitySlider.h"
//Object
#import "Brush.h"
#import "Pencil.h"
#import "Eraser.h"
#import "Pen.h"
#import "Marker.h"
#import "Finger.h"
#import "ChineseBrush.h"
#import "Crayons.h"
#import "Bucket.h"
#import "InkPen.h"
#import "MarkerSquare.h"
#import "OilBrush.h"
#import "AirBrush.h"
#import "Chalk.h"
#import "EyeDropper.h"
//help method
#import "Ultility.h"
#import "ShaderManager.h"
@class CustomTouchUIView;
//File
@class PaintDoc;
@class LayerManagerView;//to delete
#import "LayerTableViewController.h"
#import "LayerBlendModeTableViewController.h"
#import "ImportTableViewController.h"
#import "ExportTableViewController.h"
#import "BrushTypeViewController.h"
#import "SharedPopoverController.h"
#import "AutoRotateButton.h"
#import "ClearGestureRecognizer.h"
#import "InAppPurchaseTableViewController.h"
#import "SwatchManagerViewController.h"
#import "SwatchManagerButton.h"

#import "BackgroundLayer.h"
@class TransformContentView;
@class TransformAnchorView;

//记录各种状态
typedef NS_ENUM(NSInteger, PaintScreenViewState) {
    PaintScreen_Normal              = 0,
    PaintScreen_PreviewBrush        = 1 <<  0,
    PaintScreen_SelectBrush         = 1 <<  1,
    PaintScreen_EditingBrushSize    = 1 <<  2,
    PaintScreen_EditingBrushOpacity = 1 <<  3,
    PaintScreen_PickColor           = 1 <<  4,
    PaintScreen_EditingLayer        = 1 <<  5,
    PaintScreen_Transform           = 1 <<  6,
};

typedef NS_ENUM(NSInteger, TransformImageState) {
    TransformImage_Free,
    TransformImage_Move,
    TransformImage_Rotate,
    TransformImage_Scale,
};

typedef NS_ENUM(NSInteger, ScaleMode) {
    ScaleMode_None,
    ScaleMode_X,
    ScaleMode_Y,
    ScaleMode_XX,
    ScaleMode_XY,
};

@protocol PaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup;
- (void) closePaintDoc:(PaintDoc*)paintDoc;
//- (void) paintBGChanged:(NSString*)bgImageName;
//- (void) stopDetectCameraMotion;

@end

@interface PaintScreen : UIViewController
<UIGestureRecognizerDelegate, 
UIPopoverControllerDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
MFMailComposeViewControllerDelegate,
UIPrintInteractionControllerDelegate,
UIScrollViewDelegate,
UIAlertViewDelegate,
PaintingViewDelegate,
BrushTypeScrollViewDelegate, 
LayerTableViewControllerDelegate,
BrushPropertyViewControllerDelegate,
InfColorPickerControllerDelegate,
FuzzyTransparentViewDelegate,
InAppPurchaseTableViewControllerDelegate,
SwatchManagerViewControllerDelegate,
BackgroundLayerDelegate
>
{
    //变换
    TransformImageState _transformImageState;
    CGPoint _transformAnchor;
    float _transformPointToAnchorLength;
    float _transformPointToAnchorArc;
    CGPoint _twoFingerCenterBegan;
    float _twoFingerDistanceBegan;
    GLKVector2 _twoFingerVecBegan;
    GLKVector2 _twoFingerVecLast;
    float _twoFingerAngleBegan;
    
    BOOL    _colorSlotsViewHidden;    
    
    //手势
    int _LongPressGRColorSlotCount;     //记录双指长按
    
    //图层
    dispatch_queue_t _uploadDataQueque;//在打开图层时更新显示的线程
}

@property (assign, nonatomic) id delegate;
@property (retain, nonatomic) PaintDoc *paintDoc;

//Interface Builder
@property (weak, nonatomic) IBOutlet UIView *testOpenGLView;
@property (weak, nonatomic) IBOutlet ColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet PaintColorButton *paintColorButton;
//@property (weak, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGRPaintView;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrPaintView;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgr2TouchesRootCanvasView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR3Touches1TapsRootCanvasView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR1Touches1TapsPaintView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR1Touches2TapsRootCanvasView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR2Touches2TapsRootCanvasView;
@property (weak, nonatomic) IBOutlet PaintingView *paintView;
@property (weak, nonatomic) IBOutlet UIView *brushTypeView;
@property (weak, nonatomic) IBOutlet BrushTypeScrollView *brushTypeScrollView;
@property (weak, nonatomic) IBOutlet UILabel *lblBrushRadius;
@property (weak, nonatomic) IBOutlet UILabel *lblBrushOpacity;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnAction;
@property (weak, nonatomic) IBOutlet BrushTypeButton *brushButton;
@property (weak, nonatomic) IBOutlet BrushTypeButton *brushBackButton;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrBrushButton;
@property (weak, nonatomic) BrushPropertyViewController *brushPropertyViewController;
@property (weak, nonatomic) IBOutlet ClearButton *clearButton;
@property (weak, nonatomic) IBOutlet UIView *clearEffectView;
@property (weak, nonatomic) IBOutlet BrushView *brushView;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrBrushView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgrRootCanvasView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgr1TouchesPaintView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgr2TouchesRootCanvasView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgr3TouchesRootCanvasView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgrBrushView;
@property (weak, nonatomic) IBOutletCollection(UILongPressGestureRecognizer) NSArray *lpgrColorSlots;
@property (weak, nonatomic) IBOutlet BrushToolBar *pencilBrushToolBar;
@property (weak, nonatomic) IBOutlet BrushToolBar *airBrushToolBar;
@property (weak, nonatomic) IBOutletCollection(UIView) NSArray *paintUISecCollection;
@property (weak, nonatomic) IBOutletCollection(UIView) NSArray *paintUIDefaultCollection;

//InfColorPickerController 
@property( weak, nonatomic ) IBOutlet InfColorBarView* barView;
@property( weak, nonatomic ) IBOutlet InfColorSquareView* squareView;
@property( weak, nonatomic ) IBOutlet InfColorBarPicker* barPicker;
@property( weak, nonatomic ) IBOutlet InfColorSquarePicker* squarePicker;
//paintViewRef
@property (weak, nonatomic) IBOutlet UIButton *btnPaint;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet ColorSaveToSlotView *colorSaveToSlotView;
@property (weak, nonatomic) IBOutlet UIView *brushOpacityView;
@property (weak, nonatomic) IBOutlet UIView *paintColorView;
@property (weak, nonatomic) IBOutlet SwatchManagerButton *swatchManagerButton;
@property (weak, nonatomic) IBOutlet OpacitySlider *opacitySlider;
@property (weak, nonatomic) IBOutlet DownToolBar *paintToolBar;
@property (weak, nonatomic) IBOutlet UIView *paintToolView;
//@property (weak, nonatomic) IBOutlet DownToolBar *brushTypeBar;
@property (weak, nonatomic) IBOutlet UIPageControl *brushTypePageControl;
@property (weak, nonatomic) IBOutlet UIView *brushDetailView;
@property (weak, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UIView *rootCanvasView;
@property (weak, nonatomic) IBOutlet UIView *debugView;
@property (weak, nonatomic) IBOutlet UIView *debugView2;
@property (weak, nonatomic) IBOutlet InfColorPickerIndicatorMagnify *colorPickerIndicatorMagnify;
@property (weak, nonatomic) IBOutlet EyeDropperIndicatorView *eyeDropperIndicatorView;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;
@property (weak, nonatomic) IBOutlet EyeDropperButton *eyeDropperButton;
@property (weak, nonatomic) IBOutlet UIScrollView *colorSlotsScrollView;
@property (weak, nonatomic) IBOutlet UIButton *layerButton;

@property (weak, nonatomic) IBOutlet UIButton *fullScreenReverseButton;
@property (weak, nonatomic) IBOutlet UIButton *transformButton;
@property (weak, nonatomic) IBOutlet UIButton *projectButton;
@property (weak, nonatomic) IBOutlet UIButton *importButton;
@property (weak, nonatomic) IBOutlet UIButton *exportButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelTransformButton;
@property (weak, nonatomic) IBOutlet UIButton *freeTransformButton;
@property (weak, nonatomic) IBOutlet UIButton *moveTransformButton;
@property (weak, nonatomic) IBOutlet UIButton *rotateTransformButton;
@property (weak, nonatomic) IBOutlet UIButton *scaleTransformButton;
@property (weak, nonatomic) IBOutlet UIButton *transformDoneButton;
@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray *transformToolButtons;
@property (weak, nonatomic) IBOutlet UIView *lockCanvasRotationView;
@property (weak, nonatomic) IBOutlet UIView *zoomCanvasView;
@property (weak, nonatomic) IBOutlet UILabel *zoomCanvasLabel;
@property (weak, nonatomic) IBOutlet UIView *rotateCanvasView;
@property (weak, nonatomic) IBOutlet UILabel *rotateCanvasLabel;
@property (weak, nonatomic) IBOutlet TopToolBar *transformToolBar;
@property (weak, nonatomic) IBOutlet TopToolBar *mainToolBar;
@property (weak, nonatomic) IBOutlet AnchorView *anchorView;
//@property (weak, nonatomic) IBOutlet UIScrollView *radiusScrollView;
@property (weak, nonatomic) IBOutlet RadiusIndicatorView *radiusIndicatorView;
@property (weak, nonatomic) IBOutlet RedoButton *redoButton;
@property (weak, nonatomic) IBOutlet UndoButton *undoButton;
@property (strong, nonatomic) IBOutletCollection(AutoRotateButton) NSArray *autoRotateButtons;
@property (strong, nonatomic) IBOutletCollection(AutoRotateButton) NSArray *topToolBarButtons;
@property (retain, nonatomic) SwatchManagerViewController *swatchManagerVC;

- (IBAction)handlePanPaintColorButton:(UIPanGestureRecognizer *)sender;
- (IBAction)handlePinchRootView:(UIPinchGestureRecognizer *)sender;
- (IBAction)handlePanRootView:(UIPanGestureRecognizer *)sender;
- (IBAction)handleLongPressPaintView:(UILongPressGestureRecognizer *)sender;
- (IBAction)handleLongPress2TouchesRootCanvasView:(UILongPressGestureRecognizer *)sender;
//- (IBAction)handleSwipeGRRootView:(UISwipeGestureRecognizer *)sender;
- (IBAction)handleLongPressColorSlot:(UILongPressGestureRecognizer *)sender;
- (IBAction)handlePanBrushView:(UIPanGestureRecognizer *)sender;
- (IBAction)handleTapBrushView:(UITapGestureRecognizer *)sender;
- (IBAction)handleTap1Touches1TapsPaintView:(UITapGestureRecognizer *)sender;
- (IBAction)handleTap1Touches2TapsRootCanvasView:(UITapGestureRecognizer *)sender;
- (IBAction)handleTap2Touches2TapsRootCanvasView:(UITapGestureRecognizer *)sender;
- (IBAction)handleTap3Touches1TapsRootCanvasView:(UITapGestureRecognizer *)sender;
- (IBAction)handleLongPressPaintColorButton:(UILongPressGestureRecognizer *)sender;
- (IBAction)handlePanTopDownToolBar:(UIPanGestureRecognizer *)sender;

//- (IBAction)handlePanBrushToolBar:(UIPanGestureRecognizer *)sender;
- (IBAction)brushTypeBackButtonTouchUp:(UIButton *)sender;
- (IBAction)brushTypeBackButtonTouchCancel:(UIButton *)sender;
- (IBAction)importButtonTapped:(UIButton *)sender;
- (IBAction)exportButtonTapped:(UIButton *)sender;
- (IBAction)selectColor:(ColorButton *)sender;
- (IBAction)selectColorConfirmed:(ColorButton *)sender;
- (IBAction)selectBrushRadius:(RadiusButton *)sender;
- (IBAction)slideBrushRadius:(UISlider *)sender;
- (IBAction)radiusSliderTouchUpOutside:(RadiusSlider *)sender;
- (IBAction)radiusSliderTouchDown:(RadiusSlider *)sender;
- (IBAction)radiusSliderTouchUp:(RadiusSlider *)sender;
- (IBAction)slideBrushOpacity:(UISlider *)sender;
- (IBAction)brushTypeButtonTouchUp:(UIButton *)sender;
- (IBAction)brushTypeButtonTouchDown:(UIButton *)sender;
- (IBAction)brushTypeButtonTouchCancel:(UIButton *)sender;
- (IBAction)brushTypePageControlValueChanged:(UIPageControl *)sender;
- (IBAction)touchUpInsideUndoButton:(UndoButton *)sender;
- (IBAction)touchUpInsideRedoButton:(UIButton *)sender;
- (IBAction)syncBrushView:(id)sender;
- (IBAction)showPaint:(id)sender;
- (IBAction)colorSlotsSwitchTapped:(UIButton *)sender;
- (IBAction)colorPickerSwitchTapped:(UIButton *)sender;
- (IBAction)paintColorButtonTouchUp:(UIButton *)sender;

//InfColorPicker
- (IBAction)takeBarValue: (InfColorBarPicker*) sender;
- (IBAction)takeSquareValue: (InfColorSquarePicker*) sender;

- (IBAction)debugButtonTapped:(UIButton *)sender;
- (IBAction)takePhotoButtonTapped:(id)sender;
- (IBAction)pickPhotoButtonTapped:(id)sender;
- (IBAction)clearButtonTouchUp:(ClearButton *)sender;
- (IBAction)clearButtonTouchDown:(ClearButton *)sender;
//- (IBAction)clearButtonTouchCancel:(ClearButton *)sender;
- (IBAction)eyeDropperButtonTouchDown:(UIButton *)sender;
- (IBAction)eyeDropperButtonTouchUp:(UIButton *)sender;
- (IBAction)eyeDropperButtonTouchCancel:(UIButton *)sender;
- (IBAction)saveToDocButtonTapped:(UIButton *)sender;
- (IBAction)saveAndCloseButtonTapped:(UIButton *)sender;
- (IBAction)projectPaintButtonTapped:(UIButton *)sender;
- (IBAction)fullScreenButtonTouchUp:(UIButton *)sender;
- (IBAction)layerButtonTapped:(UIButton *)sender;
- (IBAction)transformButtonTapped:(id)sender;
- (IBAction)transformDoneButtonTapped:(UIButton *)sender;
- (IBAction)tranformCancelButtonTapped:(UIButton *)sender;
- (IBAction)freeTransformButtonTapped:(UIButton *)sender;
- (IBAction)moveButtonTapped:(UIButton *)sender;
- (IBAction)rotateButtonTapped:(UIButton *)sender;
- (IBAction)scaleButtonTapped:(UIButton *)sender;
- (IBAction)customLayerButtonTouchDown:(AutoRotateButton *)sender;

#pragma mark- 
- (void)prepareForPresentation;
- (void)afterPresentation;
- (void)openDoc:(PaintDoc*)paintDoc;
#pragma test

@end
