//
//  PaintButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-24.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADPaintButton.h"

@implementation ADPaintButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setIsReversePaint:(BOOL)isReversePaint{
    _isReversePaint = isReversePaint;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
//        if (self.isReversePaint) {
//            [self drawReverseNormalSelectedWithFrame:rect];
//        }
//        else{
            [self drawNormalSelectedWithFrame:rect];
//        }

//        [self setTitleColor:[UIColor colorWithRed:247/255.0 green:167/255.0 blue:211/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
//        if (self.isReversePaint) {
//            [self drawReverseNormalWithFrame:rect];
//        }
//        else{
            [self drawNormalWithFrame:rect];
//        }
//
//        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

- (void)drawNormalSelectedWithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0.667 green: 0 blue: 1 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 0.906 green: 0.718 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.843 green: 0.53 blue: 1 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.736 green: 0.209 blue: 1 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.227 green: 0.227 blue: 0.227 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 0.837 green: 0.51 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor.CGColor, (id)[UIColor colorWithRed: 0.755 green: 0.265 blue: 1 alpha: 1].CGColor, (id)gradientColor.CGColor], gradientLocations);
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconSpecularColor2.CGColor, (id)iconSpecularColor.CGColor], gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 6;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 32.53) * 0.49294 + 0.44) + 0.06, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 46.58) * 0.46378 - 0.42) + 0.92, 32.53, 46.58);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 45.13)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.02, CGRectGetMinY(iconNormal) + 46.58)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.9, CGRectGetMinY(iconNormal) + 32.56)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 16.07)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.39, CGRectGetMinY(iconNormal) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.03, CGRectGetMinY(iconNormal) + 9.21)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.39, CGRectGetMinY(iconNormal) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.75, CGRectGetMinY(iconNormal) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.71, CGRectGetMinY(iconNormal) + 2.83)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.39, CGRectGetMinY(iconNormal) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.08, CGRectGetMinY(iconNormal) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.01, CGRectGetMinY(iconNormal) - 0.08)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.78, CGRectGetMinY(iconNormal) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.23, CGRectGetMinY(iconNormal) + 7.35)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 32.53, CGRectGetHeight(bezierBounds) / 46.58);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -2.81 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 6.02 * bezierResizeRatio), 32.99 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -3.06 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 5.01 * bezierResizeRatio), 16.91 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezierPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezierPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
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
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 45.13)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.02, CGRectGetMinY(iconNormal) + 46.58)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.9, CGRectGetMinY(iconNormal) + 32.56)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 16.07)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.39, CGRectGetMinY(iconNormal) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.03, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.39, CGRectGetMinY(iconNormal) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.75, CGRectGetMinY(iconNormal) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.71, CGRectGetMinY(iconNormal) + 2.83)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.39, CGRectGetMinY(iconNormal) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.08, CGRectGetMinY(iconNormal) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.01, CGRectGetMinY(iconNormal) - 0.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.78, CGRectGetMinY(iconNormal) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.23, CGRectGetMinY(iconNormal) + 7.35)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 32.53, CGRectGetHeight(bezier3Bounds) / 46.58);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -1.44 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + 0.57 * bezier3ResizeRatio), 27.06 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.54 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -1.14 * bezier3ResizeRatio), 16.91 * bezier3ResizeRatio,
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

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawNormalWithFrame: (CGRect)frame;
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
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor.CGColor, (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor, (id)gradientColor.CGColor], gradientLocations);
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconSpecularColor2.CGColor, (id)iconSpecularColor.CGColor], gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 6;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 32.53) * 0.49294 + 0.44) + 0.06, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 46.58) * 0.46378 - 0.42) + 0.92, 32.53, 46.58);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 45.13)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.02, CGRectGetMinY(iconNormal) + 46.58)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.9, CGRectGetMinY(iconNormal) + 32.56)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 16.07)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.39, CGRectGetMinY(iconNormal) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.03, CGRectGetMinY(iconNormal) + 9.21)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.39, CGRectGetMinY(iconNormal) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.75, CGRectGetMinY(iconNormal) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.71, CGRectGetMinY(iconNormal) + 2.83)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.39, CGRectGetMinY(iconNormal) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.08, CGRectGetMinY(iconNormal) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.01, CGRectGetMinY(iconNormal) - 0.08)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.78, CGRectGetMinY(iconNormal) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.23, CGRectGetMinY(iconNormal) + 7.35)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 32.53, CGRectGetHeight(bezierBounds) / 46.58);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -2.81 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 6.02 * bezierResizeRatio), 32.99 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -3.06 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 5.01 * bezierResizeRatio), 16.91 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezierPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezierPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
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
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 45.13)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.02, CGRectGetMinY(iconNormal) + 46.58)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.9, CGRectGetMinY(iconNormal) + 32.56)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.9, CGRectGetMinY(iconNormal) + 16.07)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.39, CGRectGetMinY(iconNormal) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.03, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.39, CGRectGetMinY(iconNormal) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.75, CGRectGetMinY(iconNormal) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.71, CGRectGetMinY(iconNormal) + 2.83)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.39, CGRectGetMinY(iconNormal) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.08, CGRectGetMinY(iconNormal) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.01, CGRectGetMinY(iconNormal) - 0.08)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.78, CGRectGetMinY(iconNormal) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.89, CGRectGetMinY(iconNormal) + 3.35)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.23, CGRectGetMinY(iconNormal) + 7.35)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.28, CGRectGetMinY(iconNormal) + 23.66)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 32.53, CGRectGetHeight(bezier3Bounds) / 46.58);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -1.44 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + 0.57 * bezier3ResizeRatio), 27.06 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.54 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -1.14 * bezier3ResizeRatio), 16.91 * bezier3ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 3 Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezier3Path.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezier3Path fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
            
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






