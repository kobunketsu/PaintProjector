//
//  AnamorphicTopViewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicTopViewButton.h"

@implementation AnamorphicTopViewButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.227 green: 0.227 blue: 0.227 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -4.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 64) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 64, 44);
    
    
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
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.57973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35917 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.57973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11811 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62383 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29260 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62383 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18467 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42002 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11811 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.53562 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05154 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46412 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05154 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42002 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35917 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18467 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29260 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.57973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35917 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46412 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42573 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.53562 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42573 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11590 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01183 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23561 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06023 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14358 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02012 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19788 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03795 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.36561 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30201 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28847 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09146 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34121 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25959 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50387 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44924 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39001 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34442 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42525 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44924 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64214 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30201 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58249 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44924 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61367 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35787 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81294 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06023 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.67060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.76143 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08494 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89646 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01823 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84393 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04537 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02895 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85231 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82109 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.04793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25772 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03321 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60194 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15557 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82109 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65538 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.05964 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35250 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.05964 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01174 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.02697 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59996 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.04030 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25147 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11590 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01183 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 63.5, CGRectGetHeight(bezierBounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.09 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 12.74 * bezierResizeRatio), 9.2 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.25 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -4.93 * bezierResizeRatio), 32.17 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
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
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.57973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35917 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.57973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11811 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62383 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29260 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62383 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18467 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42002 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11811 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.53562 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05154 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46412 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05154 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42002 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35917 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18467 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29260 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.57973 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35917 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46412 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42573 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.53562 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.42573 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11590 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01183 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23561 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06023 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14358 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02012 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19788 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03795 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.36561 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30201 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28847 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09146 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34121 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25959 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50387 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44924 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39001 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34442 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42525 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44924 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64214 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30201 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58249 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44924 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61367 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35787 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81294 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06023 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.67060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.76143 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08494 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89646 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01823 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84393 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04537 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02895 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85231 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82109 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.04793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25772 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03321 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60194 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15557 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82109 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65538 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.05964 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35250 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.05964 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01174 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.02697 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59996 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.04030 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25147 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11590 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01183 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 63.5, CGRectGetHeight(bezier3Bounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -5.94 * bezier3ResizeRatio), 57.04 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.25 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -22.59 * bezier3ResizeRatio), 21.68 * bezier3ResizeRatio,
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
