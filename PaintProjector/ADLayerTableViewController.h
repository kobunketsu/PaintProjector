//
//  LayerTableViewController.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-17.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADLayerBlendModeTableViewController.h"
#import "ADLayerTableViewCell.h"
#import "ADLayerTableView.h"
#import "ADBackgroundLayer.h"
#import "ADLayerDeleteDoneButton.h"
#import "ADAutoRotateButton.h"
#import "ADSharedPopoverController.h"
#import "InfColorPickerController.h"
@class ADLayerTableViewController;
@class ADFuzzyTransparentView;

@protocol ADLayerTableViewControllerDelegate
- (BOOL) willSetCurLayerDataAtIndex:(int)index;
- (BOOL) willInsertLayerDataAtIndex:(int)index;
- (BOOL) willInsertCopyLayerDataAtIndex:(int)index;
- (BOOL) willEraseLayerDataAtIndex:(int)index;
- (BOOL) willDeleteLayerDataAtIndex:(int)index;
- (BOOL) willClearLayerDataAtIndex:(int)index;
- (BOOL) willMergeLayerDataAtIndex:(int)index;
- (BOOL) willMoveLayerFromIndex:(int)fromIndex toIndex:(int)toIndex;
- (BOOL) willSetLayerAtIndex:(int)index visible:(BOOL)visible;
- (BOOL) willSetLayerBlendMode:(LayerBlendMode)blendMode atIndex:(int)index;
- (BOOL) willSetLayerAtIndex:(int)index opacity:(float)opacity;
- (BOOL) willSetLayerAtIndex:(int)index opacityLock:(BOOL)opacityLock;
- (int) willGetCurLayerIndex;
- (void) willUpdateRender;
- (void) willSetBackgroundLayerVisible:(bool)visible;
- (void) willSetBackgroundLayerClearColor:(UIButton*)button colorPickerControllerDelegate:(ADLayerTableViewController*)controllerDelegate;
- (void) willSetBackgroundLayerClearColorFinished:(UIColor*)clearColor;
- (void) willSetBackgroundLayerClearColorChanged:(UIColor*)clearColor;
//- (BOOL) willValidateOperationOnLayerIndex:(NSInteger)index;
- (UIView*) willGetFuzzyTransparentSourceView;
@end

@interface ADLayerTableViewController : UIViewController
<UITableViewDataSource,
UITableViewDelegate,
ADLayerBlendModeTableViewControllerDelegate,
InfColorPickerControllerDelegate,
UIAlertViewDelegate
>
{
}

@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *rootView;
@property (weak, nonatomic) ADLayerBlendModeTableViewController *blendModeTableViewController;
@property (assign, nonatomic)float tableViewWidth;
@property (assign, nonatomic)float tableViewHeightMax;
@property (weak, nonatomic)NSArray *layers;//retain?
@property (weak, nonatomic)ADBackgroundLayer *backgroundLayer;
@property (retain, nonatomic)NSIndexPath *curLayerIndexPath;
@property (retain, nonatomic)NSIndexPath *curSetupIndexPath;
@property (assign, nonatomic)int inBlendModeRow;
@property (assign, nonatomic) id delegate;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *layerToolButtons;
@property (weak, nonatomic) IBOutlet UIButton *layerDeleteButton;
@property (weak, nonatomic) IBOutlet UILabel *blendModeLabel;
@property (strong, nonatomic) IBOutletCollection(ADAutoRotateButton) NSArray *autoRotateButtons;
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
