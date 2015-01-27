//
//  ADSetupCylinderRefTeaCupButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefTeaCupButton.h"

@implementation ADSetupCylinderRefTeaCupButton

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 46) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.50000 + 0.5), 46, 44);
    
    
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
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.49, CGRectGetMinY(iconNormal) + 3.56)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.49, CGRectGetMinY(iconNormal) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.93, CGRectGetMinY(iconNormal) + 5.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.93, CGRectGetMinY(iconNormal) + 9.87)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.05, CGRectGetMinY(iconNormal) + 14.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.34, CGRectGetMinY(iconNormal) + 14.68)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.46, CGRectGetMinY(iconNormal) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.46, CGRectGetMinY(iconNormal) + 5.97)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.49, CGRectGetMinY(iconNormal) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.34, CGRectGetMinY(iconNormal) + 1.16) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.05, CGRectGetMinY(iconNormal) + 1.16)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 14.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.13, CGRectGetMinY(iconNormal) + 14.55) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.29, CGRectGetMinY(iconNormal) + 14.26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.21, CGRectGetMinY(iconNormal) + 14.42)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.46, CGRectGetMinY(iconNormal) + 30.06) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.93, CGRectGetMinY(iconNormal) + 19.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.66, CGRectGetMinY(iconNormal) + 25.49)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 30.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.67, CGRectGetMinY(iconNormal) + 30.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.01, CGRectGetMinY(iconNormal) + 30.51)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 38.92, CGRectGetMinY(iconNormal) + 26.99) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 30.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 36.56, CGRectGetMinY(iconNormal) + 29.33)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 43.64, CGRectGetMinY(iconNormal) + 18.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.28, CGRectGetMinY(iconNormal) + 24.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 43.65, CGRectGetMinY(iconNormal) + 22.05)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 41.28, CGRectGetMinY(iconNormal) + 12.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 43.64, CGRectGetMinY(iconNormal) + 15.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 43.35, CGRectGetMinY(iconNormal) + 14.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 14.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.22, CGRectGetMinY(iconNormal) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 36.56, CGRectGetMinY(iconNormal) + 11.73)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.72, CGRectGetMinY(iconNormal) + 2.58)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.83, CGRectGetMinY(iconNormal) + 4.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 6.55)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.31, CGRectGetMinY(iconNormal) + 10.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.36, CGRectGetMinY(iconNormal) + 9.47)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 10.56)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 42.46, CGRectGetMinY(iconNormal) + 10.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 37.74, CGRectGetMinY(iconNormal) + 9.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 40.1, CGRectGetMinY(iconNormal) + 9.39)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 46, CGRectGetMinY(iconNormal) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 44.82, CGRectGetMinY(iconNormal) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 46, CGRectGetMinY(iconNormal) + 14.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.1, CGRectGetMinY(iconNormal) + 29.33) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 46, CGRectGetMinY(iconNormal) + 21.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 42.76, CGRectGetMinY(iconNormal) + 26.4)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.28, CGRectGetMinY(iconNormal) + 34.02) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 37.66, CGRectGetMinY(iconNormal) + 32.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.88, CGRectGetMinY(iconNormal) + 33.92)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.21, CGRectGetMinY(iconNormal) + 35.79) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.23, CGRectGetMinY(iconNormal) + 35.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.21, CGRectGetMinY(iconNormal) + 35.79)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.21, CGRectGetMinY(iconNormal) + 36.96)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.04, CGRectGetMinY(iconNormal) + 36.96)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.54, CGRectGetMinY(iconNormal) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.57, CGRectGetMinY(iconNormal) + 38.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 32.07, CGRectGetMinY(iconNormal) + 40.29)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.84, CGRectGetMinY(iconNormal) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.32, CGRectGetMinY(iconNormal) + 44.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.06, CGRectGetMinY(iconNormal) + 44.8)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.34, CGRectGetMinY(iconNormal) + 36.96) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.31, CGRectGetMinY(iconNormal) + 40.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.81, CGRectGetMinY(iconNormal) + 38.66)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.18, CGRectGetMinY(iconNormal) + 36.96)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 8.8)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.66, CGRectGetMinY(iconNormal) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 6.55) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.55, CGRectGetMinY(iconNormal) + 4.3)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.72, CGRectGetMinY(iconNormal) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.88, CGRectGetMinY(iconNormal) - 0.86) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.5, CGRectGetMinY(iconNormal) - 0.86)];
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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.526];
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0.987 blue: 0.959 alpha: 0.719];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.7 + 0.3) green: (iconColorRGBA[1] * 0.7 + 0.3) blue: (iconColorRGBA[2] * 0.7 + 0.3) alpha: (iconColorRGBA[3] * 0.7 + 0.3)];
    CGFloat gradientColorRGBA[4];
    [gradientColor getRed: &gradientColorRGBA[0] green: &gradientColorRGBA[1] blue: &gradientColorRGBA[2] alpha: &gradientColorRGBA[3]];
    
    UIColor* iconSpecularColor = [UIColor colorWithRed: (gradientColorRGBA[0] * 0.9 + 0.1) green: (gradientColorRGBA[1] * 0.9 + 0.1) blue: (gradientColorRGBA[2] * 0.9 + 0.1) alpha: (gradientColorRGBA[3] * 0.9 + 0.1)];
    CGFloat iconSpecularColorRGBA[4];
    [iconSpecularColor getRed: &iconSpecularColorRGBA[0] green: &iconSpecularColorRGBA[1] blue: &iconSpecularColorRGBA[2] alpha: &iconSpecularColorRGBA[3]];
    
    UIColor* glowColor = [UIColor colorWithRed: (iconSpecularColorRGBA[0] * 1 + 0) green: (iconSpecularColorRGBA[1] * 1 + 0) blue: (iconSpecularColorRGBA[2] * 1 + 0) alpha: (iconSpecularColorRGBA[3] * 1 + 0)];
    UIColor* iconShadowColor4 = [UIColor colorWithRed: 0.752 green: 0.729 blue: 0.678 alpha: 0.5];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 2;
    UIColor* iconShadow = iconShadowColor4;
    CGSize iconShadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat iconShadowBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 46) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.50000 + 0.5), 46, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.49, CGRectGetMinY(iconNormal) + 3.56)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.49, CGRectGetMinY(iconNormal) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.93, CGRectGetMinY(iconNormal) + 5.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.93, CGRectGetMinY(iconNormal) + 9.87)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.05, CGRectGetMinY(iconNormal) + 14.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.34, CGRectGetMinY(iconNormal) + 14.68)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.46, CGRectGetMinY(iconNormal) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.46, CGRectGetMinY(iconNormal) + 5.97)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.49, CGRectGetMinY(iconNormal) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.34, CGRectGetMinY(iconNormal) + 1.16) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.05, CGRectGetMinY(iconNormal) + 1.16)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 14.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.13, CGRectGetMinY(iconNormal) + 14.55) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.29, CGRectGetMinY(iconNormal) + 14.26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.21, CGRectGetMinY(iconNormal) + 14.42)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.46, CGRectGetMinY(iconNormal) + 30.06) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.93, CGRectGetMinY(iconNormal) + 19.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.66, CGRectGetMinY(iconNormal) + 25.49)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 30.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.67, CGRectGetMinY(iconNormal) + 30.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.01, CGRectGetMinY(iconNormal) + 30.51)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 38.92, CGRectGetMinY(iconNormal) + 26.99) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 30.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 36.56, CGRectGetMinY(iconNormal) + 29.33)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 43.64, CGRectGetMinY(iconNormal) + 18.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.28, CGRectGetMinY(iconNormal) + 24.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 43.65, CGRectGetMinY(iconNormal) + 22.05)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 41.28, CGRectGetMinY(iconNormal) + 12.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 43.64, CGRectGetMinY(iconNormal) + 15.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 43.35, CGRectGetMinY(iconNormal) + 14.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 14.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.22, CGRectGetMinY(iconNormal) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 36.56, CGRectGetMinY(iconNormal) + 11.73)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.72, CGRectGetMinY(iconNormal) + 2.58)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.83, CGRectGetMinY(iconNormal) + 4.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 6.55)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.31, CGRectGetMinY(iconNormal) + 10.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.36, CGRectGetMinY(iconNormal) + 9.47)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.38, CGRectGetMinY(iconNormal) + 10.56)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 42.46, CGRectGetMinY(iconNormal) + 10.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 37.74, CGRectGetMinY(iconNormal) + 9.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 40.1, CGRectGetMinY(iconNormal) + 9.39)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 46, CGRectGetMinY(iconNormal) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 44.82, CGRectGetMinY(iconNormal) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 46, CGRectGetMinY(iconNormal) + 14.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.1, CGRectGetMinY(iconNormal) + 29.33) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 46, CGRectGetMinY(iconNormal) + 21.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 42.76, CGRectGetMinY(iconNormal) + 26.4)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.28, CGRectGetMinY(iconNormal) + 34.02) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 37.66, CGRectGetMinY(iconNormal) + 32.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.88, CGRectGetMinY(iconNormal) + 33.92)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.21, CGRectGetMinY(iconNormal) + 35.79) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.23, CGRectGetMinY(iconNormal) + 35.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.21, CGRectGetMinY(iconNormal) + 35.79)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.21, CGRectGetMinY(iconNormal) + 36.96)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.04, CGRectGetMinY(iconNormal) + 36.96)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.54, CGRectGetMinY(iconNormal) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.57, CGRectGetMinY(iconNormal) + 38.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 32.07, CGRectGetMinY(iconNormal) + 40.29)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.84, CGRectGetMinY(iconNormal) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.32, CGRectGetMinY(iconNormal) + 44.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.06, CGRectGetMinY(iconNormal) + 44.8)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.34, CGRectGetMinY(iconNormal) + 36.96) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.31, CGRectGetMinY(iconNormal) + 40.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.81, CGRectGetMinY(iconNormal) + 38.66)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.18, CGRectGetMinY(iconNormal) + 36.96)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 8.8)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.66, CGRectGetMinY(iconNormal) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 6.55) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.55, CGRectGetMinY(iconNormal) + 4.3)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.72, CGRectGetMinY(iconNormal) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.88, CGRectGetMinY(iconNormal) - 0.86) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.5, CGRectGetMinY(iconNormal) - 0.86)];
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
