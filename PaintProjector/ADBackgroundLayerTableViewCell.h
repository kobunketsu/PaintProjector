//
//  BackgroundLayerTableViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-23.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADLayerVisibleButton.h"
#import "ADLayerImageView.h"
@interface ADBackgroundLayerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet ADLayerVisibleButton *visibleButton;
@property (weak, nonatomic) IBOutlet ADLayerImageView *layerImageView;
@property (weak, nonatomic) IBOutlet UIButton *layerImageButton;
@property (weak, nonatomic) IBOutlet UIView *layerImageViewFrame;

@end
