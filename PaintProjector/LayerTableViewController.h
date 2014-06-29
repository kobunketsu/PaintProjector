//
//  LayerTableViewController.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-17.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayerBlendModeTableViewController.h"
#import "LayerTableViewCell.h"
#import "LayerTableView.h"
#import "BackgroundLayer.h"
#import "LayerDeleteDoneButton.h"
#import "AutoRotateButton.h"
#import "SharedPopoverController.h"
#import "InfColorPickerController.h"
@class LayerTableViewController;
@class FuzzyTransparentView;

@protocol LayerTableViewControllerDelegate
- (void) willSetCurLayerDataAtIndex:(int)index;
- (void) willInsertLayerDataAtIndex:(int)index completion:(void (^)(void))completion;
- (void) willInsertCopyLayerDataAtIndex:(int)index;
- (void) willEraseLayerDataAtIndex:(int)index;
- (void) willDeleteLayerDataAtIndex:(int)index;
- (void) willClearLayerDataAtIndex:(int)index;
- (void) willMergeLayerDataAtIndex:(int)index;
- (void) willMoveLayerFromIndex:(int)fromIndex toIndex:(int)toIndex;
- (void) willSetLayerAtIndex:(int)index visible:(BOOL)visible;
- (void) willSetLayerBlendMode:(LayerBlendMode)blendMode atIndex:(int)index;
- (void) willSetLayerAtIndex:(int)index opacity:(float)opacity;
- (void) willSetLayerAtIndex:(int)index opacityLock:(BOOL)opacityLock;
- (int) willGetCurLayerIndex;
- (void) willUpdateRender;
- (void) willSetBackgroundLayerVisible:(bool)visible;
- (void) willSetBackgroundLayerClearColor:(UIButton*)button colorPickerControllerDelegate:(LayerTableViewController*)controllerDelegate;
- (void) willSetBackgroundLayerClearColorFinished:(UIColor*)clearColor;
- (void) willSetBackgroundLayerClearColorChanged:(UIColor*)clearColor;
- (UIView*) willGetFuzzyTransparentSourceView;
@end

@interface LayerTableViewController : UIViewController
<UITableViewDataSource,
UITableViewDelegate,
LayerBlendModeTableViewControllerDelegate,
InfColorPickerControllerDelegate,
UIAlertViewDelegate
>
{
}

@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet FuzzyTransparentView *rootView;
@property (weak, nonatomic) LayerBlendModeTableViewController *blendModeTableViewController;
@property (assign, nonatomic)float tableViewWidth;
@property (assign, nonatomic)float tableViewHeightMax;
@property (weak, nonatomic)NSArray *layers;//retain?
@property (weak, nonatomic)BackgroundLayer *backgroundLayer;
@property (retain, nonatomic)NSIndexPath *curLayerIndexPath;
@property (retain, nonatomic)NSIndexPath *curSetupIndexPath;
@property (assign, nonatomic)int inBlendModeRow;
@property (assign, nonatomic) id delegate;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *layerToolButtons;
@property (weak, nonatomic) IBOutlet UIButton *layerDeleteButton;
@property (weak, nonatomic) IBOutlet UILabel *blendModeLabel;
@property (strong, nonatomic) IBOutletCollection(AutoRotateButton) NSArray *autoRotateButtons;
@property (weak, nonatomic) UIButton* backgroundLayerButton;
@property (assign, nonatomic)NSInteger moveTargetSection;
- (float)tableViewHeight;
- (int)layerIndexForRow:(int)row;
- (int)rowForLayerIndex:(int)layerIndex;
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)selectRowForCurLayer;
- (void)updateIconColors;
//添加图层按钮
- (IBAction)addLayerButtonTouchUp:(UIButton *)sender;
//复制图层按钮
- (IBAction)copyLayerButtonTouchUp:(UIButton *)sender;
//合并图层按钮
- (IBAction)mergeLayerButtonTouchUp:(UIButton *)sender;
//删除图层按钮
- (IBAction)deleteLayerButtonTouchUp:(UIButton *)sender;
//删除确认图层按钮
- (IBAction)deleteDoneLayerButtonTouchUp:(UIButton *)sender;
//设置图层透明度
- (IBAction)layerOpacitySliderSlide:(UISlider *)sender;
//设置图层混合模式
- (IBAction)layerBlendModeButtonTouchUp:(UIButton *)sender;
//设置图层可见性
- (IBAction)layerVisibleButtonTouchUp:(UIButton *)sender;
- (IBAction)layerOpacityLockButtonTouchUp:(UIButton *)sender;

#pragma mark- Layer Display
//@property (weak, nonatomic) UIImage *tempImageForLayerTableViewCellDisplay;
//- (void)updateDisplayCell:(LayerTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@end
