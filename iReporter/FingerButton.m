//
//  HandButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "FingerButton.h"

@implementation FingerButton

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
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.923 green: 0.629 blue: 0.281 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.4) green: (colorRGBA[1] * 0.4) blue: (colorRGBA[2] * 0.4) alpha: (colorRGBA[3] * 0.4 + 0.6)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(37.86, 4.19)];
    [bezierPath addCurveToPoint: CGPointMake(41.81, 6.78) controlPoint1: CGPointMake(39.6, 5.04) controlPoint2: CGPointMake(41.02, 4.69)];
    [bezierPath addCurveToPoint: CGPointMake(42.5, 12.61) controlPoint1: CGPointMake(42.25, 7.94) controlPoint2: CGPointMake(42.5, 11.24)];
    [bezierPath addLineToPoint: CGPointMake(43.5, 25)];
    [bezierPath addLineToPoint: CGPointMake(39.93, 23)];
    [bezierPath addCurveToPoint: CGPointMake(36, 13.61) controlPoint1: CGPointMake(38.31, 23) controlPoint2: CGPointMake(36, 15.6)];
    [bezierPath addLineToPoint: CGPointMake(37, 6.73)];
    [bezierPath addCurveToPoint: CGPointMake(37.85, 4.19) controlPoint1: CGPointMake(37, 5.74) controlPoint2: CGPointMake(37.32, 4.84)];
    [bezierPath addLineToPoint: CGPointMake(37.86, 4.19)];
    [bezierPath closePath];
    [color6 setFill];
    [bezierPath fill];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(33.47, 3.49)];
    [bezier4Path addCurveToPoint: CGPointMake(37.15, 4.19) controlPoint1: CGPointMake(34.79, 3.5) controlPoint2: CGPointMake(36.02, 3.74)];
    [bezier4Path addCurveToPoint: CGPointMake(36, 7) controlPoint1: CGPointMake(36.44, 4.91) controlPoint2: CGPointMake(36, 5.9)];
    [bezier4Path addLineToPoint: CGPointMake(35, 13.99)];
    [bezier4Path addLineToPoint: CGPointMake(36, 21)];
    [bezier4Path addCurveToPoint: CGPointMake(38, 25) controlPoint1: CGPointMake(37.49, 23.62) controlPoint2: CGPointMake(36.75, 22.99)];
    [bezier4Path addLineToPoint: CGPointMake(43.5, 28)];
    [bezier4Path addLineToPoint: CGPointMake(44.5, 40.96)];
    [bezier4Path addCurveToPoint: CGPointMake(43.5, 45.01) controlPoint1: CGPointMake(44.5, 40.96) controlPoint2: CGPointMake(44.8, 38.95)];
    [bezier4Path addCurveToPoint: CGPointMake(43.04, 48.02) controlPoint1: CGPointMake(43.27, 46.11) controlPoint2: CGPointMake(43.12, 47.1)];
    [bezier4Path addCurveToPoint: CGPointMake(37, 46) controlPoint1: CGPointMake(41.44, 47.4) controlPoint2: CGPointMake(39.32, 47.43)];
    [bezier4Path addCurveToPoint: CGPointMake(30, 40) controlPoint1: CGPointMake(32.06, 42.95) controlPoint2: CGPointMake(30, 40)];
    [bezier4Path addCurveToPoint: CGPointMake(37, 48) controlPoint1: CGPointMake(30, 40) controlPoint2: CGPointMake(31.85, 43.98)];
    [bezier4Path addCurveToPoint: CGPointMake(43.07, 50.83) controlPoint1: CGPointMake(39.39, 49.86) controlPoint2: CGPointMake(41.49, 50.07)];
    [bezier4Path addCurveToPoint: CGPointMake(44.29, 60.2) controlPoint1: CGPointMake(43.3, 53.35) controlPoint2: CGPointMake(43.9, 56.78)];
    [bezier4Path addCurveToPoint: CGPointMake(44.5, 70.61) controlPoint1: CGPointMake(44.99, 66.39) controlPoint2: CGPointMake(43.95, 66.79)];
    [bezier4Path addCurveToPoint: CGPointMake(45.5, 80.5) controlPoint1: CGPointMake(45.05, 74.43) controlPoint2: CGPointMake(45.5, 80.5)];
    [bezier4Path addLineToPoint: CGPointMake(18.5, 80.5)];
    [bezier4Path addLineToPoint: CGPointMake(17.1, 74.52)];
    [bezier4Path addCurveToPoint: CGPointMake(17.5, 60.81) controlPoint1: CGPointMake(17.1, 74.52) controlPoint2: CGPointMake(16.9, 68.34)];
    [bezier4Path addCurveToPoint: CGPointMake(19.5, 44.4) controlPoint1: CGPointMake(18.1, 53.28) controlPoint2: CGPointMake(19.5, 44.4)];
    [bezier4Path addLineToPoint: CGPointMake(17.5, 40.48)];
    [bezier4Path addCurveToPoint: CGPointMake(18.5, 26.16) controlPoint1: CGPointMake(17.5, 40.48) controlPoint2: CGPointMake(17.5, 32.91)];
    [bezier4Path addCurveToPoint: CGPointMake(21.5, 13.5) controlPoint1: CGPointMake(19.5, 19.42) controlPoint2: CGPointMake(21.5, 13.5)];
    [bezier4Path addCurveToPoint: CGPointMake(27.5, 5.5) controlPoint1: CGPointMake(24.16, 7.83) controlPoint2: CGPointMake(24.5, 8)];
    [bezier4Path addCurveToPoint: CGPointMake(33.5, 3.5) controlPoint1: CGPointMake(30.5, 3) controlPoint2: CGPointMake(33.5, 3.5)];
    [bezier4Path addLineToPoint: CGPointMake(33.47, 3.49)];
    [bezier4Path closePath];
    [color setFill];
    [bezier4Path fill];
    
    
    //// Bezier 7 Drawing
    UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
    [bezier7Path moveToPoint: CGPointMake(31.48, 3.6)];
    [bezier7Path addCurveToPoint: CGPointMake(33.35, 8.13) controlPoint1: CGPointMake(32.54, 4.84) controlPoint2: CGPointMake(33.36, 6.37)];
    [bezier7Path addCurveToPoint: CGPointMake(29.14, 18.29) controlPoint1: CGPointMake(33.32, 13) controlPoint2: CGPointMake(29.54, 11)];
    [bezier7Path addCurveToPoint: CGPointMake(21.24, 26.92) controlPoint1: CGPointMake(28.74, 25.58) controlPoint2: CGPointMake(24.8, 21.23)];
    [bezier7Path addCurveToPoint: CGPointMake(18.03, 30.04) controlPoint1: CGPointMake(20.33, 28.37) controlPoint2: CGPointMake(19.2, 29.37)];
    [bezier7Path addCurveToPoint: CGPointMake(18.5, 26.16) controlPoint1: CGPointMake(18.16, 28.76) controlPoint2: CGPointMake(18.31, 27.44)];
    [bezier7Path addCurveToPoint: CGPointMake(21.5, 13.5) controlPoint1: CGPointMake(19.5, 19.42) controlPoint2: CGPointMake(21.5, 13.5)];
    [bezier7Path addCurveToPoint: CGPointMake(27.5, 5.5) controlPoint1: CGPointMake(24.16, 7.83) controlPoint2: CGPointMake(24.5, 8)];
    [bezier7Path addCurveToPoint: CGPointMake(31.47, 3.59) controlPoint1: CGPointMake(28.93, 4.31) controlPoint2: CGPointMake(30.37, 3.8)];
    [bezier7Path addLineToPoint: CGPointMake(31.48, 3.6)];
    [bezier7Path closePath];
    [color5 setFill];
    [bezier7Path fill];
    
    
    
}


@end
