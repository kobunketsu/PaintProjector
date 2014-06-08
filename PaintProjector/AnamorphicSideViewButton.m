//
//  AnamorphicViewModeButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicSideViewButton.h"

@implementation AnamorphicSideViewButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0.733 blue: 0.461 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 0.726 green: 1 blue: 0.745 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.461 green: 0.901 blue: 0.656 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0.513 blue: 0.163 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.5 green: 1 blue: 0.658 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 0.609 green: 1 blue: 0.732 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.23 green: 0.817 blue: 0.558 alpha: 1].CGColor,
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 50) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.40000 + 0.5), 50, 45);
    
    
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
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17676 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03806 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.64750 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64750 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07636 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41844 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.03806 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.54837 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00024 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46801 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00024 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41844 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17676 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.36888 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.36888 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13846 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59793 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17676 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46801 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21506 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.54837 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21506 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15777 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38355 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15777 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38284 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14883 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15330 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47296 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59741 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54100 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.63285 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49769 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52211 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41936 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54100 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.54824 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58104 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46852 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58104 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47296 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39617 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52211 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38391 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49769 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46850 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15777 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41936 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21178 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38248 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18401 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.39477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19175 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59741 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.21178 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46852 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.54824 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.25182 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63322 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62618 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18835 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.63812 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17489 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14439 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11658 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34274 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37488 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14424 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34824 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19850 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36008 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.36610 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51820 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28902 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39562 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34171 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49003 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50425 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60735 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.39048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54637 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42569 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60735 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64241 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51820 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58281 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60735 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61397 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.55530 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81308 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37488 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.67086 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48109 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.76161 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39129 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89654 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34699 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84405 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36501 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87600 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35411 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.85242 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88017 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.04789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50604 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03318 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73464 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15622 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88017 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65564 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03860 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35299 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03860 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11626 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34268 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.02618 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73332 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03950 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50188 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11658 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34274 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 49.57, CGRectGetHeight(bezier2Bounds) / 44.53);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.04 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 12.84 * bezier2ResizeRatio), 9.73 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.05 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -5.94 * bezier2ResizeRatio), 33.41 * bezier2ResizeRatio,
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
            [bezier4Path addClip];
            CGRect bezier4Bounds = CGPathGetPathBoundingBox(bezier4Path.CGPath);
            CGFloat bezier4ResizeRatio = MIN(CGRectGetWidth(bezier4Bounds) / 49.57, CGRectGetHeight(bezier4Bounds) / 44.53);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier4Bounds) + 0.41 * bezier4ResizeRatio, CGRectGetMidY(bezier4Bounds) + -0.72 * bezier4ResizeRatio), 58.03 * bezier4ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier4Bounds) + 0.05 * bezier4ResizeRatio, CGRectGetMidY(bezier4Bounds) + -24.03 * bezier4ResizeRatio), 22.69 * bezier4ResizeRatio,
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
