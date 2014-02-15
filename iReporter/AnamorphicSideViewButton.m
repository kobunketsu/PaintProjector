//
//  AnamorphicViewModeButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicSideViewButton.h"

@implementation AnamorphicSideViewButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0.468 green: 0.468 blue: 0.468 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconGlowColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.9 alpha: iconColorHSBA[3]];
    
    //// Group 2
    {
        //// Oval 4 Drawing
        UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(28, 16, 26, 6)];
        [iconGlowColor setFill];
        [oval4Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(53.71, 56)];
        [bezierPath addLineToPoint: CGPointMake(52.96, 56)];
        [bezierPath addCurveToPoint: CGPointMake(49.84, 57.12) controlPoint1: CGPointMake(52.32, 56.41) controlPoint2: CGPointMake(51.28, 56.79)];
        [bezierPath addCurveToPoint: CGPointMake(31.17, 57.12) controlPoint1: CGPointMake(44.69, 58.29) controlPoint2: CGPointMake(36.33, 58.29)];
        [bezierPath addCurveToPoint: CGPointMake(28.06, 56) controlPoint1: CGPointMake(29.73, 56.79) controlPoint2: CGPointMake(28.7, 56.41)];
        [bezierPath addLineToPoint: CGPointMake(27.31, 56)];
        [bezierPath addLineToPoint: CGPointMake(27.31, 21)];
        [bezierPath addCurveToPoint: CGPointMake(31.17, 23.12) controlPoint1: CGPointMake(27.31, 21.77) controlPoint2: CGPointMake(28.6, 22.54)];
        [bezierPath addCurveToPoint: CGPointMake(49.84, 23.12) controlPoint1: CGPointMake(36.33, 24.29) controlPoint2: CGPointMake(44.69, 24.29)];
        [bezierPath addCurveToPoint: CGPointMake(53.71, 21) controlPoint1: CGPointMake(52.42, 22.54) controlPoint2: CGPointMake(53.71, 21.77)];
        [bezierPath addLineToPoint: CGPointMake(53.71, 56)];
        [bezierPath closePath];
        [iconGlowColor setFill];
        [bezierPath fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(25.75, 57.37)];
        [bezier3Path addLineToPoint: CGPointMake(26.59, 57.37)];
        [bezier3Path addCurveToPoint: CGPointMake(30.09, 58.67) controlPoint1: CGPointMake(27.31, 57.84) controlPoint2: CGPointMake(28.47, 58.29)];
        [bezier3Path addCurveToPoint: CGPointMake(51.05, 58.67) controlPoint1: CGPointMake(35.88, 60.03) controlPoint2: CGPointMake(45.26, 60.03)];
        [bezier3Path addCurveToPoint: CGPointMake(54.55, 57.37) controlPoint1: CGPointMake(52.67, 58.29) controlPoint2: CGPointMake(53.83, 57.84)];
        [bezier3Path addLineToPoint: CGPointMake(55.39, 57.37)];
        [bezier3Path addLineToPoint: CGPointMake(55.39, 51.29)];
        [bezier3Path addCurveToPoint: CGPointMake(62.98, 52.61) controlPoint1: CGPointMake(58.12, 51.63) controlPoint2: CGPointMake(60.68, 52.07)];
        [bezier3Path addCurveToPoint: CGPointMake(62.98, 63.29) controlPoint1: CGPointMake(75.66, 55.56) controlPoint2: CGPointMake(75.66, 60.34)];
        [bezier3Path addCurveToPoint: CGPointMake(17.02, 63.29) controlPoint1: CGPointMake(50.29, 66.24) controlPoint2: CGPointMake(29.71, 66.24)];
        [bezier3Path addCurveToPoint: CGPointMake(17.02, 52.61) controlPoint1: CGPointMake(4.34, 60.34) controlPoint2: CGPointMake(4.34, 55.56)];
        [bezier3Path addCurveToPoint: CGPointMake(25.75, 51.16) controlPoint1: CGPointMake(19.64, 52) controlPoint2: CGPointMake(22.6, 51.51)];
        [bezier3Path addLineToPoint: CGPointMake(25.75, 57.37)];
        [bezier3Path closePath];
        [iconGlowColor setFill];
        [bezier3Path fill];
    }
    
    
    
}


@end
