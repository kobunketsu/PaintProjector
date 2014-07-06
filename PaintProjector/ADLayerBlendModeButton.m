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
    //// Color Declarations
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 1];
    UIColor* color = iconColor;
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(32.05, 7.95)];
        [bezier2Path addCurveToPoint: CGPointMake(35.04, 22.5) controlPoint1: CGPointMake(35.98, 11.89) controlPoint2: CGPointMake(36.98, 17.64)];
        [bezier2Path addCurveToPoint: CGPointMake(32.05, 37.05) controlPoint1: CGPointMake(36.98, 27.36) controlPoint2: CGPointMake(35.98, 33.11)];
        [bezier2Path addCurveToPoint: CGPointMake(12.95, 37.05) controlPoint1: CGPointMake(26.77, 42.32) controlPoint2: CGPointMake(18.23, 42.32)];
        [bezier2Path addCurveToPoint: CGPointMake(9.96, 22.5) controlPoint1: CGPointMake(9.02, 33.11) controlPoint2: CGPointMake(8.02, 27.36)];
        [bezier2Path addCurveToPoint: CGPointMake(12.95, 7.95) controlPoint1: CGPointMake(8.02, 17.64) controlPoint2: CGPointMake(9.02, 11.89)];
        [bezier2Path addCurveToPoint: CGPointMake(32.05, 7.95) controlPoint1: CGPointMake(18.23, 2.68) controlPoint2: CGPointMake(26.77, 2.68)];
        [bezier2Path closePath];
        [gradientColor2 setFill];
        [bezier2Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(32.05, 17.95)];
        [bezierPath addCurveToPoint: CGPointMake(35.04, 22.5) controlPoint1: CGPointMake(33.39, 19.29) controlPoint2: CGPointMake(34.38, 20.84)];
        [bezierPath addCurveToPoint: CGPointMake(32.05, 27.05) controlPoint1: CGPointMake(34.38, 24.16) controlPoint2: CGPointMake(33.39, 25.71)];
        [bezierPath addCurveToPoint: CGPointMake(12.95, 27.05) controlPoint1: CGPointMake(26.77, 32.32) controlPoint2: CGPointMake(18.23, 32.32)];
        [bezierPath addCurveToPoint: CGPointMake(9.96, 22.5) controlPoint1: CGPointMake(11.61, 25.71) controlPoint2: CGPointMake(10.62, 24.16)];
        [bezierPath addCurveToPoint: CGPointMake(12.95, 17.95) controlPoint1: CGPointMake(10.62, 20.84) controlPoint2: CGPointMake(11.61, 19.29)];
        [bezierPath addCurveToPoint: CGPointMake(32.05, 17.95) controlPoint1: CGPointMake(18.23, 12.68) controlPoint2: CGPointMake(26.77, 12.68)];
        [bezierPath closePath];
        [color setFill];
        [bezierPath fill];
    }
    
    

}


@end
