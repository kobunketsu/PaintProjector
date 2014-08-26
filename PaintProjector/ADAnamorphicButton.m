//
//  AnamorphicButton.m
//  AnaDraw
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAnamorphicButton.h"

@implementation ADAnamorphicButton

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

- (void)setIsReversePaint:(BOOL)isReversePaint{
    _isReversePaint = isReversePaint;
    [self.layer setNeedsDisplay];
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    if (self.isReversePaint) {
        [self drawReverseWithFrame:self.bounds ctx:ctx iconColor:iconColor];
    }
    else{
        [self drawNormalWithFrame:self.bounds ctx:ctx iconColor:iconColor];
    }
}

- (void)drawNormalWithFrame:(CGRect)frame9 ctx:(CGContextRef)ctx iconColor:(UIColor*)iconColor{
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
    CGRect iconNormal9 = CGRectMake(CGRectGetMinX(frame9) + floor((CGRectGetWidth(frame9) - 50.59) * 0.49356 + 0.09) + 0.41, CGRectGetMinY(frame9) + floor((CGRectGetHeight(frame9) - 43.61) * 0.50540 + 0.5), 50.59, 43.61);
    
    
    //// Close 2
    {
        //// IconNormal 9
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 4
            {
                //// Bezier 7 Drawing
                UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 30.07, CGRectGetMinY(iconNormal9) + 7.38)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 30.07, CGRectGetMinY(iconNormal9) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 32.6, CGRectGetMinY(iconNormal9) + 5.69) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 32.6, CGRectGetMinY(iconNormal9) + 2.95)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 20.91, CGRectGetMinY(iconNormal9) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 27.54, CGRectGetMinY(iconNormal9) - 0.42) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 23.44, CGRectGetMinY(iconNormal9) - 0.42)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 20.91, CGRectGetMinY(iconNormal9) + 7.38) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 18.38, CGRectGetMinY(iconNormal9) + 2.95) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 18.38, CGRectGetMinY(iconNormal9) + 5.69)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 30.07, CGRectGetMinY(iconNormal9) + 7.38) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 23.44, CGRectGetMinY(iconNormal9) + 9.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 27.54, CGRectGetMinY(iconNormal9) + 9.06)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 6.54)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 5.95)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.13, CGRectGetMinY(iconNormal9) + 5.95)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 6.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 19.09, CGRectGetMinY(iconNormal9) + 6.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 6.34)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 31.92, CGRectGetMinY(iconNormal9) + 5.95)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 31.92, CGRectGetMinY(iconNormal9) + 20.43)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 30.04, CGRectGetMinY(iconNormal9) + 23.43) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 31.85, CGRectGetMinY(iconNormal9) + 21.52) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 31.23, CGRectGetMinY(iconNormal9) + 22.59)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 20.96, CGRectGetMinY(iconNormal9) + 23.43) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 27.53, CGRectGetMinY(iconNormal9) + 25.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 23.47, CGRectGetMinY(iconNormal9) + 25.19)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 20.43) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 19.77, CGRectGetMinY(iconNormal9) + 22.59) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 19.15, CGRectGetMinY(iconNormal9) + 21.52)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 20.23)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 6.54)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 20.96, CGRectGetMinY(iconNormal9) + 8.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 19.08, CGRectGetMinY(iconNormal9) + 7.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 19.7, CGRectGetMinY(iconNormal9) + 8.04)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 30.04, CGRectGetMinY(iconNormal9) + 8.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 23.47, CGRectGetMinY(iconNormal9) + 10.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 27.53, CGRectGetMinY(iconNormal9) + 10.68)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 31.87, CGRectGetMinY(iconNormal9) + 5.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 31.51, CGRectGetMinY(iconNormal9) + 7.89) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 32.12, CGRectGetMinY(iconNormal9) + 7.29)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 31.92, CGRectGetMinY(iconNormal9) + 5.95)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 5.51, CGRectGetMinY(iconNormal9) + 14.69)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 11.61, CGRectGetMinY(iconNormal9) + 16.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 6.92, CGRectGetMinY(iconNormal9) + 14.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 9.69, CGRectGetMinY(iconNormal9) + 15.45)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 18.24, CGRectGetMinY(iconNormal9) + 22.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 14.31, CGRectGetMinY(iconNormal9) + 17.02) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 17, CGRectGetMinY(iconNormal9) + 21.18)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 25.29, CGRectGetMinY(iconNormal9) + 26.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 19.48, CGRectGetMinY(iconNormal9) + 23.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 21.28, CGRectGetMinY(iconNormal9) + 26.35)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 32.34, CGRectGetMinY(iconNormal9) + 22.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 29.3, CGRectGetMinY(iconNormal9) + 26.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 30.89, CGRectGetMinY(iconNormal9) + 24.06)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 41.05, CGRectGetMinY(iconNormal9) + 16.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 33.79, CGRectGetMinY(iconNormal9) + 20.79) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 38.42, CGRectGetMinY(iconNormal9) + 16.83)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 45.31, CGRectGetMinY(iconNormal9) + 14.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 42.63, CGRectGetMinY(iconNormal9) + 15.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 44.26, CGRectGetMinY(iconNormal9) + 15.19)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 43.05, CGRectGetMinY(iconNormal9) + 38.37) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 53.03, CGRectGetMinY(iconNormal9) + 21.89) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 52.28, CGRectGetMinY(iconNormal9) + 31.96)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 7.53, CGRectGetMinY(iconNormal9) + 38.37) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) + 33.01, CGRectGetMinY(iconNormal9) + 45.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) + 17.57, CGRectGetMinY(iconNormal9) + 45.35)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 5.49, CGRectGetMinY(iconNormal9) + 14.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal9) - 1.78, CGRectGetMinY(iconNormal9) + 31.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal9) - 2.46, CGRectGetMinY(iconNormal9) + 21.7)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal9) + 5.51, CGRectGetMinY(iconNormal9) + 14.69)];
                [bezier7Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier7Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}



- (void)drawReverseWithFrame:(CGRect)frame ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 63.5) * 0.50775 - 0) + 0.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43.48) * 0.45230 + 0.5), 63.5, 43.48);
    
    
    //// Close
    {
        //// IconNormal
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 5
            {
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 7.61)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 1.75)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 12.36)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 18.22)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.57, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.69, CGRectGetMinY(iconNormal) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.16, CGRectGetMinY(iconNormal) + 1.15)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.89, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.96, CGRectGetMinY(iconNormal) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.33, CGRectGetMinY(iconNormal) + 10.91)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.74, CGRectGetMinY(iconNormal) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.46, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.71, CGRectGetMinY(iconNormal) + 19.25)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.59, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 36.78, CGRectGetMinY(iconNormal) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 38.77, CGRectGetMinY(iconNormal) + 15.23)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 51.52, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 42.41, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 48.23, CGRectGetMinY(iconNormal) + 3.22)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 56.87, CGRectGetMinY(iconNormal) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 53.51, CGRectGetMinY(iconNormal) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 55.55, CGRectGetMinY(iconNormal) + 0.76)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 54.04, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 66.56, CGRectGetMinY(iconNormal) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 65.62, CGRectGetMinY(iconNormal) + 25.97)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.45, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.44, CGRectGetMinY(iconNormal) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.06, CGRectGetMinY(iconNormal) + 46.11)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.89, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 2.23, CGRectGetMinY(iconNormal) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 3.08, CGRectGetMinY(iconNormal) + 10.55)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezierPath fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
