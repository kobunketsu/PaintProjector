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
        if (self.isReversePaint) {
            [self drawReverseNormalSelectedWithFrame:rect];
        }
        else{
            [self drawNormalSelectedWithFrame:rect];
        }

//        [self setTitleColor:[UIColor colorWithRed:247/255.0 green:167/255.0 blue:211/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        if (self.isReversePaint) {
            [self drawReverseNormalWithFrame:rect];
        }
        else{
            [self drawNormalWithFrame:rect];
        }

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
            
            
            
            //// Bezier 2 Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, CGRectGetMinX(iconNormal) + 16.36, CGRectGetMinY(iconNormal) + 23.31);
            CGContextRotateCTM(context, 1.85 * M_PI / 180);
            
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(7.71, -22.15)];
            [bezier2Path addCurveToPoint: CGPointMake(9.23, -21.7) controlPoint1: CGPointMake(8.24, -22.05) controlPoint2: CGPointMake(8.74, -21.9)];
            [bezier2Path addCurveToPoint: CGPointMake(10.54, -21.08) controlPoint1: CGPointMake(9.72, -21.5) controlPoint2: CGPointMake(10.15, -21.3)];
            [bezier2Path addCurveToPoint: CGPointMake(11.67, -20.34) controlPoint1: CGPointMake(10.92, -20.86) controlPoint2: CGPointMake(11.3, -20.61)];
            [bezier2Path addCurveToPoint: CGPointMake(12.7, -19.45) controlPoint1: CGPointMake(12.04, -20.07) controlPoint2: CGPointMake(12.38, -19.77)];
            [bezier2Path addCurveToPoint: CGPointMake(13.56, -18.39) controlPoint1: CGPointMake(13.02, -19.12) controlPoint2: CGPointMake(13.31, -18.77)];
            [bezier2Path addCurveToPoint: CGPointMake(14.14, -17.17) controlPoint1: CGPointMake(13.81, -18.02) controlPoint2: CGPointMake(14, -17.61)];
            [bezier2Path addCurveToPoint: CGPointMake(14.38, -15.87) controlPoint1: CGPointMake(14.29, -16.73) controlPoint2: CGPointMake(14.37, -16.3)];
            [bezier2Path addCurveToPoint: CGPointMake(14.25, -14.62) controlPoint1: CGPointMake(14.38, -15.45) controlPoint2: CGPointMake(14.34, -15.03)];
            [bezier2Path addCurveToPoint: CGPointMake(13.86, -13.39) controlPoint1: CGPointMake(14.16, -14.2) controlPoint2: CGPointMake(14.03, -13.8)];
            [bezier2Path addCurveToPoint: CGPointMake(13.28, -12.2) controlPoint1: CGPointMake(13.69, -12.99) controlPoint2: CGPointMake(13.5, -12.59)];
            [bezier2Path addLineToPoint: CGPointMake(11.09, -8.16)];
            [bezier2Path addCurveToPoint: CGPointMake(3.38, -12.52) controlPoint1: CGPointMake(11.09, -8.16) controlPoint2: CGPointMake(6.74, -10.62)];
            [bezier2Path addCurveToPoint: CGPointMake(3.9, -11.85) controlPoint1: CGPointMake(3.59, -12.31) controlPoint2: CGPointMake(3.76, -12.08)];
            [bezier2Path addCurveToPoint: CGPointMake(3.85, -10) controlPoint1: CGPointMake(4.22, -11.26) controlPoint2: CGPointMake(4.2, -10.65)];
            [bezier2Path addLineToPoint: CGPointMake(1.71, -6.05)];
            [bezier2Path addCurveToPoint: CGPointMake(1.63, -5.73) controlPoint1: CGPointMake(1.64, -5.94) controlPoint2: CGPointMake(1.62, -5.83)];
            [bezier2Path addCurveToPoint: CGPointMake(1.87, -5.45) controlPoint1: CGPointMake(1.63, -5.63) controlPoint2: CGPointMake(1.72, -5.53)];
            [bezier2Path addCurveToPoint: CGPointMake(2.16, -6.11) controlPoint1: CGPointMake(1.95, -5.66) controlPoint2: CGPointMake(2.04, -5.88)];
            [bezier2Path addCurveToPoint: CGPointMake(3.55, -7.26) controlPoint1: CGPointMake(2.51, -6.75) controlPoint2: CGPointMake(2.97, -7.13)];
            [bezier2Path addCurveToPoint: CGPointMake(5.44, -7.05) controlPoint1: CGPointMake(4.13, -7.4) controlPoint2: CGPointMake(4.76, -7.32)];
            [bezier2Path addLineToPoint: CGPointMake(7.37, -6.26)];
            [bezier2Path addCurveToPoint: CGPointMake(8.07, -6.3) controlPoint1: CGPointMake(7.65, -6.15) controlPoint2: CGPointMake(7.88, -6.16)];
            [bezier2Path addCurveToPoint: CGPointMake(8.39, -6.7) controlPoint1: CGPointMake(8.18, -6.37) controlPoint2: CGPointMake(8.28, -6.51)];
            [bezier2Path addCurveToPoint: CGPointMake(8.44, -7.79) controlPoint1: CGPointMake(8.6, -7.1) controlPoint2: CGPointMake(8.62, -7.46)];
            [bezier2Path addCurveToPoint: CGPointMake(7.41, -8.73) controlPoint1: CGPointMake(8.26, -8.13) controlPoint2: CGPointMake(7.92, -8.44)];
            [bezier2Path addCurveToPoint: CGPointMake(5.89, -8.95) controlPoint1: CGPointMake(6.82, -9.06) controlPoint2: CGPointMake(6.31, -9.13)];
            [bezier2Path addCurveToPoint: CGPointMake(5.18, -8.3) controlPoint1: CGPointMake(5.65, -8.85) controlPoint2: CGPointMake(5.42, -8.63)];
            [bezier2Path addLineToPoint: CGPointMake(4.13, -8.89)];
            [bezier2Path addCurveToPoint: CGPointMake(5.9, -10.21) controlPoint1: CGPointMake(4.61, -9.73) controlPoint2: CGPointMake(5.2, -10.17)];
            [bezier2Path addCurveToPoint: CGPointMake(7.97, -9.69) controlPoint1: CGPointMake(6.59, -10.25) controlPoint2: CGPointMake(7.28, -10.08)];
            [bezier2Path addCurveToPoint: CGPointMake(9.64, -8.14) controlPoint1: CGPointMake(8.76, -9.24) controlPoint2: CGPointMake(9.32, -8.73)];
            [bezier2Path addCurveToPoint: CGPointMake(9.59, -6.28) controlPoint1: CGPointMake(9.96, -7.55) controlPoint2: CGPointMake(9.95, -6.93)];
            [bezier2Path addLineToPoint: CGPointMake(7.44, -2.31)];
            [bezier2Path addCurveToPoint: CGPointMake(7.35, -1.98) controlPoint1: CGPointMake(7.37, -2.19) controlPoint2: CGPointMake(7.34, -2.08)];
            [bezier2Path addCurveToPoint: CGPointMake(7.6, -1.69) controlPoint1: CGPointMake(7.36, -1.88) controlPoint2: CGPointMake(7.44, -1.78)];
            [bezier2Path addCurveToPoint: CGPointMake(7.77, -1.61) controlPoint1: CGPointMake(7.65, -1.67) controlPoint2: CGPointMake(7.71, -1.64)];
            [bezier2Path addCurveToPoint: CGPointMake(7.99, -1.52) controlPoint1: CGPointMake(7.84, -1.58) controlPoint2: CGPointMake(7.91, -1.55)];
            [bezier2Path addLineToPoint: CGPointMake(7.52, -0.67)];
            [bezier2Path addCurveToPoint: CGPointMake(7.07, -0.8) controlPoint1: CGPointMake(7.32, -0.71) controlPoint2: CGPointMake(7.17, -0.76)];
            [bezier2Path addCurveToPoint: CGPointMake(6.68, -0.99) controlPoint1: CGPointMake(6.97, -0.84) controlPoint2: CGPointMake(6.84, -0.9)];
            [bezier2Path addCurveToPoint: CGPointMake(6.06, -1.9) controlPoint1: CGPointMake(6.29, -1.21) controlPoint2: CGPointMake(6.09, -1.51)];
            [bezier2Path addCurveToPoint: CGPointMake(6.22, -2.64) controlPoint1: CGPointMake(6.05, -2.1) controlPoint2: CGPointMake(6.1, -2.35)];
            [bezier2Path addCurveToPoint: CGPointMake(4.79, -2.4) controlPoint1: CGPointMake(5.82, -2.46) controlPoint2: CGPointMake(5.34, -2.38)];
            [bezier2Path addCurveToPoint: CGPointMake(3.18, -2.87) controlPoint1: CGPointMake(4.23, -2.42) controlPoint2: CGPointMake(3.7, -2.57)];
            [bezier2Path addCurveToPoint: CGPointMake(1.96, -4.31) controlPoint1: CGPointMake(2.55, -3.22) controlPoint2: CGPointMake(2.15, -3.7)];
            [bezier2Path addCurveToPoint: CGPointMake(1.89, -4.6) controlPoint1: CGPointMake(1.93, -4.41) controlPoint2: CGPointMake(1.91, -4.51)];
            [bezier2Path addCurveToPoint: CGPointMake(1.8, -4.43) controlPoint1: CGPointMake(1.84, -4.5) controlPoint2: CGPointMake(1.8, -4.43)];
            [bezier2Path addCurveToPoint: CGPointMake(1.35, -4.56) controlPoint1: CGPointMake(1.59, -4.47) controlPoint2: CGPointMake(1.44, -4.52)];
            [bezier2Path addCurveToPoint: CGPointMake(0.96, -4.75) controlPoint1: CGPointMake(1.25, -4.6) controlPoint2: CGPointMake(1.12, -4.66)];
            [bezier2Path addCurveToPoint: CGPointMake(0.34, -5.65) controlPoint1: CGPointMake(0.57, -4.97) controlPoint2: CGPointMake(0.37, -5.27)];
            [bezier2Path addCurveToPoint: CGPointMake(0.49, -6.39) controlPoint1: CGPointMake(0.33, -5.85) controlPoint2: CGPointMake(0.38, -6.1)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.93, -6.15) controlPoint1: CGPointMake(0.1, -6.21) controlPoint2: CGPointMake(-0.38, -6.13)];
            [bezier2Path addCurveToPoint: CGPointMake(-2.53, -6.62) controlPoint1: CGPointMake(-1.48, -6.17) controlPoint2: CGPointMake(-2.02, -6.32)];
            [bezier2Path addCurveToPoint: CGPointMake(-3.74, -8.06) controlPoint1: CGPointMake(-3.15, -6.97) controlPoint2: CGPointMake(-3.56, -7.45)];
            [bezier2Path addCurveToPoint: CGPointMake(-3.55, -9.84) controlPoint1: CGPointMake(-3.93, -8.67) controlPoint2: CGPointMake(-3.86, -9.26)];
            [bezier2Path addCurveToPoint: CGPointMake(-2.16, -10.99) controlPoint1: CGPointMake(-3.2, -10.47) controlPoint2: CGPointMake(-2.74, -10.86)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.29, -10.77) controlPoint1: CGPointMake(-1.58, -11.12) controlPoint2: CGPointMake(-0.96, -11.04)];
            [bezier2Path addLineToPoint: CGPointMake(1.63, -9.98)];
            [bezier2Path addCurveToPoint: CGPointMake(2.33, -10.02) controlPoint1: CGPointMake(1.91, -9.87) controlPoint2: CGPointMake(2.14, -9.88)];
            [bezier2Path addCurveToPoint: CGPointMake(2.65, -10.42) controlPoint1: CGPointMake(2.44, -10.1) controlPoint2: CGPointMake(2.54, -10.23)];
            [bezier2Path addCurveToPoint: CGPointMake(2.7, -11.51) controlPoint1: CGPointMake(2.86, -10.81) controlPoint2: CGPointMake(2.88, -11.17)];
            [bezier2Path addCurveToPoint: CGPointMake(1.67, -12.43) controlPoint1: CGPointMake(2.53, -11.84) controlPoint2: CGPointMake(2.18, -12.15)];
            [bezier2Path addCurveToPoint: CGPointMake(0.16, -12.66) controlPoint1: CGPointMake(1.09, -12.77) controlPoint2: CGPointMake(0.58, -12.84)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.54, -12.01) controlPoint1: CGPointMake(-0.08, -12.56) controlPoint2: CGPointMake(-0.31, -12.34)];
            [bezier2Path addLineToPoint: CGPointMake(-1.59, -12.6)];
            [bezier2Path addCurveToPoint: CGPointMake(0.17, -13.91) controlPoint1: CGPointMake(-1.12, -13.44) controlPoint2: CGPointMake(-0.53, -13.87)];
            [bezier2Path addCurveToPoint: CGPointMake(1.05, -13.84) controlPoint1: CGPointMake(0.46, -13.93) controlPoint2: CGPointMake(0.76, -13.9)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.46, -14.7) controlPoint1: CGPointMake(0.14, -14.36) controlPoint2: CGPointMake(-0.46, -14.7)];
            [bezier2Path addLineToPoint: CGPointMake(1.73, -18.73)];
            [bezier2Path addCurveToPoint: CGPointMake(2.28, -19.68) controlPoint1: CGPointMake(1.91, -19.06) controlPoint2: CGPointMake(2.1, -19.38)];
            [bezier2Path addCurveToPoint: CGPointMake(2.9, -20.55) controlPoint1: CGPointMake(2.47, -19.99) controlPoint2: CGPointMake(2.68, -20.28)];
            [bezier2Path addCurveToPoint: CGPointMake(3.65, -21.3) controlPoint1: CGPointMake(3.13, -20.83) controlPoint2: CGPointMake(3.38, -21.07)];
            [bezier2Path addCurveToPoint: CGPointMake(4.58, -21.88) controlPoint1: CGPointMake(3.93, -21.52) controlPoint2: CGPointMake(4.24, -21.71)];
            [bezier2Path addCurveToPoint: CGPointMake(6.12, -22.27) controlPoint1: CGPointMake(5.07, -22.11) controlPoint2: CGPointMake(5.58, -22.25)];
            [bezier2Path addCurveToPoint: CGPointMake(7.71, -22.15) controlPoint1: CGPointMake(6.66, -22.29) controlPoint2: CGPointMake(7.19, -22.25)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(5.79, -20.98)];
            [bezier2Path addCurveToPoint: CGPointMake(4.43, -20.42) controlPoint1: CGPointMake(5.33, -20.9) controlPoint2: CGPointMake(4.87, -20.71)];
            [bezier2Path addCurveToPoint: CGPointMake(3.4, -19.37) controlPoint1: CGPointMake(4.06, -20.17) controlPoint2: CGPointMake(3.72, -19.82)];
            [bezier2Path addCurveToPoint: CGPointMake(2.53, -17.96) controlPoint1: CGPointMake(3.09, -18.92) controlPoint2: CGPointMake(2.8, -18.45)];
            [bezier2Path addCurveToPoint: CGPointMake(1.08, -15.29) controlPoint1: CGPointMake(2.25, -17.44) controlPoint2: CGPointMake(1.08, -15.29)];
            [bezier2Path addCurveToPoint: CGPointMake(8.51, -11.08) controlPoint1: CGPointMake(1.08, -15.29) controlPoint2: CGPointMake(5.64, -12.7)];
            [bezier2Path addCurveToPoint: CGPointMake(10.77, -9.8) controlPoint1: CGPointMake(9.81, -10.34) controlPoint2: CGPointMake(10.77, -9.8)];
            [bezier2Path addLineToPoint: CGPointMake(12.22, -12.48)];
            [bezier2Path addCurveToPoint: CGPointMake(12.9, -13.94) controlPoint1: CGPointMake(12.49, -12.98) controlPoint2: CGPointMake(12.72, -13.47)];
            [bezier2Path addCurveToPoint: CGPointMake(13.19, -15.55) controlPoint1: CGPointMake(13.08, -14.42) controlPoint2: CGPointMake(13.18, -14.95)];
            [bezier2Path addCurveToPoint: CGPointMake(12.93, -16.96) controlPoint1: CGPointMake(13.21, -16.05) controlPoint2: CGPointMake(13.13, -16.52)];
            [bezier2Path addCurveToPoint: CGPointMake(12.18, -18.17) controlPoint1: CGPointMake(12.74, -17.4) controlPoint2: CGPointMake(12.49, -17.8)];
            [bezier2Path addCurveToPoint: CGPointMake(11.12, -19.17) controlPoint1: CGPointMake(11.87, -18.54) controlPoint2: CGPointMake(11.51, -18.87)];
            [bezier2Path addCurveToPoint: CGPointMake(9.93, -19.96) controlPoint1: CGPointMake(10.72, -19.48) controlPoint2: CGPointMake(10.33, -19.74)];
            [bezier2Path addCurveToPoint: CGPointMake(8.61, -20.6) controlPoint1: CGPointMake(9.51, -20.2) controlPoint2: CGPointMake(9.07, -20.41)];
            [bezier2Path addCurveToPoint: CGPointMake(7.21, -20.99) controlPoint1: CGPointMake(8.15, -20.79) controlPoint2: CGPointMake(7.68, -20.92)];
            [bezier2Path addCurveToPoint: CGPointMake(5.79, -20.98) controlPoint1: CGPointMake(6.73, -21.06) controlPoint2: CGPointMake(6.26, -21.05)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(-1.32, -9.86)];
            [bezier2Path addCurveToPoint: CGPointMake(-2.36, -9.2) controlPoint1: CGPointMake(-1.77, -9.86) controlPoint2: CGPointMake(-2.12, -9.64)];
            [bezier2Path addCurveToPoint: CGPointMake(-2.43, -8.21) controlPoint1: CGPointMake(-2.54, -8.87) controlPoint2: CGPointMake(-2.56, -8.54)];
            [bezier2Path addCurveToPoint: CGPointMake(-1.74, -7.45) controlPoint1: CGPointMake(-2.29, -7.88) controlPoint2: CGPointMake(-2.06, -7.63)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.43, -7.08) controlPoint1: CGPointMake(-1.34, -7.22) controlPoint2: CGPointMake(-0.91, -7.1)];
            [bezier2Path addCurveToPoint: CGPointMake(1.33, -8.07) controlPoint1: CGPointMake(0.36, -7.03) controlPoint2: CGPointMake(0.95, -7.37)];
            [bezier2Path addLineToPoint: CGPointMake(1.84, -9)];
            [bezier2Path addCurveToPoint: CGPointMake(1.18, -9.08) controlPoint1: CGPointMake(1.65, -8.99) controlPoint2: CGPointMake(1.43, -9.01)];
            [bezier2Path addCurveToPoint: CGPointMake(0.48, -9.31) controlPoint1: CGPointMake(0.93, -9.14) controlPoint2: CGPointMake(0.7, -9.22)];
            [bezier2Path addLineToPoint: CGPointMake(-0.25, -9.61)];
            [bezier2Path addCurveToPoint: CGPointMake(-1.32, -9.86) controlPoint1: CGPointMake(-0.69, -9.78) controlPoint2: CGPointMake(-1.05, -9.87)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(-5.12, -7.4)];
            [bezier2Path addCurveToPoint: CGPointMake(-4.05, -6.8) controlPoint1: CGPointMake(-5.12, -7.41) controlPoint2: CGPointMake(-4.05, -6.8)];
            [bezier2Path addLineToPoint: CGPointMake(-5.02, -5)];
            [bezier2Path addCurveToPoint: CGPointMake(-2.96, -5.93) controlPoint1: CGPointMake(-4.27, -5.58) controlPoint2: CGPointMake(-3.59, -5.89)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.84, -5.32) controlPoint1: CGPointMake(-2.32, -5.96) controlPoint2: CGPointMake(-1.61, -5.76)];
            [bezier2Path addLineToPoint: CGPointMake(-1.49, -4.12)];
            [bezier2Path addCurveToPoint: CGPointMake(-3.16, -4.67) controlPoint1: CGPointMake(-2.09, -4.47) controlPoint2: CGPointMake(-2.65, -4.66)];
            [bezier2Path addCurveToPoint: CGPointMake(-4.56, -4.36) controlPoint1: CGPointMake(-3.67, -4.69) controlPoint2: CGPointMake(-4.13, -4.58)];
            [bezier2Path addCurveToPoint: CGPointMake(-5.73, -3.36) controlPoint1: CGPointMake(-4.99, -4.13) controlPoint2: CGPointMake(-5.38, -3.8)];
            [bezier2Path addCurveToPoint: CGPointMake(-6.7, -1.92) controlPoint1: CGPointMake(-6.09, -2.93) controlPoint2: CGPointMake(-6.41, -2.45)];
            [bezier2Path addCurveToPoint: CGPointMake(-9.18, 2.65) controlPoint1: CGPointMake(-6.7, -1.92) controlPoint2: CGPointMake(-8.77, 1.9)];
            [bezier2Path addCurveToPoint: CGPointMake(-11.48, 11.34) controlPoint1: CGPointMake(-9.07, 2.71) controlPoint2: CGPointMake(-11.48, 11.34)];
            [bezier2Path addLineToPoint: CGPointMake(-5.26, 4.87)];
            [bezier2Path addLineToPoint: CGPointMake(-0.17, -4.18)];
            [bezier2Path addLineToPoint: CGPointMake(0.81, -3.63)];
            [bezier2Path addLineToPoint: CGPointMake(0.09, -2.31)];
            [bezier2Path addCurveToPoint: CGPointMake(1.92, -2.76) controlPoint1: CGPointMake(0.73, -2.55) controlPoint2: CGPointMake(1.34, -2.7)];
            [bezier2Path addCurveToPoint: CGPointMake(3.67, -2.34) controlPoint1: CGPointMake(2.5, -2.81) controlPoint2: CGPointMake(3.08, -2.68)];
            [bezier2Path addCurveToPoint: CGPointMake(4.96, -1.22) controlPoint1: CGPointMake(4.19, -2.05) controlPoint2: CGPointMake(4.62, -1.67)];
            [bezier2Path addCurveToPoint: CGPointMake(5.51, 0.47) controlPoint1: CGPointMake(5.3, -0.76) controlPoint2: CGPointMake(5.48, -0.2)];
            [bezier2Path addCurveToPoint: CGPointMake(5.31, 1.73) controlPoint1: CGPointMake(5.53, 0.93) controlPoint2: CGPointMake(5.47, 1.35)];
            [bezier2Path addCurveToPoint: CGPointMake(4.75, 2.89) controlPoint1: CGPointMake(5.15, 2.12) controlPoint2: CGPointMake(4.97, 2.5)];
            [bezier2Path addCurveToPoint: CGPointMake(0.98, 8.88) controlPoint1: CGPointMake(4.75, 2.89) controlPoint2: CGPointMake(1.19, 9)];
            [bezier2Path addCurveToPoint: CGPointMake(-6.31, 16.33) controlPoint1: CGPointMake(-0.4, 10.36) controlPoint2: CGPointMake(-6.31, 16.33)];
            [bezier2Path addLineToPoint: CGPointMake(-7.38, 15.75)];
            [bezier2Path addLineToPoint: CGPointMake(-5.45, 6.86)];
            [bezier2Path addLineToPoint: CGPointMake(-11.83, 13.24)];
            [bezier2Path addLineToPoint: CGPointMake(-12.92, 12.61)];
            [bezier2Path addCurveToPoint: CGPointMake(-10.82, 3.53) controlPoint1: CGPointMake(-12.92, 12.61) controlPoint2: CGPointMake(-11.57, 6.53)];
            [bezier2Path addCurveToPoint: CGPointMake(-10.42, 1.94) controlPoint1: CGPointMake(-10.58, 2.58) controlPoint2: CGPointMake(-10.42, 1.94)];
            [bezier2Path addLineToPoint: CGPointMake(-5.12, -7.41)];
            [bezier2Path addLineToPoint: CGPointMake(-5.12, -7.4)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(4.4, -6.14)];
            [bezier2Path addCurveToPoint: CGPointMake(3.36, -5.47) controlPoint1: CGPointMake(3.94, -6.13) controlPoint2: CGPointMake(3.6, -5.91)];
            [bezier2Path addCurveToPoint: CGPointMake(3.28, -4.47) controlPoint1: CGPointMake(3.17, -5.13) controlPoint2: CGPointMake(3.15, -4.8)];
            [bezier2Path addCurveToPoint: CGPointMake(3.97, -3.7) controlPoint1: CGPointMake(3.42, -4.14) controlPoint2: CGPointMake(3.65, -3.89)];
            [bezier2Path addCurveToPoint: CGPointMake(5.28, -3.33) controlPoint1: CGPointMake(4.37, -3.48) controlPoint2: CGPointMake(4.81, -3.35)];
            [bezier2Path addCurveToPoint: CGPointMake(7.06, -4.34) controlPoint1: CGPointMake(6.08, -3.29) controlPoint2: CGPointMake(6.67, -3.62)];
            [bezier2Path addLineToPoint: CGPointMake(7.57, -5.27)];
            [bezier2Path addCurveToPoint: CGPointMake(6.91, -5.35) controlPoint1: CGPointMake(7.38, -5.26) controlPoint2: CGPointMake(7.16, -5.28)];
            [bezier2Path addCurveToPoint: CGPointMake(6.2, -5.58) controlPoint1: CGPointMake(6.66, -5.41) controlPoint2: CGPointMake(6.43, -5.49)];
            [bezier2Path addLineToPoint: CGPointMake(5.47, -5.88)];
            [bezier2Path addCurveToPoint: CGPointMake(4.4, -6.14) controlPoint1: CGPointMake(5.03, -6.05) controlPoint2: CGPointMake(4.67, -6.14)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(1.15, -1.73)];
            [bezier2Path addCurveToPoint: CGPointMake(0.32, -1.44) controlPoint1: CGPointMake(0.86, -1.67) controlPoint2: CGPointMake(0.58, -1.58)];
            [bezier2Path addCurveToPoint: CGPointMake(-0.39, -0.92) controlPoint1: CGPointMake(0.06, -1.3) controlPoint2: CGPointMake(-0.18, -1.13)];
            [bezier2Path addCurveToPoint: CGPointMake(-1.04, -0.15) controlPoint1: CGPointMake(-0.65, -0.67) controlPoint2: CGPointMake(-0.87, -0.41)];
            [bezier2Path addCurveToPoint: CGPointMake(-1.57, 0.75) controlPoint1: CGPointMake(-1.22, 0.12) controlPoint2: CGPointMake(-1.39, 0.42)];
            [bezier2Path addLineToPoint: CGPointMake(-3.91, 5.64)];
            [bezier2Path addLineToPoint: CGPointMake(-5.98, 14.46)];
            [bezier2Path addLineToPoint: CGPointMake(-0.1, 7.8)];
            [bezier2Path addLineToPoint: CGPointMake(3.76, 2.36)];
            [bezier2Path addCurveToPoint: CGPointMake(4.3, 0.15) controlPoint1: CGPointMake(4.23, 1.5) controlPoint2: CGPointMake(4.41, 0.77)];
            [bezier2Path addCurveToPoint: CGPointMake(2.97, -1.45) controlPoint1: CGPointMake(4.2, -0.47) controlPoint2: CGPointMake(3.75, -1)];
            [bezier2Path addCurveToPoint: CGPointMake(2.05, -1.76) controlPoint1: CGPointMake(2.67, -1.62) controlPoint2: CGPointMake(2.36, -1.72)];
            [bezier2Path addCurveToPoint: CGPointMake(1.15, -1.73) controlPoint1: CGPointMake(1.75, -1.8) controlPoint2: CGPointMake(1.45, -1.79)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(-12.47, 16.88)];
            [bezier2Path addLineToPoint: CGPointMake(-13.16, 20.86)];
            [bezier2Path addLineToPoint: CGPointMake(-10.15, 18.19)];
            [bezier2Path addLineToPoint: CGPointMake(-12.47, 16.88)];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(-12.94, 12.56)];
            [bezier2Path addCurveToPoint: CGPointMake(-11.85, 13.17) controlPoint1: CGPointMake(-12.95, 12.56) controlPoint2: CGPointMake(-11.85, 13.17)];
            [bezier2Path addLineToPoint: CGPointMake(-12.33, 15.86)];
            [bezier2Path addLineToPoint: CGPointMake(-9.41, 17.52)];
            [bezier2Path addLineToPoint: CGPointMake(-7.38, 15.7)];
            [bezier2Path addLineToPoint: CGPointMake(-6.36, 16.28)];
            [bezier2Path addLineToPoint: CGPointMake(-13.25, 22.28)];
            [bezier2Path addLineToPoint: CGPointMake(-14.38, 21.64)];
            [bezier2Path addLineToPoint: CGPointMake(-12.95, 12.56)];
            [bezier2Path addLineToPoint: CGPointMake(-12.94, 12.56)];
            [bezier2Path closePath];
            [UIColor.grayColor setFill];
            [bezier2Path fill];
            
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

