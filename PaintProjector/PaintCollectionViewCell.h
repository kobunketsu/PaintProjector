//
//  PaintCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintFrameView.h"

@interface PaintCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PaintFrameView *paintFrameView;
- (IBAction)paintFrameViewTouchDown:(UIButton *)sender;
@end
