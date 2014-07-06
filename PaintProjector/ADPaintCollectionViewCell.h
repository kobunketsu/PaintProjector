//
//  PaintCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPaintFrameView.h"
#import "ADPaintCollectionViewCellFrame.h"

@interface ADPaintCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet ADPaintFrameView *paintFrameView;
@property (weak, nonatomic) IBOutlet ADPaintCollectionViewCellFrame *cellFrame;
@property (weak, nonatomic) IBOutlet UIImageView *pinView;
- (IBAction)paintFrameViewTouchDown:(UIButton *)sender;
@end
