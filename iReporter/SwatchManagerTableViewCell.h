//
//  SwatchManagerTableViewCell.h
//  PaintProjector
//
//  Created by kobunketsu on 14-2-28.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwatchChartView.h"

@interface SwatchManagerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *swatchCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *swatchNameButton;
@property (weak, nonatomic) IBOutlet SwatchChartView *swatchChartView;
- (IBAction)swatchNameButtonTouchUp:(UIButton *)sender;


@end
