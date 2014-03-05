//
//  SwatchCollectionViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwatchChartButton.h"

@interface SwatchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet SwatchChartButton *swatchChartButton;
@property (weak, nonatomic) IBOutlet UILabel *swatchNameLabel;


@end
