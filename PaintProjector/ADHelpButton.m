//
//  ADHelpButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADHelpButton.h"

@implementation ADHelpButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    [self drawCanvas1WithFrame10:self.bounds ctx:ctx iconColor:iconColor];
}

- (void)drawCanvas1WithFrame10: (CGRect)frame10 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
//    UIColor* iconColor = [UIColor colorWithRed: 0.484 green: 0.484 blue: 0.484 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconGradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.9) green: (iconColorRGBA[1] * 0.9) blue: (iconColorRGBA[2] * 0.9) alpha: (iconColorRGBA[3] * 0.9 + 0.1)];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.138];
    
    //dynamic change color
    if(self.isSelected || self.isHighlighted){
        iconShadowColor = iconGradientColor = [UIColor whiteColor];
    }
    
    //// Shadow Declarations
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat iconShadowBlurRadius = 10;
    UIColor* iconGradient = iconGradientColor;
    CGSize iconGradientOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconGradientBlurRadius = 0;
    
    
    //// Subframes
    CGRect iconNormal10 = CGRectMake(CGRectGetMinX(frame10) + floor((CGRectGetWidth(frame10) - 27.4) * 0.51688 + 0.04) + 0.46, CGRectGetMinY(frame10) + floor((CGRectGetHeight(frame10) - 43.77) * 0.44332 + 0.33) + 0.17, 27.4, 43.77);
    
    
    //// Help
    {
        //// IconNormal 10
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 7
            {
                //// Bezier 10 Drawing
                UIBezierPath* bezier10Path = UIBezierPath.bezierPath;
                [bezier10Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 10.35, CGRectGetMinY(iconNormal10) + 42.56)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 10.35, CGRectGetMinY(iconNormal10) + 39.77)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 10.93, CGRectGetMinY(iconNormal10) + 38.81) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 10.35, CGRectGetMinY(iconNormal10) + 39.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 10.63, CGRectGetMinY(iconNormal10) + 39.16)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 11.55, CGRectGetMinY(iconNormal10) + 38.38) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 11.23, CGRectGetMinY(iconNormal10) + 38.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 11.55, CGRectGetMinY(iconNormal10) + 38.38)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 15.38, CGRectGetMinY(iconNormal10) + 38.38)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 16.11, CGRectGetMinY(iconNormal10) + 38.81) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 15.38, CGRectGetMinY(iconNormal10) + 38.38) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 15.83, CGRectGetMinY(iconNormal10) + 38.46)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 16.47, CGRectGetMinY(iconNormal10) + 39.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 16.38, CGRectGetMinY(iconNormal10) + 39.16) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 16.47, CGRectGetMinY(iconNormal10) + 39.77)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 16.47, CGRectGetMinY(iconNormal10) + 42.6)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 16.11, CGRectGetMinY(iconNormal10) + 43.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 16.47, CGRectGetMinY(iconNormal10) + 42.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 16.41, CGRectGetMinY(iconNormal10) + 43.06)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 15.26, CGRectGetMinY(iconNormal10) + 43.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 15.8, CGRectGetMinY(iconNormal10) + 43.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 15.26, CGRectGetMinY(iconNormal10) + 43.77)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 11.67, CGRectGetMinY(iconNormal10) + 43.77)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 10.93, CGRectGetMinY(iconNormal10) + 43.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 11.67, CGRectGetMinY(iconNormal10) + 43.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 11.26, CGRectGetMinY(iconNormal10) + 43.66)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 10.35, CGRectGetMinY(iconNormal10) + 42.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 10.6, CGRectGetMinY(iconNormal10) + 43.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 10.35, CGRectGetMinY(iconNormal10) + 42.56)];
                [bezier10Path closePath];
                [bezier10Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal10), CGRectGetMinY(iconNormal10) + 13.94)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 3.74, CGRectGetMinY(iconNormal10) + 4.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 0.14, CGRectGetMinY(iconNormal10) + 9.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 1.39, CGRectGetMinY(iconNormal10) + 6.58)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 14.04, CGRectGetMinY(iconNormal10)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 6.24, CGRectGetMinY(iconNormal10) + 1.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 9.68, CGRectGetMinY(iconNormal10))];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 23.75, CGRectGetMinY(iconNormal10) + 3.46) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 18.08, CGRectGetMinY(iconNormal10)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 21.32, CGRectGetMinY(iconNormal10) + 1.15)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 27.4, CGRectGetMinY(iconNormal10) + 12.3) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 26.18, CGRectGetMinY(iconNormal10) + 5.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 27.4, CGRectGetMinY(iconNormal10) + 8.72)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 26.06, CGRectGetMinY(iconNormal10) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 27.4, CGRectGetMinY(iconNormal10) + 14.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 26.95, CGRectGetMinY(iconNormal10) + 16.24)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 20.66, CGRectGetMinY(iconNormal10) + 23.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 25.16, CGRectGetMinY(iconNormal10) + 18.95) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 23.37, CGRectGetMinY(iconNormal10) + 20.94)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 16.83, CGRectGetMinY(iconNormal10) + 28.41) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 18.69, CGRectGetMinY(iconNormal10) + 25.47) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 17.41, CGRectGetMinY(iconNormal10) + 27.09)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 15.96, CGRectGetMinY(iconNormal10) + 33.4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 16.31, CGRectGetMinY(iconNormal10) + 29.58) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 16.02, CGRectGetMinY(iconNormal10) + 31.24)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 15.05, CGRectGetMinY(iconNormal10) + 34.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 15.96, CGRectGetMinY(iconNormal10) + 33.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 15.05, CGRectGetMinY(iconNormal10) + 34.27)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 11.3, CGRectGetMinY(iconNormal10) + 34.27)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 10.49, CGRectGetMinY(iconNormal10) + 33.31) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 11.3, CGRectGetMinY(iconNormal10) + 34.27) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 10.48, CGRectGetMinY(iconNormal10) + 33.62)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 11.52, CGRectGetMinY(iconNormal10) + 27.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 10.56, CGRectGetMinY(iconNormal10) + 30.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 10.9, CGRectGetMinY(iconNormal10) + 28.77)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 16.11, CGRectGetMinY(iconNormal10) + 21.01) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 12.22, CGRectGetMinY(iconNormal10) + 25.38) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 13.75, CGRectGetMinY(iconNormal10) + 23.33)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 18.57, CGRectGetMinY(iconNormal10) + 18.58)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 20.35, CGRectGetMinY(iconNormal10) + 16.4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 19.3, CGRectGetMinY(iconNormal10) + 17.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 19.9, CGRectGetMinY(iconNormal10) + 17.15)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 21.58, CGRectGetMinY(iconNormal10) + 12.24) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 21.17, CGRectGetMinY(iconNormal10) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 21.58, CGRectGetMinY(iconNormal10) + 13.68)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 19.78, CGRectGetMinY(iconNormal10) + 7.01) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 21.58, CGRectGetMinY(iconNormal10) + 10.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 20.98, CGRectGetMinY(iconNormal10) + 8.49)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 13.83, CGRectGetMinY(iconNormal10) + 4.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 18.58, CGRectGetMinY(iconNormal10) + 5.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 16.6, CGRectGetMinY(iconNormal10) + 4.8)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 6.72, CGRectGetMinY(iconNormal10) + 8.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 10.4, CGRectGetMinY(iconNormal10) + 4.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 8.04, CGRectGetMinY(iconNormal10) + 6.07)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 5.51, CGRectGetMinY(iconNormal10) + 13.85) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 6.07, CGRectGetMinY(iconNormal10) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 5.66, CGRectGetMinY(iconNormal10) + 11.61)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 4.59, CGRectGetMinY(iconNormal10) + 14.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 5.49, CGRectGetMinY(iconNormal10) + 14.14) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) + 4.59, CGRectGetMinY(iconNormal10) + 14.73)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal10) + 0.8, CGRectGetMinY(iconNormal10) + 14.73)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal10), CGRectGetMinY(iconNormal10) + 13.94) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal10) + 0.8, CGRectGetMinY(iconNormal10) + 14.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal10) - 0.01, CGRectGetMinY(iconNormal10) + 14.2)];
                [bezier10Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier10Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
