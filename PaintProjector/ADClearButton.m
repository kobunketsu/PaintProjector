//
//  ClearButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADClearButton.h"

@implementation ADClearButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
//    UIColor* iconColor = [UIColor colorWithRed: 0.574 green: 0.574 blue: 0.574 alpha: 1];
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
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
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08415 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13348 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77371 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82169 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.12017 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13141 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08621 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41538 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38539 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58911 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61722 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.65943 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08063 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            [iconColor setFill];
            [bezier5Path fill];
            
            ////// Bezier 5 Inner Shadow
            CGRect bezier5BorderRect = CGRectInset([bezier5Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier5BorderRect = CGRectOffset(bezier5BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier5BorderRect = CGRectInset(CGRectUnion(bezier5BorderRect, [bezier5Path bounds]), -1, -1);
            
            UIBezierPath* bezier5NegativePath = [UIBezierPath bezierPathWithRect: bezier5BorderRect];
            [bezier5NegativePath appendPath: bezier5Path];
            bezier5NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier5BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier5Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier5BorderRect.size.width), 0);
                [bezier5NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier5NegativePath fill];
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
