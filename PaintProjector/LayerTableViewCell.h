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
//@property (copy, nonatomic) NSString *layerIdentifier;
@property (weak, nonatomic) IBOutlet LayerVisibleButton *visibleButton;
@property (weak, nonatomic) IBOutlet LayerImageView *layerImageView;
@property (weak, nonatomic) IBOutlet UIView *layerImageViewFrame;
@property (weak, nonatomic) IBOutlet UIButton *layerDeleteDoneButton;
@property (weak, nonatomic) IBOutlet LayerBlendModeButton *layerBlendModeButton;
@property (weak, nonatomic) IBOutlet UIView *layerBlendModeButtonUp;
@property (weak, nonatomic) IBOutlet UISlider *layerOpacitySlider;
- (void)setSelectedState:(BOOL)selected;
@end
