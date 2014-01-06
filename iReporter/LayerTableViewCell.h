//
//  LayerTableViewCell.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-18.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayerVisibleButton.h"
#import "LayerBlendModeButton.h"
#import "LayerImageView.h"
@interface LayerTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet LayerVisibleButton *visibleButton;
@property (nonatomic, weak) IBOutlet LayerImageView *layerImageView;
@property (weak, nonatomic) IBOutlet UIView *layerImageViewFrame;
@property (weak, nonatomic) IBOutlet UIButton *layerDeleteDoneButton;
@property (nonatomic, weak) IBOutlet LayerBlendModeButton *layerBlendModeButton;
@property (weak, nonatomic) IBOutlet UIView *layerBlendModeButtonUp;
@property (nonatomic, weak) IBOutlet UISlider *layerOpacitySlider;
- (void)setSelectedState:(BOOL)selected;
@end
