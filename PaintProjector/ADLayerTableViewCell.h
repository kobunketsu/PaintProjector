//
//  LayerTableViewCell.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-18.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADLayerDeleteButton.h"
#import "ADLayerVisibleButton.h"
#import "ADLayerBlendModeButton.h"
#import "ADLayerImageView.h"
#import "ADLayerOpacityLockButton.h"
#import "ADLayerTableViewCellBackgroundView.h"
@class ADLayerOpacityLockButton;

@interface ADLayerTableViewCell : UITableViewCell
//@property (copy, nonatomic) NSString *layerIdentifier;
@property (weak, nonatomic) IBOutlet ADLayerVisibleButton *visibleButton;
@property (weak, nonatomic) IBOutlet ADLayerOpacityLockButton *layerOpacityLockButton;
@property (weak, nonatomic) IBOutlet ADLayerImageView *layerImageView;
@property (weak, nonatomic) IBOutlet UIView *layerImageViewFrame;
@property (weak, nonatomic) IBOutlet UIButton *layerDeleteDoneButton;
@property (weak, nonatomic) IBOutlet ADLayerBlendModeButton *layerBlendModeButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *layerHelpButtons;

@property (weak, nonatomic) IBOutlet UIView *layerBlendModeButtonUp;
@property (weak, nonatomic) IBOutlet UISlider *layerOpacitySlider;
- (ADLayerDeleteButton *)deleteButton;
- (void)setSelectedState:(BOOL)selected;
@end
