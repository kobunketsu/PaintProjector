//
//  SwatchCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwatchChartView.h"

@interface SwatchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet SwatchChartView *swatchChartView;
@property (weak, nonatomic) IBOutlet UIButton *swatchNameButton;


@end
