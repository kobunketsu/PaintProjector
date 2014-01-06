//
//  LayerTableViewController.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-17.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayerBlendModeTableViewController.h"
#import "BackgroundLayer.h"

#import "LayerDeleteDoneButton.h"
#import "AutoRotateButton.h"
#import "PaintScreenPopoverController.h"
#import "InfColorPickerController.h"
@class LayerTableViewController;
@class FuzzyTransparentView;

@protocol LayerTableViewControllerDelegate
- (void) willSetCurLayerDataAtIndex:(int)index;
- (void) willInsertLayerDataAtIndex:(int)index;
- (void) willInsertCopyLayerDataAtIndex:(int)index;
- (void) willEraseLayerDataAtIndex:(int)index;
- (void) willDeleteLayerDataAtIndex:(int)index;
- (void) willClearLayerDataAtIndex:(int)index;
- (void) willMergeLayerDataAtIndex:(int)index;
- (void) willMoveLayerFromIndex:(int)fromIndex toIndex:(int)toIndex;
- (void) willSetLayerAtIndex:(int)index visible:(BOOL)visible;
- (void) willSetLayerBlendMode:(LayerBlendMode)blendMode atIndex:(int)index;
- (void) willSetLayerAtIndex:(int)index opacity:(float)opacity;
- (int) willGetLayerIndex;
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
@property(nonatomic, assign)float tableViewWidth;
@property(nonatomic, assign)float tableViewHeightMax;
@property(nonatomic, weak)NSArray *layers;//retain?
@property(nonatomic, weak)BackgroundLayer *backgroundLayer;
@property(nonatomic, retain)NSIndexPath *curLayerIndexPath;
@property(nonatomic, retain)NSIndexPath *curSetupIndexPath;
@property(nonatomic, assign)int inBlendModeRow;
@property(nonatomic, assign) id delegate;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *layerToolButtons;
@property (weak, nonatomic) IBOutlet UIButton *layerDeleteButton;
@property (weak, nonatomic) IBOutlet UILabel *blendModeLabel;
@property (strong, nonatomic) IBOutletCollection(AutoRotateButton) NSArray *autoRotateButtons;
@property(nonatomic, weak) UIButton* backgroundLayerButton;
@property(nonatomic, assign)NSInteger moveTargetSection;
- (float)tableViewHeight;
- (int)layerIndexForRow:(int)row;
- (int)rowForLayerIndex:(int)layerIndex;
- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)selectRowForCurLayer;
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
@end
