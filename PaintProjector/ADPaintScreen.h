//
//  PaintScreen.h
//  AnaDraw
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
#import "ADAnchorView.h"
#import "ADBrushView.h"
#import "ADColorButton.h"
#import "ADColorSaveToSlotView.h"
#import "ADRadiusSlider.h"
#import "ADRadiusButton.h"
#import "ADTopToolBar.h"
#import "ADDownToolBar.h"
#import "ADRadiusIndicatorView.h"
#import "ADOpacityIndicatorView.h"
#import "ADEyeDropperButton.h"
#import "ADSelectBrushButton.h"
#import "InfColorPickerController.h"
#import "InfColorBarPicker.h"
#import "InfColorSquarePicker.h"
#import "InfColorPickerIndicatorMagnify.h"
#import "ADEyeDropperIndicatorView.h"
#import "ADUndoButton.h"
#import "ADRedoButton.h"
#import "ADClearButton.h"
#import "ADBrushToolBar.h"
#import "ADLayerButton.h"
#import "BrushTypePageControl.h"

//Other ViewController
//#import "CylinderProjectViewController.h"
//@class PaintView;
#import "ADPaintView.h"
#import "ADBrushTypeButton.h"
#import "ADBrushPropertyViewController.h"
#import "ADPaintColorButton.h"
#import "ADBrushTypeScrollView.h"
#import "ADColorPickerView.h"
#import "ADOpacitySlider.h"
//Object
#import "ADBrush.h"
#import "ADPencil.h"
#import "ADEraser.h"
#import "ADPen.h"
#import "ADMarker.h"
#import "ADFinger.h"
#import "ADChineseBrush.h"
#import "ADCrayons.h"
#import "ADBucket.h"
#import "AdInkPen.h"
#import "ADMarkerSquare.h"
#import "ADOilBrush.h"
#import "ADAirBrush.h"
#import "ADChalk.h"
#import "ADEyeDropper.h"
//help method
#import "ADUltility.h"
@class ADCustomTouchUIView;
//File
@class ADPaintDoc;
@class ADLayerManagerView;//to delete
#import "ADLayerTableViewController.h"
#import "ADLayerBlendModeTableViewController.h"
#import "ADImportTableViewController.h"
#import "ADExportTableViewController.h"
#import "ADBrushTypeViewController.h"
#import "ADSharedPopoverController.h"
#import "ADAutoRotateButton.h"
#import "ADClearGestureRecognizer.h"
#import "ADInAppPurchaseTableViewController.h"
#import "ADSwatchManagerViewController.h"
#import "ADSwatchManagerButton.h"

#import "ADBackgroundLayer.h"
@class ADTransformContentView;
@class ADTransformAnchorView;

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

@protocol ADPaintScreenDelegate
- (EAGLContext*) createEAGleContextWithShareGroup;
- (void) willPaintScreenDissmissWithPaintDoc:(ADPaintDoc*)paintDoc;
- (void) willPaintScreenDissmissDoneWithPaintDoc:(ADPaintDoc*)paintDoc;
//- (void) paintBGChanged:(NSString*)bgImageName;
//- (void) stopDetectCameraMotion;

@end

@interface ADPaintScreen : UIViewController
<UIGestureRecognizerDelegate, 
UIPopoverControllerDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
MFMailComposeViewControllerDelegate,
UIPrintInteractionControllerDelegate,
UIScrollViewDelegate,
UIAlertViewDelegate,
ADPaintingViewDelegate,
ADBrushTypeScrollViewDelegate,
ADLayerTableViewControllerDelegate,
ADBrushPropertyViewControllerDelegate,
InfColorPickerControllerDelegate,
ADFuzzyTransparentViewDelegate,
ADInAppPurchaseTableViewControllerDelegate,
ADSwatchManagerViewControllerDelegate,
ADBackgroundLayerDelegate,
BrushTypePageControlDelegate
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
@property (retain, nonatomic) ADPaintDoc *paintDoc;

