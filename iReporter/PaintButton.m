//
//  PaintButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-24.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PaintButton.h"

@implementation PaintButton

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
    UIColor* mainColor = [UIColor colorWithRed: 0.713 green: 0.713 blue: 0.713 alpha: 1];
    CGFloat mainColorRGBA[4];
    [mainColor getRed: &mainColorRGBA[0] green: &mainColorRGBA[1] blue: &mainColorRGBA[2] alpha: &mainColorRGBA[3]];
    
    UIColor* cylinderProjectGradientColor1 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.5 + 0.5) green: (mainColorRGBA[1] * 0.5 + 0.5) blue: (mainColorRGBA[2] * 0.5 + 0.5) alpha: (mainColorRGBA[3] * 0.5 + 0.5)];
    UIColor* cylinderProjectGradientColor2 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.8 + 0.2) green: (mainColorRGBA[1] * 0.8 + 0.2) blue: (mainColorRGBA[2] * 0.8 + 0.2) alpha: (mainColorRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorShadow = [mainColor colorWithAlphaComponent: 0.5];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.604 green: 0.576 blue: 0.512 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* paintColorRed = [UIColor colorWithRed: 1 green: 0.531 blue: 0.121 alpha: 1];
    CGFloat paintColorRedRGBA[4];
    [paintColorRed getRed: &paintColorRedRGBA[0] green: &paintColorRedRGBA[1] blue: &paintColorRedRGBA[2] alpha: &paintColorRedRGBA[3]];
    
    UIColor* paintColorRedBright = [UIColor colorWithRed: (paintColorRedRGBA[0] * 0.5 + 0.5) green: (paintColorRedRGBA[1] * 0.5 + 0.5) blue: (paintColorRedRGBA[2] * 0.5 + 0.5) alpha: (paintColorRedRGBA[3] * 0.5 + 0.5)];
    UIColor* paintColorRedDark = [UIColor colorWithRed: (paintColorRedRGBA[0] * 0.8) green: (paintColorRedRGBA[1] * 0.8) blue: (paintColorRedRGBA[2] * 0.8) alpha: (paintColorRedRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorGreen = [UIColor colorWithRed: 0.36 green: 0.94 blue: 0.285 alpha: 1];
    CGFloat paintColorGreenRGBA[4];
    [paintColorGreen getRed: &paintColorGreenRGBA[0] green: &paintColorGreenRGBA[1] blue: &paintColorGreenRGBA[2] alpha: &paintColorGreenRGBA[3]];
    
    UIColor* paintColorGreenBright = [UIColor colorWithRed: (paintColorGreenRGBA[0] * 0.5 + 0.5) green: (paintColorGreenRGBA[1] * 0.5 + 0.5) blue: (paintColorGreenRGBA[2] * 0.5 + 0.5) alpha: (paintColorGreenRGBA[3] * 0.5 + 0.5)];
    UIColor* paintColorGreenDark = [UIColor colorWithRed: (paintColorGreenRGBA[0] * 0.8) green: (paintColorGreenRGBA[1] * 0.8) blue: (paintColorGreenRGBA[2] * 0.8) alpha: (paintColorGreenRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorBlue = [UIColor colorWithRed: 0.29 green: 0.774 blue: 0.978 alpha: 1];
    CGFloat paintColorBlueRGBA[4];
    [paintColorBlue getRed: &paintColorBlueRGBA[0] green: &paintColorBlueRGBA[1] blue: &paintColorBlueRGBA[2] alpha: &paintColorBlueRGBA[3]];
    
    UIColor* paintColorBlueDark = [UIColor colorWithRed: (paintColorBlueRGBA[0] * 0.8) green: (paintColorBlueRGBA[1] * 0.8) blue: (paintColorBlueRGBA[2] * 0.8) alpha: (paintColorBlueRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorBlueBright = [UIColor colorWithRed: (paintColorBlueRGBA[0] * 0.5 + 0.5) green: (paintColorBlueRGBA[1] * 0.5 + 0.5) blue: (paintColorBlueRGBA[2] * 0.5 + 0.5) alpha: (paintColorBlueRGBA[3] * 0.5 + 0.5)];
    UIColor* paintColorPink = [UIColor colorWithRed: 0.931 green: 0.429 blue: 0.598 alpha: 1];
    CGFloat paintColorPinkRGBA[4];
    [paintColorPink getRed: &paintColorPinkRGBA[0] green: &paintColorPinkRGBA[1] blue: &paintColorPinkRGBA[2] alpha: &paintColorPinkRGBA[3]];
    
    UIColor* paintColorPinkDark = [UIColor colorWithRed: (paintColorPinkRGBA[0] * 0.8) green: (paintColorPinkRGBA[1] * 0.8) blue: (paintColorPinkRGBA[2] * 0.8) alpha: (paintColorPinkRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorPinkBright = [UIColor colorWithRed: (paintColorPinkRGBA[0] * 0.5 + 0.5) green: (paintColorPinkRGBA[1] * 0.5 + 0.5) blue: (paintColorPinkRGBA[2] * 0.5 + 0.5) alpha: (paintColorPinkRGBA[3] * 0.5 + 0.5)];
    UIColor* cylinderProjectInnerShadowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientCylinderProjectColors = [NSArray arrayWithObjects:
                                              (id)cylinderProjectGradientColor1.CGColor,
                                              (id)cylinderProjectGradientColor2.CGColor, nil];
    CGFloat gradientCylinderProjectLocations[] = {0, 1};
    CGGradientRef gradientCylinderProject = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientCylinderProjectColors, gradientCylinderProjectLocations);
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconShadowColor.CGColor,
                               (id)white.CGColor, nil];
    CGFloat gradientLocations[] = {0.59, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = iconShadowColor;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* cylinderProjectInnerShadow = cylinderProjectInnerShadowColor;
    CGSize cylinderProjectInnerShadowOffset = CGSizeMake(0.1, -2.1);
    CGFloat cylinderProjectInnerShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    UIColor* paintColorRedShadow = paintColorRedDark;
    CGSize paintColorRedShadowOffset = CGSizeMake(0.1, -2.1);
    CGFloat paintColorRedShadowBlurRadius = 2;
    UIColor* paintColorGreenShadow = paintColorGreenDark;
    CGSize paintColorGreenShadowOffset = CGSizeMake(0.1, -2.1);
    CGFloat paintColorGreenShadowBlurRadius = 2;
    UIColor* paintColorBlueShadow = paintColorBlueDark;
    CGSize paintColorBlueShadowOffset = CGSizeMake(0.1, -2.1);
    CGFloat paintColorBlueShadowBlurRadius = 2;
    UIColor* paintColorPinkShadow = paintColorPinkDark;
    CGSize paintColorPinkShadowOffset = CGSizeMake(0.1, -2.1);
    CGFloat paintColorPinkShadowBlurRadius = 2;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    
    //// Group 2
    {
        //// Group 3
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group
            {
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
                CGContextBeginTransparencyLayer(context, NULL);
                
                
                //// Bezier Drawing
                UIBezierPath* bezierPath = [UIBezierPath bezierPath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.38, CGRectGetMinY(frame) + 11.85)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 88.36, CGRectGetMinY(frame) + 22.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 82.86, CGRectGetMinY(frame) + 12.91) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 88.36, CGRectGetMinY(frame) + 16.73)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 81.36, CGRectGetMinY(frame) + 26.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 88.36, CGRectGetMinY(frame) + 29.11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 81.36, CGRectGetMinY(frame) + 26.92)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 74.36, CGRectGetMinY(frame) + 32.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 81.36, CGRectGetMinY(frame) + 26.92) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 74.36, CGRectGetMinY(frame) + 28.54)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 81, CGRectGetMinY(frame) + 38) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 74.36, CGRectGetMinY(frame) + 37.31) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 81, CGRectGetMinY(frame) + 38)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 95, CGRectGetMinY(frame) + 46) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 81, CGRectGetMinY(frame) + 38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 95, CGRectGetMinY(frame) + 34.64)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.36, CGRectGetMinY(frame) + 63.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 95, CGRectGetMinY(frame) + 52.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 89.4, CGRectGetMinY(frame) + 59.81)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 59.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 69.33, CGRectGetMinY(frame) + 68.04) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.39, CGRectGetMinY(frame) + 70.38)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 18.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.39, CGRectGetMinY(frame) + 48.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.39, CGRectGetMinY(frame) + 30.32)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.38, CGRectGetMinY(frame) + 11.85) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.72, CGRectGetMinY(frame) + 10.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 66.61, CGRectGetMinY(frame) + 8)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 68.97, CGRectGetMinY(frame) + 46.24)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 71.38, CGRectGetMinY(frame) + 52.89) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 67.25, CGRectGetMinY(frame) + 48.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 68.33, CGRectGetMinY(frame) + 51.92)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 80.03, CGRectGetMinY(frame) + 49.76) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 74.43, CGRectGetMinY(frame) + 53.86) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 78.3, CGRectGetMinY(frame) + 52.46)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.62, CGRectGetMinY(frame) + 43.11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 81.75, CGRectGetMinY(frame) + 47.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 80.67, CGRectGetMinY(frame) + 44.08)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 68.97, CGRectGetMinY(frame) + 46.24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 74.57, CGRectGetMinY(frame) + 42.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 70.7, CGRectGetMinY(frame) + 43.54)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                [bezierPath addClip];
                CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
                CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 64.09, CGRectGetHeight(bezierBounds) / 57.34);
                CGContextDrawRadialGradient(context, gradientCylinderProject,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + 0.4 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -0.12 * bezierResizeRatio), 14.28 * bezierResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + 0.28 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -6.09 * bezierResizeRatio), 52.73 * bezierResizeRatio,
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextRestoreGState(context);
                
                ////// Bezier Inner Shadow
                CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -cylinderProjectInnerShadowBlurRadius, -cylinderProjectInnerShadowBlurRadius);
                bezierBorderRect = CGRectOffset(bezierBorderRect, -cylinderProjectInnerShadowOffset.width, -cylinderProjectInnerShadowOffset.height);
                bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
                
                UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
                [bezierNegativePath appendPath: bezierPath];
                bezierNegativePath.usesEvenOddFillRule = YES;
                
                CGContextSaveGState(context);
                {
                    CGFloat xOffset = cylinderProjectInnerShadowOffset.width + round(bezierBorderRect.size.width);
                    CGFloat yOffset = cylinderProjectInnerShadowOffset.height;
                    CGContextSetShadowWithColor(context,
                                                CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                                cylinderProjectInnerShadowBlurRadius,
                                                cylinderProjectInnerShadow.CGColor);
                    
                    [bezierPath addClip];
                    CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                    [bezierNegativePath applyTransform: transform];
                    [[UIColor grayColor] setFill];
                    [bezierNegativePath fill];
                }
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
                
                
                //// Bezier 2 Drawing
                UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.38, CGRectGetMinY(frame) + 11.85)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 88.36, CGRectGetMinY(frame) + 22.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 82.86, CGRectGetMinY(frame) + 12.91) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 88.36, CGRectGetMinY(frame) + 16.73)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 81.36, CGRectGetMinY(frame) + 26.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 88.36, CGRectGetMinY(frame) + 29.11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 81.36, CGRectGetMinY(frame) + 26.92)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 74.36, CGRectGetMinY(frame) + 32.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 81.36, CGRectGetMinY(frame) + 26.92) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 74.36, CGRectGetMinY(frame) + 28.54)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 81, CGRectGetMinY(frame) + 38) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 74.36, CGRectGetMinY(frame) + 37.31) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 81, CGRectGetMinY(frame) + 38)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 95, CGRectGetMinY(frame) + 46) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 81, CGRectGetMinY(frame) + 38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 95, CGRectGetMinY(frame) + 34.64)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.36, CGRectGetMinY(frame) + 63.92) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 95, CGRectGetMinY(frame) + 52.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 89.4, CGRectGetMinY(frame) + 59.81)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 59.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 69.33, CGRectGetMinY(frame) + 68.04) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.39, CGRectGetMinY(frame) + 70.38)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.46, CGRectGetMinY(frame) + 18.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.39, CGRectGetMinY(frame) + 48.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.39, CGRectGetMinY(frame) + 30.32)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.38, CGRectGetMinY(frame) + 11.85) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.72, CGRectGetMinY(frame) + 10.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 66.61, CGRectGetMinY(frame) + 8)];
                [bezier2Path closePath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 68.97, CGRectGetMinY(frame) + 46.24)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 71.38, CGRectGetMinY(frame) + 52.89) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 67.25, CGRectGetMinY(frame) + 48.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 68.33, CGRectGetMinY(frame) + 51.92)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 80.03, CGRectGetMinY(frame) + 49.76) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 74.43, CGRectGetMinY(frame) + 53.86) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 78.3, CGRectGetMinY(frame) + 52.46)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.62, CGRectGetMinY(frame) + 43.11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 81.75, CGRectGetMinY(frame) + 47.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 80.67, CGRectGetMinY(frame) + 44.08)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 68.97, CGRectGetMinY(frame) + 46.24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 74.57, CGRectGetMinY(frame) + 42.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 70.7, CGRectGetMinY(frame) + 43.54)];
                [bezier2Path closePath];
                CGContextSaveGState(context);
                [bezier2Path addClip];
                CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
                CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 64.09, CGRectGetHeight(bezier2Bounds) / 57.34);
                CGContextDrawRadialGradient(context, gradient,
                                            CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.71 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 4.27 * bezier2ResizeRatio), 64.79 * bezier2ResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.07 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -32.06 * bezier2ResizeRatio), 25.22 * bezier2ResizeRatio,
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextRestoreGState(context);
                
                ////// Bezier 2 Inner Shadow
                CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -cylinderProjectInnerShadowBlurRadius, -cylinderProjectInnerShadowBlurRadius);
                bezier2BorderRect = CGRectOffset(bezier2BorderRect, -cylinderProjectInnerShadowOffset.width, -cylinderProjectInnerShadowOffset.height);
                bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
                
                UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
                [bezier2NegativePath appendPath: bezier2Path];
                bezier2NegativePath.usesEvenOddFillRule = YES;
                
                CGContextSaveGState(context);
                {
                    CGFloat xOffset = cylinderProjectInnerShadowOffset.width + round(bezier2BorderRect.size.width);
                    CGFloat yOffset = cylinderProjectInnerShadowOffset.height;
                    CGContextSetShadowWithColor(context,
                                                CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                                cylinderProjectInnerShadowBlurRadius,
                                                cylinderProjectInnerShadow.CGColor);
                    
                    [bezier2Path addClip];
                    CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier2BorderRect.size.width), 0);
                    [bezier2NegativePath applyTransform: transform];
                    [[UIColor grayColor] setFill];
                    [bezier2NegativePath fill];
                }
                CGContextRestoreGState(context);
                
                
                
                CGContextEndTransparencyLayer(context);
                CGContextRestoreGState(context);
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// PaintRed
        {
            //// PaintShadow Drawing
            UIBezierPath* paintShadowPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 20, 10, 4)];
            [paintColorShadow setFill];
            [paintShadowPath fill];
            
            
            //// PaintHighlighted Drawing
            UIBezierPath* paintHighlightedPath = [UIBezierPath bezierPath];
            [paintHighlightedPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.35, CGRectGetMinY(frame) + 22.05)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.78, CGRectGetMinY(frame) + 15.9) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.26, CGRectGetMinY(frame) + 20.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.78, CGRectGetMinY(frame) + 15.9)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.25, CGRectGetMinY(frame) + 15.91) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.78, CGRectGetMinY(frame) + 15.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.38, CGRectGetMinY(frame) + 15.97)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.43, CGRectGetMinY(frame) + 16.95) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.88, CGRectGetMinY(frame) + 15.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.48, CGRectGetMinY(frame) + 16.18)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.43, CGRectGetMinY(frame) + 22.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.52, CGRectGetMinY(frame) + 18.36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.52, CGRectGetMinY(frame) + 20.64)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.35, CGRectGetMinY(frame) + 22.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.34, CGRectGetMinY(frame) + 23.45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.44, CGRectGetMinY(frame) + 23.45)];
            [paintHighlightedPath closePath];
            [paintColorRed setFill];
            [paintHighlightedPath fill];
            
            ////// PaintHighlighted Inner Shadow
            CGRect paintHighlightedBorderRect = CGRectInset([paintHighlightedPath bounds], -paintColorRedShadowBlurRadius, -paintColorRedShadowBlurRadius);
            paintHighlightedBorderRect = CGRectOffset(paintHighlightedBorderRect, -paintColorRedShadowOffset.width, -paintColorRedShadowOffset.height);
            paintHighlightedBorderRect = CGRectInset(CGRectUnion(paintHighlightedBorderRect, [paintHighlightedPath bounds]), -1, -1);
            
            UIBezierPath* paintHighlightedNegativePath = [UIBezierPath bezierPathWithRect: paintHighlightedBorderRect];
            [paintHighlightedNegativePath appendPath: paintHighlightedPath];
            paintHighlightedNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = paintColorRedShadowOffset.width + round(paintHighlightedBorderRect.size.width);
                CGFloat yOffset = paintColorRedShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            paintColorRedShadowBlurRadius,
                                            paintColorRedShadow.CGColor);
                
                [paintHighlightedPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(paintHighlightedBorderRect.size.width), 0);
                [paintHighlightedNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [paintHighlightedNegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            //// PaintMain Drawing
            UIBezierPath* paintMainPath = [UIBezierPath bezierPath];
            [paintMainPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.97, CGRectGetMinY(frame) + 21.06)];
            [paintMainPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 52.89, CGRectGetMinY(frame) + 19.01)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.72, CGRectGetMinY(frame) + 18.26) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.89, CGRectGetMinY(frame) + 19.01) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54, CGRectGetMinY(frame) + 18.83)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.57, CGRectGetMinY(frame) + 15.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.66, CGRectGetMinY(frame) + 17.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.57, CGRectGetMinY(frame) + 15.93)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.17, CGRectGetMinY(frame) + 15.94) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.57, CGRectGetMinY(frame) + 15.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.01, CGRectGetMinY(frame) + 15.98)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.3, CGRectGetMinY(frame) + 16.68) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.14, CGRectGetMinY(frame) + 15.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.08, CGRectGetMinY(frame) + 16.13)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.3, CGRectGetMinY(frame) + 20.32) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.86, CGRectGetMinY(frame) + 17.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.86, CGRectGetMinY(frame) + 19.31)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.97, CGRectGetMinY(frame) + 21.06) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.09, CGRectGetMinY(frame) + 20.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.97, CGRectGetMinY(frame) + 21.06)];
            [paintMainPath closePath];
            [paintColorRedBright setFill];
            [paintMainPath fill];
        }
        
        
        //// PaintGreen
        {
            //// PaintShadow 2 Drawing
            UIBezierPath* paintShadow2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 49, 10, 4)];
            [paintColorShadow setFill];
            [paintShadow2Path fill];
            
            
            //// PaintHighlighted 2 Drawing
            UIBezierPath* paintHighlighted2Path = [UIBezierPath bezierPath];
            [paintHighlighted2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 51.05)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.78, CGRectGetMinY(frame) + 44.9) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.26, CGRectGetMinY(frame) + 49.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.78, CGRectGetMinY(frame) + 44.9)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.25, CGRectGetMinY(frame) + 44.91) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.78, CGRectGetMinY(frame) + 44.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.38, CGRectGetMinY(frame) + 44.97)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.43, CGRectGetMinY(frame) + 45.95) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.88, CGRectGetMinY(frame) + 44.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42.48, CGRectGetMinY(frame) + 45.18)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.43, CGRectGetMinY(frame) + 51.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.52, CGRectGetMinY(frame) + 47.36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39.52, CGRectGetMinY(frame) + 49.64)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 51.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.34, CGRectGetMinY(frame) + 52.45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.44, CGRectGetMinY(frame) + 52.45)];
            [paintHighlighted2Path closePath];
            [paintColorGreen setFill];
            [paintHighlighted2Path fill];
            
            ////// PaintHighlighted 2 Inner Shadow
            CGRect paintHighlighted2BorderRect = CGRectInset([paintHighlighted2Path bounds], -paintColorGreenShadowBlurRadius, -paintColorGreenShadowBlurRadius);
            paintHighlighted2BorderRect = CGRectOffset(paintHighlighted2BorderRect, -paintColorGreenShadowOffset.width, -paintColorGreenShadowOffset.height);
            paintHighlighted2BorderRect = CGRectInset(CGRectUnion(paintHighlighted2BorderRect, [paintHighlighted2Path bounds]), -1, -1);
            
            UIBezierPath* paintHighlighted2NegativePath = [UIBezierPath bezierPathWithRect: paintHighlighted2BorderRect];
            [paintHighlighted2NegativePath appendPath: paintHighlighted2Path];
            paintHighlighted2NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = paintColorGreenShadowOffset.width + round(paintHighlighted2BorderRect.size.width);
                CGFloat yOffset = paintColorGreenShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            paintColorGreenShadowBlurRadius,
                                            paintColorGreenShadow.CGColor);
                
                [paintHighlighted2Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(paintHighlighted2BorderRect.size.width), 0);
                [paintHighlighted2NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [paintHighlighted2NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            //// PaintMain 2 Drawing
            UIBezierPath* paintMain2Path = [UIBezierPath bezierPath];
            [paintMain2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.97, CGRectGetMinY(frame) + 50.06)];
            [paintMain2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 43.89, CGRectGetMinY(frame) + 48.01)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.72, CGRectGetMinY(frame) + 47.26) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.89, CGRectGetMinY(frame) + 48.01) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45, CGRectGetMinY(frame) + 47.83)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.57, CGRectGetMinY(frame) + 44.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.66, CGRectGetMinY(frame) + 46.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.57, CGRectGetMinY(frame) + 44.93)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.17, CGRectGetMinY(frame) + 44.94) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.57, CGRectGetMinY(frame) + 44.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.01, CGRectGetMinY(frame) + 44.98)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.3, CGRectGetMinY(frame) + 45.68) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.14, CGRectGetMinY(frame) + 44.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42.08, CGRectGetMinY(frame) + 45.13)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.3, CGRectGetMinY(frame) + 49.32) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.86, CGRectGetMinY(frame) + 46.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39.86, CGRectGetMinY(frame) + 48.31)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.97, CGRectGetMinY(frame) + 50.06) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.09, CGRectGetMinY(frame) + 49.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42.97, CGRectGetMinY(frame) + 50.06)];
            [paintMain2Path closePath];
            [paintColorGreenBright setFill];
            [paintMain2Path fill];
        }
        
        
        //// PaintBlue
        {
            //// PaintShadow 3 Drawing
            UIBezierPath* paintShadow3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 35, CGRectGetMinY(frame) + 34, 10, 4)];
            [paintColorShadow setFill];
            [paintShadow3Path fill];
            
            
            //// PaintMain 3 Drawing
            UIBezierPath* paintMain3Path = [UIBezierPath bezierPath];
            [paintMain3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.35, CGRectGetMinY(frame) + 36.05)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.78, CGRectGetMinY(frame) + 29.9) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.26, CGRectGetMinY(frame) + 34.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.78, CGRectGetMinY(frame) + 29.9)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 43.25, CGRectGetMinY(frame) + 29.91) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.78, CGRectGetMinY(frame) + 29.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.38, CGRectGetMinY(frame) + 29.97)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.43, CGRectGetMinY(frame) + 30.95) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.88, CGRectGetMinY(frame) + 29.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.48, CGRectGetMinY(frame) + 30.18)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.43, CGRectGetMinY(frame) + 36.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.52, CGRectGetMinY(frame) + 32.36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.52, CGRectGetMinY(frame) + 34.64)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.35, CGRectGetMinY(frame) + 36.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.34, CGRectGetMinY(frame) + 37.45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.44, CGRectGetMinY(frame) + 37.45)];
            [paintMain3Path closePath];
            [paintColorBlue setFill];
            [paintMain3Path fill];
            
            ////// PaintMain 3 Inner Shadow
            CGRect paintMain3BorderRect = CGRectInset([paintMain3Path bounds], -paintColorBlueShadowBlurRadius, -paintColorBlueShadowBlurRadius);
            paintMain3BorderRect = CGRectOffset(paintMain3BorderRect, -paintColorBlueShadowOffset.width, -paintColorBlueShadowOffset.height);
            paintMain3BorderRect = CGRectInset(CGRectUnion(paintMain3BorderRect, [paintMain3Path bounds]), -1, -1);
            
            UIBezierPath* paintMain3NegativePath = [UIBezierPath bezierPathWithRect: paintMain3BorderRect];
            [paintMain3NegativePath appendPath: paintMain3Path];
            paintMain3NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = paintColorBlueShadowOffset.width + round(paintMain3BorderRect.size.width);
                CGFloat yOffset = paintColorBlueShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            paintColorBlueShadowBlurRadius,
                                            paintColorBlueShadow.CGColor);
                
                [paintMain3Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(paintMain3BorderRect.size.width), 0);
                [paintMain3NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [paintMain3NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            //// PaintHighlighted 3 Drawing
            UIBezierPath* paintHighlighted3Path = [UIBezierPath bezierPath];
            [paintHighlighted3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.97, CGRectGetMinY(frame) + 35.06)];
            [paintHighlighted3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.89, CGRectGetMinY(frame) + 33.01)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 43.72, CGRectGetMinY(frame) + 32.26) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.89, CGRectGetMinY(frame) + 33.01) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43, CGRectGetMinY(frame) + 32.83)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.57, CGRectGetMinY(frame) + 29.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.66, CGRectGetMinY(frame) + 31.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.57, CGRectGetMinY(frame) + 29.93)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.17, CGRectGetMinY(frame) + 29.94) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.57, CGRectGetMinY(frame) + 29.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.01, CGRectGetMinY(frame) + 29.98)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.3, CGRectGetMinY(frame) + 30.68) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.14, CGRectGetMinY(frame) + 29.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.08, CGRectGetMinY(frame) + 30.13)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.3, CGRectGetMinY(frame) + 34.32) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.86, CGRectGetMinY(frame) + 31.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.86, CGRectGetMinY(frame) + 33.31)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.97, CGRectGetMinY(frame) + 35.06) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 40.09, CGRectGetMinY(frame) + 34.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.97, CGRectGetMinY(frame) + 35.06)];
            [paintHighlighted3Path closePath];
            [paintColorBlueBright setFill];
            [paintHighlighted3Path fill];
        }
        
        
        //// PaintPink
        {
            //// PaintShadow 4 Drawing
            UIBezierPath* paintShadow4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 49, CGRectGetMinY(frame) + 58, 10, 4)];
            [paintColorShadow setFill];
            [paintShadow4Path fill];
            
            
            //// PaintMain 4 Drawing
            UIBezierPath* paintMain4Path = [UIBezierPath bezierPath];
            [paintMain4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.35, CGRectGetMinY(frame) + 60.05)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 61.78, CGRectGetMinY(frame) + 53.9) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.26, CGRectGetMinY(frame) + 58.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.78, CGRectGetMinY(frame) + 53.9)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.25, CGRectGetMinY(frame) + 53.91) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 61.78, CGRectGetMinY(frame) + 53.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.38, CGRectGetMinY(frame) + 53.97)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.43, CGRectGetMinY(frame) + 54.95) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.88, CGRectGetMinY(frame) + 53.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.48, CGRectGetMinY(frame) + 54.18)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.43, CGRectGetMinY(frame) + 60.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.52, CGRectGetMinY(frame) + 56.36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.52, CGRectGetMinY(frame) + 58.64)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.35, CGRectGetMinY(frame) + 60.05) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.34, CGRectGetMinY(frame) + 61.45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.44, CGRectGetMinY(frame) + 61.45)];
            [paintMain4Path closePath];
            [paintColorPink setFill];
            [paintMain4Path fill];
            
            ////// PaintMain 4 Inner Shadow
            CGRect paintMain4BorderRect = CGRectInset([paintMain4Path bounds], -paintColorPinkShadowBlurRadius, -paintColorPinkShadowBlurRadius);
            paintMain4BorderRect = CGRectOffset(paintMain4BorderRect, -paintColorPinkShadowOffset.width, -paintColorPinkShadowOffset.height);
            paintMain4BorderRect = CGRectInset(CGRectUnion(paintMain4BorderRect, [paintMain4Path bounds]), -1, -1);
            
            UIBezierPath* paintMain4NegativePath = [UIBezierPath bezierPathWithRect: paintMain4BorderRect];
            [paintMain4NegativePath appendPath: paintMain4Path];
            paintMain4NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = paintColorPinkShadowOffset.width + round(paintMain4BorderRect.size.width);
                CGFloat yOffset = paintColorPinkShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            paintColorPinkShadowBlurRadius,
                                            paintColorPinkShadow.CGColor);
                
                [paintMain4Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(paintMain4BorderRect.size.width), 0);
                [paintMain4NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [paintMain4NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            //// PaintHighlighted 4 Drawing
            UIBezierPath* paintHighlighted4Path = [UIBezierPath bezierPath];
            [paintHighlighted4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.97, CGRectGetMinY(frame) + 59.06)];
            [paintHighlighted4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 55.89, CGRectGetMinY(frame) + 57.01)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.72, CGRectGetMinY(frame) + 56.26) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.89, CGRectGetMinY(frame) + 57.01) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 57, CGRectGetMinY(frame) + 56.83)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 59.57, CGRectGetMinY(frame) + 53.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.66, CGRectGetMinY(frame) + 55.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 59.57, CGRectGetMinY(frame) + 53.93)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.17, CGRectGetMinY(frame) + 53.94) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.57, CGRectGetMinY(frame) + 53.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 57.01, CGRectGetMinY(frame) + 53.98)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.3, CGRectGetMinY(frame) + 54.68) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.14, CGRectGetMinY(frame) + 53.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.08, CGRectGetMinY(frame) + 54.13)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.3, CGRectGetMinY(frame) + 58.32) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.86, CGRectGetMinY(frame) + 55.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.86, CGRectGetMinY(frame) + 57.31)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.97, CGRectGetMinY(frame) + 59.06) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 54.09, CGRectGetMinY(frame) + 58.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.97, CGRectGetMinY(frame) + 59.06)];
            [paintHighlighted4Path closePath];
            [paintColorPinkBright setFill];
            [paintHighlighted4Path fill];
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientCylinderProject);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
