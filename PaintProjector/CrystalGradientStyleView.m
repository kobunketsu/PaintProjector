//
//  CrystalGradientStyleView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CrystalGradientStyleView.h"
#import "PaintUIKitStyle.h"
@implementation CrystalGradientStyleView

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
    [PaintUIKitStyle drawCrystalGradientInView:self];
}


@end
