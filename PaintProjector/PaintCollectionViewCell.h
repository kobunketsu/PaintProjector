//
//  PaintCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintFrameView.h"
#import "PaintCollectionViewCellFrame.h"

@interface PaintCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PaintFrameView *paintFrameView;
@property (weak, nonatomic) IBOutlet PaintCollectionViewCellFrame *cellFrame;
@property (weak, nonatomic) IBOutlet UIImageView *pinView;
- (IBAction)paintFrameViewTouchDown:(UIButton *)sender;
@end
