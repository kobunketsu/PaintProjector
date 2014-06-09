//
//  ImportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ImportButton.h"

@implementation ImportButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.284];
//    UIColor* iconColor = [UIColor colorWithRed: 0.554 green: 0.554 blue: 0.554 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.8 + 0.2) green: (iconColorRGBA[1] * 0.8 + 0.2) blue: (iconColorRGBA[2] * 0.8 + 0.2) alpha: (iconColorRGBA[3] * 0.8 + 0.2)];
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
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.51948 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 51, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 1);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00849 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93435 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.05169 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99321 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00849 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.96685 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.02783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99321 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84882 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99321 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93435 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.78719 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.95680 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72833 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75468 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98066 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72833 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15968 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72833 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11648 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.78719 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00849 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93435 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44573 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11753 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44511 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22425 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.42123 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14680 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42096 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19458 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.53322 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22500 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25393 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.50872 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25427 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.53384 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11828 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.55772 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19574 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.55800 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14796 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44573 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11753 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.50968 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08861 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.47023 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08827 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15297 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18350 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.05189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42414 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.62505 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42900 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.37673 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27596 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29412 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15297 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18350 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.65207 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06700 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.65014 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39903 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59996 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45898 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.64995 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43237 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62748 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45921 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.05172 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45432 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00223 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39353 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.02419 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45409 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00204 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42687 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00415 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06150 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.05434 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00155 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00434 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02815 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.02681 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00131 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60258 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00620 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.65207 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06700 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.63010 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00644 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.65226 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03365 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22742 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70095 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18498 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.78928 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17834 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70095 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18498 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70095 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32660 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.82556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45666 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70095 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32660 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28898 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.82556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56213 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.82556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62433 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56213 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.75080 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56213 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.87540 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68287 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56213 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.92524 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56213 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.92524 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42647 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.92524 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56213 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.92524 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58653 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22742 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.92524 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35470 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.90023 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26732 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            [iconColor setFill];
            [bezier3Path fill];
            
            ////// Bezier 3 Inner Shadow
            CGRect bezier3BorderRect = CGRectInset([bezier3Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier3BorderRect = CGRectOffset(bezier3BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier3BorderRect = CGRectInset(CGRectUnion(bezier3BorderRect, [bezier3Path bounds]), -1, -1);
            
            UIBezierPath* bezier3NegativePath = [UIBezierPath bezierPathWithRect: bezier3BorderRect];
            [bezier3NegativePath appendPath: bezier3Path];
            bezier3NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier3BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier3Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier3BorderRect.size.width), 0);
                [bezier3NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier3NegativePath fill];
            }
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
