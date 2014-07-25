//
//  ADSetupCylinderRefCan.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefCanButton.h"

@implementation ADSetupCylinderRefCanButton

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 27) * 0.51282 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 47.5) * 0.48649) + 0.5, 27, 47.5);
    
    
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
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.37, CGRectGetMinY(iconNormal) + 2.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.37, CGRectGetMinY(iconNormal) + 10.39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88, CGRectGetMinY(iconNormal) + 4.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88, CGRectGetMinY(iconNormal) + 8.24)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.63, CGRectGetMinY(iconNormal) + 10.39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.86, CGRectGetMinY(iconNormal) + 12.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.14, CGRectGetMinY(iconNormal) + 12.54)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.63, CGRectGetMinY(iconNormal) + 2.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 8.24) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 4.76)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.37, CGRectGetMinY(iconNormal) + 2.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.14, CGRectGetMinY(iconNormal) + 0.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.86, CGRectGetMinY(iconNormal) + 0.46)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 2.2)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 7.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.68, CGRectGetMinY(iconNormal) + 3.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 5.58)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27, CGRectGetMinY(iconNormal) + 11)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27, CGRectGetMinY(iconNormal) + 39)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 41.5)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 45.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 41.5) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.19, CGRectGetMinY(iconNormal) + 44.34)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.95, CGRectGetMinY(iconNormal) + 45.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.77, CGRectGetMinY(iconNormal) + 48.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.23, CGRectGetMinY(iconNormal) + 48.18)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 41.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.81, CGRectGetMinY(iconNormal) + 44.34) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 41.5)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 39)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 11)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 7.5)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.95, CGRectGetMinY(iconNormal) + 2.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 5.58) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.32, CGRectGetMinY(iconNormal) + 3.66)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 2.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.23, CGRectGetMinY(iconNormal) - 0.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.77, CGRectGetMinY(iconNormal) - 0.73)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10, CGRectGetMinY(iconNormal) + 7.33)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 7.33)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.59, CGRectGetMinY(iconNormal) + 5.32)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.59, CGRectGetMinY(iconNormal) + 7.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.8, CGRectGetMinY(iconNormal) + 5.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.8, CGRectGetMinY(iconNormal) + 7.03)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.41, CGRectGetMinY(iconNormal) + 7.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.37, CGRectGetMinY(iconNormal) + 8.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.63, CGRectGetMinY(iconNormal) + 8.33)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.41, CGRectGetMinY(iconNormal) + 5.32) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.2, CGRectGetMinY(iconNormal) + 7.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.2, CGRectGetMinY(iconNormal) + 5.97)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.59, CGRectGetMinY(iconNormal) + 5.32) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.63, CGRectGetMinY(iconNormal) + 4.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 6.37, CGRectGetMinY(iconNormal) + 4.67)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 4.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 4.83)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 5.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.1, CGRectGetMinY(iconNormal) + 4.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 4.75)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 7.33)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 8.17) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 8.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.1, CGRectGetMinY(iconNormal) + 8.17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 9)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 7.33) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.9, CGRectGetMinY(iconNormal) + 9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 8.25)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 4.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.9, CGRectGetMinY(iconNormal) + 4)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [bezier3Path fill];
            
            ////// Bezier 3 Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezier3Path.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezier3Path fill];
                
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
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 27) * 0.51282 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 47.5) * 0.48649) + 0.5, 27, 47.5);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.37, CGRectGetMinY(iconNormal) + 2.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.37, CGRectGetMinY(iconNormal) + 10.39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88, CGRectGetMinY(iconNormal) + 4.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88, CGRectGetMinY(iconNormal) + 8.24)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.63, CGRectGetMinY(iconNormal) + 10.39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.86, CGRectGetMinY(iconNormal) + 12.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.14, CGRectGetMinY(iconNormal) + 12.54)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.63, CGRectGetMinY(iconNormal) + 2.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 8.24) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 4.76)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.37, CGRectGetMinY(iconNormal) + 2.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.14, CGRectGetMinY(iconNormal) + 0.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.86, CGRectGetMinY(iconNormal) + 0.46)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 2.2)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 7.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.68, CGRectGetMinY(iconNormal) + 3.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 5.58)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27, CGRectGetMinY(iconNormal) + 11)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27, CGRectGetMinY(iconNormal) + 39)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 41.5)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 45.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 41.5) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.19, CGRectGetMinY(iconNormal) + 44.34)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.95, CGRectGetMinY(iconNormal) + 45.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.77, CGRectGetMinY(iconNormal) + 48.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.23, CGRectGetMinY(iconNormal) + 48.18)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 41.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.81, CGRectGetMinY(iconNormal) + 44.34) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 41.5)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 39)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 11)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 7.5)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.95, CGRectGetMinY(iconNormal) + 2.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 5.58) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.32, CGRectGetMinY(iconNormal) + 3.66)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 2.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.23, CGRectGetMinY(iconNormal) - 0.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.77, CGRectGetMinY(iconNormal) - 0.73)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10, CGRectGetMinY(iconNormal) + 7.33)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 7.33)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.59, CGRectGetMinY(iconNormal) + 5.32)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.59, CGRectGetMinY(iconNormal) + 7.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.8, CGRectGetMinY(iconNormal) + 5.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.8, CGRectGetMinY(iconNormal) + 7.03)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.41, CGRectGetMinY(iconNormal) + 7.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.37, CGRectGetMinY(iconNormal) + 8.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.63, CGRectGetMinY(iconNormal) + 8.33)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.41, CGRectGetMinY(iconNormal) + 5.32) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.2, CGRectGetMinY(iconNormal) + 7.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.2, CGRectGetMinY(iconNormal) + 5.97)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.59, CGRectGetMinY(iconNormal) + 5.32) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.63, CGRectGetMinY(iconNormal) + 4.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 6.37, CGRectGetMinY(iconNormal) + 4.67)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 4.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 4.83)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 5.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.1, CGRectGetMinY(iconNormal) + 4.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 4.75)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 7.33)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13, CGRectGetMinY(iconNormal) + 8.17) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 8.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.1, CGRectGetMinY(iconNormal) + 8.17)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 9)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 7.33) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.9, CGRectGetMinY(iconNormal) + 9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 8.25)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 5.67)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 4.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.9, CGRectGetMinY(iconNormal) + 4)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6, CGRectGetMinY(iconNormal) + 4)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [bezier3Path fill];
            
            ////// Bezier 3 Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezier3Path.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezier3Path fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}

@end
