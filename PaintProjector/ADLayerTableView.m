//
//  LayerTableView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerTableView.h"
#import "ADPaintUIKitStyle.h"

@implementation ADLayerTableView

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
    [ADPaintUIKitStyle drawCrystalGradientInView:self];
}

@end
