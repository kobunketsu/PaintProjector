//
//  LayerBlendModeButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerBlendModeButton.h"

@implementation ADLayerBlendModeButton

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.841 green: 0.841 blue: 0.841 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color = iconColor;
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 2;
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(32.05, 6.95)];
        [bezier2Path addCurveToPoint: CGPointMake(35.04, 21.5) controlPoint1: CGPointMake(35.98, 10.89) controlPoint2: CGPointMake(36.98, 16.64)];
        [bezier2Path addCurveToPoint: CGPointMake(32.05, 36.05) controlPoint1: CGPointMake(36.98, 26.36) controlPoint2: CGPointMake(35.98, 32.11)];
        [bezier2Path addCurveToPoint: CGPointMake(12.95, 36.05) controlPoint1: CGPointMake(26.77, 41.32) controlPoint2: CGPointMake(18.23, 41.32)];
        [bezier2Path addCurveToPoint: CGPointMake(9.96, 21.5) controlPoint1: CGPointMake(9.02, 32.11) controlPoint2: CGPointMake(8.02, 26.36)];
        [bezier2Path addCurveToPoint: CGPointMake(12.95, 6.95) controlPoint1: CGPointMake(8.02, 16.64) controlPoint2: CGPointMake(9.02, 10.89)];
        [bezier2Path addCurveToPoint: CGPointMake(32.05, 6.95) controlPoint1: CGPointMake(18.23, 1.68) controlPoint2: CGPointMake(26.77, 1.68)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [gradientColor2 setFill];
        [bezier2Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(32.05, 16.95)];
        [bezierPath addCurveToPoint: CGPointMake(35.04, 21.5) controlPoint1: CGPointMake(33.39, 18.29) controlPoint2: CGPointMake(34.38, 19.84)];
        [bezierPath addCurveToPoint: CGPointMake(32.05, 26.05) controlPoint1: CGPointMake(34.38, 23.16) controlPoint2: CGPointMake(33.39, 24.71)];
        [bezierPath addCurveToPoint: CGPointMake(12.95, 26.05) controlPoint1: CGPointMake(26.77, 31.32) controlPoint2: CGPointMake(18.23, 31.32)];
        [bezierPath addCurveToPoint: CGPointMake(9.96, 21.5) controlPoint1: CGPointMake(11.61, 24.71) controlPoint2: CGPointMake(10.62, 23.16)];
        [bezierPath addCurveToPoint: CGPointMake(12.95, 16.95) controlPoint1: CGPointMake(10.62, 19.84) controlPoint2: CGPointMake(11.61, 18.29)];
        [bezierPath addCurveToPoint: CGPointMake(32.05, 16.95) controlPoint1: CGPointMake(18.23, 11.68) controlPoint2: CGPointMake(26.77, 11.68)];
        [bezierPath closePath];
        [color setFill];
        [bezierPath fill];
    }

}


@end
