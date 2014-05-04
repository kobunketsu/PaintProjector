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

- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
        [self drawSelected];
        [self setTitleColor:[UIColor colorWithRed:247/255.0 green:167/255.0 blue:211/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        [self drawNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawSelected
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
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 25.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 80.48, CGRectGetMinY(frame) + 17.25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 20.22)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 29.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 32.78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 29.38)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 36.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 42.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 34.12)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.73, CGRectGetMinY(frame) + 56.84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 48.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 85.61, CGRectGetMinY(frame) + 53.64)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 53.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 69.86, CGRectGetMinY(frame) + 60.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.14, CGRectGetMinY(frame) + 61.84)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 21.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 44.59) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 30.77)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.04, CGRectGetMinY(frame) + 15.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 67.72, CGRectGetMinY(frame) + 13.45)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 71.47, CGRectGetMinY(frame) + 48.28) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 68.23, CGRectGetMinY(frame) + 45.21) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 69.08, CGRectGetMinY(frame) + 47.52)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 78.25, CGRectGetMinY(frame) + 45.85) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.86, CGRectGetMinY(frame) + 49.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 76.9, CGRectGetMinY(frame) + 47.94)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 76.36, CGRectGetMinY(frame) + 40.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.6, CGRectGetMinY(frame) + 43.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 78.76, CGRectGetMinY(frame) + 41.44)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.97, CGRectGetMinY(frame) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 70.93, CGRectGetMinY(frame) + 41.02)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                [bezierPath addClip];
                CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
                CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 50.29, CGRectGetHeight(bezierBounds) / 44.49);
                CGContextDrawRadialGradient(context, gradientCylinderProject,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + 0.32 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -0.09 * bezierResizeRatio), 11.15 * bezierResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + 0.22 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -4.76 * bezierResizeRatio), 41.17 * bezierResizeRatio,
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
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 25.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 80.48, CGRectGetMinY(frame) + 17.25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 20.22)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 29.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 32.78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 29.38)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 36.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 42.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 34.12)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.73, CGRectGetMinY(frame) + 56.84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 48.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 85.61, CGRectGetMinY(frame) + 53.64)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 53.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 69.86, CGRectGetMinY(frame) + 60.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.14, CGRectGetMinY(frame) + 61.84)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 21.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 44.59) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 30.77)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.04, CGRectGetMinY(frame) + 15.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 67.72, CGRectGetMinY(frame) + 13.45)];
                [bezier2Path closePath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 71.47, CGRectGetMinY(frame) + 48.28) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 68.23, CGRectGetMinY(frame) + 45.21) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 69.08, CGRectGetMinY(frame) + 47.52)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 78.25, CGRectGetMinY(frame) + 45.85) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.86, CGRectGetMinY(frame) + 49.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 76.9, CGRectGetMinY(frame) + 47.94)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 76.36, CGRectGetMinY(frame) + 40.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.6, CGRectGetMinY(frame) + 43.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 78.76, CGRectGetMinY(frame) + 41.44)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.97, CGRectGetMinY(frame) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 70.93, CGRectGetMinY(frame) + 41.02)];
                [bezier2Path closePath];
                CGContextSaveGState(context);
                [bezier2Path addClip];
                CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
                CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 50.29, CGRectGetHeight(bezier2Bounds) / 44.49);
                CGContextDrawRadialGradient(context, gradient,
                                            CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.56 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 3.34 * bezier2ResizeRatio), 50.58 * bezier2ResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.05 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -25.03 * bezier2ResizeRatio), 19.69 * bezier2ResizeRatio,
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
            UIBezierPath* paintShadowPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 52, CGRectGetMinY(frame) + 23, 8, 3)];
            [paintColorShadow setFill];
            [paintShadowPath fill];
            
            
            //// PaintHighlighted Drawing
            UIBezierPath* paintHighlightedPath = [UIBezierPath bezierPath];
            [paintHighlightedPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.73, CGRectGetMinY(frame) + 24.48)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 61.83, CGRectGetMinY(frame) + 19.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.2, CGRectGetMinY(frame) + 23.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.83, CGRectGetMinY(frame) + 19.7)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.35, CGRectGetMinY(frame) + 19.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 61.83, CGRectGetMinY(frame) + 19.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 59.21, CGRectGetMinY(frame) + 19.75)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.41, CGRectGetMinY(frame) + 20.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.29, CGRectGetMinY(frame) + 19.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.21, CGRectGetMinY(frame) + 19.92)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.41, CGRectGetMinY(frame) + 24.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 53.94, CGRectGetMinY(frame) + 21.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 53.94, CGRectGetMinY(frame) + 23.39)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.73, CGRectGetMinY(frame) + 24.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.88, CGRectGetMinY(frame) + 25.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 59.26, CGRectGetMinY(frame) + 25.57)];
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
            [paintMainPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.59, CGRectGetMinY(frame) + 23.72)];
            [paintMainPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 57.3, CGRectGetMinY(frame) + 22.12)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.71, CGRectGetMinY(frame) + 21.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.3, CGRectGetMinY(frame) + 22.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.15, CGRectGetMinY(frame) + 21.98)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.13, CGRectGetMinY(frame) + 19.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.43, CGRectGetMinY(frame) + 20.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 60.13, CGRectGetMinY(frame) + 19.72)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.51, CGRectGetMinY(frame) + 19.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 60.13, CGRectGetMinY(frame) + 19.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.16, CGRectGetMinY(frame) + 19.76)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.31, CGRectGetMinY(frame) + 20.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.72, CGRectGetMinY(frame) + 19.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.91, CGRectGetMinY(frame) + 19.88)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.31, CGRectGetMinY(frame) + 23.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 54.2, CGRectGetMinY(frame) + 21.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.2, CGRectGetMinY(frame) + 22.36)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.59, CGRectGetMinY(frame) + 23.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.92, CGRectGetMinY(frame) + 23.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.59, CGRectGetMinY(frame) + 23.72)];
            [paintMainPath closePath];
            [paintColorRedBright setFill];
            [paintMainPath fill];
        }
        
        
        //// PaintGreen
        {
            //// PaintShadow 2 Drawing
            UIBezierPath* paintShadow2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 45, 8, 3)];
            [paintColorShadow setFill];
            [paintShadow2Path fill];
            
            
            //// PaintHighlighted 2 Drawing
            UIBezierPath* paintHighlighted2Path = [UIBezierPath bezierPath];
            [paintHighlighted2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.6, CGRectGetMinY(frame) + 46.48)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.81, CGRectGetMinY(frame) + 41.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.22, CGRectGetMinY(frame) + 45.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.81, CGRectGetMinY(frame) + 41.7)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.98, CGRectGetMinY(frame) + 41.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 54.81, CGRectGetMinY(frame) + 41.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.93, CGRectGetMinY(frame) + 41.75)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.75, CGRectGetMinY(frame) + 42.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.82, CGRectGetMinY(frame) + 41.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.64, CGRectGetMinY(frame) + 41.92)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.75, CGRectGetMinY(frame) + 46.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.13, CGRectGetMinY(frame) + 43.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.13, CGRectGetMinY(frame) + 45.39)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.6, CGRectGetMinY(frame) + 46.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.37, CGRectGetMinY(frame) + 47.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.98, CGRectGetMinY(frame) + 47.57)];
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
            [paintMain2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.05, CGRectGetMinY(frame) + 45.72)];
            [paintMain2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 49.83, CGRectGetMinY(frame) + 44.12)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.38, CGRectGetMinY(frame) + 43.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.83, CGRectGetMinY(frame) + 44.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.77, CGRectGetMinY(frame) + 43.98)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.94, CGRectGetMinY(frame) + 41.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.18, CGRectGetMinY(frame) + 42.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.94, CGRectGetMinY(frame) + 41.72)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.06, CGRectGetMinY(frame) + 41.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.94, CGRectGetMinY(frame) + 41.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.78, CGRectGetMinY(frame) + 41.76)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.64, CGRectGetMinY(frame) + 42.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.19, CGRectGetMinY(frame) + 41.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.3, CGRectGetMinY(frame) + 41.88)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.64, CGRectGetMinY(frame) + 45.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.42, CGRectGetMinY(frame) + 43.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.42, CGRectGetMinY(frame) + 44.36)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.05, CGRectGetMinY(frame) + 45.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.31, CGRectGetMinY(frame) + 45.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.05, CGRectGetMinY(frame) + 45.72)];
            [paintMain2Path closePath];
            [paintColorGreenBright setFill];
            [paintMain2Path fill];
        }
        
        
        //// PaintBlue
        {
            //// PaintShadow 3 Drawing
            UIBezierPath* paintShadow3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 43, CGRectGetMinY(frame) + 34, 8, 3)];
            [paintColorShadow setFill];
            [paintShadow3Path fill];
            
            
            //// PaintMain 3 Drawing
            UIBezierPath* paintMain3Path = [UIBezierPath bezierPath];
            [paintMain3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.73, CGRectGetMinY(frame) + 35.48)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.83, CGRectGetMinY(frame) + 30.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 53.2, CGRectGetMinY(frame) + 34.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.83, CGRectGetMinY(frame) + 30.7)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.35, CGRectGetMinY(frame) + 30.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.83, CGRectGetMinY(frame) + 30.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.21, CGRectGetMinY(frame) + 30.75)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.41, CGRectGetMinY(frame) + 31.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.29, CGRectGetMinY(frame) + 30.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.21, CGRectGetMinY(frame) + 30.92)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.41, CGRectGetMinY(frame) + 35.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.94, CGRectGetMinY(frame) + 32.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.94, CGRectGetMinY(frame) + 34.39)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.73, CGRectGetMinY(frame) + 35.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.88, CGRectGetMinY(frame) + 36.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.26, CGRectGetMinY(frame) + 36.57)];
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
            [paintHighlighted3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.59, CGRectGetMinY(frame) + 34.72)];
            [paintHighlighted3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48.3, CGRectGetMinY(frame) + 33.12)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.71, CGRectGetMinY(frame) + 32.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.3, CGRectGetMinY(frame) + 33.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.15, CGRectGetMinY(frame) + 32.98)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.13, CGRectGetMinY(frame) + 30.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.43, CGRectGetMinY(frame) + 31.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.13, CGRectGetMinY(frame) + 30.72)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.51, CGRectGetMinY(frame) + 30.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.13, CGRectGetMinY(frame) + 30.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.16, CGRectGetMinY(frame) + 30.76)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.31, CGRectGetMinY(frame) + 31.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.72, CGRectGetMinY(frame) + 30.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.91, CGRectGetMinY(frame) + 30.88)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.31, CGRectGetMinY(frame) + 34.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.2, CGRectGetMinY(frame) + 32.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.2, CGRectGetMinY(frame) + 33.36)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.59, CGRectGetMinY(frame) + 34.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.92, CGRectGetMinY(frame) + 34.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.59, CGRectGetMinY(frame) + 34.72)];
            [paintHighlighted3Path closePath];
            [paintColorBlueBright setFill];
            [paintHighlighted3Path fill];
        }
        
        
        //// PaintPink
        {
            //// PaintShadow 4 Drawing
            UIBezierPath* paintShadow4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 54, CGRectGetMinY(frame) + 52, 8, 3)];
            [paintColorShadow setFill];
            [paintShadow4Path fill];
            
            
            //// PaintMain 4 Drawing
            UIBezierPath* paintMain4Path = [UIBezierPath bezierPath];
            [paintMain4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 62.73, CGRectGetMinY(frame) + 53.48)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 63.83, CGRectGetMinY(frame) + 48.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 64.2, CGRectGetMinY(frame) + 52.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 63.83, CGRectGetMinY(frame) + 48.7)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.35, CGRectGetMinY(frame) + 48.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 63.83, CGRectGetMinY(frame) + 48.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.21, CGRectGetMinY(frame) + 48.75)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.41, CGRectGetMinY(frame) + 49.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.29, CGRectGetMinY(frame) + 48.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.21, CGRectGetMinY(frame) + 48.92)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.41, CGRectGetMinY(frame) + 53.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.94, CGRectGetMinY(frame) + 50.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.94, CGRectGetMinY(frame) + 52.39)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 62.73, CGRectGetMinY(frame) + 53.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.88, CGRectGetMinY(frame) + 54.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.26, CGRectGetMinY(frame) + 54.57)];
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
            [paintHighlighted4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.59, CGRectGetMinY(frame) + 52.72)];
            [paintHighlighted4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 59.3, CGRectGetMinY(frame) + 51.12)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.71, CGRectGetMinY(frame) + 50.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.3, CGRectGetMinY(frame) + 51.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 60.15, CGRectGetMinY(frame) + 50.98)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 62.13, CGRectGetMinY(frame) + 48.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 61.43, CGRectGetMinY(frame) + 49.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 62.13, CGRectGetMinY(frame) + 48.72)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 59.51, CGRectGetMinY(frame) + 48.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.13, CGRectGetMinY(frame) + 48.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 60.16, CGRectGetMinY(frame) + 48.76)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.31, CGRectGetMinY(frame) + 49.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.72, CGRectGetMinY(frame) + 48.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 57.91, CGRectGetMinY(frame) + 48.88)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.31, CGRectGetMinY(frame) + 52.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.2, CGRectGetMinY(frame) + 50.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.2, CGRectGetMinY(frame) + 51.36)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.59, CGRectGetMinY(frame) + 52.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.92, CGRectGetMinY(frame) + 52.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.59, CGRectGetMinY(frame) + 52.72)];
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

