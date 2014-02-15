//
//  BackgroundLayerTableViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-23.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayerVisibleButton.h"
#import "LayerImageView.h"
@interface BackgroundLayerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LayerVisibleButton *visibleButton;
@property (weak, nonatomic) IBOutlet LayerImageView *layerImageView;
@property (weak, nonatomic) IBOutlet UIButton *layerImageButton;
@property (weak, nonatomic) IBOutlet UIView *layerImageViewFrame;

@end
