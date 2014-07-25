//
//  ADCylinderSetupMacProButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefMacProButton.h"

@implementation ADSetupCylinderRefMacProButton

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
    if (self.isSelected || self.isHighlighted) {
        [self drawSelectedWithFrame:rect];
    }
    else{
        [self drawNormalWithFrame:rect];
    }
}

- (void)drawNormalWithFrame: (CGRect)frame;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0.198 green: 0.198 blue: 0.198 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.7 + 0.3) green: (iconColorRGBA[1] * 0.7 + 0.3) blue: (iconColorRGBA[2] * 0.7 + 0.3) alpha: (iconColorRGBA[3] * 0.7 + 0.3)];
    CGFloat gradientColorRGBA[4];
    [gradientColor getRed: &gradientColorRGBA[0] green: &gradientColorRGBA[1] blue: &gradientColorRGBA[2] alpha: &gradientColorRGBA[3]];
    
    UIColor* iconSpecularColor = [UIColor colorWithRed: (gradientColorRGBA[0] * 0.9 + 0.1) green: (gradientColorRGBA[1] * 0.9 + 0.1) blue: (gradientColorRGBA[2] * 0.9 + 0.1) alpha: (gradientColorRGBA[3] * 0.9 + 0.1)];
    CGFloat iconSpecularColorRGBA[4];
    [iconSpecularColor getRed: &iconSpecularColorRGBA[0] green: &iconSpecularColorRGBA[1] blue: &iconSpecularColorRGBA[2] alpha: &iconSpecularColorRGBA[3]];
    
    UIColor* glowColor = [UIColor colorWithRed: (iconSpecularColorRGBA[0] * 1 + 0) green: (iconSpecularColorRGBA[1] * 1 + 0) blue: (iconSpecularColorRGBA[2] * 1 + 0) alpha: (iconSpecularColorRGBA[3] * 1 + 0)];
    UIColor* iconShadowTempColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.3) green: (iconColorRGBA[1] * 0.3) blue: (iconColorRGBA[2] * 0.3) alpha: (iconColorRGBA[3] * 0.3 + 0.7)];
    UIColor* iconShadowColor = [iconShadowTempColor colorWithAlphaComponent: 0.5];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 2;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat iconShadowBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 28) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44.5) * 0.51163) + 0.5, 28, 44.5);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Oval Drawing
            UIBezierPath* ovalPath = UIBezierPath.bezierPath;
            [ovalPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 11.15)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 5.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 9.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 7.23)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.77, CGRectGetMinY(iconNormal) + 5.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.79, CGRectGetMinY(iconNormal) + 4.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 4.23)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.77, CGRectGetMinY(iconNormal) + 11.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.32, CGRectGetMinY(iconNormal) + 7.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.32, CGRectGetMinY(iconNormal) + 9.65)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 11.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 12.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.79, CGRectGetMinY(iconNormal) + 12.65)];
            [ovalPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [ovalPath fill];
            
            ////// Oval Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(ovalPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [ovalPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.74, CGRectGetMinY(iconNormal) + 3.11)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.74, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.73, CGRectGetMinY(iconNormal) + 5.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.73, CGRectGetMinY(iconNormal) + 8.61)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.26, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.75, CGRectGetMinY(iconNormal) + 12.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.25, CGRectGetMinY(iconNormal) + 12.8)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.26, CGRectGetMinY(iconNormal) + 3.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.27, CGRectGetMinY(iconNormal) + 8.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.27, CGRectGetMinY(iconNormal) + 5.2)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.74, CGRectGetMinY(iconNormal) + 3.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.25, CGRectGetMinY(iconNormal) + 1.01) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.75, CGRectGetMinY(iconNormal) + 1.01)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.64, CGRectGetMinY(iconNormal) + 20.91)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.64, CGRectGetMinY(iconNormal) + 23.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5.03, CGRectGetMinY(iconNormal) + 21.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.03, CGRectGetMinY(iconNormal) + 22.48)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.84, CGRectGetMinY(iconNormal) + 23.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.25, CGRectGetMinY(iconNormal) + 23.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.23, CGRectGetMinY(iconNormal) + 23.68)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.84, CGRectGetMinY(iconNormal) + 20.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.45, CGRectGetMinY(iconNormal) + 22.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 8.45, CGRectGetMinY(iconNormal) + 21.51)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.64, CGRectGetMinY(iconNormal) + 20.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.23, CGRectGetMinY(iconNormal) + 20.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 6.25, CGRectGetMinY(iconNormal) + 20.31)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 20.46)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 20.46)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 22.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.3, CGRectGetMinY(iconNormal) + 20.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 21.38)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 36.83)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 38.87) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 37.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.3, CGRectGetMinY(iconNormal) + 38.87)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 38.87)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 36.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.7, CGRectGetMinY(iconNormal) + 38.87) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 37.96)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 22.51)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 20.46) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 21.38) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.7, CGRectGetMinY(iconNormal) + 20.46)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.9, CGRectGetMinY(iconNormal) + 2.25)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 7.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.63, CGRectGetMinY(iconNormal) + 3.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 5.71)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 37.34)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 38.36)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.86, CGRectGetMinY(iconNormal) + 38.36)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.9, CGRectGetMinY(iconNormal) + 42.4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.44, CGRectGetMinY(iconNormal) + 39.84) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 41.27)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.1, CGRectGetMinY(iconNormal) + 42.4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.43, CGRectGetMinY(iconNormal) + 45.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.57, CGRectGetMinY(iconNormal) + 45.2)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14, CGRectGetMinY(iconNormal) + 38.36) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.88, CGRectGetMinY(iconNormal) + 41.27) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.56, CGRectGetMinY(iconNormal) + 39.84)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 38.36)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 7.67)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.1, CGRectGetMinY(iconNormal) + 2.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 5.71) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.37, CGRectGetMinY(iconNormal) + 3.75)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.9, CGRectGetMinY(iconNormal) + 2.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.57, CGRectGetMinY(iconNormal) - 0.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.43, CGRectGetMinY(iconNormal) - 0.75)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 36.83)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 37.85) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 37.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.87, CGRectGetMinY(iconNormal) + 37.85)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 37.85)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 36.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.13, CGRectGetMinY(iconNormal) + 37.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 37.39)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 22.51)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 21.48) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 21.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.13, CGRectGetMinY(iconNormal) + 21.48)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 21.48)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 22.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.87, CGRectGetMinY(iconNormal) + 21.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 21.94)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 36.83)];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [bezierPath fill];
            
            ////// Bezier Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezierPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezierPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}

- (void)drawSelectedWithFrame: (CGRect)frame;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 1 + 0) green: (iconColorRGBA[1] * 1 + 0) blue: (iconColorRGBA[2] * 1 + 0) alpha: (iconColorRGBA[3] * 1 + 0)];
    CGFloat gradientColorRGBA[4];
    [gradientColor getRed: &gradientColorRGBA[0] green: &gradientColorRGBA[1] blue: &gradientColorRGBA[2] alpha: &gradientColorRGBA[3]];
    
    UIColor* iconSpecularColor = [UIColor colorWithRed: (gradientColorRGBA[0] * 1 + 0) green: (gradientColorRGBA[1] * 1 + 0) blue: (gradientColorRGBA[2] * 1 + 0) alpha: (gradientColorRGBA[3] * 1 + 0)];
    CGFloat iconSpecularColorRGBA[4];
    [iconSpecularColor getRed: &iconSpecularColorRGBA[0] green: &iconSpecularColorRGBA[1] blue: &iconSpecularColorRGBA[2] alpha: &iconSpecularColorRGBA[3]];
    
    UIColor* glowColor = [UIColor colorWithRed: (iconSpecularColorRGBA[0] * 1 + 0) green: (iconSpecularColorRGBA[1] * 1 + 0) blue: (iconSpecularColorRGBA[2] * 1 + 0) alpha: (iconSpecularColorRGBA[3] * 1 + 0)];
    UIColor* iconShadowTempColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.3) green: (iconColorRGBA[1] * 0.3) blue: (iconColorRGBA[2] * 0.3) alpha: (iconColorRGBA[3] * 0.3 + 0.7)];
    UIColor* iconShadowColor = [iconShadowTempColor colorWithAlphaComponent: 0.5];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 2;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat iconShadowBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 28) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44.5) * 0.51163) + 0.5, 28, 44.5);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.6);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Oval Drawing
            UIBezierPath* ovalPath = UIBezierPath.bezierPath;
            [ovalPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 11.15)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 5.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 9.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 7.23)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.77, CGRectGetMinY(iconNormal) + 5.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.79, CGRectGetMinY(iconNormal) + 4.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 4.23)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.77, CGRectGetMinY(iconNormal) + 11.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.32, CGRectGetMinY(iconNormal) + 7.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.32, CGRectGetMinY(iconNormal) + 9.65)];
            [ovalPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 11.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 12.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.79, CGRectGetMinY(iconNormal) + 12.65)];
            [ovalPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [ovalPath fill];
            
            ////// Oval Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(ovalPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [ovalPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.74, CGRectGetMinY(iconNormal) + 3.11)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.74, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.73, CGRectGetMinY(iconNormal) + 5.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.73, CGRectGetMinY(iconNormal) + 8.61)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.26, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.75, CGRectGetMinY(iconNormal) + 12.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.25, CGRectGetMinY(iconNormal) + 12.8)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.26, CGRectGetMinY(iconNormal) + 3.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.27, CGRectGetMinY(iconNormal) + 8.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.27, CGRectGetMinY(iconNormal) + 5.2)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.74, CGRectGetMinY(iconNormal) + 3.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.25, CGRectGetMinY(iconNormal) + 1.01) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.75, CGRectGetMinY(iconNormal) + 1.01)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.64, CGRectGetMinY(iconNormal) + 20.91)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.64, CGRectGetMinY(iconNormal) + 23.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5.03, CGRectGetMinY(iconNormal) + 21.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.03, CGRectGetMinY(iconNormal) + 22.48)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.84, CGRectGetMinY(iconNormal) + 23.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.25, CGRectGetMinY(iconNormal) + 23.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.23, CGRectGetMinY(iconNormal) + 23.68)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.84, CGRectGetMinY(iconNormal) + 20.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.45, CGRectGetMinY(iconNormal) + 22.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 8.45, CGRectGetMinY(iconNormal) + 21.51)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.64, CGRectGetMinY(iconNormal) + 20.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.23, CGRectGetMinY(iconNormal) + 20.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 6.25, CGRectGetMinY(iconNormal) + 20.31)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 20.46)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 20.46)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 22.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.3, CGRectGetMinY(iconNormal) + 20.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 21.38)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 36.83)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 38.87) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 37.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.3, CGRectGetMinY(iconNormal) + 38.87)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 38.87)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 36.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.7, CGRectGetMinY(iconNormal) + 38.87) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 37.96)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 22.51)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 20.46) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.63, CGRectGetMinY(iconNormal) + 21.38) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.7, CGRectGetMinY(iconNormal) + 20.46)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.9, CGRectGetMinY(iconNormal) + 2.25)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 7.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.63, CGRectGetMinY(iconNormal) + 3.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 5.71)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 37.34)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28, CGRectGetMinY(iconNormal) + 38.36)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.86, CGRectGetMinY(iconNormal) + 38.36)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.9, CGRectGetMinY(iconNormal) + 42.4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.44, CGRectGetMinY(iconNormal) + 39.84) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 41.27)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.1, CGRectGetMinY(iconNormal) + 42.4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.43, CGRectGetMinY(iconNormal) + 45.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.57, CGRectGetMinY(iconNormal) + 45.2)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14, CGRectGetMinY(iconNormal) + 38.36) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.88, CGRectGetMinY(iconNormal) + 41.27) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.56, CGRectGetMinY(iconNormal) + 39.84)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 38.36)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 7.67)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.1, CGRectGetMinY(iconNormal) + 2.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 5.71) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.37, CGRectGetMinY(iconNormal) + 3.75)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.9, CGRectGetMinY(iconNormal) + 2.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.57, CGRectGetMinY(iconNormal) - 0.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.43, CGRectGetMinY(iconNormal) - 0.75)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 36.83)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 37.85) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 37.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.87, CGRectGetMinY(iconNormal) + 37.85)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 37.85)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 36.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.13, CGRectGetMinY(iconNormal) + 37.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 37.39)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 22.51)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 21.48) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 21.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.13, CGRectGetMinY(iconNormal) + 21.48)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.44, CGRectGetMinY(iconNormal) + 21.48)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 22.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.87, CGRectGetMinY(iconNormal) + 21.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 21.94)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 36.83)];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [bezierPath fill];
            
            ////// Bezier Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezierPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezierPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}

@end