- (void)drawReverseNormalWithFrame: (CGRect)frame;
{
        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
        UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
        UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
        UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.498];
        UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
        
        //// Gradient Declarations
        CGFloat gradientLocations[] = {0, 0.44, 1};
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor.CGColor, (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor, (id)gradientColor.CGColor], gradientLocations);
        
        //// Shadow Declarations
        UIColor* iconHighlight = iconHighlightColor;
        CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
        CGFloat iconHighlightBlurRadius = 6;
        UIColor* iconShadow = iconShadowColor;
        CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
        CGFloat iconShadowBlurRadius = 4;
        UIColor* glow = glowColor;
        CGSize glowOffset = CGSizeMake(0.1, -0.1);
        CGFloat glowBlurRadius = 15;
        
        
        //// Subframes
        CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 32.84) * 0.49129 - 0.25) + 0.75, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 46) * 0.45588) + 0.5, 32.84, 46);
        
        
        //// IconNormal
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 5
            {
                CGContextSaveGState(context);
                CGContextSetAlpha(context, 0.38);
                CGContextBeginTransparencyLayer(context, NULL);
                
                
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.58, CGRectGetMinY(iconNormal) + 23.66)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.55, CGRectGetMinY(iconNormal) + 33.54)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 42.88)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.5, CGRectGetMinY(iconNormal) + 46)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.62, CGRectGetMinY(iconNormal) + 45.25)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.75, CGRectGetMinY(iconNormal) + 39.62)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.87, CGRectGetMinY(iconNormal) + 32.5)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.21, CGRectGetMinY(iconNormal) + 16.07)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.59, CGRectGetMinY(iconNormal) + 11.96)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.7, CGRectGetMinY(iconNormal) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.59, CGRectGetMinY(iconNormal) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.34, CGRectGetMinY(iconNormal) + 9.21)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.7, CGRectGetMinY(iconNormal) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 32.06, CGRectGetMinY(iconNormal) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.01, CGRectGetMinY(iconNormal) + 2.83)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.7, CGRectGetMinY(iconNormal) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.39, CGRectGetMinY(iconNormal) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.32, CGRectGetMinY(iconNormal) - 0.08)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.2, CGRectGetMinY(iconNormal) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.09, CGRectGetMinY(iconNormal) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.2, CGRectGetMinY(iconNormal) + 3.35)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.54, CGRectGetMinY(iconNormal) + 7.35)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.58, CGRectGetMinY(iconNormal) + 23.66)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
                CGContextBeginTransparencyLayer(context, NULL);
                [bezierPath addClip];
                CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
                CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 32.84, CGRectGetHeight(bezierBounds) / 46);
                CGContextDrawRadialGradient(context, gradient,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + -2.81 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 6.02 * bezierResizeRatio), 32.99 * bezierResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + -3.06 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 5.01 * bezierResizeRatio), 16.91 * bezierResizeRatio,
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextEndTransparencyLayer(context);
                
                ////// Bezier Inner Shadow
                CGContextSaveGState(context);
                UIRectClip(bezierPath.bounds);
                CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
                
                CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
                CGContextBeginTransparencyLayer(context, NULL);
                {
                    UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                    CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                    CGContextBeginTransparencyLayer(context, NULL);
                    
                    [opaqueShadow setFill];
                    [bezierPath fill];
                    
                    CGContextEndTransparencyLayer(context);
                }
                CGContextEndTransparencyLayer(context);
                CGContextRestoreGState(context);
                
                CGContextRestoreGState(context);
                
                
                
                CGContextEndTransparencyLayer(context);
                CGContextRestoreGState(context);
            }
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 3.13)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 4.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.34, CGRectGetMinY(iconNormal) + 3.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 4.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.72, CGRectGetMinY(iconNormal) + 6.03) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 4.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.31, CGRectGetMinY(iconNormal) + 5.1)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.61, CGRectGetMinY(iconNormal) + 6.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.72, CGRectGetMinY(iconNormal) + 6.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.68, CGRectGetMinY(iconNormal) + 6.09)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.93, CGRectGetMinY(iconNormal) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.23, CGRectGetMinY(iconNormal) + 6.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.93, CGRectGetMinY(iconNormal) + 8.8)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.86, CGRectGetMinY(iconNormal) + 13.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.93, CGRectGetMinY(iconNormal) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.16, CGRectGetMinY(iconNormal) + 11.69)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.05, CGRectGetMinY(iconNormal) + 15.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 14.4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.05, CGRectGetMinY(iconNormal) + 15.04)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.86, CGRectGetMinY(iconNormal) + 12.23)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.94, CGRectGetMinY(iconNormal) + 10.31) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.36, CGRectGetMinY(iconNormal) + 11.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.94, CGRectGetMinY(iconNormal) + 10.31)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.14, CGRectGetMinY(iconNormal) + 7.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.94, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.48, CGRectGetMinY(iconNormal) + 8.82)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.67, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.71, CGRectGetMinY(iconNormal) + 6.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.83, CGRectGetMinY(iconNormal) + 5.58)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 3.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.42, CGRectGetMinY(iconNormal) + 3.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.02, CGRectGetMinY(iconNormal) + 3.21)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.02, CGRectGetMinY(iconNormal) + 1.72)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.06, CGRectGetMinY(iconNormal) + 3.14) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.02, CGRectGetMinY(iconNormal) + 1.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.03, CGRectGetMinY(iconNormal) + 2.43)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.19, CGRectGetMinY(iconNormal) + 5.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.94, CGRectGetMinY(iconNormal) + 3.74) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.65, CGRectGetMinY(iconNormal) + 4.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.35, CGRectGetMinY(iconNormal) + 7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.73, CGRectGetMinY(iconNormal) + 5.72) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.12, CGRectGetMinY(iconNormal) + 6.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.62, CGRectGetMinY(iconNormal) + 8.72) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.59, CGRectGetMinY(iconNormal) + 7.63) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.62, CGRectGetMinY(iconNormal) + 8.16)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 10.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.62, CGRectGetMinY(iconNormal) + 9.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.52, CGRectGetMinY(iconNormal) + 9.89)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.27, CGRectGetMinY(iconNormal) + 12.55) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.07, CGRectGetMinY(iconNormal) + 11.16) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.73, CGRectGetMinY(iconNormal) + 11.84)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.37, CGRectGetMinY(iconNormal) + 17.06)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.34, CGRectGetMinY(iconNormal) + 17.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.37, CGRectGetMinY(iconNormal) + 17.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.36, CGRectGetMinY(iconNormal) + 17.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.19, CGRectGetMinY(iconNormal) + 23.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.24, CGRectGetMinY(iconNormal) + 17.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.19, CGRectGetMinY(iconNormal) + 23.49)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.38, CGRectGetMinY(iconNormal) + 24.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.07, CGRectGetMinY(iconNormal) + 23.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.38, CGRectGetMinY(iconNormal) + 24.78)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.81, CGRectGetMinY(iconNormal) + 32.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.86, CGRectGetMinY(iconNormal) + 27.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.81, CGRectGetMinY(iconNormal) + 32.13)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.18, CGRectGetMinY(iconNormal) + 39.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.16, CGRectGetMinY(iconNormal) + 39.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.18, CGRectGetMinY(iconNormal) + 39.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.18, CGRectGetMinY(iconNormal) + 39.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.92, CGRectGetMinY(iconNormal) + 44.62) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.79, CGRectGetMinY(iconNormal) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.92, CGRectGetMinY(iconNormal) + 44.62)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.9, CGRectGetMinY(iconNormal) + 43.93)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.55, CGRectGetMinY(iconNormal) + 35.16) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.9, CGRectGetMinY(iconNormal) + 43.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.47, CGRectGetMinY(iconNormal) + 35.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.68, CGRectGetMinY(iconNormal) + 31.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.04, CGRectGetMinY(iconNormal) + 33.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.18, CGRectGetMinY(iconNormal) + 24.26) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.67, CGRectGetMinY(iconNormal) + 28.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.99, CGRectGetMinY(iconNormal) + 24.82)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.11, CGRectGetMinY(iconNormal) + 24.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.13, CGRectGetMinY(iconNormal) + 24.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 6.11, CGRectGetMinY(iconNormal) + 24.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.72, CGRectGetMinY(iconNormal) + 15.66) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.11, CGRectGetMinY(iconNormal) + 24.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.46, CGRectGetMinY(iconNormal) + 16.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.7, CGRectGetMinY(iconNormal) + 15.65) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.71, CGRectGetMinY(iconNormal) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.7, CGRectGetMinY(iconNormal) + 15.65)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.87, CGRectGetMinY(iconNormal) + 9.18)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.87, CGRectGetMinY(iconNormal) + 9.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.92, CGRectGetMinY(iconNormal) + 9.22)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.11, CGRectGetMinY(iconNormal) + 10.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.72, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.11, CGRectGetMinY(iconNormal) + 10.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.72, CGRectGetMinY(iconNormal) + 10.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.88, CGRectGetMinY(iconNormal) + 11.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.52, CGRectGetMinY(iconNormal) + 10.57) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.18, CGRectGetMinY(iconNormal) + 10.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.45, CGRectGetMinY(iconNormal) + 13.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.74, CGRectGetMinY(iconNormal) + 11.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.26, CGRectGetMinY(iconNormal) + 12.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.5, CGRectGetMinY(iconNormal) + 14.82) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.52, CGRectGetMinY(iconNormal) + 14.07) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.54, CGRectGetMinY(iconNormal) + 14.45)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.55, CGRectGetMinY(iconNormal) + 14.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.82, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.17, CGRectGetMinY(iconNormal) + 14.51)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.18, CGRectGetMinY(iconNormal) + 14.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.49, CGRectGetMinY(iconNormal) + 14.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.37, CGRectGetMinY(iconNormal) + 14.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.79, CGRectGetMinY(iconNormal) + 12.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.69, CGRectGetMinY(iconNormal) + 4.9)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.21, CGRectGetMinY(iconNormal) + 2.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.28, CGRectGetMinY(iconNormal) + 3.98) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.79, CGRectGetMinY(iconNormal) + 3.32)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.15, CGRectGetMinY(iconNormal) + 1.76) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.8, CGRectGetMinY(iconNormal) + 2.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.44, CGRectGetMinY(iconNormal) + 1.96)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.02, CGRectGetMinY(iconNormal) + 1.72) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.06, CGRectGetMinY(iconNormal) + 1.49) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.02, CGRectGetMinY(iconNormal) + 1.48)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.48, CGRectGetMinY(iconNormal) + 15.08)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.68, CGRectGetMinY(iconNormal) + 16.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.12, CGRectGetMinY(iconNormal) + 15.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.52, CGRectGetMinY(iconNormal) + 16.12)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.14, CGRectGetMinY(iconNormal) + 16.22) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.68, CGRectGetMinY(iconNormal) + 16.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.11, CGRectGetMinY(iconNormal) + 16.27)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.47, CGRectGetMinY(iconNormal) + 15.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.68, CGRectGetMinY(iconNormal) + 15.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.11, CGRectGetMinY(iconNormal) + 15.51)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.48, CGRectGetMinY(iconNormal) + 15.08)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.41, CGRectGetMinY(iconNormal) + 15.7)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.22, CGRectGetMinY(iconNormal) + 17.49)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.55, CGRectGetMinY(iconNormal) + 17.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.92, CGRectGetMinY(iconNormal) + 17.14) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.55, CGRectGetMinY(iconNormal) + 17.23)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.58, CGRectGetMinY(iconNormal) + 17.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.55, CGRectGetMinY(iconNormal) + 17.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.27, CGRectGetMinY(iconNormal) + 17.35)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.62, CGRectGetMinY(iconNormal) + 19.01) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.02, CGRectGetMinY(iconNormal) + 17.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.37, CGRectGetMinY(iconNormal) + 18.38)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.75, CGRectGetMinY(iconNormal) + 20.27)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.52, CGRectGetMinY(iconNormal) + 18.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.56, CGRectGetMinY(iconNormal) + 19.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.84, CGRectGetMinY(iconNormal) + 19.19)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.56, CGRectGetMinY(iconNormal) + 18.66) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.24, CGRectGetMinY(iconNormal) + 18.74) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.92, CGRectGetMinY(iconNormal) + 18.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.46, CGRectGetMinY(iconNormal) + 19.12) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.21, CGRectGetMinY(iconNormal) + 18.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.95, CGRectGetMinY(iconNormal) + 18.72)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.28, CGRectGetMinY(iconNormal) + 20.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.97, CGRectGetMinY(iconNormal) + 19.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.68, CGRectGetMinY(iconNormal) + 19.93)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.42, CGRectGetMinY(iconNormal) + 25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.28, CGRectGetMinY(iconNormal) + 20.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.79, CGRectGetMinY(iconNormal) + 24.42)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.5, CGRectGetMinY(iconNormal) + 25.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.47, CGRectGetMinY(iconNormal) + 25.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.5, CGRectGetMinY(iconNormal) + 25.05)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.29, CGRectGetMinY(iconNormal) + 33.79)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.23, CGRectGetMinY(iconNormal) + 27.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.33, CGRectGetMinY(iconNormal) + 27.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.23, CGRectGetMinY(iconNormal) + 27.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.27, CGRectGetMinY(iconNormal) + 27.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.64, CGRectGetMinY(iconNormal) + 22.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.86, CGRectGetMinY(iconNormal) + 26.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.64, CGRectGetMinY(iconNormal) + 22.54)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.59, CGRectGetMinY(iconNormal) + 21.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.05, CGRectGetMinY(iconNormal) + 21.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.37, CGRectGetMinY(iconNormal) + 21.31)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.62, CGRectGetMinY(iconNormal) + 20.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.92, CGRectGetMinY(iconNormal) + 20.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.23, CGRectGetMinY(iconNormal) + 20.57)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.97, CGRectGetMinY(iconNormal) + 20.3) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.02, CGRectGetMinY(iconNormal) + 20.26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.44, CGRectGetMinY(iconNormal) + 20.2)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.54, CGRectGetMinY(iconNormal) + 20.94) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.51, CGRectGetMinY(iconNormal) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.03, CGRectGetMinY(iconNormal) + 20.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.7, CGRectGetMinY(iconNormal) + 21.71) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.06, CGRectGetMinY(iconNormal) + 22.59)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.5, CGRectGetMinY(iconNormal) + 21.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 23.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.5, CGRectGetMinY(iconNormal) + 21.88)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.15, CGRectGetMinY(iconNormal) + 21.34) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.59, CGRectGetMinY(iconNormal) + 22.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.88, CGRectGetMinY(iconNormal) + 21.84)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.64, CGRectGetMinY(iconNormal) + 18.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.32, CGRectGetMinY(iconNormal) + 20.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.82, CGRectGetMinY(iconNormal) + 19.97)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.59, CGRectGetMinY(iconNormal) + 17.79) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.57, CGRectGetMinY(iconNormal) + 18.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.55, CGRectGetMinY(iconNormal) + 18.16)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.55, CGRectGetMinY(iconNormal) + 18.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.27, CGRectGetMinY(iconNormal) + 17.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.92, CGRectGetMinY(iconNormal) + 18.11)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.81, CGRectGetMinY(iconNormal) + 17.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.55, CGRectGetMinY(iconNormal) + 18.42) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.64, CGRectGetMinY(iconNormal) + 18.25)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.41, CGRectGetMinY(iconNormal) + 15.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.11, CGRectGetMinY(iconNormal) + 17.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.64, CGRectGetMinY(iconNormal) + 16.57)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.39, CGRectGetMinY(iconNormal) + 12.15)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.95, CGRectGetMinY(iconNormal) + 13.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.79, CGRectGetMinY(iconNormal) + 12.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.31, CGRectGetMinY(iconNormal) + 12.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.58, CGRectGetMinY(iconNormal) + 14.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.58, CGRectGetMinY(iconNormal) + 13.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.46, CGRectGetMinY(iconNormal) + 14.35)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.52, CGRectGetMinY(iconNormal) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.7, CGRectGetMinY(iconNormal) + 15.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.02, CGRectGetMinY(iconNormal) + 16.09)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.21, CGRectGetMinY(iconNormal) + 16.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.03, CGRectGetMinY(iconNormal) + 16.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 16.89)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.65, CGRectGetMinY(iconNormal) + 15.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.83, CGRectGetMinY(iconNormal) + 16.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.31, CGRectGetMinY(iconNormal) + 16.26)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.01, CGRectGetMinY(iconNormal) + 13.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19, CGRectGetMinY(iconNormal) + 15.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.12, CGRectGetMinY(iconNormal) + 14.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.08, CGRectGetMinY(iconNormal) + 12.48) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.91, CGRectGetMinY(iconNormal) + 13.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.59, CGRectGetMinY(iconNormal) + 12.84)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.39, CGRectGetMinY(iconNormal) + 12.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.56, CGRectGetMinY(iconNormal) + 12.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17, CGRectGetMinY(iconNormal) + 12.02)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.84, CGRectGetMinY(iconNormal) + 15.87)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.38, CGRectGetMinY(iconNormal) + 16.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.21, CGRectGetMinY(iconNormal) + 16.02) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.73, CGRectGetMinY(iconNormal) + 16.36)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.02, CGRectGetMinY(iconNormal) + 18.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.03, CGRectGetMinY(iconNormal) + 17.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.91, CGRectGetMinY(iconNormal) + 18.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.97, CGRectGetMinY(iconNormal) + 20.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.14, CGRectGetMinY(iconNormal) + 19.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.45, CGRectGetMinY(iconNormal) + 19.86)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.67, CGRectGetMinY(iconNormal) + 20.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.48, CGRectGetMinY(iconNormal) + 20.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 20.67)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.14, CGRectGetMinY(iconNormal) + 19.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.28, CGRectGetMinY(iconNormal) + 20.41) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.78, CGRectGetMinY(iconNormal) + 20.06)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.52, CGRectGetMinY(iconNormal) + 17.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.51, CGRectGetMinY(iconNormal) + 18.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.64, CGRectGetMinY(iconNormal) + 18.32)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.56, CGRectGetMinY(iconNormal) + 16.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.41, CGRectGetMinY(iconNormal) + 17.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.09, CGRectGetMinY(iconNormal) + 16.54)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.84, CGRectGetMinY(iconNormal) + 15.87) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.03, CGRectGetMinY(iconNormal) + 15.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.46, CGRectGetMinY(iconNormal) + 15.72)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.92, CGRectGetMinY(iconNormal) + 21.98)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.86, CGRectGetMinY(iconNormal) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.53, CGRectGetMinY(iconNormal) + 21.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.15, CGRectGetMinY(iconNormal) + 22.03)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.78, CGRectGetMinY(iconNormal) + 23.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.57, CGRectGetMinY(iconNormal) + 22.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.14, CGRectGetMinY(iconNormal) + 22.91)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.56, CGRectGetMinY(iconNormal) + 28.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.78, CGRectGetMinY(iconNormal) + 23.49) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.04, CGRectGetMinY(iconNormal) + 27.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.6, CGRectGetMinY(iconNormal) + 28.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.58, CGRectGetMinY(iconNormal) + 28.53) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.6, CGRectGetMinY(iconNormal) + 28.54)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.8, CGRectGetMinY(iconNormal) + 37.56)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.43, CGRectGetMinY(iconNormal) + 31.2)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.44, CGRectGetMinY(iconNormal) + 31.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.43, CGRectGetMinY(iconNormal) + 31.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.44, CGRectGetMinY(iconNormal) + 31.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.34, CGRectGetMinY(iconNormal) + 26.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.63, CGRectGetMinY(iconNormal) + 30.91) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.34, CGRectGetMinY(iconNormal) + 26.44)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.15, CGRectGetMinY(iconNormal) + 23.89) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.01, CGRectGetMinY(iconNormal) + 25.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.35, CGRectGetMinY(iconNormal) + 24.57)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.07, CGRectGetMinY(iconNormal) + 22.37) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.95, CGRectGetMinY(iconNormal) + 23.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.68, CGRectGetMinY(iconNormal) + 22.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.92, CGRectGetMinY(iconNormal) + 21.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.69, CGRectGetMinY(iconNormal) + 22.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.31, CGRectGetMinY(iconNormal) + 21.99)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 29.19)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.74, CGRectGetMinY(iconNormal) + 35.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.84, CGRectGetMinY(iconNormal) + 29.55) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.74, CGRectGetMinY(iconNormal) + 35.97)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 38.06) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.69, CGRectGetMinY(iconNormal) + 36.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 38.06)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.26, CGRectGetMinY(iconNormal) + 40.12)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.05, CGRectGetMinY(iconNormal) + 38.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.26, CGRectGetMinY(iconNormal) + 40.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.9, CGRectGetMinY(iconNormal) + 39.02)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 29.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.13, CGRectGetMinY(iconNormal) + 38.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.16, CGRectGetMinY(iconNormal) + 29.34)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.07, CGRectGetMinY(iconNormal) + 39.11)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.26, CGRectGetMinY(iconNormal) + 42.95)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.43, CGRectGetMinY(iconNormal) + 40.73)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.07, CGRectGetMinY(iconNormal) + 39.11)];
            [bezier5Path closePath];
            [UIColor.whiteColor setFill];
            [bezier5Path fill];
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Cleanup
        CGGradientRelease(gradient);
        CGColorSpaceRelease(colorSpace);
    }

