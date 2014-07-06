//
//  LockRotationView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLockCanvasRotationView.h"

@implementation ADLockCanvasRotationView

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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.57 green: 0.57 blue: 0.57 alpha: 1];
    UIColor* colorGlow = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* glow = colorGlow;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 5;
    
    //// Rotate 2 Drawing
    UIBezierPath* rotate2Path = [UIBezierPath bezierPath];
    [rotate2Path moveToPoint: CGPointMake(40.54, 7.18)];
    [rotate2Path addCurveToPoint: CGPointMake(40.54, 39.29) controlPoint1: CGPointMake(49.12, 16.05) controlPoint2: CGPointMake(49.12, 30.43)];
    [rotate2Path addCurveToPoint: CGPointMake(9.44, 39.29) controlPoint1: CGPointMake(31.95, 48.16) controlPoint2: CGPointMake(18.03, 48.16)];
    [rotate2Path addCurveToPoint: CGPointMake(9.44, 7.18) controlPoint1: CGPointMake(0.85, 30.43) controlPoint2: CGPointMake(0.85, 16.05)];
    [rotate2Path addCurveToPoint: CGPointMake(9.86, 6.76) controlPoint1: CGPointMake(9.58, 7.03) controlPoint2: CGPointMake(9.72, 6.89)];
    [rotate2Path addLineToPoint: CGPointMake(8.45, 4.3)];
    [rotate2Path addLineToPoint: CGPointMake(12.83, 4.31)];
    [rotate2Path addLineToPoint: CGPointMake(13, 4.19)];
    [rotate2Path addLineToPoint: CGPointMake(13.09, 4.31)];
    [rotate2Path addLineToPoint: CGPointMake(19.21, 4.33)];
    [rotate2Path addLineToPoint: CGPointMake(14.03, 14.07)];
    [rotate2Path addLineToPoint: CGPointMake(11.95, 10.43)];
    [rotate2Path addCurveToPoint: CGPointMake(12.27, 36.37) controlPoint1: CGPointMake(5.24, 17.71) controlPoint2: CGPointMake(5.35, 29.23)];
    [rotate2Path addCurveToPoint: CGPointMake(37.71, 36.37) controlPoint1: CGPointMake(19.29, 43.63) controlPoint2: CGPointMake(30.68, 43.63)];
    [rotate2Path addCurveToPoint: CGPointMake(37.71, 10.1) controlPoint1: CGPointMake(44.74, 29.12) controlPoint2: CGPointMake(44.74, 17.35)];
    [rotate2Path addCurveToPoint: CGPointMake(34.29, 7.33) controlPoint1: CGPointMake(36.66, 9.01) controlPoint2: CGPointMake(35.51, 8.09)];
    [rotate2Path addCurveToPoint: CGPointMake(36.69, 4) controlPoint1: CGPointMake(35.14, 6.15) controlPoint2: CGPointMake(35.96, 5.02)];
    [rotate2Path addCurveToPoint: CGPointMake(40.54, 7.18) controlPoint1: CGPointMake(38.05, 4.89) controlPoint2: CGPointMake(39.35, 5.95)];
    [rotate2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
    [color setFill];
    [rotate2Path fill];
    CGContextRestoreGState(context);
    
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(18, 33)];
    [bezierPath addCurveToPoint: CGPointMake(20, 35) controlPoint1: CGPointMake(18, 34.1) controlPoint2: CGPointMake(18.9, 35)];
    [bezierPath addLineToPoint: CGPointMake(31, 35)];
    [bezierPath addCurveToPoint: CGPointMake(33, 33) controlPoint1: CGPointMake(32.1, 35) controlPoint2: CGPointMake(33, 34.1)];
    [bezierPath addLineToPoint: CGPointMake(33, 23)];
    [bezierPath addCurveToPoint: CGPointMake(31, 21) controlPoint1: CGPointMake(33, 21.9) controlPoint2: CGPointMake(32.1, 21)];
    [bezierPath addLineToPoint: CGPointMake(20, 21)];
    [bezierPath addCurveToPoint: CGPointMake(18, 23) controlPoint1: CGPointMake(18.9, 21) controlPoint2: CGPointMake(18, 21.9)];
    [bezierPath addLineToPoint: CGPointMake(18, 33)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(31, 16)];
    [bezierPath addLineToPoint: CGPointMake(31, 21)];
    [bezierPath addLineToPoint: CGPointMake(29.5, 21)];
    [bezierPath addLineToPoint: CGPointMake(29.5, 16.5)];
    [bezierPath addCurveToPoint: CGPointMake(27.5, 14.5) controlPoint1: CGPointMake(29.5, 15.4) controlPoint2: CGPointMake(28.6, 14.5)];
    [bezierPath addLineToPoint: CGPointMake(23.5, 14.5)];
    [bezierPath addCurveToPoint: CGPointMake(21.5, 16.5) controlPoint1: CGPointMake(22.4, 14.5) controlPoint2: CGPointMake(21.5, 15.4)];
    [bezierPath addLineToPoint: CGPointMake(21.5, 21)];
    [bezierPath addLineToPoint: CGPointMake(20, 21)];
    [bezierPath addLineToPoint: CGPointMake(20, 16)];
    [bezierPath addCurveToPoint: CGPointMake(23, 13) controlPoint1: CGPointMake(20, 14.34) controlPoint2: CGPointMake(21.34, 13)];
    [bezierPath addLineToPoint: CGPointMake(28, 13)];
    [bezierPath addCurveToPoint: CGPointMake(31, 16) controlPoint1: CGPointMake(29.66, 13) controlPoint2: CGPointMake(31, 14.34)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
    [color setFill];
    [bezierPath fill];
    CGContextRestoreGState(context);
    
    
    
  

  
}


@end
