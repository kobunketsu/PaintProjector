//
//  PaintHighlightedFrameView.m
//  PaintProjector
//
//  Created by officeMac2 on 14-1-27.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "ADPaintHighlightedFrameView.h"

@implementation ADPaintHighlightedFrameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor colorWithRed: 0.498 green: 0.661 blue: 1 alpha: 1].CGColor;
        self.layer.borderWidth = 5;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 0;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
