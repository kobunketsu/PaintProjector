//
//  SetupUnitZoomView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupUnitZoomView.h"

@implementation ADSetupUnitZoomView

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44.61) * 0.48568 + 0.5), 44, 44.61);
    
    
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
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 44.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 44.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 44.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 44.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.12, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.44, CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 8.14, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.59, CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.27, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.66, CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.34, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.71, CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.4, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 33, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 33, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 38, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.83, CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 36.52, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 38, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40, CGRectGetMinY(iconNormal) + 37.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 42.48, CGRectGetMinY(iconNormal) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 34.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 44.61)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 44, CGRectGetMinY(iconNormal) + 44.61)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.99, CGRectGetMinY(iconNormal) + 13.5)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.49, CGRectGetMinY(iconNormal) + 22) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.99, CGRectGetMinY(iconNormal) + 18.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.8, CGRectGetMinY(iconNormal) + 22)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.99, CGRectGetMinY(iconNormal) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.18, CGRectGetMinY(iconNormal) + 22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.99, CGRectGetMinY(iconNormal) + 18.19)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.49, CGRectGetMinY(iconNormal) + 5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.99, CGRectGetMinY(iconNormal) + 8.81) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.18, CGRectGetMinY(iconNormal) + 5)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.99, CGRectGetMinY(iconNormal) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.8, CGRectGetMinY(iconNormal) + 5) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.99, CGRectGetMinY(iconNormal) + 8.81)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.49, CGRectGetMinY(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 34.99, CGRectGetMinY(iconNormal) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.95, CGRectGetMinY(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.99, CGRectGetMinY(iconNormal) + 6.04)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.64, CGRectGetMinY(iconNormal) + 21.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 34.99, CGRectGetMinY(iconNormal) + 16.32) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 34.12, CGRectGetMinY(iconNormal) + 18.95)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.81, CGRectGetMinY(iconNormal) + 29.28) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 35.94, CGRectGetMinY(iconNormal) + 24.42) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 40.81, CGRectGetMinY(iconNormal) + 29.28)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.58, CGRectGetMinY(iconNormal) + 31.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.46, CGRectGetMinY(iconNormal) + 29.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 41.36, CGRectGetMinY(iconNormal) + 31.1)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 39.87, CGRectGetMinY(iconNormal) + 32.59)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 37.27, CGRectGetMinY(iconNormal) + 32.82) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.09, CGRectGetMinY(iconNormal) + 33.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 37.93, CGRectGetMinY(iconNormal) + 33.47)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.1, CGRectGetMinY(iconNormal) + 24.65) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 37.27, CGRectGetMinY(iconNormal) + 32.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 32.41, CGRectGetMinY(iconNormal) + 27.95)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.49, CGRectGetMinY(iconNormal) + 27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.94, CGRectGetMinY(iconNormal) + 26.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.31, CGRectGetMinY(iconNormal) + 27)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.99, CGRectGetMinY(iconNormal) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.03, CGRectGetMinY(iconNormal) + 27) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.99, CGRectGetMinY(iconNormal) + 20.96)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.49, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.99, CGRectGetMinY(iconNormal) + 6.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.03, CGRectGetMinY(iconNormal))];
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
