//
//  ADSetupCylinderRefNormalButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefNormalButton.h"

@implementation ADSetupCylinderRefNormalButton

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 30.28) * 0.51400 + 0.14) + 0.36, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.47727) + 0.5, 30.28, 44);
    
    
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
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 12.23)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.76, CGRectGetMinY(iconNormal) + 9.43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.76, CGRectGetMinY(iconNormal) + 4.9)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) - 0.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) - 0.7)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 12.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 1.48, CGRectGetMinY(iconNormal) + 4.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 1.48, CGRectGetMinY(iconNormal) + 9.43)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 12.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 15.02) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 15.02)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 14.27)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 14.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 17.07) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 17.07)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.8, CGRectGetMinY(iconNormal) + 12.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 11.04)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 36.84)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 37.86)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.12, CGRectGetMinY(iconNormal) + 37.86)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.68, CGRectGetMinY(iconNormal) + 39.34) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.25, CGRectGetMinY(iconNormal) + 40.76)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 44.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 44.7)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15, CGRectGetMinY(iconNormal) + 37.86) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 40.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.6, CGRectGetMinY(iconNormal) + 39.34)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37.86)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 9.21)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 14.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 11.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.48, CGRectGetMinY(iconNormal) + 12.88)];
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
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
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
    UIColor* iconShadowTempColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.3) green: (iconColorRGBA[1] * 0.3) blue: (iconColorRGBA[2] * 0.3) alpha: (iconColorRGBA[3] * 0.3 + 0.7)];
    UIColor* iconShadowColor = [iconShadowTempColor colorWithAlphaComponent: 0.1];
    
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 30.28) * 0.51400 + 0.14) + 0.36, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.47727) + 0.5, 30.28, 44);
    
    
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
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 12.23)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.76, CGRectGetMinY(iconNormal) + 9.43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.76, CGRectGetMinY(iconNormal) + 4.9)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) - 0.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) - 0.7)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 12.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 1.48, CGRectGetMinY(iconNormal) + 4.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 1.48, CGRectGetMinY(iconNormal) + 9.43)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 12.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 15.02) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 15.02)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 14.27)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 14.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 17.07) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 17.07)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.8, CGRectGetMinY(iconNormal) + 12.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 11.04)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 36.84)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 37.86)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.12, CGRectGetMinY(iconNormal) + 37.86)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.68, CGRectGetMinY(iconNormal) + 39.34) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.25, CGRectGetMinY(iconNormal) + 40.76)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 44.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 44.7)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15, CGRectGetMinY(iconNormal) + 37.86) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 40.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.6, CGRectGetMinY(iconNormal) + 39.34)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37.86)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 9.21)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 14.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 11.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.48, CGRectGetMinY(iconNormal) + 12.88)];
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

@end
