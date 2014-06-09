//
//  SetupCylinderImageView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupCylinderImageView.h"

@implementation SetupCylinderImageView

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 47) * 0.52632 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 47) * 0.52632 + 0.5), 47, 47);
    
    
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
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10638 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84043 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89362 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.10638 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86980 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.13020 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89362 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89362 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89362 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84043 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86980 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89362 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89362 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86980 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89362 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15957 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10638 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.89362 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13020 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.86980 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10638 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10638 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10638 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15957 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.13020 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10638 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.10638 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13020 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10638 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84043 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88298 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11702 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11702 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05239 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.05239 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88298 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11702 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.94761 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05239 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88298 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88298 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94761 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.94761 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11702 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88298 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.05239 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94761 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63830 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48936 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80851 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57447 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.73370 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48936 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.80851 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57447 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80851 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80851 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21277 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80851 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63830 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48936 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21277 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80851 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.45745 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48936 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56348 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47874 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19149 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.78723 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37975 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56341 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19149 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.78723 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19149 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49468 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38298 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.19149 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49468 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.22375 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38298 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56348 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47874 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38298 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.47634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40164 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79863 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33054 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79863 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18010 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84017 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28900 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.84017 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22164 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18010 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.75708 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13855 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.68973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13855 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33054 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.60663 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22164 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.60663 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28900 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79863 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33054 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.68973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37209 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75708 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37209 * CGRectGetHeight(iconNormal))];
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