- (void)drawNormal{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* mainColor = [UIColor colorWithRed: 0.287 green: 0.287 blue: 0.287 alpha: 1];
    CGFloat mainColorRGBA[4];
    [mainColor getRed: &mainColorRGBA[0] green: &mainColorRGBA[1] blue: &mainColorRGBA[2] alpha: &mainColorRGBA[3]];
    
    UIColor* cylinderProjectGradientColor1 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.5 + 0.5) green: (mainColorRGBA[1] * 0.5 + 0.5) blue: (mainColorRGBA[2] * 0.5 + 0.5) alpha: (mainColorRGBA[3] * 0.5 + 0.5)];
    UIColor* cylinderProjectGradientColor2 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.8 + 0.2) green: (mainColorRGBA[1] * 0.8 + 0.2) blue: (mainColorRGBA[2] * 0.8 + 0.2) alpha: (mainColorRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorShadow = [mainColor colorWithAlphaComponent: 0.5];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.831 green: 0.831 blue: 0.831 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.51];
    UIColor* paintColorRed = [UIColor colorWithRed: 0.744 green: 0.744 blue: 0.744 alpha: 1];
    CGFloat paintColorRedRGBA[4];
    [paintColorRed getRed: &paintColorRedRGBA[0] green: &paintColorRedRGBA[1] blue: &paintColorRedRGBA[2] alpha: &paintColorRedRGBA[3]];
    
    UIColor* paintColorRedBright = [UIColor colorWithRed: (paintColorRedRGBA[0] * 0.5 + 0.5) green: (paintColorRedRGBA[1] * 0.5 + 0.5) blue: (paintColorRedRGBA[2] * 0.5 + 0.5) alpha: (paintColorRedRGBA[3] * 0.5 + 0.5)];
    UIColor* paintColorRedDark = [UIColor colorWithRed: (paintColorRedRGBA[0] * 0.8) green: (paintColorRedRGBA[1] * 0.8) blue: (paintColorRedRGBA[2] * 0.8) alpha: (paintColorRedRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorGreen = [UIColor colorWithRed: 0.754 green: 0.754 blue: 0.754 alpha: 1];
    CGFloat paintColorGreenRGBA[4];
    [paintColorGreen getRed: &paintColorGreenRGBA[0] green: &paintColorGreenRGBA[1] blue: &paintColorGreenRGBA[2] alpha: &paintColorGreenRGBA[3]];
    
    UIColor* paintColorGreenBright = [UIColor colorWithRed: (paintColorGreenRGBA[0] * 0.5 + 0.5) green: (paintColorGreenRGBA[1] * 0.5 + 0.5) blue: (paintColorGreenRGBA[2] * 0.5 + 0.5) alpha: (paintColorGreenRGBA[3] * 0.5 + 0.5)];
    UIColor* paintColorGreenDark = [UIColor colorWithRed: (paintColorGreenRGBA[0] * 0.8) green: (paintColorGreenRGBA[1] * 0.8) blue: (paintColorGreenRGBA[2] * 0.8) alpha: (paintColorGreenRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorBlue = [UIColor colorWithRed: 0.754 green: 0.754 blue: 0.754 alpha: 1];
    CGFloat paintColorBlueRGBA[4];
    [paintColorBlue getRed: &paintColorBlueRGBA[0] green: &paintColorBlueRGBA[1] blue: &paintColorBlueRGBA[2] alpha: &paintColorBlueRGBA[3]];
    
    UIColor* paintColorBlueDark = [UIColor colorWithRed: (paintColorBlueRGBA[0] * 0.8) green: (paintColorBlueRGBA[1] * 0.8) blue: (paintColorBlueRGBA[2] * 0.8) alpha: (paintColorBlueRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorBlueBright = [UIColor colorWithRed: (paintColorBlueRGBA[0] * 0.5 + 0.5) green: (paintColorBlueRGBA[1] * 0.5 + 0.5) blue: (paintColorBlueRGBA[2] * 0.5 + 0.5) alpha: (paintColorBlueRGBA[3] * 0.5 + 0.5)];
    UIColor* paintColorPink = [UIColor colorWithRed: 0.744 green: 0.744 blue: 0.744 alpha: 1];
    CGFloat paintColorPinkRGBA[4];
    [paintColorPink getRed: &paintColorPinkRGBA[0] green: &paintColorPinkRGBA[1] blue: &paintColorPinkRGBA[2] alpha: &paintColorPinkRGBA[3]];
    
    UIColor* paintColorPinkDark = [UIColor colorWithRed: (paintColorPinkRGBA[0] * 0.8) green: (paintColorPinkRGBA[1] * 0.8) blue: (paintColorPinkRGBA[2] * 0.8) alpha: (paintColorPinkRGBA[3] * 0.8 + 0.2)];
    UIColor* paintColorPinkBright = [UIColor colorWithRed: (paintColorPinkRGBA[0] * 0.5 + 0.5) green: (paintColorPinkRGBA[1] * 0.5 + 0.5) blue: (paintColorPinkRGBA[2] * 0.5 + 0.5) alpha: (paintColorPinkRGBA[3] * 0.5 + 0.5)];
    UIColor* cylinderProjectInnerShadowColor = [UIColor colorWithRed: 0.762 green: 0.762 blue: 0.762 alpha: 0];
    
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
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 25.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 80.48, CGRectGetMinY(frame) + 17.25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 20.22)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 29.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 32.78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 29.38)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 36.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 42.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 34.12)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.73, CGRectGetMinY(frame) + 56.84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 48.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 85.61, CGRectGetMinY(frame) + 53.64)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 53.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 69.86, CGRectGetMinY(frame) + 60.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.14, CGRectGetMinY(frame) + 61.84)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 21.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 44.59) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 30.77)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.04, CGRectGetMinY(frame) + 15.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 67.72, CGRectGetMinY(frame) + 13.45)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 71.47, CGRectGetMinY(frame) + 48.28) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 68.23, CGRectGetMinY(frame) + 45.21) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 69.08, CGRectGetMinY(frame) + 47.52)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 78.25, CGRectGetMinY(frame) + 45.85) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.86, CGRectGetMinY(frame) + 49.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 76.9, CGRectGetMinY(frame) + 47.94)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 76.36, CGRectGetMinY(frame) + 40.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.6, CGRectGetMinY(frame) + 43.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 78.76, CGRectGetMinY(frame) + 41.44)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.97, CGRectGetMinY(frame) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 70.93, CGRectGetMinY(frame) + 41.02)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                [bezierPath addClip];
                CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
                CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 50.29, CGRectGetHeight(bezierBounds) / 44.49);
                CGContextDrawRadialGradient(context, gradientCylinderProject,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + 0.32 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -0.09 * bezierResizeRatio), 11.15 * bezierResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + 0.22 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -4.76 * bezierResizeRatio), 41.17 * bezierResizeRatio,
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
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 25.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 80.48, CGRectGetMinY(frame) + 17.25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 20.22)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 84.79, CGRectGetMinY(frame) + 29.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 32.78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.3, CGRectGetMinY(frame) + 28.13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 29.38)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.81, CGRectGetMinY(frame) + 36.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 42.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.02, CGRectGetMinY(frame) + 36.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 34.12)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.73, CGRectGetMinY(frame) + 56.84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 90, CGRectGetMinY(frame) + 48.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 85.61, CGRectGetMinY(frame) + 53.64)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 53.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 69.86, CGRectGetMinY(frame) + 60.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.14, CGRectGetMinY(frame) + 61.84)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 21.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 44.59) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.95, CGRectGetMinY(frame) + 30.77)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 77.75, CGRectGetMinY(frame) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.04, CGRectGetMinY(frame) + 15.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 67.72, CGRectGetMinY(frame) + 13.45)];
                [bezier2Path closePath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 71.47, CGRectGetMinY(frame) + 48.28) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 68.23, CGRectGetMinY(frame) + 45.21) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 69.08, CGRectGetMinY(frame) + 47.52)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 78.25, CGRectGetMinY(frame) + 45.85) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.86, CGRectGetMinY(frame) + 49.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 76.9, CGRectGetMinY(frame) + 47.94)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 76.36, CGRectGetMinY(frame) + 40.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 79.6, CGRectGetMinY(frame) + 43.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 78.76, CGRectGetMinY(frame) + 41.44)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 69.58, CGRectGetMinY(frame) + 43.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 73.97, CGRectGetMinY(frame) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 70.93, CGRectGetMinY(frame) + 41.02)];
                [bezier2Path closePath];
                CGContextSaveGState(context);
                [bezier2Path addClip];
                CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
                CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 50.29, CGRectGetHeight(bezier2Bounds) / 44.49);
                CGContextDrawRadialGradient(context, gradient,
                                            CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.56 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 3.34 * bezier2ResizeRatio), 50.58 * bezier2ResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.05 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -25.03 * bezier2ResizeRatio), 19.69 * bezier2ResizeRatio,
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
            UIBezierPath* paintShadowPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 52, CGRectGetMinY(frame) + 23, 8, 3)];
            [paintColorShadow setFill];
            [paintShadowPath fill];
            
            
            //// PaintHighlighted Drawing
            UIBezierPath* paintHighlightedPath = [UIBezierPath bezierPath];
            [paintHighlightedPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.73, CGRectGetMinY(frame) + 24.48)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 61.83, CGRectGetMinY(frame) + 19.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.2, CGRectGetMinY(frame) + 23.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.83, CGRectGetMinY(frame) + 19.7)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.35, CGRectGetMinY(frame) + 19.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 61.83, CGRectGetMinY(frame) + 19.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 59.21, CGRectGetMinY(frame) + 19.75)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.41, CGRectGetMinY(frame) + 20.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.29, CGRectGetMinY(frame) + 19.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.21, CGRectGetMinY(frame) + 19.92)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.41, CGRectGetMinY(frame) + 24.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 53.94, CGRectGetMinY(frame) + 21.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 53.94, CGRectGetMinY(frame) + 23.39)];
            [paintHighlightedPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.73, CGRectGetMinY(frame) + 24.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.88, CGRectGetMinY(frame) + 25.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 59.26, CGRectGetMinY(frame) + 25.57)];
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
            [paintMainPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.59, CGRectGetMinY(frame) + 23.72)];
            [paintMainPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 57.3, CGRectGetMinY(frame) + 22.12)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.71, CGRectGetMinY(frame) + 21.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.3, CGRectGetMinY(frame) + 22.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.15, CGRectGetMinY(frame) + 21.98)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.13, CGRectGetMinY(frame) + 19.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.43, CGRectGetMinY(frame) + 20.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 60.13, CGRectGetMinY(frame) + 19.72)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.51, CGRectGetMinY(frame) + 19.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 60.13, CGRectGetMinY(frame) + 19.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.16, CGRectGetMinY(frame) + 19.76)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.31, CGRectGetMinY(frame) + 20.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.72, CGRectGetMinY(frame) + 19.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.91, CGRectGetMinY(frame) + 19.88)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55.31, CGRectGetMinY(frame) + 23.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 54.2, CGRectGetMinY(frame) + 21.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.2, CGRectGetMinY(frame) + 22.36)];
            [paintMainPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.59, CGRectGetMinY(frame) + 23.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.92, CGRectGetMinY(frame) + 23.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.59, CGRectGetMinY(frame) + 23.72)];
            [paintMainPath closePath];
            [paintColorRedBright setFill];
            [paintMainPath fill];
        }
        
        
        //// PaintGreen
        {
            //// PaintShadow 2 Drawing
            UIBezierPath* paintShadow2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 45, 8, 3)];
            [paintColorShadow setFill];
            [paintShadow2Path fill];
            
            
            //// PaintHighlighted 2 Drawing
            UIBezierPath* paintHighlighted2Path = [UIBezierPath bezierPath];
            [paintHighlighted2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.6, CGRectGetMinY(frame) + 46.48)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.81, CGRectGetMinY(frame) + 41.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.22, CGRectGetMinY(frame) + 45.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.81, CGRectGetMinY(frame) + 41.7)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.98, CGRectGetMinY(frame) + 41.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 54.81, CGRectGetMinY(frame) + 41.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.93, CGRectGetMinY(frame) + 41.75)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.75, CGRectGetMinY(frame) + 42.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.82, CGRectGetMinY(frame) + 41.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.64, CGRectGetMinY(frame) + 41.92)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.75, CGRectGetMinY(frame) + 46.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.13, CGRectGetMinY(frame) + 43.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.13, CGRectGetMinY(frame) + 45.39)];
            [paintHighlighted2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53.6, CGRectGetMinY(frame) + 46.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.37, CGRectGetMinY(frame) + 47.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.98, CGRectGetMinY(frame) + 47.57)];
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
            [paintMain2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.05, CGRectGetMinY(frame) + 45.72)];
            [paintMain2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 49.83, CGRectGetMinY(frame) + 44.12)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.38, CGRectGetMinY(frame) + 43.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.83, CGRectGetMinY(frame) + 44.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.77, CGRectGetMinY(frame) + 43.98)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.94, CGRectGetMinY(frame) + 41.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.18, CGRectGetMinY(frame) + 42.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.94, CGRectGetMinY(frame) + 41.72)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.06, CGRectGetMinY(frame) + 41.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.94, CGRectGetMinY(frame) + 41.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.78, CGRectGetMinY(frame) + 41.76)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.64, CGRectGetMinY(frame) + 42.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.19, CGRectGetMinY(frame) + 41.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.3, CGRectGetMinY(frame) + 41.88)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.64, CGRectGetMinY(frame) + 45.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.42, CGRectGetMinY(frame) + 43.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.42, CGRectGetMinY(frame) + 44.36)];
            [paintMain2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.05, CGRectGetMinY(frame) + 45.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.31, CGRectGetMinY(frame) + 45.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.05, CGRectGetMinY(frame) + 45.72)];
            [paintMain2Path closePath];
            [paintColorGreenBright setFill];
            [paintMain2Path fill];
        }
        
        
        //// PaintBlue
        {
            //// PaintShadow 3 Drawing
            UIBezierPath* paintShadow3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 43, CGRectGetMinY(frame) + 34, 8, 3)];
            [paintColorShadow setFill];
            [paintShadow3Path fill];
            
            
            //// PaintMain 3 Drawing
            UIBezierPath* paintMain3Path = [UIBezierPath bezierPath];
            [paintMain3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.73, CGRectGetMinY(frame) + 35.48)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.83, CGRectGetMinY(frame) + 30.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 53.2, CGRectGetMinY(frame) + 34.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.83, CGRectGetMinY(frame) + 30.7)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.35, CGRectGetMinY(frame) + 30.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.83, CGRectGetMinY(frame) + 30.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.21, CGRectGetMinY(frame) + 30.75)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.41, CGRectGetMinY(frame) + 31.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.29, CGRectGetMinY(frame) + 30.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.21, CGRectGetMinY(frame) + 30.92)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.41, CGRectGetMinY(frame) + 35.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.94, CGRectGetMinY(frame) + 32.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.94, CGRectGetMinY(frame) + 34.39)];
            [paintMain3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.73, CGRectGetMinY(frame) + 35.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.88, CGRectGetMinY(frame) + 36.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.26, CGRectGetMinY(frame) + 36.57)];
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
            [paintHighlighted3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.59, CGRectGetMinY(frame) + 34.72)];
            [paintHighlighted3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48.3, CGRectGetMinY(frame) + 33.12)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.71, CGRectGetMinY(frame) + 32.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.3, CGRectGetMinY(frame) + 33.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.15, CGRectGetMinY(frame) + 32.98)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51.13, CGRectGetMinY(frame) + 30.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.43, CGRectGetMinY(frame) + 31.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.13, CGRectGetMinY(frame) + 30.72)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.51, CGRectGetMinY(frame) + 30.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.13, CGRectGetMinY(frame) + 30.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.16, CGRectGetMinY(frame) + 30.76)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.31, CGRectGetMinY(frame) + 31.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.72, CGRectGetMinY(frame) + 30.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.91, CGRectGetMinY(frame) + 30.88)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.31, CGRectGetMinY(frame) + 34.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.2, CGRectGetMinY(frame) + 32.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.2, CGRectGetMinY(frame) + 33.36)];
            [paintHighlighted3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.59, CGRectGetMinY(frame) + 34.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.92, CGRectGetMinY(frame) + 34.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.59, CGRectGetMinY(frame) + 34.72)];
            [paintHighlighted3Path closePath];
            [paintColorBlueBright setFill];
            [paintHighlighted3Path fill];
        }
        
        
        //// PaintPink
        {
            //// PaintShadow 4 Drawing
            UIBezierPath* paintShadow4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 54, CGRectGetMinY(frame) + 52, 8, 3)];
            [paintColorShadow setFill];
            [paintShadow4Path fill];
            
            
            //// PaintMain 4 Drawing
            UIBezierPath* paintMain4Path = [UIBezierPath bezierPath];
            [paintMain4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 62.73, CGRectGetMinY(frame) + 53.48)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 63.83, CGRectGetMinY(frame) + 48.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 64.2, CGRectGetMinY(frame) + 52.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 63.83, CGRectGetMinY(frame) + 48.7)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.35, CGRectGetMinY(frame) + 48.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 63.83, CGRectGetMinY(frame) + 48.7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.21, CGRectGetMinY(frame) + 48.75)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.41, CGRectGetMinY(frame) + 49.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.29, CGRectGetMinY(frame) + 48.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.21, CGRectGetMinY(frame) + 48.92)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.41, CGRectGetMinY(frame) + 53.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.94, CGRectGetMinY(frame) + 50.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.94, CGRectGetMinY(frame) + 52.39)];
            [paintMain4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 62.73, CGRectGetMinY(frame) + 53.48) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.88, CGRectGetMinY(frame) + 54.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 61.26, CGRectGetMinY(frame) + 54.57)];
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
            [paintHighlighted4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.59, CGRectGetMinY(frame) + 52.72)];
            [paintHighlighted4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 59.3, CGRectGetMinY(frame) + 51.12)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 60.71, CGRectGetMinY(frame) + 50.54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59.3, CGRectGetMinY(frame) + 51.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 60.15, CGRectGetMinY(frame) + 50.98)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 62.13, CGRectGetMinY(frame) + 48.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 61.43, CGRectGetMinY(frame) + 49.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 62.13, CGRectGetMinY(frame) + 48.72)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 59.51, CGRectGetMinY(frame) + 48.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.13, CGRectGetMinY(frame) + 48.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 60.16, CGRectGetMinY(frame) + 48.76)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.31, CGRectGetMinY(frame) + 49.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.72, CGRectGetMinY(frame) + 48.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 57.91, CGRectGetMinY(frame) + 48.88)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.31, CGRectGetMinY(frame) + 52.14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56.2, CGRectGetMinY(frame) + 50.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56.2, CGRectGetMinY(frame) + 51.36)];
            [paintHighlighted4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58.59, CGRectGetMinY(frame) + 52.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.92, CGRectGetMinY(frame) + 52.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.59, CGRectGetMinY(frame) + 52.72)];
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
