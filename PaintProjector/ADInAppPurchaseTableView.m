//
//  InAppPurchaseView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/21/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADInAppPurchaseTableView.h"
#import "ADPaintUIKitStyle.h"

@implementation ADInAppPurchaseTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [ADPaintUIKitStyle drawCrystalGradientInView:self];
}


@end