- (void)drawReverseNormalSelectedWithFrame: (CGRect)frame;
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
    UIColor* colorG1 = [UIColor colorWithRed: 1 green: 0.844 blue: 0 alpha: 1];
    CGFloat colorG1RGBA[4];
    [colorG1 getRed: &colorG1RGBA[0] green: &colorG1RGBA[1] blue: &colorG1RGBA[2] alpha: &colorG1RGBA[3]];
    
    UIColor* colorG2 = [UIColor colorWithRed: (colorG1RGBA[0] * 0 + 1) green: (colorG1RGBA[1] * 0 + 1) blue: (colorG1RGBA[2] * 0 + 1) alpha: (colorG1RGBA[3] * 0 + 1)];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor.CGColor, (id)[UIColor colorWithRed: 0.755 green: 0.265 blue: 1 alpha: 1].CGColor, (id)gradientColor.CGColor], gradientLocations);
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconSpecularColor2.CGColor, (id)iconSpecularColor.CGColor], gradient2Locations);
    CGFloat gradient3Locations[] = {0, 1};
    CGGradientRef gradient3 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)colorG2.CGColor, (id)colorG1.CGColor], gradient3Locations);
    
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
        
        
        //// Bezier 2 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, CGRectGetMinX(iconNormal) + 16.36, CGRectGetMinY(iconNormal) + 23.31);
        CGContextRotateCTM(context, 1.85 * M_PI / 180);
        
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(7.71, -22.15)];
        [bezier2Path addCurveToPoint: CGPointMake(9.23, -21.7) controlPoint1: CGPointMake(8.24, -22.05) controlPoint2: CGPointMake(8.74, -21.9)];
        [bezier2Path addCurveToPoint: CGPointMake(10.54, -21.08) controlPoint1: CGPointMake(9.72, -21.5) controlPoint2: CGPointMake(10.15, -21.3)];
        [bezier2Path addCurveToPoint: CGPointMake(11.67, -20.34) controlPoint1: CGPointMake(10.92, -20.86) controlPoint2: CGPointMake(11.3, -20.61)];
        [bezier2Path addCurveToPoint: CGPointMake(12.7, -19.45) controlPoint1: CGPointMake(12.04, -20.07) controlPoint2: CGPointMake(12.38, -19.77)];
        [bezier2Path addCurveToPoint: CGPointMake(13.56, -18.39) controlPoint1: CGPointMake(13.02, -19.12) controlPoint2: CGPointMake(13.31, -18.77)];
        [bezier2Path addCurveToPoint: CGPointMake(14.14, -17.17) controlPoint1: CGPointMake(13.81, -18.02) controlPoint2: CGPointMake(14, -17.61)];
        [bezier2Path addCurveToPoint: CGPointMake(14.38, -15.87) controlPoint1: CGPointMake(14.29, -16.73) controlPoint2: CGPointMake(14.37, -16.3)];
        [bezier2Path addCurveToPoint: CGPointMake(14.25, -14.62) controlPoint1: CGPointMake(14.38, -15.45) controlPoint2: CGPointMake(14.34, -15.03)];
        [bezier2Path addCurveToPoint: CGPointMake(13.86, -13.39) controlPoint1: CGPointMake(14.16, -14.2) controlPoint2: CGPointMake(14.03, -13.8)];
        [bezier2Path addCurveToPoint: CGPointMake(13.28, -12.2) controlPoint1: CGPointMake(13.69, -12.99) controlPoint2: CGPointMake(13.5, -12.59)];
        [bezier2Path addLineToPoint: CGPointMake(11.09, -8.16)];
        [bezier2Path addCurveToPoint: CGPointMake(3.38, -12.52) controlPoint1: CGPointMake(11.09, -8.16) controlPoint2: CGPointMake(6.74, -10.62)];
        [bezier2Path addCurveToPoint: CGPointMake(3.9, -11.85) controlPoint1: CGPointMake(3.59, -12.31) controlPoint2: CGPointMake(3.76, -12.08)];
        [bezier2Path addCurveToPoint: CGPointMake(3.85, -10) controlPoint1: CGPointMake(4.22, -11.26) controlPoint2: CGPointMake(4.2, -10.65)];
        [bezier2Path addLineToPoint: CGPointMake(1.71, -6.05)];
        [bezier2Path addCurveToPoint: CGPointMake(1.63, -5.73) controlPoint1: CGPointMake(1.64, -5.94) controlPoint2: CGPointMake(1.62, -5.83)];
        [bezier2Path addCurveToPoint: CGPointMake(1.87, -5.45) controlPoint1: CGPointMake(1.63, -5.63) controlPoint2: CGPointMake(1.72, -5.53)];
        [bezier2Path addCurveToPoint: CGPointMake(2.16, -6.11) controlPoint1: CGPointMake(1.95, -5.66) controlPoint2: CGPointMake(2.04, -5.88)];
        [bezier2Path addCurveToPoint: CGPointMake(3.55, -7.26) controlPoint1: CGPointMake(2.51, -6.75) controlPoint2: CGPointMake(2.97, -7.13)];
        [bezier2Path addCurveToPoint: CGPointMake(5.44, -7.05) controlPoint1: CGPointMake(4.13, -7.4) controlPoint2: CGPointMake(4.76, -7.32)];
        [bezier2Path addLineToPoint: CGPointMake(7.37, -6.26)];
        [bezier2Path addCurveToPoint: CGPointMake(8.07, -6.3) controlPoint1: CGPointMake(7.65, -6.15) controlPoint2: CGPointMake(7.88, -6.16)];
        [bezier2Path addCurveToPoint: CGPointMake(8.39, -6.7) controlPoint1: CGPointMake(8.18, -6.37) controlPoint2: CGPointMake(8.28, -6.51)];
        [bezier2Path addCurveToPoint: CGPointMake(8.44, -7.79) controlPoint1: CGPointMake(8.6, -7.1) controlPoint2: CGPointMake(8.62, -7.46)];
        [bezier2Path addCurveToPoint: CGPointMake(7.41, -8.73) controlPoint1: CGPointMake(8.26, -8.13) controlPoint2: CGPointMake(7.92, -8.44)];
        [bezier2Path addCurveToPoint: CGPointMake(5.89, -8.95) controlPoint1: CGPointMake(6.82, -9.06) controlPoint2: CGPointMake(6.31, -9.13)];
        [bezier2Path addCurveToPoint: CGPointMake(5.18, -8.3) controlPoint1: CGPointMake(5.65, -8.85) controlPoint2: CGPointMake(5.42, -8.63)];
        [bezier2Path addLineToPoint: CGPointMake(4.13, -8.89)];
        [bezier2Path addCurveToPoint: CGPointMake(5.9, -10.21) controlPoint1: CGPointMake(4.61, -9.73) controlPoint2: CGPointMake(5.2, -10.17)];
        [bezier2Path addCurveToPoint: CGPointMake(7.97, -9.69) controlPoint1: CGPointMake(6.59, -10.25) controlPoint2: CGPointMake(7.28, -10.08)];
        [bezier2Path addCurveToPoint: CGPointMake(9.64, -8.14) controlPoint1: CGPointMake(8.76, -9.24) controlPoint2: CGPointMake(9.32, -8.73)];
        [bezier2Path addCurveToPoint: CGPointMake(9.59, -6.28) controlPoint1: CGPointMake(9.96, -7.55) controlPoint2: CGPointMake(9.95, -6.93)];
        [bezier2Path addLineToPoint: CGPointMake(7.44, -2.31)];
        [bezier2Path addCurveToPoint: CGPointMake(7.35, -1.98) controlPoint1: CGPointMake(7.37, -2.19) controlPoint2: CGPointMake(7.34, -2.08)];
        [bezier2Path addCurveToPoint: CGPointMake(7.6, -1.69) controlPoint1: CGPointMake(7.36, -1.88) controlPoint2: CGPointMake(7.44, -1.78)];
        [bezier2Path addCurveToPoint: CGPointMake(7.77, -1.61) controlPoint1: CGPointMake(7.65, -1.67) controlPoint2: CGPointMake(7.71, -1.64)];
        [bezier2Path addCurveToPoint: CGPointMake(7.99, -1.52) controlPoint1: CGPointMake(7.84, -1.58) controlPoint2: CGPointMake(7.91, -1.55)];
        [bezier2Path addLineToPoint: CGPointMake(7.52, -0.67)];
        [bezier2Path addCurveToPoint: CGPointMake(7.07, -0.8) controlPoint1: CGPointMake(7.32, -0.71) controlPoint2: CGPointMake(7.17, -0.76)];
        [bezier2Path addCurveToPoint: CGPointMake(6.68, -0.99) controlPoint1: CGPointMake(6.97, -0.84) controlPoint2: CGPointMake(6.84, -0.9)];
        [bezier2Path addCurveToPoint: CGPointMake(6.06, -1.9) controlPoint1: CGPointMake(6.29, -1.21) controlPoint2: CGPointMake(6.09, -1.51)];
        [bezier2Path addCurveToPoint: CGPointMake(6.22, -2.64) controlPoint1: CGPointMake(6.05, -2.1) controlPoint2: CGPointMake(6.1, -2.35)];
        [bezier2Path addCurveToPoint: CGPointMake(4.79, -2.4) controlPoint1: CGPointMake(5.82, -2.46) controlPoint2: CGPointMake(5.34, -2.38)];
        [bezier2Path addCurveToPoint: CGPointMake(3.18, -2.87) controlPoint1: CGPointMake(4.23, -2.42) controlPoint2: CGPointMake(3.7, -2.57)];
        [bezier2Path addCurveToPoint: CGPointMake(1.96, -4.31) controlPoint1: CGPointMake(2.55, -3.22) controlPoint2: CGPointMake(2.15, -3.7)];
        [bezier2Path addCurveToPoint: CGPointMake(1.89, -4.6) controlPoint1: CGPointMake(1.93, -4.41) controlPoint2: CGPointMake(1.91, -4.51)];
        [bezier2Path addCurveToPoint: CGPointMake(1.8, -4.43) controlPoint1: CGPointMake(1.84, -4.5) controlPoint2: CGPointMake(1.8, -4.43)];
        [bezier2Path addCurveToPoint: CGPointMake(1.35, -4.56) controlPoint1: CGPointMake(1.59, -4.47) controlPoint2: CGPointMake(1.44, -4.52)];
        [bezier2Path addCurveToPoint: CGPointMake(0.96, -4.75) controlPoint1: CGPointMake(1.25, -4.6) controlPoint2: CGPointMake(1.12, -4.66)];
        [bezier2Path addCurveToPoint: CGPointMake(0.34, -5.65) controlPoint1: CGPointMake(0.57, -4.97) controlPoint2: CGPointMake(0.37, -5.27)];
        [bezier2Path addCurveToPoint: CGPointMake(0.49, -6.39) controlPoint1: CGPointMake(0.33, -5.85) controlPoint2: CGPointMake(0.38, -6.1)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.93, -6.15) controlPoint1: CGPointMake(0.1, -6.21) controlPoint2: CGPointMake(-0.38, -6.13)];
        [bezier2Path addCurveToPoint: CGPointMake(-2.53, -6.62) controlPoint1: CGPointMake(-1.48, -6.17) controlPoint2: CGPointMake(-2.02, -6.32)];
        [bezier2Path addCurveToPoint: CGPointMake(-3.74, -8.06) controlPoint1: CGPointMake(-3.15, -6.97) controlPoint2: CGPointMake(-3.56, -7.45)];
        [bezier2Path addCurveToPoint: CGPointMake(-3.55, -9.84) controlPoint1: CGPointMake(-3.93, -8.67) controlPoint2: CGPointMake(-3.86, -9.26)];
        [bezier2Path addCurveToPoint: CGPointMake(-2.16, -10.99) controlPoint1: CGPointMake(-3.2, -10.47) controlPoint2: CGPointMake(-2.74, -10.86)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.29, -10.77) controlPoint1: CGPointMake(-1.58, -11.12) controlPoint2: CGPointMake(-0.96, -11.04)];
        [bezier2Path addLineToPoint: CGPointMake(1.63, -9.98)];
        [bezier2Path addCurveToPoint: CGPointMake(2.33, -10.02) controlPoint1: CGPointMake(1.91, -9.87) controlPoint2: CGPointMake(2.14, -9.88)];
        [bezier2Path addCurveToPoint: CGPointMake(2.65, -10.42) controlPoint1: CGPointMake(2.44, -10.1) controlPoint2: CGPointMake(2.54, -10.23)];
        [bezier2Path addCurveToPoint: CGPointMake(2.7, -11.51) controlPoint1: CGPointMake(2.86, -10.81) controlPoint2: CGPointMake(2.88, -11.17)];
        [bezier2Path addCurveToPoint: CGPointMake(1.67, -12.43) controlPoint1: CGPointMake(2.53, -11.84) controlPoint2: CGPointMake(2.18, -12.15)];
        [bezier2Path addCurveToPoint: CGPointMake(0.16, -12.66) controlPoint1: CGPointMake(1.09, -12.77) controlPoint2: CGPointMake(0.58, -12.84)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.54, -12.01) controlPoint1: CGPointMake(-0.08, -12.56) controlPoint2: CGPointMake(-0.31, -12.34)];
        [bezier2Path addLineToPoint: CGPointMake(-1.59, -12.6)];
        [bezier2Path addCurveToPoint: CGPointMake(0.17, -13.91) controlPoint1: CGPointMake(-1.12, -13.44) controlPoint2: CGPointMake(-0.53, -13.87)];
        [bezier2Path addCurveToPoint: CGPointMake(1.05, -13.84) controlPoint1: CGPointMake(0.46, -13.93) controlPoint2: CGPointMake(0.76, -13.9)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.46, -14.7) controlPoint1: CGPointMake(0.14, -14.36) controlPoint2: CGPointMake(-0.46, -14.7)];
        [bezier2Path addLineToPoint: CGPointMake(1.73, -18.73)];
        [bezier2Path addCurveToPoint: CGPointMake(2.28, -19.68) controlPoint1: CGPointMake(1.91, -19.06) controlPoint2: CGPointMake(2.1, -19.38)];
        [bezier2Path addCurveToPoint: CGPointMake(2.9, -20.55) controlPoint1: CGPointMake(2.47, -19.99) controlPoint2: CGPointMake(2.68, -20.28)];
        [bezier2Path addCurveToPoint: CGPointMake(3.65, -21.3) controlPoint1: CGPointMake(3.13, -20.83) controlPoint2: CGPointMake(3.38, -21.07)];
        [bezier2Path addCurveToPoint: CGPointMake(4.58, -21.88) controlPoint1: CGPointMake(3.93, -21.52) controlPoint2: CGPointMake(4.24, -21.71)];
        [bezier2Path addCurveToPoint: CGPointMake(6.12, -22.27) controlPoint1: CGPointMake(5.07, -22.11) controlPoint2: CGPointMake(5.58, -22.25)];
        [bezier2Path addCurveToPoint: CGPointMake(7.71, -22.15) controlPoint1: CGPointMake(6.66, -22.29) controlPoint2: CGPointMake(7.19, -22.25)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(5.79, -20.98)];
        [bezier2Path addCurveToPoint: CGPointMake(4.43, -20.42) controlPoint1: CGPointMake(5.33, -20.9) controlPoint2: CGPointMake(4.87, -20.71)];
        [bezier2Path addCurveToPoint: CGPointMake(3.4, -19.37) controlPoint1: CGPointMake(4.06, -20.17) controlPoint2: CGPointMake(3.72, -19.82)];
        [bezier2Path addCurveToPoint: CGPointMake(2.53, -17.96) controlPoint1: CGPointMake(3.09, -18.92) controlPoint2: CGPointMake(2.8, -18.45)];
        [bezier2Path addCurveToPoint: CGPointMake(1.08, -15.29) controlPoint1: CGPointMake(2.25, -17.44) controlPoint2: CGPointMake(1.08, -15.29)];
        [bezier2Path addCurveToPoint: CGPointMake(8.51, -11.08) controlPoint1: CGPointMake(1.08, -15.29) controlPoint2: CGPointMake(5.64, -12.7)];
        [bezier2Path addCurveToPoint: CGPointMake(10.77, -9.8) controlPoint1: CGPointMake(9.81, -10.34) controlPoint2: CGPointMake(10.77, -9.8)];
        [bezier2Path addLineToPoint: CGPointMake(12.22, -12.48)];
        [bezier2Path addCurveToPoint: CGPointMake(12.9, -13.94) controlPoint1: CGPointMake(12.49, -12.98) controlPoint2: CGPointMake(12.72, -13.47)];
        [bezier2Path addCurveToPoint: CGPointMake(13.19, -15.55) controlPoint1: CGPointMake(13.08, -14.42) controlPoint2: CGPointMake(13.18, -14.95)];
        [bezier2Path addCurveToPoint: CGPointMake(12.93, -16.96) controlPoint1: CGPointMake(13.21, -16.05) controlPoint2: CGPointMake(13.13, -16.52)];
        [bezier2Path addCurveToPoint: CGPointMake(12.18, -18.17) controlPoint1: CGPointMake(12.74, -17.4) controlPoint2: CGPointMake(12.49, -17.8)];
        [bezier2Path addCurveToPoint: CGPointMake(11.12, -19.17) controlPoint1: CGPointMake(11.87, -18.54) controlPoint2: CGPointMake(11.51, -18.87)];
        [bezier2Path addCurveToPoint: CGPointMake(9.93, -19.96) controlPoint1: CGPointMake(10.72, -19.48) controlPoint2: CGPointMake(10.33, -19.74)];
        [bezier2Path addCurveToPoint: CGPointMake(8.61, -20.6) controlPoint1: CGPointMake(9.51, -20.2) controlPoint2: CGPointMake(9.07, -20.41)];
        [bezier2Path addCurveToPoint: CGPointMake(7.21, -20.99) controlPoint1: CGPointMake(8.15, -20.79) controlPoint2: CGPointMake(7.68, -20.92)];
        [bezier2Path addCurveToPoint: CGPointMake(5.79, -20.98) controlPoint1: CGPointMake(6.73, -21.06) controlPoint2: CGPointMake(6.26, -21.05)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(-1.32, -9.86)];
        [bezier2Path addCurveToPoint: CGPointMake(-2.36, -9.2) controlPoint1: CGPointMake(-1.77, -9.86) controlPoint2: CGPointMake(-2.12, -9.64)];
        [bezier2Path addCurveToPoint: CGPointMake(-2.43, -8.21) controlPoint1: CGPointMake(-2.54, -8.87) controlPoint2: CGPointMake(-2.56, -8.54)];
        [bezier2Path addCurveToPoint: CGPointMake(-1.74, -7.45) controlPoint1: CGPointMake(-2.29, -7.88) controlPoint2: CGPointMake(-2.06, -7.63)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.43, -7.08) controlPoint1: CGPointMake(-1.34, -7.22) controlPoint2: CGPointMake(-0.91, -7.1)];
        [bezier2Path addCurveToPoint: CGPointMake(1.33, -8.07) controlPoint1: CGPointMake(0.36, -7.03) controlPoint2: CGPointMake(0.95, -7.37)];
        [bezier2Path addLineToPoint: CGPointMake(1.84, -9)];
        [bezier2Path addCurveToPoint: CGPointMake(1.18, -9.08) controlPoint1: CGPointMake(1.65, -8.99) controlPoint2: CGPointMake(1.43, -9.01)];
        [bezier2Path addCurveToPoint: CGPointMake(0.48, -9.31) controlPoint1: CGPointMake(0.93, -9.14) controlPoint2: CGPointMake(0.7, -9.22)];
        [bezier2Path addLineToPoint: CGPointMake(-0.25, -9.61)];
        [bezier2Path addCurveToPoint: CGPointMake(-1.32, -9.86) controlPoint1: CGPointMake(-0.69, -9.78) controlPoint2: CGPointMake(-1.05, -9.87)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(-5.12, -7.4)];
        [bezier2Path addCurveToPoint: CGPointMake(-4.05, -6.8) controlPoint1: CGPointMake(-5.12, -7.41) controlPoint2: CGPointMake(-4.05, -6.8)];
        [bezier2Path addLineToPoint: CGPointMake(-5.02, -5)];
        [bezier2Path addCurveToPoint: CGPointMake(-2.96, -5.93) controlPoint1: CGPointMake(-4.27, -5.58) controlPoint2: CGPointMake(-3.59, -5.89)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.84, -5.32) controlPoint1: CGPointMake(-2.32, -5.96) controlPoint2: CGPointMake(-1.61, -5.76)];
        [bezier2Path addLineToPoint: CGPointMake(-1.49, -4.12)];
        [bezier2Path addCurveToPoint: CGPointMake(-3.16, -4.67) controlPoint1: CGPointMake(-2.09, -4.47) controlPoint2: CGPointMake(-2.65, -4.66)];
        [bezier2Path addCurveToPoint: CGPointMake(-4.56, -4.36) controlPoint1: CGPointMake(-3.67, -4.69) controlPoint2: CGPointMake(-4.13, -4.58)];
        [bezier2Path addCurveToPoint: CGPointMake(-5.73, -3.36) controlPoint1: CGPointMake(-4.99, -4.13) controlPoint2: CGPointMake(-5.38, -3.8)];
        [bezier2Path addCurveToPoint: CGPointMake(-6.7, -1.92) controlPoint1: CGPointMake(-6.09, -2.93) controlPoint2: CGPointMake(-6.41, -2.45)];
        [bezier2Path addCurveToPoint: CGPointMake(-9.18, 2.65) controlPoint1: CGPointMake(-6.7, -1.92) controlPoint2: CGPointMake(-8.77, 1.9)];
        [bezier2Path addCurveToPoint: CGPointMake(-11.48, 11.34) controlPoint1: CGPointMake(-9.07, 2.71) controlPoint2: CGPointMake(-11.48, 11.34)];
        [bezier2Path addLineToPoint: CGPointMake(-5.26, 4.87)];
        [bezier2Path addLineToPoint: CGPointMake(-0.17, -4.18)];
        [bezier2Path addLineToPoint: CGPointMake(0.81, -3.63)];
        [bezier2Path addLineToPoint: CGPointMake(0.09, -2.31)];
        [bezier2Path addCurveToPoint: CGPointMake(1.92, -2.76) controlPoint1: CGPointMake(0.73, -2.55) controlPoint2: CGPointMake(1.34, -2.7)];
        [bezier2Path addCurveToPoint: CGPointMake(3.67, -2.34) controlPoint1: CGPointMake(2.5, -2.81) controlPoint2: CGPointMake(3.08, -2.68)];
        [bezier2Path addCurveToPoint: CGPointMake(4.96, -1.22) controlPoint1: CGPointMake(4.19, -2.05) controlPoint2: CGPointMake(4.62, -1.67)];
        [bezier2Path addCurveToPoint: CGPointMake(5.51, 0.47) controlPoint1: CGPointMake(5.3, -0.76) controlPoint2: CGPointMake(5.48, -0.2)];
        [bezier2Path addCurveToPoint: CGPointMake(5.31, 1.73) controlPoint1: CGPointMake(5.53, 0.93) controlPoint2: CGPointMake(5.47, 1.35)];
        [bezier2Path addCurveToPoint: CGPointMake(4.75, 2.89) controlPoint1: CGPointMake(5.15, 2.12) controlPoint2: CGPointMake(4.97, 2.5)];
        [bezier2Path addCurveToPoint: CGPointMake(0.98, 8.88) controlPoint1: CGPointMake(4.75, 2.89) controlPoint2: CGPointMake(1.19, 9)];
        [bezier2Path addCurveToPoint: CGPointMake(-6.31, 16.33) controlPoint1: CGPointMake(-0.4, 10.36) controlPoint2: CGPointMake(-6.31, 16.33)];
        [bezier2Path addLineToPoint: CGPointMake(-7.38, 15.75)];
        [bezier2Path addLineToPoint: CGPointMake(-5.45, 6.86)];
        [bezier2Path addLineToPoint: CGPointMake(-11.83, 13.24)];
        [bezier2Path addLineToPoint: CGPointMake(-12.92, 12.61)];
        [bezier2Path addCurveToPoint: CGPointMake(-10.82, 3.53) controlPoint1: CGPointMake(-12.92, 12.61) controlPoint2: CGPointMake(-11.57, 6.53)];
        [bezier2Path addCurveToPoint: CGPointMake(-10.42, 1.94) controlPoint1: CGPointMake(-10.58, 2.58) controlPoint2: CGPointMake(-10.42, 1.94)];
        [bezier2Path addLineToPoint: CGPointMake(-5.12, -7.41)];
        [bezier2Path addLineToPoint: CGPointMake(-5.12, -7.4)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(4.4, -6.14)];
        [bezier2Path addCurveToPoint: CGPointMake(3.36, -5.47) controlPoint1: CGPointMake(3.94, -6.13) controlPoint2: CGPointMake(3.6, -5.91)];
        [bezier2Path addCurveToPoint: CGPointMake(3.28, -4.47) controlPoint1: CGPointMake(3.17, -5.13) controlPoint2: CGPointMake(3.15, -4.8)];
        [bezier2Path addCurveToPoint: CGPointMake(3.97, -3.7) controlPoint1: CGPointMake(3.42, -4.14) controlPoint2: CGPointMake(3.65, -3.89)];
        [bezier2Path addCurveToPoint: CGPointMake(5.28, -3.33) controlPoint1: CGPointMake(4.37, -3.48) controlPoint2: CGPointMake(4.81, -3.35)];
        [bezier2Path addCurveToPoint: CGPointMake(7.06, -4.34) controlPoint1: CGPointMake(6.08, -3.29) controlPoint2: CGPointMake(6.67, -3.62)];
        [bezier2Path addLineToPoint: CGPointMake(7.57, -5.27)];
        [bezier2Path addCurveToPoint: CGPointMake(6.91, -5.35) controlPoint1: CGPointMake(7.38, -5.26) controlPoint2: CGPointMake(7.16, -5.28)];
        [bezier2Path addCurveToPoint: CGPointMake(6.2, -5.58) controlPoint1: CGPointMake(6.66, -5.41) controlPoint2: CGPointMake(6.43, -5.49)];
        [bezier2Path addLineToPoint: CGPointMake(5.47, -5.88)];
        [bezier2Path addCurveToPoint: CGPointMake(4.4, -6.14) controlPoint1: CGPointMake(5.03, -6.05) controlPoint2: CGPointMake(4.67, -6.14)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(1.15, -1.73)];
        [bezier2Path addCurveToPoint: CGPointMake(0.32, -1.44) controlPoint1: CGPointMake(0.86, -1.67) controlPoint2: CGPointMake(0.58, -1.58)];
        [bezier2Path addCurveToPoint: CGPointMake(-0.39, -0.92) controlPoint1: CGPointMake(0.06, -1.3) controlPoint2: CGPointMake(-0.18, -1.13)];
        [bezier2Path addCurveToPoint: CGPointMake(-1.04, -0.15) controlPoint1: CGPointMake(-0.65, -0.67) controlPoint2: CGPointMake(-0.87, -0.41)];
        [bezier2Path addCurveToPoint: CGPointMake(-1.57, 0.75) controlPoint1: CGPointMake(-1.22, 0.12) controlPoint2: CGPointMake(-1.39, 0.42)];
        [bezier2Path addLineToPoint: CGPointMake(-3.91, 5.64)];
        [bezier2Path addLineToPoint: CGPointMake(-5.98, 14.46)];
        [bezier2Path addLineToPoint: CGPointMake(-0.1, 7.8)];
        [bezier2Path addLineToPoint: CGPointMake(3.76, 2.36)];
        [bezier2Path addCurveToPoint: CGPointMake(4.3, 0.15) controlPoint1: CGPointMake(4.23, 1.5) controlPoint2: CGPointMake(4.41, 0.77)];
        [bezier2Path addCurveToPoint: CGPointMake(2.97, -1.45) controlPoint1: CGPointMake(4.2, -0.47) controlPoint2: CGPointMake(3.75, -1)];
        [bezier2Path addCurveToPoint: CGPointMake(2.05, -1.76) controlPoint1: CGPointMake(2.67, -1.62) controlPoint2: CGPointMake(2.36, -1.72)];
        [bezier2Path addCurveToPoint: CGPointMake(1.15, -1.73) controlPoint1: CGPointMake(1.75, -1.8) controlPoint2: CGPointMake(1.45, -1.79)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(-12.47, 16.88)];
        [bezier2Path addLineToPoint: CGPointMake(-13.16, 20.86)];
        [bezier2Path addLineToPoint: CGPointMake(-10.15, 18.19)];
        [bezier2Path addLineToPoint: CGPointMake(-12.47, 16.88)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(-12.94, 12.56)];
        [bezier2Path addCurveToPoint: CGPointMake(-11.85, 13.17) controlPoint1: CGPointMake(-12.95, 12.56) controlPoint2: CGPointMake(-11.85, 13.17)];
        [bezier2Path addLineToPoint: CGPointMake(-12.33, 15.86)];
        [bezier2Path addLineToPoint: CGPointMake(-9.41, 17.52)];
        [bezier2Path addLineToPoint: CGPointMake(-7.38, 15.7)];
        [bezier2Path addLineToPoint: CGPointMake(-6.36, 16.28)];
        [bezier2Path addLineToPoint: CGPointMake(-13.25, 22.28)];
        [bezier2Path addLineToPoint: CGPointMake(-14.38, 21.64)];
        [bezier2Path addLineToPoint: CGPointMake(-12.95, 12.56)];
        [bezier2Path addLineToPoint: CGPointMake(-12.94, 12.56)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
        CGContextDrawLinearGradient(context, gradient3,
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + 11.86 * CGRectGetWidth(bezier2Bounds) / 28.76, CGRectGetMidY(bezier2Bounds) + -22.1 * CGRectGetHeight(bezier2Bounds) / 44.55),
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + -14.64 * CGRectGetWidth(bezier2Bounds) / 28.76, CGRectGetMidY(bezier2Bounds) + 21.61 * CGRectGetHeight(bezier2Bounds) / 44.55),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
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
    CGGradientRelease(gradient3);
    CGColorSpaceRelease(colorSpace);
}


@end
