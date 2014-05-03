//
//  SharedTableView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/26/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SharedTableView.h"
#import "PaintUIKitStyle.h"

@implementation SharedTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [PaintUIKitStyle drawCrystalGradientInView:self];
}
@end
