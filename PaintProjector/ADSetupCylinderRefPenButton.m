//
//  ADSetupCylinderRefPenButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefPenButton.h"

@implementation ADSetupCylinderRefPenButton

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 5) * 0.50820 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 48) * 0.55556 + 0.5), 5, 48);
    
    
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
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 43)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.75, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.5, CGRectGetMinY(iconNormal) + 48)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 43)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.5, CGRectGetMinY(iconNormal) + 43.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 43.5)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 43) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.75, CGRectGetMinY(iconNormal) + 43.5) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 43)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.44, CGRectGetMinY(iconNormal) + 1.29)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.44, CGRectGetMinY(iconNormal) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.85, CGRectGetMinY(iconNormal) + 1.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.85, CGRectGetMinY(iconNormal) + 2.32)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.56, CGRectGetMinY(iconNormal) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 3.1) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.97, CGRectGetMinY(iconNormal) + 3.1)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.56, CGRectGetMinY(iconNormal) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.15, CGRectGetMinY(iconNormal) + 2.32) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.15, CGRectGetMinY(iconNormal) + 1.68)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.44, CGRectGetMinY(iconNormal) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.97, CGRectGetMinY(iconNormal) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 0.9)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.27, CGRectGetMinY(iconNormal) + 0.44)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.54, CGRectGetMinY(iconNormal) + 0.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 1.17)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 5.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 36.15)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.86, CGRectGetMinY(iconNormal) + 41) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.86, CGRectGetMinY(iconNormal) + 41)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.27, CGRectGetMinY(iconNormal) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.74, CGRectGetMinY(iconNormal) + 41.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.54, CGRectGetMinY(iconNormal) + 41.4)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73, CGRectGetMinY(iconNormal) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.29, CGRectGetMinY(iconNormal) + 42.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.71, CGRectGetMinY(iconNormal) + 42.15)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14, CGRectGetMinY(iconNormal) + 41) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46, CGRectGetMinY(iconNormal) + 41.4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.26, CGRectGetMinY(iconNormal) + 41.2)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14, CGRectGetMinY(iconNormal) + 41) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 40.83)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 36.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 5.85)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73, CGRectGetMinY(iconNormal) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 1.17) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46, CGRectGetMinY(iconNormal) + 0.6)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.27, CGRectGetMinY(iconNormal) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.71, CGRectGetMinY(iconNormal) - 0.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.29, CGRectGetMinY(iconNormal) - 0.15)];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [bezier2Path fill];
            
            ////// Bezier 2 Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezier2Path.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezier2Path fill];
                
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 5) * 0.50820 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 48) * 0.55556 + 0.5), 5, 48);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 43)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.75, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.5, CGRectGetMinY(iconNormal) + 48)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 43)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.5, CGRectGetMinY(iconNormal) + 43.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4, CGRectGetMinY(iconNormal) + 43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 43.5)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 43) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.75, CGRectGetMinY(iconNormal) + 43.5) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1, CGRectGetMinY(iconNormal) + 43)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.44, CGRectGetMinY(iconNormal) + 1.29)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.44, CGRectGetMinY(iconNormal) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.85, CGRectGetMinY(iconNormal) + 1.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.85, CGRectGetMinY(iconNormal) + 2.32)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.56, CGRectGetMinY(iconNormal) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 3.1) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.97, CGRectGetMinY(iconNormal) + 3.1)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.56, CGRectGetMinY(iconNormal) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.15, CGRectGetMinY(iconNormal) + 2.32) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.15, CGRectGetMinY(iconNormal) + 1.68)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.44, CGRectGetMinY(iconNormal) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.97, CGRectGetMinY(iconNormal) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 0.9)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.27, CGRectGetMinY(iconNormal) + 0.44)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.54, CGRectGetMinY(iconNormal) + 0.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 1.17)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 5.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 36.15)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.86, CGRectGetMinY(iconNormal) + 41) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.86, CGRectGetMinY(iconNormal) + 41)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.27, CGRectGetMinY(iconNormal) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.74, CGRectGetMinY(iconNormal) + 41.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.54, CGRectGetMinY(iconNormal) + 41.4)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73, CGRectGetMinY(iconNormal) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.29, CGRectGetMinY(iconNormal) + 42.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.71, CGRectGetMinY(iconNormal) + 42.15)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14, CGRectGetMinY(iconNormal) + 41) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46, CGRectGetMinY(iconNormal) + 41.4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.26, CGRectGetMinY(iconNormal) + 41.2)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14, CGRectGetMinY(iconNormal) + 41) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 40.83)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 36.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 5.85)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73, CGRectGetMinY(iconNormal) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 1.17) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46, CGRectGetMinY(iconNormal) + 0.6)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.27, CGRectGetMinY(iconNormal) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.71, CGRectGetMinY(iconNormal) - 0.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.29, CGRectGetMinY(iconNormal) - 0.15)];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            [iconColor setFill];
            [bezier2Path fill];
            
            ////// Bezier 2 Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezier2Path.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezier2Path fill];
                
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
