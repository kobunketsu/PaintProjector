//
//  TransformAnchorView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "TransformAnchorView.h"

@implementation TransformAnchorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Oval Drawing
    CGFloat size = self.bounds.size.width - 4;
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2, 2, size, size)];
    [[UIColor lightGrayColor] setFill];
    [ovalPath fill];
    [[UIColor whiteColor] setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
}


@end
