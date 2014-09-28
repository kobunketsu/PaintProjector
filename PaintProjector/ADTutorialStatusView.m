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
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.731 green: 0.731 blue: 0.731 alpha: 1];
    UIColor* highlightedColor = [UIColor colorWithRed: 0.832 green: 0.832 blue: 0.832 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.14, 0.51, 0.87, 0.98};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color2.CGColor, (id)[UIColor colorWithRed: 0.781 green: 0.781 blue: 0.781 alpha: 1].CGColor, (id)highlightedColor.CGColor, (id)[UIColor colorWithRed: 0.781 green: 0.781 blue: 0.781 alpha: 1].CGColor, (id)color2.CGColor], gradientLocations);
    
    //// locker Drawing
    UIBezierPath* lockerPath = UIBezierPath.bezierPath;
    [lockerPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 28.24, CGRectGetMinY(frame) + 4.95)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.26, CGRectGetMinY(frame) + 4.95)];
    [lockerPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 14.27, CGRectGetMinY(frame) + 5.91) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.71, CGRectGetMinY(frame) + 4.95) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.27, CGRectGetMinY(frame) + 5.38)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 14.27, CGRectGetMinY(frame) + 15.65)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29.23, CGRectGetMinY(frame) + 15.65)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29.23, CGRectGetMinY(frame) + 5.91)];
    [lockerPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 28.24, CGRectGetMinY(frame) + 4.95) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.23, CGRectGetMinY(frame) + 5.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.79, CGRectGetMinY(frame) + 4.95)];
    [lockerPath closePath];
    [lockerPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 33.29, CGRectGetMinY(frame) + 2.93)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33.29, CGRectGetMinY(frame) + 15.65)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 43.5, CGRectGetMinY(frame) + 15.65)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 43.5, CGRectGetMinY(frame) + 43.5)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 43.5)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 15.65)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 10.21, CGRectGetMinY(frame) + 15.65)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 10.21, CGRectGetMinY(frame) + 2.93)];
    [lockerPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.19, CGRectGetMinY(frame) + 1) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.21, CGRectGetMinY(frame) + 1.86) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.09, CGRectGetMinY(frame) + 1)];
    [lockerPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 31.31, CGRectGetMinY(frame) + 1)];
    [lockerPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33.29, CGRectGetMinY(frame) + 2.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 32.41, CGRectGetMinY(frame) + 1) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 33.29, CGRectGetMinY(frame) + 1.86)];
    [lockerPath closePath];
    CGContextSaveGState(context);
    [lockerPath addClip];
    CGRect lockerBounds = CGPathGetPathBoundingBox(lockerPath.CGPath);
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMinX(lockerBounds), CGRectGetMidY(lockerBounds)),
                                CGPointMake(CGRectGetMaxX(lockerBounds), CGRectGetMidY(lockerBounds)),
                                0);
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    lockerPath.lineWidth = 1;
    [lockerPath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
