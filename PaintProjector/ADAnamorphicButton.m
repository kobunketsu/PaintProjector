//
//  AnamorphicButton.m
//  AnaDraw
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAnamorphicButton.h"

@implementation ADAnamorphicButton

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
//    UIColor* iconColor = [UIColor colorWithRed: 0.515 green: 0.515 blue: 0.515 alpha: 1];
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 50) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.42857 + 0.5), 50, 45);
    
    
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
            
            
            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17676 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03806 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.64750 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64750 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07636 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41844 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03806 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.54837 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00024 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46801 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00024 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41844 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17676 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.36888 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.36888 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13846 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17676 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46801 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21506 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.54837 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21506 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15777 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38355 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15777 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38284 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14883 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15330 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47296 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59741 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54100 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.63285 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49769 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52211 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41936 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54100 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.54824 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58104 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46852 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58104 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47296 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39617 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52211 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38391 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49769 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46850 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15777 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41936 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21178 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18401 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.39477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19175 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59741 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21178 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46852 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.54824 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25182 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63322 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62618 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18835 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.63812 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17489 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11658 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34274 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37488 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14424 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34824 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19850 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36008 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.36610 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51820 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28902 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39562 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34171 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49003 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50425 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60735 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54637 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42569 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60735 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64241 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51820 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58281 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60735 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61397 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.55530 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81308 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37488 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.67086 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48109 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.76161 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39129 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89654 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34699 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84405 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36501 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87600 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35411 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85242 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88017 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.04789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50604 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03318 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73464 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15622 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88017 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65564 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03860 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35299 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03860 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11626 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34268 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.02618 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73332 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03950 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50188 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11658 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34274 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            [iconColor setFill];
            [bezier4Path fill];
            
            ////// Bezier 4 Inner Shadow
            CGRect bezier4BorderRect = CGRectInset([bezier4Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier4BorderRect = CGRectOffset(bezier4BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier4BorderRect = CGRectInset(CGRectUnion(bezier4BorderRect, [bezier4Path bounds]), -1, -1);
            
            UIBezierPath* bezier4NegativePath = [UIBezierPath bezierPathWithRect: bezier4BorderRect];
            [bezier4NegativePath appendPath: bezier4Path];
            bezier4NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier4BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier4Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier4BorderRect.size.width), 0);
                [bezier4NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier4NegativePath fill];
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
