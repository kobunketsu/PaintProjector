//
//  AnamorphicTopViewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicTopViewButton.h"

@implementation AnamorphicTopViewButton

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
    
    //// Group
    {
        //// Oval 2 Drawing
        UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(27, 17, 26, 26)];
        [iconGlowColor setFill];
        [oval2Path fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(27.35, 21.93)];
        [bezier4Path addCurveToPoint: CGPointMake(29.39, 40.61) controlPoint1: CGPointMake(23.64, 27.73) controlPoint2: CGPointMake(24.32, 35.53)];
        [bezier4Path addCurveToPoint: CGPointMake(50.61, 40.61) controlPoint1: CGPointMake(35.25, 46.46) controlPoint2: CGPointMake(44.75, 46.46)];
        [bezier4Path addCurveToPoint: CGPointMake(52.66, 21.94) controlPoint1: CGPointMake(55.67, 35.54) controlPoint2: CGPointMake(56.36, 27.75)];
        [bezier4Path addLineToPoint: CGPointMake(70.4, 17.15)];
        [bezier4Path addCurveToPoint: CGPointMake(63.33, 53.33) controlPoint1: CGPointMake(75.47, 29.15) controlPoint2: CGPointMake(73.12, 43.55)];
        [bezier4Path addCurveToPoint: CGPointMake(16.67, 53.33) controlPoint1: CGPointMake(50.45, 66.22) controlPoint2: CGPointMake(29.55, 66.22)];
        [bezier4Path addCurveToPoint: CGPointMake(9.77, 16.75) controlPoint1: CGPointMake(6.78, 43.44) controlPoint2: CGPointMake(4.48, 28.84)];
        [bezier4Path addLineToPoint: CGPointMake(27.35, 21.93)];
        [bezier4Path closePath];
        [iconGlowColor setFill];
        [bezier4Path fill];
    }
    
    
    
}


@end
