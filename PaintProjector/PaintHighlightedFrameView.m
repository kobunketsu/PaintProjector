//
//  PaintHighlightedFrameView.m
//  PaintProjector
//
//  Created by officeMac2 on 14-1-27.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "PaintHighlightedFrameView.h"

@implementation PaintHighlightedFrameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor cyanColor].CGColor;
        self.layer.borderWidth = 5;
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
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
