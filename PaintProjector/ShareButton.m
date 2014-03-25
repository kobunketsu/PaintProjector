//
//  ShareButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/31/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ShareButton.h"

@implementation ShareButton

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
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.675];
    UIColor* iconColor = [UIColor colorWithRed: 0.953 green: 0 blue: 0.196 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 1 green: 0.554 blue: 0.713 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.761 green: 0 blue: 0.157 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.99 green: 0.737 blue: 0.832 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 0.451 blue: 0.707 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.976 green: 0.277 blue: 0.454 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0.54, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -4.1);
    CGFloat iconHighlightBlurRadius = 6;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect icon2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 50) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.42857 + 0.5), 50, 45);
    
    
    //// Icon 2
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.90693 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.08635 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.98434 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.41103 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.98363 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.17156 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 1.01861 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.23384 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.75462 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.77819 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.95007 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.58822 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.84149 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.68169 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.57465 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.93433 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.70698 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.83111 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.62977 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.89278 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.50906 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.99997 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.53659 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.96302 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.50906 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.99997 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.43716 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.93267 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.50906 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.99997 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.47862 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.96238 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.25367 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.77819 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.37996 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.89167 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.30180 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.83166 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.02350 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.40998 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.17065 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.68597 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.05396 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.58717 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.11659 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.08635 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + -0.00696 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.23279 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.03603 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.17583 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.36205 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.04886 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.16670 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.03069 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.28083 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.00092 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.49626 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.15318 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.41014 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.07725 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.49626 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.15318 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.64628 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.03477 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.49626 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.15318 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.58652 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.06730 * CGRectGetHeight(icon2))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.90693 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.08635 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.72916 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + -0.01035 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.85824 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.03227 * CGRectGetHeight(icon2))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 49.19, CGRectGetHeight(bezier2Bounds) / 44.29);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.36 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -4.87 * bezier2ResizeRatio), 27.16 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.12 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 10.68 * bezier2ResizeRatio), 11.39 * bezier2ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
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
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Oval 4 Drawing
            UIBezierPath* oval4Path = [UIBezierPath bezierPath];
            [oval4Path moveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.43716 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.93267 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.50906 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.99997 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.47862 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.96238 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.50906 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.99997 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.55852 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.95219 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.50906 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.99997 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.52046 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.98087 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.75462 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.77819 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.61364 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.91064 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.70698 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.83111 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.98434 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.39317 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.84149 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.68169 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.95007 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.57036 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.90693 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.08635 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 1.01861 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.21598 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.98363 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.17156 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.64628 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.03477 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.85824 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.03227 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.72916 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + -0.01035 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.49626 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.15318 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.58652 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.06730 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.49626 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.15318 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.36205 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.04886 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.49626 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.15318 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.41014 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.07725 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.11659 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.08635 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.28083 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.00092 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.16670 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.03069 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.02350 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.40998 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.03603 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.17583 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + -0.00696 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.23279 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.25367 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.77819 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.05396 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.58717 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.17065 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.68597 * CGRectGetHeight(icon2))];
            [oval4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon2) + 0.43716 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.93267 * CGRectGetHeight(icon2)) controlPoint1: CGPointMake(CGRectGetMinX(icon2) + 0.30180 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.83166 * CGRectGetHeight(icon2)) controlPoint2: CGPointMake(CGRectGetMinX(icon2) + 0.37996 * CGRectGetWidth(icon2), CGRectGetMinY(icon2) + 0.89167 * CGRectGetHeight(icon2))];
            [oval4Path closePath];
            CGContextSaveGState(context);
            [oval4Path addClip];
            CGRect oval4Bounds = CGPathGetPathBoundingBox(oval4Path.CGPath);
            CGFloat oval4ResizeRatio = MIN(CGRectGetWidth(oval4Bounds) / 49.19, CGRectGetHeight(oval4Bounds) / 44.29);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(oval4Bounds) + -0.29 * oval4ResizeRatio, CGRectGetMidY(oval4Bounds) + -4.74 * oval4ResizeRatio), 50.17 * oval4ResizeRatio,
                                        CGPointMake(CGRectGetMidX(oval4Bounds) + -0.28 * oval4ResizeRatio, CGRectGetMidY(oval4Bounds) + -24.19 * oval4ResizeRatio), 24.71 * oval4ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    

}


@end
