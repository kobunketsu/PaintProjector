//
//  PenButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PenButton.h"

@implementation PenButton

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
    UIColor* color = [UIColor colorWithRed: 0.981 green: 0.885 blue: 0.452 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.3) green: (colorRGBA[1] * 0.3) blue: (colorRGBA[2] * 0.3) alpha: (colorRGBA[3] * 0.3 + 0.7)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(30.59, 33.05)];
    [bezier4Path addCurveToPoint: CGPointMake(30.59, 36.64) controlPoint1: CGPointMake(29.57, 34.04) controlPoint2: CGPointMake(29.57, 35.65)];
    [bezier4Path addCurveToPoint: CGPointMake(34.28, 36.64) controlPoint1: CGPointMake(31.61, 37.64) controlPoint2: CGPointMake(33.26, 37.64)];
    [bezier4Path addCurveToPoint: CGPointMake(34.28, 33.05) controlPoint1: CGPointMake(35.3, 35.65) controlPoint2: CGPointMake(35.3, 34.04)];
    [bezier4Path addCurveToPoint: CGPointMake(30.59, 33.05) controlPoint1: CGPointMake(33.26, 32.05) controlPoint2: CGPointMake(31.61, 32.05)];
    [bezier4Path closePath];
    [bezier4Path moveToPoint: CGPointMake(31.55, 3.43)];
    [bezier4Path addCurveToPoint: CGPointMake(33, 5) controlPoint1: CGPointMake(31.57, 3.47) controlPoint2: CGPointMake(32.22, 2.58)];
    [bezier4Path addCurveToPoint: CGPointMake(36.78, 17.88) controlPoint1: CGPointMake(34.09, 8.39) controlPoint2: CGPointMake(35.53, 14.12)];
    [bezier4Path addCurveToPoint: CGPointMake(42, 28.91) controlPoint1: CGPointMake(38.92, 24.33) controlPoint2: CGPointMake(42, 28.91)];
    [bezier4Path addCurveToPoint: CGPointMake(41.58, 42.05) controlPoint1: CGPointMake(42, 28.91) controlPoint2: CGPointMake(41.8, 36.11)];
    [bezier4Path addCurveToPoint: CGPointMake(40, 53.5) controlPoint1: CGPointMake(41.36, 47.98) controlPoint2: CGPointMake(40, 53.5)];
    [bezier4Path addLineToPoint: CGPointMake(25, 53.5)];
    [bezier4Path addCurveToPoint: CGPointMake(23.26, 42.09) controlPoint1: CGPointMake(25, 53.5) controlPoint2: CGPointMake(23.91, 48.02)];
    [bezier4Path addCurveToPoint: CGPointMake(22, 28.91) controlPoint1: CGPointMake(22.61, 36.15) controlPoint2: CGPointMake(22, 28.91)];
    [bezier4Path addCurveToPoint: CGPointMake(27.22, 17.88) controlPoint1: CGPointMake(22, 28.91) controlPoint2: CGPointMake(24.86, 25.18)];
    [bezier4Path addCurveToPoint: CGPointMake(31, 5) controlPoint1: CGPointMake(28.56, 13.72) controlPoint2: CGPointMake(30.2, 8.23)];
    [bezier4Path addCurveToPoint: CGPointMake(32, 3.47) controlPoint1: CGPointMake(31.6, 2.58) controlPoint2: CGPointMake(32, 3.47)];
    [bezier4Path addLineToPoint: CGPointMake(31.55, 3.43)];
    [bezier4Path closePath];
    [color setFill];
    [bezier4Path fill];
    
    
    //// Rounded Rectangle 4 Drawing
    UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(23, 55, 19, 3) cornerRadius: 1.5];
    [color6 setFill];
    [roundedRectangle4Path fill];
    
    
    //// Rounded Rectangle 5 Drawing
    UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPath];
    [roundedRectangle5Path moveToPoint: CGPointMake(23, 93)];
    [roundedRectangle5Path addCurveToPoint: CGPointMake(24, 94) controlPoint1: CGPointMake(23, 93.55) controlPoint2: CGPointMake(23.45, 94)];
    [roundedRectangle5Path addLineToPoint: CGPointMake(41, 94)];
    [roundedRectangle5Path addCurveToPoint: CGPointMake(42, 93) controlPoint1: CGPointMake(41.55, 94) controlPoint2: CGPointMake(42, 93.55)];
    [roundedRectangle5Path addLineToPoint: CGPointMake(40, 60)];
    [roundedRectangle5Path addCurveToPoint: CGPointMake(39, 59) controlPoint1: CGPointMake(40, 59.45) controlPoint2: CGPointMake(39.55, 59)];
    [roundedRectangle5Path addLineToPoint: CGPointMake(26, 59)];
    [roundedRectangle5Path addCurveToPoint: CGPointMake(25, 60) controlPoint1: CGPointMake(25.45, 59) controlPoint2: CGPointMake(25, 59.45)];
    [roundedRectangle5Path addLineToPoint: CGPointMake(23, 93)];
    [roundedRectangle5Path closePath];
    [color5 setFill];
    [roundedRectangle5Path fill];
    
    
    
}


@end