//Interface Builder
@property (weak, nonatomic) IBOutlet ADColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet ADPaintColorButton *paintColorButton;
//@property (weak, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGRPaintView;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrPaintView;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgr2TouchesRootCanvasView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR3Touches1TapsRootCanvasView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR1Touches1TapsPaintView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR1Touches2TapsRootCanvasView;
@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *tapGR2Touches2TapsRootCanvasView;
@property (weak, nonatomic) IBOutlet ADPaintView *paintView;
@property (weak, nonatomic) IBOutlet UIView *brushTypeView;
@property (weak, nonatomic) IBOutlet ADBrushTypeScrollView *brushTypeScrollView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnAction;
@property (weak, nonatomic) IBOutlet ADBrushTypeButton *brushButton;
@property (weak, nonatomic) IBOutlet ADBrushTypeButton *brushBackButton;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrBrushButton;
@property (weak, nonatomic) ADBrushPropertyViewController *brushPropertyViewController;
@property (weak, nonatomic) IBOutlet ADClearButton *clearButton;
@property (weak, nonatomic) IBOutlet UIView *clearEffectView;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *lpgrBrushView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgrRootCanvasView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgr1TouchesPaintView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgr2TouchesRootCanvasView;
@property (weak, nonatomic) IBOutlet UIPanGestureRecognizer *pgr3TouchesRootCanvasView;
@property (weak, nonatomic) IBOutletCollection(UIView) NSArray *paintUISecCollection;
@property (weak, nonatomic) IBOutletCollection(UIView) NSArray *paintUIDefaultCollection;

//InfColorPickerController 
@property( weak, nonatomic ) IBOutlet InfColorBarView* barView;
@property( weak, nonatomic ) IBOutlet InfColorSquareView* squareView;
@property( weak, nonatomic ) IBOutlet InfColorBarPicker* barPicker;
@property( weak, nonatomic ) IBOutlet InfColorSquarePicker* squarePicker;
//paintViewRef
@property (weak, nonatomic) IBOutlet ADColorSaveToSlotView *colorSaveToSlotView;
@property (weak, nonatomic) IBOutlet UIView *brushOpacityView;
@property (weak, nonatomic) IBOutlet UIView *paintColorView;
@property (weak, nonatomic) IBOutlet ADSwatchManagerButton *swatchManagerButton;
@property (weak, nonatomic) IBOutlet ADOpacitySlider *opacitySlider;
@property (weak, nonatomic) IBOutlet ADDownToolBar *paintToolBar;
@property (weak, nonatomic) IBOutlet UIView *paintToolView;
//@property (weak, nonatomic) IBOutlet DownToolBar *brushTypeBar;
@property (weak, nonatomic) IBOutlet BrushTypePageControl *brushTypePageControl;
@property( weak, nonatomic) IBOutlet UIButton* previousBrushTypePageButton;
@property( weak, nonatomic) IBOutlet UIButton* nextBrushTypePageButton;
@property (weak, nonatomic) IBOutlet UIView *brushDetailView;
@property (weak, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) IBOutlet UIView *rootCanvasView;
@property (weak, nonatomic) IBOutlet InfColorPickerIndicatorMagnify *colorPickerIndicatorMagnify;
@property (weak, nonatomic) IBOutlet ADEyeDropperIndicatorView *eyeDropperIndicatorView;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;
@property (weak, nonatomic) IBOutlet ADEyeDropperButton *eyeDropperButton;
@property (weak, nonatomic) IBOutlet UIScrollView *colorSlotsScrollView;
@property (weak, nonatomic) IBOutlet UIButton *layerButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *fullScreenButtons;

