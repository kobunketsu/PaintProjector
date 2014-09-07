//
//  SetupCylinderImageView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderImageView.h"

@implementation ADSetupCylinderImageView

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
    [self drawNormalWithFrame:rect];
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
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.50000 + 0.5), 44, 44);
    
    
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
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.68, CGRectGetMinY(iconNormal) + 36.98)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.02, CGRectGetMinY(iconNormal) + 39.32) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.68, CGRectGetMinY(iconNormal) + 38.27) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.73, CGRectGetMinY(iconNormal) + 39.32)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.98, CGRectGetMinY(iconNormal) + 39.32)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 39.32, CGRectGetMinY(iconNormal) + 36.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 38.27, CGRectGetMinY(iconNormal) + 39.32) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 39.32, CGRectGetMinY(iconNormal) + 38.27)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 39.32, CGRectGetMinY(iconNormal) + 7.02)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.98, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.32, CGRectGetMinY(iconNormal) + 5.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 38.27, CGRectGetMinY(iconNormal) + 4.68)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.02, CGRectGetMinY(iconNormal) + 4.68)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.68, CGRectGetMinY(iconNormal) + 7.02) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5.73, CGRectGetMinY(iconNormal) + 4.68) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 4.68, CGRectGetMinY(iconNormal) + 5.73)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.68, CGRectGetMinY(iconNormal) + 36.98)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 38.85)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 5.15)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.15, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 2.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.31, CGRectGetMinY(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 38.85, CGRectGetMinY(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 5.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.69, CGRectGetMinY(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 2.31)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 38.85)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 38.85, CGRectGetMinY(iconNormal) + 44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 41.69) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 41.69, CGRectGetMinY(iconNormal) + 44)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.15, CGRectGetMinY(iconNormal) + 44)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 38.85) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.31, CGRectGetMinY(iconNormal) + 44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 41.69)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.09, CGRectGetMinY(iconNormal) + 21.53)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.57, CGRectGetMinY(iconNormal) + 25.28) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 32.28, CGRectGetMinY(iconNormal) + 21.53) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 35.57, CGRectGetMinY(iconNormal) + 25.28)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.57, CGRectGetMinY(iconNormal) + 35.57)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.36, CGRectGetMinY(iconNormal) + 35.57)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.09, CGRectGetMinY(iconNormal) + 21.53) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.36, CGRectGetMinY(iconNormal) + 35.57) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.13, CGRectGetMinY(iconNormal) + 21.53)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.79, CGRectGetMinY(iconNormal) + 21.06)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.43, CGRectGetMinY(iconNormal) + 34.64) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.71, CGRectGetMinY(iconNormal) + 24.79) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 8.43, CGRectGetMinY(iconNormal) + 34.64)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.43, CGRectGetMinY(iconNormal) + 21.77)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.04, CGRectGetMinY(iconNormal) + 16.85) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.43, CGRectGetMinY(iconNormal) + 21.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.84, CGRectGetMinY(iconNormal) + 16.85)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.79, CGRectGetMinY(iconNormal) + 21.06) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.99, CGRectGetMinY(iconNormal) + 16.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.96, CGRectGetMinY(iconNormal) + 17.67)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.14, CGRectGetMinY(iconNormal) + 14.54)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.14, CGRectGetMinY(iconNormal) + 7.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 36.97, CGRectGetMinY(iconNormal) + 12.72) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 36.97, CGRectGetMinY(iconNormal) + 9.75)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.52, CGRectGetMinY(iconNormal) + 7.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.31, CGRectGetMinY(iconNormal) + 6.1) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.35, CGRectGetMinY(iconNormal) + 6.1)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.52, CGRectGetMinY(iconNormal) + 14.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.69, CGRectGetMinY(iconNormal) + 9.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.69, CGRectGetMinY(iconNormal) + 12.72)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 35.14, CGRectGetMinY(iconNormal) + 14.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.35, CGRectGetMinY(iconNormal) + 16.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.31, CGRectGetMinY(iconNormal) + 16.37)];
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


@end
