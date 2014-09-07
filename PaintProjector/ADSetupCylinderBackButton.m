//
//  ADSetupCylinderBackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderBackButton.h"

@implementation ADSetupCylinderBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 45.43) * 0.51395 - 0.07) + 0.57, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45.69) * 0.49665 + 0.28) + 0.22, 45.43, 45.69);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextSetAlpha(context, 0.5);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            //// IconNormal 2
            {
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
                CGContextBeginTransparencyLayer(context, NULL);
                
                
                //// Group
                {
                    //// Bezier Drawing
                    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.57, CGRectGetMinY(iconNormal) + 2.92)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.61, CGRectGetMinY(iconNormal) + 19.91)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 19.91)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 24.45)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.43, CGRectGetMinY(iconNormal) + 24.91)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.43, CGRectGetMinY(iconNormal) + 42.91)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.4, CGRectGetMinY(iconNormal) + 45.69)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 45.43, CGRectGetMinY(iconNormal) + 21.91)];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.4, CGRectGetMinY(iconNormal))];
                    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.57, CGRectGetMinY(iconNormal) + 2.92)];
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
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}


- (void)drawSelectedWithFrame: (CGRect)frame;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.464];
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
    UIColor* iconShadowColor4 = [UIColor colorWithRed: 0.762 green: 0.746 blue: 0.746 alpha: 0.5];
    
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
    CGRect iconNormal2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 45.43) * 0.51395 - 0.07) + 0.57, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45.69) * 0.49665 + 0.28) + 0.22, 45.43, 45.69);
    
    
    //// IconNormal 2
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 19.57, CGRectGetMinY(iconNormal2) + 2.92)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 36.61, CGRectGetMinY(iconNormal2) + 19.91)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2), CGRectGetMinY(iconNormal2) + 19.91)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2), CGRectGetMinY(iconNormal2) + 24.45)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 36.43, CGRectGetMinY(iconNormal2) + 24.91)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 19.43, CGRectGetMinY(iconNormal2) + 42.91)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.4, CGRectGetMinY(iconNormal2) + 45.69)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 45.43, CGRectGetMinY(iconNormal2) + 21.91)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.4, CGRectGetMinY(iconNormal2))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 19.57, CGRectGetMinY(iconNormal2) + 2.92)];
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


@end