@property (weak, nonatomic) IBOutlet UIButton *transformButton;
@property (weak, nonatomic) IBOutlet UIButton *importButton;
@property (weak, nonatomic) IBOutlet UIButton *exportButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIView *lockCanvasRotationView;
@property (weak, nonatomic) IBOutlet UIView *zoomCanvasView;
@property (weak, nonatomic) IBOutlet UILabel *zoomCanvasLabel;
@property (weak, nonatomic) IBOutlet UIView *rotateCanvasView;
@property (weak, nonatomic) IBOutlet UILabel *rotateCanvasLabel;
@property (weak, nonatomic) IBOutlet ADTopToolBar *mainToolBar;
@property (weak, nonatomic) IBOutlet ADAnchorView *anchorView;
//@property (weak, nonatomic) IBOutlet UIScrollView *radiusScrollView;
@property (weak, nonatomic) IBOutlet ADRadiusIndicatorView *radiusIndicatorView;
@property (weak, nonatomic) IBOutlet ADOpacityIndicatorView *opacityIndicatorView;
@property (weak, nonatomic) IBOutlet ADRedoButton *redoButton;
@property (weak, nonatomic) IBOutlet ADUndoButton *undoButton;
@property (strong, nonatomic) IBOutletCollection(ADAutoRotateButton) NSArray *autoRotateButtons;
@property (strong, nonatomic) IBOutletCollection(ADAutoRotateButton) NSArray *topToolBarButtons;
@property (retain, nonatomic) ADSwatchManagerViewController *swatchManagerVC;
@property (retain, nonatomic) UIImagePickerController *cameraImagePickerVC;

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
- (IBAction)importButtonTouchUp:(UIButton *)sender;
- (IBAction)exportButtonTouchUp:(UIButton *)sender;
- (IBAction)selectColor:(ADColorButton *)sender;
- (IBAction)selectColorConfirmed:(ADColorButton *)sender;
- (IBAction)selectBrushRadius:(ADRadiusButton *)sender;
- (IBAction)slideBrushRadius:(UISlider *)sender;
- (IBAction)radiusSliderTouchUpOutside:(ADRadiusSlider *)sender;
- (IBAction)radiusSliderTouchDown:(ADRadiusSlider *)sender;
- (IBAction)radiusSliderTouchUp:(ADRadiusSlider *)sender;
- (IBAction)slideBrushOpacity:(UISlider *)sender;
- (IBAction)opacitySliderTouchUpOutside:(ADOpacitySlider *)sender;
- (IBAction)opacitySliderTouchDown:(ADOpacitySlider *)sender;
- (IBAction)opacitySliderTouchUp:(ADOpacitySlider *)sender;
- (IBAction)brushTypeButtonTouchUp:(UIButton *)sender;
- (IBAction)brushTypeButtonTouchDown:(UIButton *)sender;
- (IBAction)brushTypeButtonTouchCancel:(UIButton *)sender;
- (IBAction)brushTypePageControlValueChanged:(UIPageControl *)sender;
- (IBAction)previousBrushTypePageButtonTouchUp:(UIButton *)sender;
- (IBAction)nextBrushTypePageButtonTouchUp:(UIButton *)sender;
- (IBAction)touchUpInsideUndoButton:(ADUndoButton *)sender;
- (IBAction)touchUpInsideRedoButton:(UIButton *)sender;
- (IBAction)syncBrushView:(id)sender;
- (IBAction)showPaint:(id)sender;
- (IBAction)colorSlotsSwitchTouchUp:(UIButton *)sender;
- (IBAction)colorPickerSwitchTouchUp:(UIButton *)sender;
- (IBAction)paintColorButtonTouchUp:(UIButton *)sender;

//InfColorPicker
- (IBAction)takeBarValue: (InfColorBarPicker*) sender;
- (IBAction)takeSquareValue: (InfColorSquarePicker*) sender;

- (IBAction)debugButtonTouchUp:(UIButton *)sender;
- (IBAction)clearButtonTouchUp:(ADClearButton *)sender;
- (IBAction)clearButtonTouchDown:(ADClearButton *)sender;
//- (IBAction)clearButtonTouchCancel:(ClearButton *)sender;
- (IBAction)eyeDropperButtonTouchDown:(UIButton *)sender;
- (IBAction)eyeDropperButtonTouchUp:(UIButton *)sender;
- (IBAction)eyeDropperButtonTouchCancel:(UIButton *)sender;
- (IBAction)saveAndCloseButtonTouchUp:(UIButton *)sender;
- (IBAction)fullScreenButtonTouchUp:(UIButton *)sender;
- (IBAction)layerButtonTouchUp:(UIButton *)sender;
- (IBAction)transformButtonTouchUp:(id)sender;
- (IBAction)customLayerButtonTouchDown:(ADAutoRotateButton *)sender;

#pragma mark- 
@property (assign, nonatomic)BOOL isReversePaint;
- (void)prepareForPresentation;
- (void)afterPresentation;
- (void)openDoc:(ADPaintDoc*)paintDoc;
- (void)openIAPWithProductFeatureIndex:(NSInteger)index;
#pragma mark- 测试Test
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;

@end
