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
//    if (self.isReversePaint) {
//        [self drawReverseWithFrame:self.bounds ctx:ctx iconColor:iconColor];
//    }
//    else{
        [self drawNormalWithFrame:self.bounds ctx:ctx iconColor:iconColor];
//    }
}

- (void)drawNormalWithFrame:(CGRect)frame ctx:(CGContextRef)ctx iconColor:(UIColor*)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.49046 - 0) + 0.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.42526 - 0.19) + 0.69, 44, 44);
    
    
    //// Close
    {
        //// IconNormal
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 5
            {
                //// Bezier 14 Drawing
                UIBezierPath* bezier14Path = UIBezierPath.bezierPath;
                [bezier14Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.05, CGRectGetMinY(iconNormal) + 2.82)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.54, CGRectGetMinY(iconNormal) + 19.18)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 19.18)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 23.55)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.72, CGRectGetMinY(iconNormal) + 23.99)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.18, CGRectGetMinY(iconNormal) + 41.33)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.31, CGRectGetMinY(iconNormal) + 44)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 21.1)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.31, CGRectGetMinY(iconNormal))];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.05, CGRectGetMinY(iconNormal) + 2.82)];
                [bezier14Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier14Path fill];
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
