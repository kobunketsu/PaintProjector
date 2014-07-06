//
//  UndoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADUndoButton.h"

@implementation ADUndoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
//    UIColor* iconColor = [UIColor colorWithRed: 0.476 green: 0.476 blue: 0.476 alpha: 1];
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
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 48) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 48, 44);
    
    
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
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.35125 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06844 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.18358 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.67555 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88491 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36491 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.75886 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82135 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29326 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88491 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88386 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.01205 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50821 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.01205 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.74055 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.67555 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99133 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.82135 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95551 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75886 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99133 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.67555 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87292 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81721 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80678 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.72682 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87292 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.77809 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85088 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81721 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44198 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.89545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71860 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53016 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.67555 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37584 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.77809 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39788 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.72682 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37584 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.18750 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.35417 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29228 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65403 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31818 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29228 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00197 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.35125 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06844 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            [iconColor setFill];
            [bezier2Path fill];
            
            ////// Bezier 2 Inner Shadow
            CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier2BorderRect = CGRectOffset(bezier2BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
            
            UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
            [bezier2NegativePath appendPath: bezier2Path];
            bezier2NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier2BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier2Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier2BorderRect.size.width), 0);
                [bezier2NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier2NegativePath fill];
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