- (void)drawReverseNormalSelectedWithFrame: (CGRect)frame;
{
        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
        UIColor* iconShadowColor = [UIColor colorWithRed: 0.75 green: 0.241 blue: 1 alpha: 1];
        UIColor* colorG1 = [UIColor colorWithRed: 1 green: 0.844 blue: 0 alpha: 1];
        CGFloat colorG1RGBA[4];
        [colorG1 getRed: &colorG1RGBA[0] green: &colorG1RGBA[1] blue: &colorG1RGBA[2] alpha: &colorG1RGBA[3]];
        
        UIColor* colorG2 = [UIColor colorWithRed: (colorG1RGBA[0] * 0 + 1) green: (colorG1RGBA[1] * 0 + 1) blue: (colorG1RGBA[2] * 0 + 1) alpha: (colorG1RGBA[3] * 0 + 1)];
        UIColor* iconColor2 = [UIColor colorWithRed: 0.667 green: 0 blue: 1 alpha: 1];
        UIColor* gradientColor2 = [UIColor colorWithRed: 0.843 green: 0.53 blue: 1 alpha: 1];
        
        //// Gradient Declarations
        CGFloat gradient4Locations[] = {0, 1};
        CGGradientRef gradient4 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)colorG2.CGColor, (id)colorG1.CGColor], gradient4Locations);
        CGFloat gradient5Locations[] = {0, 0.44, 1};
        CGGradientRef gradient5 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor2.CGColor, (id)[UIColor colorWithRed: 0.755 green: 0.265 blue: 1 alpha: 1].CGColor, (id)gradientColor2.CGColor], gradient5Locations);
        
        //// Shadow Declarations
        UIColor* iconHighlight = iconHighlightColor;
        CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
        CGFloat iconHighlightBlurRadius = 6;
        UIColor* iconShadow = iconShadowColor;
        CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
        CGFloat iconShadowBlurRadius = 4;
        UIColor* glow = [iconShadowColor colorWithAlphaComponent: 0.25];
        CGSize glowOffset = CGSizeMake(0.1, -0.1);
        CGFloat glowBlurRadius = 15;
        
        
        //// Subframes
        CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 32.84) * 0.49129 - 0.25) + 0.75, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 46) * 0.45588) + 0.5, 32.84, 46);
        
        
        //// IconNormal
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 5
            {
                CGContextSaveGState(context);
                CGContextSetAlpha(context, 0.38);
                CGContextBeginTransparencyLayer(context, NULL);
                
                
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.58, CGRectGetMinY(iconNormal) + 23.66)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.55, CGRectGetMinY(iconNormal) + 33.54)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal), CGRectGetMinY(iconNormal) + 42.88)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.5, CGRectGetMinY(iconNormal) + 46)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.62, CGRectGetMinY(iconNormal) + 45.25)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.75, CGRectGetMinY(iconNormal) + 39.62)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.87, CGRectGetMinY(iconNormal) + 32.5)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.21, CGRectGetMinY(iconNormal) + 16.07)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.59, CGRectGetMinY(iconNormal) + 11.96)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 32.7, CGRectGetMinY(iconNormal) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.59, CGRectGetMinY(iconNormal) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.34, CGRectGetMinY(iconNormal) + 9.21)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.7, CGRectGetMinY(iconNormal) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 32.06, CGRectGetMinY(iconNormal) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.01, CGRectGetMinY(iconNormal) + 2.83)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.7, CGRectGetMinY(iconNormal) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.39, CGRectGetMinY(iconNormal) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.32, CGRectGetMinY(iconNormal) - 0.08)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.2, CGRectGetMinY(iconNormal) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.09, CGRectGetMinY(iconNormal) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.2, CGRectGetMinY(iconNormal) + 3.35)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.54, CGRectGetMinY(iconNormal) + 7.35)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.58, CGRectGetMinY(iconNormal) + 23.66)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
                CGContextBeginTransparencyLayer(context, NULL);
                [bezierPath addClip];
                CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
                CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 32.84, CGRectGetHeight(bezierBounds) / 46);
                CGContextDrawRadialGradient(context, gradient5,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + -2.81 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 6.02 * bezierResizeRatio), 32.99 * bezierResizeRatio,
                                            CGPointMake(CGRectGetMidX(bezierBounds) + -3.06 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 5.01 * bezierResizeRatio), 16.91 * bezierResizeRatio,
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextEndTransparencyLayer(context);
                
                ////// Bezier Inner Shadow
                CGContextSaveGState(context);
                UIRectClip(bezierPath.bounds);
                CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
                
                CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
                CGContextBeginTransparencyLayer(context, NULL);
                {
                    UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                    CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                    CGContextBeginTransparencyLayer(context, NULL);
                    
                    [opaqueShadow setFill];
                    [bezierPath fill];
                    
                    CGContextEndTransparencyLayer(context);
                }
                CGContextEndTransparencyLayer(context);
                CGContextRestoreGState(context);
                
                CGContextRestoreGState(context);
                
                
                
                CGContextEndTransparencyLayer(context);
                CGContextRestoreGState(context);
            }
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 3.13)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 4.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.34, CGRectGetMinY(iconNormal) + 3.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 4.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.72, CGRectGetMinY(iconNormal) + 6.03) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 4.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.31, CGRectGetMinY(iconNormal) + 5.1)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.61, CGRectGetMinY(iconNormal) + 6.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.72, CGRectGetMinY(iconNormal) + 6.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.68, CGRectGetMinY(iconNormal) + 6.09)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.93, CGRectGetMinY(iconNormal) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.23, CGRectGetMinY(iconNormal) + 6.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.93, CGRectGetMinY(iconNormal) + 8.8)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.86, CGRectGetMinY(iconNormal) + 13.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.93, CGRectGetMinY(iconNormal) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.16, CGRectGetMinY(iconNormal) + 11.69)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.05, CGRectGetMinY(iconNormal) + 15.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.12, CGRectGetMinY(iconNormal) + 14.4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.05, CGRectGetMinY(iconNormal) + 15.04)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.86, CGRectGetMinY(iconNormal) + 12.23)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.94, CGRectGetMinY(iconNormal) + 10.31) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.36, CGRectGetMinY(iconNormal) + 11.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.94, CGRectGetMinY(iconNormal) + 10.31)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.14, CGRectGetMinY(iconNormal) + 7.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.94, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.48, CGRectGetMinY(iconNormal) + 8.82)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.67, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.71, CGRectGetMinY(iconNormal) + 6.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.83, CGRectGetMinY(iconNormal) + 5.58)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.68, CGRectGetMinY(iconNormal) + 3.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.42, CGRectGetMinY(iconNormal) + 3.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.02, CGRectGetMinY(iconNormal) + 3.21)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.02, CGRectGetMinY(iconNormal) + 1.72)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.06, CGRectGetMinY(iconNormal) + 3.14) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.02, CGRectGetMinY(iconNormal) + 1.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.03, CGRectGetMinY(iconNormal) + 2.43)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.19, CGRectGetMinY(iconNormal) + 5.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.94, CGRectGetMinY(iconNormal) + 3.74) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.65, CGRectGetMinY(iconNormal) + 4.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.35, CGRectGetMinY(iconNormal) + 7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.73, CGRectGetMinY(iconNormal) + 5.72) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.12, CGRectGetMinY(iconNormal) + 6.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.62, CGRectGetMinY(iconNormal) + 8.72) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.59, CGRectGetMinY(iconNormal) + 7.63) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.62, CGRectGetMinY(iconNormal) + 8.16)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.29, CGRectGetMinY(iconNormal) + 10.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.62, CGRectGetMinY(iconNormal) + 9.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.52, CGRectGetMinY(iconNormal) + 9.89)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.27, CGRectGetMinY(iconNormal) + 12.55) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.07, CGRectGetMinY(iconNormal) + 11.16) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.73, CGRectGetMinY(iconNormal) + 11.84)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.37, CGRectGetMinY(iconNormal) + 17.06)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.34, CGRectGetMinY(iconNormal) + 17.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.37, CGRectGetMinY(iconNormal) + 17.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.36, CGRectGetMinY(iconNormal) + 17.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.19, CGRectGetMinY(iconNormal) + 23.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.24, CGRectGetMinY(iconNormal) + 17.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.19, CGRectGetMinY(iconNormal) + 23.49)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.38, CGRectGetMinY(iconNormal) + 24.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.07, CGRectGetMinY(iconNormal) + 23.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.38, CGRectGetMinY(iconNormal) + 24.78)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.81, CGRectGetMinY(iconNormal) + 32.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.86, CGRectGetMinY(iconNormal) + 27.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.81, CGRectGetMinY(iconNormal) + 32.13)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.18, CGRectGetMinY(iconNormal) + 39.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.16, CGRectGetMinY(iconNormal) + 39.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.18, CGRectGetMinY(iconNormal) + 39.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 9.18, CGRectGetMinY(iconNormal) + 39.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.92, CGRectGetMinY(iconNormal) + 44.62) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.79, CGRectGetMinY(iconNormal) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.92, CGRectGetMinY(iconNormal) + 44.62)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.9, CGRectGetMinY(iconNormal) + 43.93)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.55, CGRectGetMinY(iconNormal) + 35.16) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.9, CGRectGetMinY(iconNormal) + 43.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.47, CGRectGetMinY(iconNormal) + 35.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.68, CGRectGetMinY(iconNormal) + 31.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.54, CGRectGetMinY(iconNormal) + 35.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.04, CGRectGetMinY(iconNormal) + 33.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.18, CGRectGetMinY(iconNormal) + 24.26) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.67, CGRectGetMinY(iconNormal) + 28.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.99, CGRectGetMinY(iconNormal) + 24.82)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.11, CGRectGetMinY(iconNormal) + 24.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.13, CGRectGetMinY(iconNormal) + 24.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 6.11, CGRectGetMinY(iconNormal) + 24.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.72, CGRectGetMinY(iconNormal) + 15.66) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.11, CGRectGetMinY(iconNormal) + 24.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.46, CGRectGetMinY(iconNormal) + 16.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.7, CGRectGetMinY(iconNormal) + 15.65) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.71, CGRectGetMinY(iconNormal) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.7, CGRectGetMinY(iconNormal) + 15.65)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.87, CGRectGetMinY(iconNormal) + 9.18)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.87, CGRectGetMinY(iconNormal) + 9.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.92, CGRectGetMinY(iconNormal) + 9.22)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.11, CGRectGetMinY(iconNormal) + 10.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.72, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.11, CGRectGetMinY(iconNormal) + 10.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.72, CGRectGetMinY(iconNormal) + 10.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.88, CGRectGetMinY(iconNormal) + 11.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.52, CGRectGetMinY(iconNormal) + 10.57) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.18, CGRectGetMinY(iconNormal) + 10.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.45, CGRectGetMinY(iconNormal) + 13.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.74, CGRectGetMinY(iconNormal) + 11.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.26, CGRectGetMinY(iconNormal) + 12.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.5, CGRectGetMinY(iconNormal) + 14.82) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.52, CGRectGetMinY(iconNormal) + 14.07) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.54, CGRectGetMinY(iconNormal) + 14.45)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.55, CGRectGetMinY(iconNormal) + 14.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.82, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.17, CGRectGetMinY(iconNormal) + 14.51)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.18, CGRectGetMinY(iconNormal) + 14.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.49, CGRectGetMinY(iconNormal) + 14.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.37, CGRectGetMinY(iconNormal) + 14.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.79, CGRectGetMinY(iconNormal) + 12.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.91, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.69, CGRectGetMinY(iconNormal) + 4.9)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.21, CGRectGetMinY(iconNormal) + 2.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.28, CGRectGetMinY(iconNormal) + 3.98) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.79, CGRectGetMinY(iconNormal) + 3.32)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.15, CGRectGetMinY(iconNormal) + 1.76) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.8, CGRectGetMinY(iconNormal) + 2.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.44, CGRectGetMinY(iconNormal) + 1.96)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.02, CGRectGetMinY(iconNormal) + 1.72) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.06, CGRectGetMinY(iconNormal) + 1.49) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.02, CGRectGetMinY(iconNormal) + 1.48)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.48, CGRectGetMinY(iconNormal) + 15.08)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.68, CGRectGetMinY(iconNormal) + 16.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.12, CGRectGetMinY(iconNormal) + 15.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.52, CGRectGetMinY(iconNormal) + 16.12)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.14, CGRectGetMinY(iconNormal) + 16.22) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.68, CGRectGetMinY(iconNormal) + 16.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.11, CGRectGetMinY(iconNormal) + 16.27)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.47, CGRectGetMinY(iconNormal) + 15.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.68, CGRectGetMinY(iconNormal) + 15.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.11, CGRectGetMinY(iconNormal) + 15.51)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.48, CGRectGetMinY(iconNormal) + 15.08)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.41, CGRectGetMinY(iconNormal) + 15.7)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.22, CGRectGetMinY(iconNormal) + 17.49)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.55, CGRectGetMinY(iconNormal) + 17.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.92, CGRectGetMinY(iconNormal) + 17.14) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.55, CGRectGetMinY(iconNormal) + 17.23)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.58, CGRectGetMinY(iconNormal) + 17.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.55, CGRectGetMinY(iconNormal) + 17.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.27, CGRectGetMinY(iconNormal) + 17.35)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.62, CGRectGetMinY(iconNormal) + 19.01) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.02, CGRectGetMinY(iconNormal) + 17.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.37, CGRectGetMinY(iconNormal) + 18.38)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.75, CGRectGetMinY(iconNormal) + 20.27)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.52, CGRectGetMinY(iconNormal) + 18.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.56, CGRectGetMinY(iconNormal) + 19.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.84, CGRectGetMinY(iconNormal) + 19.19)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.56, CGRectGetMinY(iconNormal) + 18.66) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.24, CGRectGetMinY(iconNormal) + 18.74) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.92, CGRectGetMinY(iconNormal) + 18.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.46, CGRectGetMinY(iconNormal) + 19.12) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.21, CGRectGetMinY(iconNormal) + 18.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.95, CGRectGetMinY(iconNormal) + 18.72)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.28, CGRectGetMinY(iconNormal) + 20.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.97, CGRectGetMinY(iconNormal) + 19.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.68, CGRectGetMinY(iconNormal) + 19.93)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.42, CGRectGetMinY(iconNormal) + 25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.28, CGRectGetMinY(iconNormal) + 20.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.79, CGRectGetMinY(iconNormal) + 24.42)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.5, CGRectGetMinY(iconNormal) + 25.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.47, CGRectGetMinY(iconNormal) + 25.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.5, CGRectGetMinY(iconNormal) + 25.05)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 4.29, CGRectGetMinY(iconNormal) + 33.79)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.23, CGRectGetMinY(iconNormal) + 27.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.33, CGRectGetMinY(iconNormal) + 27.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.23, CGRectGetMinY(iconNormal) + 27.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.27, CGRectGetMinY(iconNormal) + 27.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.64, CGRectGetMinY(iconNormal) + 22.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.86, CGRectGetMinY(iconNormal) + 26.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.64, CGRectGetMinY(iconNormal) + 22.54)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.59, CGRectGetMinY(iconNormal) + 21.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.05, CGRectGetMinY(iconNormal) + 21.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.37, CGRectGetMinY(iconNormal) + 21.31)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.62, CGRectGetMinY(iconNormal) + 20.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.92, CGRectGetMinY(iconNormal) + 20.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.23, CGRectGetMinY(iconNormal) + 20.57)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.97, CGRectGetMinY(iconNormal) + 20.3) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.02, CGRectGetMinY(iconNormal) + 20.26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.44, CGRectGetMinY(iconNormal) + 20.2)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.54, CGRectGetMinY(iconNormal) + 20.94) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.51, CGRectGetMinY(iconNormal) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.03, CGRectGetMinY(iconNormal) + 20.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.7, CGRectGetMinY(iconNormal) + 21.71) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.06, CGRectGetMinY(iconNormal) + 22.59)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.5, CGRectGetMinY(iconNormal) + 21.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.11, CGRectGetMinY(iconNormal) + 23.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.5, CGRectGetMinY(iconNormal) + 21.88)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.15, CGRectGetMinY(iconNormal) + 21.34) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.59, CGRectGetMinY(iconNormal) + 22.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.88, CGRectGetMinY(iconNormal) + 21.84)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.64, CGRectGetMinY(iconNormal) + 18.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.32, CGRectGetMinY(iconNormal) + 20.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.82, CGRectGetMinY(iconNormal) + 19.97)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.59, CGRectGetMinY(iconNormal) + 17.79) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.57, CGRectGetMinY(iconNormal) + 18.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.55, CGRectGetMinY(iconNormal) + 18.16)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.55, CGRectGetMinY(iconNormal) + 18.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.27, CGRectGetMinY(iconNormal) + 17.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.92, CGRectGetMinY(iconNormal) + 18.11)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.81, CGRectGetMinY(iconNormal) + 17.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.55, CGRectGetMinY(iconNormal) + 18.42) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.64, CGRectGetMinY(iconNormal) + 18.25)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.41, CGRectGetMinY(iconNormal) + 15.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.11, CGRectGetMinY(iconNormal) + 17.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.64, CGRectGetMinY(iconNormal) + 16.57)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.39, CGRectGetMinY(iconNormal) + 12.15)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.95, CGRectGetMinY(iconNormal) + 13.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.79, CGRectGetMinY(iconNormal) + 12.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.31, CGRectGetMinY(iconNormal) + 12.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.58, CGRectGetMinY(iconNormal) + 14.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.58, CGRectGetMinY(iconNormal) + 13.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.46, CGRectGetMinY(iconNormal) + 14.35)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.52, CGRectGetMinY(iconNormal) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.7, CGRectGetMinY(iconNormal) + 15.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.02, CGRectGetMinY(iconNormal) + 16.09)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.21, CGRectGetMinY(iconNormal) + 16.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.03, CGRectGetMinY(iconNormal) + 16.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.59, CGRectGetMinY(iconNormal) + 16.89)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.65, CGRectGetMinY(iconNormal) + 15.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.83, CGRectGetMinY(iconNormal) + 16.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.31, CGRectGetMinY(iconNormal) + 16.26)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.01, CGRectGetMinY(iconNormal) + 13.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19, CGRectGetMinY(iconNormal) + 15.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.12, CGRectGetMinY(iconNormal) + 14.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.08, CGRectGetMinY(iconNormal) + 12.48) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.91, CGRectGetMinY(iconNormal) + 13.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.59, CGRectGetMinY(iconNormal) + 12.84)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.39, CGRectGetMinY(iconNormal) + 12.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.56, CGRectGetMinY(iconNormal) + 12.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17, CGRectGetMinY(iconNormal) + 12.02)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.84, CGRectGetMinY(iconNormal) + 15.87)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.38, CGRectGetMinY(iconNormal) + 16.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.21, CGRectGetMinY(iconNormal) + 16.02) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.73, CGRectGetMinY(iconNormal) + 16.36)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.02, CGRectGetMinY(iconNormal) + 18.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.03, CGRectGetMinY(iconNormal) + 17.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.91, CGRectGetMinY(iconNormal) + 18.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.97, CGRectGetMinY(iconNormal) + 20.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.14, CGRectGetMinY(iconNormal) + 19.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.45, CGRectGetMinY(iconNormal) + 19.86)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.67, CGRectGetMinY(iconNormal) + 20.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.48, CGRectGetMinY(iconNormal) + 20.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.05, CGRectGetMinY(iconNormal) + 20.67)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.14, CGRectGetMinY(iconNormal) + 19.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.28, CGRectGetMinY(iconNormal) + 20.41) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.78, CGRectGetMinY(iconNormal) + 20.06)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.52, CGRectGetMinY(iconNormal) + 17.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.51, CGRectGetMinY(iconNormal) + 18.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.64, CGRectGetMinY(iconNormal) + 18.32)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.56, CGRectGetMinY(iconNormal) + 16.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.41, CGRectGetMinY(iconNormal) + 17.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.09, CGRectGetMinY(iconNormal) + 16.54)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.84, CGRectGetMinY(iconNormal) + 15.87) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.03, CGRectGetMinY(iconNormal) + 15.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.46, CGRectGetMinY(iconNormal) + 15.72)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.92, CGRectGetMinY(iconNormal) + 21.98)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.86, CGRectGetMinY(iconNormal) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.53, CGRectGetMinY(iconNormal) + 21.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.15, CGRectGetMinY(iconNormal) + 22.03)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.78, CGRectGetMinY(iconNormal) + 23.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.57, CGRectGetMinY(iconNormal) + 22.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.14, CGRectGetMinY(iconNormal) + 22.91)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.56, CGRectGetMinY(iconNormal) + 28.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.78, CGRectGetMinY(iconNormal) + 23.49) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.04, CGRectGetMinY(iconNormal) + 27.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.6, CGRectGetMinY(iconNormal) + 28.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.58, CGRectGetMinY(iconNormal) + 28.53) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.6, CGRectGetMinY(iconNormal) + 28.54)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.8, CGRectGetMinY(iconNormal) + 37.56)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.43, CGRectGetMinY(iconNormal) + 31.2)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.44, CGRectGetMinY(iconNormal) + 31.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.43, CGRectGetMinY(iconNormal) + 31.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.44, CGRectGetMinY(iconNormal) + 31.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.34, CGRectGetMinY(iconNormal) + 26.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.63, CGRectGetMinY(iconNormal) + 30.91) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.34, CGRectGetMinY(iconNormal) + 26.44)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.15, CGRectGetMinY(iconNormal) + 23.89) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.01, CGRectGetMinY(iconNormal) + 25.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.35, CGRectGetMinY(iconNormal) + 24.57)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.07, CGRectGetMinY(iconNormal) + 22.37) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.95, CGRectGetMinY(iconNormal) + 23.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.68, CGRectGetMinY(iconNormal) + 22.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.92, CGRectGetMinY(iconNormal) + 21.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.69, CGRectGetMinY(iconNormal) + 22.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.31, CGRectGetMinY(iconNormal) + 21.99)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 29.19)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.74, CGRectGetMinY(iconNormal) + 35.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.84, CGRectGetMinY(iconNormal) + 29.55) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.74, CGRectGetMinY(iconNormal) + 35.97)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 38.06) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.69, CGRectGetMinY(iconNormal) + 36.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.25, CGRectGetMinY(iconNormal) + 38.06)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.26, CGRectGetMinY(iconNormal) + 40.12)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.05, CGRectGetMinY(iconNormal) + 38.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 6.26, CGRectGetMinY(iconNormal) + 40.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.9, CGRectGetMinY(iconNormal) + 39.02)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.21, CGRectGetMinY(iconNormal) + 29.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.13, CGRectGetMinY(iconNormal) + 38.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.16, CGRectGetMinY(iconNormal) + 29.34)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.07, CGRectGetMinY(iconNormal) + 39.11)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.26, CGRectGetMinY(iconNormal) + 42.95)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.43, CGRectGetMinY(iconNormal) + 40.73)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.07, CGRectGetMinY(iconNormal) + 39.11)];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGContextDrawLinearGradient(context, gradient4,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds), CGRectGetMinY(bezier5Bounds)),
                                        CGPointMake(CGRectGetMidX(bezier5Bounds), CGRectGetMaxY(bezier5Bounds)),
                                        0);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Cleanup
        CGGradientRelease(gradient4);
        CGGradientRelease(gradient5);
        CGColorSpaceRelease(colorSpace);
    }


@end
