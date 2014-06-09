//
//  SetupEyeView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupEyeView.h"

@implementation SetupEyeView

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
    UIColor* iconShadowColor = [iconShadowTempColor colorWithAlphaComponent: 0.1];
    
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
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 66);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 54) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 34) * 0.53125 + 0.5), 54, 34);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20453 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76606 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.23485 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35959 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.23485 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61100 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76606 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.43011 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.92112 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58840 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.92112 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20453 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.78367 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61100 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.78367 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35959 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20453 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58840 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04947 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.43011 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04947 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50385 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00003 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80118 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13931 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.50385 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00003 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.67714 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00106 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99998 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49422 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.92521 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27756 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.99998 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49422 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80118 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86069 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.99998 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49422 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.92431 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71956 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50746 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99990 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.67804 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.50746 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99990 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19882 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86069 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.50746 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99990 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.32567 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99743 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00006 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51177 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.07198 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72395 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00006 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51177 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19882 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13931 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00006 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51177 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.07288 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28195 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50385 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00003 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.32477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00333 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.50385 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00003 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59709 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59537 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59709 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34580 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.64048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52646 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41472 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43995 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34580 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.55369 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27689 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.48334 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27689 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43995 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59537 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39656 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41472 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.39656 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52646 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59709 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59537 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.48334 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66429 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.55369 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66429 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            [iconColor setFill];
            [bezierPath fill];
            
            ////// Bezier Inner Shadow
            CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezierBorderRect = CGRectOffset(bezierBorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
            
            UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
            [bezierNegativePath appendPath: bezierPath];
            bezierNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezierBorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezierPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                [bezierNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezierNegativePath fill];
            }
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
