//
//  LayerMergeButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-23.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerMergeButton.h"

@implementation ADLayerMergeButton

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
- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color = iconColor;
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(37, 8)];
    [bezier2Path addLineToPoint: CGPointMake(37, 10)];
    [bezier2Path addCurveToPoint: CGPointMake(36, 11) controlPoint1: CGPointMake(37, 10.55) controlPoint2: CGPointMake(36.55, 11)];
    [bezier2Path addLineToPoint: CGPointMake(23.94, 11)];
    [bezier2Path addCurveToPoint: CGPointMake(23.94, 27.85) controlPoint1: CGPointMake(23.94, 12.86) controlPoint2: CGPointMake(23.94, 23.18)];
    [bezier2Path addCurveToPoint: CGPointMake(28.75, 23.82) controlPoint1: CGPointMake(26.7, 25.3) controlPoint2: CGPointMake(28.75, 23.82)];
    [bezier2Path addCurveToPoint: CGPointMake(29.77, 23.82) controlPoint1: CGPointMake(29.03, 23.54) controlPoint2: CGPointMake(29.49, 23.54)];
    [bezier2Path addLineToPoint: CGPointMake(30.79, 24.82)];
    [bezier2Path addCurveToPoint: CGPointMake(30.79, 25.83) controlPoint1: CGPointMake(31.07, 25.1) controlPoint2: CGPointMake(31.07, 25.55)];
    [bezier2Path addLineToPoint: CGPointMake(23.08, 32.79)];
    [bezier2Path addCurveToPoint: CGPointMake(22.5, 33) controlPoint1: CGPointMake(22.92, 32.95) controlPoint2: CGPointMake(22.71, 33.02)];
    [bezier2Path addCurveToPoint: CGPointMake(22, 32.86) controlPoint1: CGPointMake(22.33, 33.01) controlPoint2: CGPointMake(22.15, 32.97)];
    [bezier2Path addCurveToPoint: CGPointMake(14.21, 25.83) controlPoint1: CGPointMake(21.92, 32.79) controlPoint2: CGPointMake(14.21, 25.83)];
    [bezier2Path addCurveToPoint: CGPointMake(14.21, 24.82) controlPoint1: CGPointMake(13.93, 25.55) controlPoint2: CGPointMake(13.93, 25.1)];
    [bezier2Path addLineToPoint: CGPointMake(15.23, 23.82)];
    [bezier2Path addCurveToPoint: CGPointMake(16.25, 23.82) controlPoint1: CGPointMake(15.51, 23.54) controlPoint2: CGPointMake(15.97, 23.54)];
    [bezier2Path addCurveToPoint: CGPointMake(21.06, 27.85) controlPoint1: CGPointMake(16.25, 23.82) controlPoint2: CGPointMake(18.3, 25.3)];
    [bezier2Path addCurveToPoint: CGPointMake(21.06, 11) controlPoint1: CGPointMake(21.06, 23.18) controlPoint2: CGPointMake(21.06, 12.86)];
    [bezier2Path addLineToPoint: CGPointMake(8, 11)];
    [bezier2Path addCurveToPoint: CGPointMake(7, 10) controlPoint1: CGPointMake(7.45, 11) controlPoint2: CGPointMake(7, 10.55)];
    [bezier2Path addLineToPoint: CGPointMake(7, 8)];
    [bezier2Path addCurveToPoint: CGPointMake(8, 7) controlPoint1: CGPointMake(7, 7.45) controlPoint2: CGPointMake(7.45, 7)];
    [bezier2Path addLineToPoint: CGPointMake(36, 7)];
    [bezier2Path addCurveToPoint: CGPointMake(37, 8) controlPoint1: CGPointMake(36.55, 7) controlPoint2: CGPointMake(37, 7.45)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(37, 34)];
    [bezier2Path addLineToPoint: CGPointMake(37, 36)];
    [bezier2Path addCurveToPoint: CGPointMake(36, 37) controlPoint1: CGPointMake(37, 36.55) controlPoint2: CGPointMake(36.55, 37)];
    [bezier2Path addLineToPoint: CGPointMake(8, 37)];
    [bezier2Path addCurveToPoint: CGPointMake(7, 36) controlPoint1: CGPointMake(7.45, 37) controlPoint2: CGPointMake(7, 36.55)];
    [bezier2Path addLineToPoint: CGPointMake(7, 34)];
    [bezier2Path addCurveToPoint: CGPointMake(8, 33) controlPoint1: CGPointMake(7, 33.45) controlPoint2: CGPointMake(7.45, 33)];
    [bezier2Path addLineToPoint: CGPointMake(36, 33)];
    [bezier2Path addCurveToPoint: CGPointMake(37, 34) controlPoint1: CGPointMake(36.55, 33) controlPoint2: CGPointMake(37, 33.45)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [color setFill];
    [bezier2Path fill];
    CGContextRestoreGState(context);

}


@end
