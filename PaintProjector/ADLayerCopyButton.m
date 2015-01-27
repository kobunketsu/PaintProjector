//
//  LayerCopyButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-24.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerCopyButton.h"

@implementation ADLayerCopyButton

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
- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = iconColor;
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Group
    {
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
        [bezier5Path moveToPoint: CGPointMake(27.87, 15.18)];
        [bezier5Path addLineToPoint: CGPointMake(25.91, 15.18)];
        [bezier5Path addCurveToPoint: CGPointMake(25.26, 15.86) controlPoint1: CGPointMake(25.55, 15.18) controlPoint2: CGPointMake(25.26, 15.49)];
        [bezier5Path addLineToPoint: CGPointMake(25.26, 19.95)];
        [bezier5Path addLineToPoint: CGPointMake(21.35, 19.95)];
        [bezier5Path addCurveToPoint: CGPointMake(20.7, 20.64) controlPoint1: CGPointMake(20.99, 19.95) controlPoint2: CGPointMake(20.7, 20.26)];
        [bezier5Path addLineToPoint: CGPointMake(20.7, 22.68)];
        [bezier5Path addCurveToPoint: CGPointMake(21.35, 23.36) controlPoint1: CGPointMake(20.7, 23.06) controlPoint2: CGPointMake(20.99, 23.36)];
        [bezier5Path addLineToPoint: CGPointMake(25.26, 23.36)];
        [bezier5Path addLineToPoint: CGPointMake(25.26, 27.45)];
        [bezier5Path addCurveToPoint: CGPointMake(25.91, 28.14) controlPoint1: CGPointMake(25.26, 27.83) controlPoint2: CGPointMake(25.55, 28.14)];
        [bezier5Path addLineToPoint: CGPointMake(27.87, 28.14)];
        [bezier5Path addCurveToPoint: CGPointMake(28.52, 27.45) controlPoint1: CGPointMake(28.23, 28.14) controlPoint2: CGPointMake(28.52, 27.83)];
        [bezier5Path addLineToPoint: CGPointMake(28.52, 23.36)];
        [bezier5Path addLineToPoint: CGPointMake(32.43, 23.36)];
        [bezier5Path addCurveToPoint: CGPointMake(33.09, 22.68) controlPoint1: CGPointMake(32.79, 23.36) controlPoint2: CGPointMake(33.09, 23.06)];
        [bezier5Path addLineToPoint: CGPointMake(33.09, 20.64)];
        [bezier5Path addCurveToPoint: CGPointMake(32.43, 19.95) controlPoint1: CGPointMake(33.09, 20.26) controlPoint2: CGPointMake(32.79, 19.95)];
        [bezier5Path addLineToPoint: CGPointMake(28.52, 19.95)];
        [bezier5Path addLineToPoint: CGPointMake(28.52, 15.86)];
        [bezier5Path addCurveToPoint: CGPointMake(27.87, 15.18) controlPoint1: CGPointMake(28.52, 15.49) controlPoint2: CGPointMake(28.23, 15.18)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(37, 9.73)];
        [bezier5Path addLineToPoint: CGPointMake(37, 34.27)];
        [bezier5Path addCurveToPoint: CGPointMake(34.39, 37) controlPoint1: CGPointMake(37, 35.78) controlPoint2: CGPointMake(35.83, 37)];
        [bezier5Path addLineToPoint: CGPointMake(19.39, 37)];
        [bezier5Path addCurveToPoint: CGPointMake(16.78, 34.27) controlPoint1: CGPointMake(17.95, 37) controlPoint2: CGPointMake(16.78, 35.78)];
        [bezier5Path addLineToPoint: CGPointMake(16.78, 9.73)];
        [bezier5Path addCurveToPoint: CGPointMake(19.39, 7) controlPoint1: CGPointMake(16.78, 8.22) controlPoint2: CGPointMake(17.95, 7)];
        [bezier5Path addLineToPoint: CGPointMake(34.39, 7)];
        [bezier5Path addCurveToPoint: CGPointMake(37, 9.73) controlPoint1: CGPointMake(35.83, 7) controlPoint2: CGPointMake(37, 8.22)];
        [bezier5Path closePath];
        [bezier5Path moveToPoint: CGPointMake(13.52, 10.41)];
        [bezier5Path addLineToPoint: CGPointMake(10.91, 10.41)];
        [bezier5Path addCurveToPoint: CGPointMake(10.26, 11.09) controlPoint1: CGPointMake(10.55, 10.41) controlPoint2: CGPointMake(10.26, 10.71)];
        [bezier5Path addLineToPoint: CGPointMake(10.26, 32.91)];
        [bezier5Path addCurveToPoint: CGPointMake(10.91, 33.59) controlPoint1: CGPointMake(10.26, 33.29) controlPoint2: CGPointMake(10.55, 33.59)];
        [bezier5Path addLineToPoint: CGPointMake(13.52, 33.59)];
        [bezier5Path addCurveToPoint: CGPointMake(16.13, 37) controlPoint1: CGPointMake(13.52, 35.1) controlPoint2: CGPointMake(14.69, 37)];
        [bezier5Path addLineToPoint: CGPointMake(9.61, 37)];
        [bezier5Path addCurveToPoint: CGPointMake(7, 34.27) controlPoint1: CGPointMake(8.17, 37) controlPoint2: CGPointMake(7, 35.78)];
        [bezier5Path addLineToPoint: CGPointMake(7, 9.73)];
        [bezier5Path addCurveToPoint: CGPointMake(9.61, 7) controlPoint1: CGPointMake(7, 8.22) controlPoint2: CGPointMake(8.17, 7)];
        [bezier5Path addLineToPoint: CGPointMake(16.13, 7)];
        [bezier5Path addCurveToPoint: CGPointMake(13.52, 10.41) controlPoint1: CGPointMake(14.69, 7) controlPoint2: CGPointMake(13.52, 8.9)];
        [bezier5Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [color setFill];
        [bezier5Path fill];
        CGContextRestoreGState(context);
        
    }

}




@end
