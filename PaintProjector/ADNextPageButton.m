//
//  ADNextPageButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 8/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADNextPageButton.h"

@implementation ADNextPageButton

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
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    
    //// Subframes
    CGRect frameNext = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 12) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 10) * 0.50000 + 0.5), 12, 10);
    
    
    //// next Drawing
    UIBezierPath* nextPath = UIBezierPath.bezierPath;
    [nextPath moveToPoint: CGPointMake(CGRectGetMinX(frameNext) + 0.95833 * CGRectGetWidth(frameNext), CGRectGetMinY(frameNext) + 5)];
    [nextPath addLineToPoint: CGPointMake(CGRectGetMinX(frameNext) + 0.27083 * CGRectGetWidth(frameNext), CGRectGetMinY(frameNext) + 0.24)];
    [nextPath addLineToPoint: CGPointMake(CGRectGetMinX(frameNext) + 0.27083 * CGRectGetWidth(frameNext), CGRectGetMinY(frameNext) + 9.76)];
    [nextPath addLineToPoint: CGPointMake(CGRectGetMinX(frameNext) + 0.95833 * CGRectGetWidth(frameNext), CGRectGetMinY(frameNext) + 5)];
    [nextPath closePath];
    [color setFill];
    [nextPath fill];
}


@end
