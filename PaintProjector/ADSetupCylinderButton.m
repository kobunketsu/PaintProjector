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
    UIColor* fillColor2 = [UIColor colorWithRed: 0.247 green: 0.557 blue: 0.996 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.941];
    UIColor* innerShadowColor = [UIColor colorWithRed: 0.327 green: 0.327 blue: 0.327 alpha: 1];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0.375 green: 0.375 blue: 0.375 alpha: 0.498];
    UIColor* hightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 13;
    UIColor* shadow = shadowColor4;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* innerShadow = innerShadowColor;
    CGSize innerShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat innerShadowBlurRadius = 0;
    UIColor* hightlight = hightlightColor;
    CGSize hightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat hightlightBlurRadius = 0;
    
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 30.28) * 0.51400 + 0.14) + 0.36, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.38636) + 0.5, 30.28, 44);
    
    
    //// Group 3
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 25.84, CGRectGetMinY(group3) + 12.95)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 25.84, CGRectGetMinY(group3) + 3.05) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 31.76, CGRectGetMinY(group3) + 10.22) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 31.76, CGRectGetMinY(group3) + 5.78)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 4.43, CGRectGetMinY(group3) + 3.05) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 19.93, CGRectGetMinY(group3) + 0.32) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 10.35, CGRectGetMinY(group3) + 0.32)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 4.43, CGRectGetMinY(group3) + 12.95) controlPoint1: CGPointMake(CGRectGetMinX(group3) - 1.48, CGRectGetMinY(group3) + 5.78) controlPoint2: CGPointMake(CGRectGetMinX(group3) - 1.48, CGRectGetMinY(group3) + 10.22)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 25.84, CGRectGetMinY(group3) + 12.95) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 10.35, CGRectGetMinY(group3) + 15.68) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 19.93, CGRectGetMinY(group3) + 15.68)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 4.43, CGRectGetMinY(group3) + 14.95)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 25.84, CGRectGetMinY(group3) + 14.95) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 10.35, CGRectGetMinY(group3) + 17.68) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 19.93, CGRectGetMinY(group3) + 17.68)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 30.28, CGRectGetMinY(group3) + 10) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 28.8, CGRectGetMinY(group3) + 13.58) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 30.28, CGRectGetMinY(group3) + 11.79)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 30.28, CGRectGetMinY(group3) + 37)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 30.28, CGRectGetMinY(group3) + 38)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 30.12, CGRectGetMinY(group3) + 38)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 25.84, CGRectGetMinY(group3) + 41.95) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 29.68, CGRectGetMinY(group3) + 39.45) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 28.25, CGRectGetMinY(group3) + 40.84)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 4.43, CGRectGetMinY(group3) + 41.95) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 19.93, CGRectGetMinY(group3) + 44.68) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 10.35, CGRectGetMinY(group3) + 44.68)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15, CGRectGetMinY(group3) + 38) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 2.03, CGRectGetMinY(group3) + 40.84) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.6, CGRectGetMinY(group3) + 39.45)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3), CGRectGetMinY(group3) + 38)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3), CGRectGetMinY(group3) + 10)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 4.43, CGRectGetMinY(group3) + 14.95) controlPoint1: CGPointMake(CGRectGetMinX(group3), CGRectGetMinY(group3) + 11.79) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.48, CGRectGetMinY(group3) + 13.58)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, hightlightOffset, hightlightBlurRadius, [hightlight CGColor]);
            [fillColor2 setFill];
            [bezier3Path fill];
            
            ////// Bezier 3 Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezier3Path.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([innerShadow CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [innerShadow colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, innerShadowOffset, innerShadowBlurRadius, [opaqueShadow CGColor]);
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 30.28) * 0.51400 + 0.14) + 0.36, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43) * 0.54348) + 0.5, 30.28, 43);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.5);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 11.95)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 2.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.76, CGRectGetMinY(iconNormal) + 9.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.76, CGRectGetMinY(iconNormal) + 4.78)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 2.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) - 0.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) - 0.68)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 11.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 1.48, CGRectGetMinY(iconNormal) + 4.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 1.48, CGRectGetMinY(iconNormal) + 9.22)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 11.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 14.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 14.68)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 13.95)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 13.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 16.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 16.68)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.8, CGRectGetMinY(iconNormal) + 12.58) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 10.79)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 36)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.28, CGRectGetMinY(iconNormal) + 37)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.12, CGRectGetMinY(iconNormal) + 37)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 40.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.68, CGRectGetMinY(iconNormal) + 38.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.25, CGRectGetMinY(iconNormal) + 39.84)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 40.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.93, CGRectGetMinY(iconNormal) + 43.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.35, CGRectGetMinY(iconNormal) + 43.68)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15, CGRectGetMinY(iconNormal) + 37) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.03, CGRectGetMinY(iconNormal) + 39.84) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.6, CGRectGetMinY(iconNormal) + 38.45)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 37)];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 9)];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.43, CGRectGetMinY(iconNormal) + 13.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 10.79) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.48, CGRectGetMinY(iconNormal) + 12.58)];
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
