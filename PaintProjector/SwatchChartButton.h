//
//  SwatchChartView.h
//  PaintProjector
//
//  Created by kobunketsu on 14-3-1.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwatchChartButton : UIButton
@property(retain, nonatomic)NSArray *swatchColors;
@property(assign, nonatomic)BOOL filtered;
@end
