//
//  SetupUnitZoomView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupUnitZoomView.h"

@implementation SetupUnitZoomView

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.46667 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 35) * 0.54839 + 0.5), 51, 35);
    
    
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
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36112 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12080 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62459 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29476 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62459 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18716 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42119 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12080 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.53656 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05444 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46520 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05444 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42119 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36112 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37718 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18716 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37718 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29476 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36112 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46520 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42749 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.53656 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42749 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11769 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01485 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06310 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14531 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02311 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19950 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04088 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.36689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30414 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09424 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34254 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26185 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50488 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45093 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39124 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34642 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42641 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45093 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64286 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30414 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58334 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45093 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61445 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35983 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81331 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06310 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.67127 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24844 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.76191 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08774 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89667 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02123 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84425 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04828 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87616 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03191 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82163 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.04783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25999 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03314 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60316 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15728 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82163 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65608 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.05946 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.05946 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11737 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01475 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.02489 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60118 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03820 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25375 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11769 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01485 * CGRectGetHeight(iconNormal))];
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
