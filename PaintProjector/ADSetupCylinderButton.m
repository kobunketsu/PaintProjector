//
//  ADSetupCylinderButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderButton.h"

@implementation ADSetupCylinderButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0.467 blue: 1 alpha: 1];
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
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 31) * 0.48571 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.47727) + 0.5, 31, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.62, CGRectGetMinY(iconNormal) + 4.78)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.62, CGRectGetMinY(iconNormal) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.82, CGRectGetMinY(iconNormal) + 6.38) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.82, CGRectGetMinY(iconNormal) + 8.97)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.38, CGRectGetMinY(iconNormal) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.42, CGRectGetMinY(iconNormal) + 12.17) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.58, CGRectGetMinY(iconNormal) + 12.17)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.38, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.18, CGRectGetMinY(iconNormal) + 8.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.18, CGRectGetMinY(iconNormal) + 6.38)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.62, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.58, CGRectGetMinY(iconNormal) + 3.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.42, CGRectGetMinY(iconNormal) + 3.18)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.46, CGRectGetMinY(iconNormal) + 2.1)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.96, CGRectGetMinY(iconNormal) + 6.65) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 3.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.71, CGRectGetMinY(iconNormal) + 4.99)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 16.88)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 36.84) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 25.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 36.84)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 37.86)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.84, CGRectGetMinY(iconNormal) + 37.86)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.46, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.38, CGRectGetMinY(iconNormal) + 39.34) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.92, CGRectGetMinY(iconNormal) + 40.76)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.54, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.41, CGRectGetMinY(iconNormal) + 44.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.59, CGRectGetMinY(iconNormal) + 44.7)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16, CGRectGetMinY(iconNormal) + 37.86) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.08, CGRectGetMinY(iconNormal) + 40.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62, CGRectGetMinY(iconNormal) + 39.34)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37.86)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 16.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37.86) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 25.37)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.04, CGRectGetMinY(iconNormal) + 6.65)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.54, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29, CGRectGetMinY(iconNormal) + 4.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.8, CGRectGetMinY(iconNormal) + 3.37)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.46, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.59, CGRectGetMinY(iconNormal) - 0.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.41, CGRectGetMinY(iconNormal) - 0.7)];
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
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.7 + 0.3) green: (iconColorRGBA[1] * 0.7 + 0.3) blue: (iconColorRGBA[2] * 0.7 + 0.3) alpha: (iconColorRGBA[3] * 0.7 + 0.3)];
    CGFloat gradientColorRGBA[4];
    [gradientColor getRed: &gradientColorRGBA[0] green: &gradientColorRGBA[1] blue: &gradientColorRGBA[2] alpha: &gradientColorRGBA[3]];
    
    UIColor* iconSpecularColor = [UIColor colorWithRed: (gradientColorRGBA[0] * 0.9 + 0.1) green: (gradientColorRGBA[1] * 0.9 + 0.1) blue: (gradientColorRGBA[2] * 0.9 + 0.1) alpha: (gradientColorRGBA[3] * 0.9 + 0.1)];
    CGFloat iconSpecularColorRGBA[4];
    [iconSpecularColor getRed: &iconSpecularColorRGBA[0] green: &iconSpecularColorRGBA[1] blue: &iconSpecularColorRGBA[2] alpha: &iconSpecularColorRGBA[3]];
    
    UIColor* glowColor = [UIColor colorWithRed: (iconSpecularColorRGBA[0] * 1 + 0) green: (iconSpecularColorRGBA[1] * 1 + 0) blue: (iconSpecularColorRGBA[2] * 1 + 0) alpha: (iconSpecularColorRGBA[3] * 1 + 0)];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 31.14) * 0.48766 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.47727) + 0.5, 31.14, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.66, CGRectGetMinY(iconNormal) + 4.78)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.66, CGRectGetMinY(iconNormal) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.85, CGRectGetMinY(iconNormal) + 6.38) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.85, CGRectGetMinY(iconNormal) + 8.97)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.48, CGRectGetMinY(iconNormal) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.48, CGRectGetMinY(iconNormal) + 12.17) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.66, CGRectGetMinY(iconNormal) + 12.17)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.48, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.29, CGRectGetMinY(iconNormal) + 8.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.29, CGRectGetMinY(iconNormal) + 6.38)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.66, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.66, CGRectGetMinY(iconNormal) + 3.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.48, CGRectGetMinY(iconNormal) + 3.18)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.58, CGRectGetMinY(iconNormal) + 2.1)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.1, CGRectGetMinY(iconNormal) + 6.65) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.34, CGRectGetMinY(iconNormal) + 3.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.84, CGRectGetMinY(iconNormal) + 4.99)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.14, CGRectGetMinY(iconNormal) + 16.88)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.14, CGRectGetMinY(iconNormal) + 36.84) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.14, CGRectGetMinY(iconNormal) + 25.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.14, CGRectGetMinY(iconNormal) + 36.84)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.14, CGRectGetMinY(iconNormal) + 37.86)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.98, CGRectGetMinY(iconNormal) + 37.86)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.58, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.52, CGRectGetMinY(iconNormal) + 39.34) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.05, CGRectGetMinY(iconNormal) + 40.76)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.56, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.5, CGRectGetMinY(iconNormal) + 44.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.64, CGRectGetMinY(iconNormal) + 44.7)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16, CGRectGetMinY(iconNormal) + 37.86) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.09, CGRectGetMinY(iconNormal) + 40.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62, CGRectGetMinY(iconNormal) + 39.34)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37.86)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 16.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37.86) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 25.37)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.04, CGRectGetMinY(iconNormal) + 6.65)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.56, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.3, CGRectGetMinY(iconNormal) + 4.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.8, CGRectGetMinY(iconNormal) + 3.37)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.58, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.64, CGRectGetMinY(iconNormal) - 0.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.5, CGRectGetMinY(iconNormal) - 0.7)];
            [bezierPath closePath];
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
            
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}


@end
