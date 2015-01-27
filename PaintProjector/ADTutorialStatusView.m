//
//  ADTutorialStatusCheckedView.m
//  PaintProjector
//
//  Created by kobunketsu on 9/28/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADTutorialStatusView.h"

@implementation ADTutorialStatusView

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
    if (self.locked) {
        [self drawLockWithFrame:rect];
    }
    else{
        [self drawCanvas1WithFrame:rect];
    }
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0 green: 0.502 blue: 1 alpha: 1];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.47, CGRectGetMinY(frame) + 7.47)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 10) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 7.46) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 10)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.54, CGRectGetMinY(frame) + 38.46)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 22.93)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 2.54, CGRectGetMinY(frame) + 20.39)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.54, CGRectGetMinY(frame) + 33.39) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 2.54, CGRectGetMinY(frame) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.99, CGRectGetMinY(frame) + 29.85)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 7.46) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.16, CGRectGetMinY(frame) + 25.77) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 7.46)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.47, CGRectGetMinY(frame) + 7.47)];
    [bezierPath closePath];
    [color setFill];
    [bezierPath fill];
}

- (void)drawLockWithFrame:(CGRect)frame;
{
}


@end
