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
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.37, CGRectGetMinY(iconNormal) + 3.13)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.8, CGRectGetMinY(iconNormal) + 4.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.03, CGRectGetMinY(iconNormal) + 3.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.8, CGRectGetMinY(iconNormal) + 4.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.41, CGRectGetMinY(iconNormal) + 6.03) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.8, CGRectGetMinY(iconNormal) + 4.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.01, CGRectGetMinY(iconNormal) + 5.1)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.31, CGRectGetMinY(iconNormal) + 6.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.41, CGRectGetMinY(iconNormal) + 6.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.37, CGRectGetMinY(iconNormal) + 6.09)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.62, CGRectGetMinY(iconNormal) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.93, CGRectGetMinY(iconNormal) + 6.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.62, CGRectGetMinY(iconNormal) + 8.8)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.55, CGRectGetMinY(iconNormal) + 13.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.62, CGRectGetMinY(iconNormal) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.85, CGRectGetMinY(iconNormal) + 11.69)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.74, CGRectGetMinY(iconNormal) + 15.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.81, CGRectGetMinY(iconNormal) + 14.4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.74, CGRectGetMinY(iconNormal) + 15.04)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 28.55, CGRectGetMinY(iconNormal) + 12.23)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.63, CGRectGetMinY(iconNormal) + 10.31) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.05, CGRectGetMinY(iconNormal) + 11.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.63, CGRectGetMinY(iconNormal) + 10.31)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.83, CGRectGetMinY(iconNormal) + 7.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.63, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.17, CGRectGetMinY(iconNormal) + 8.82)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.36, CGRectGetMinY(iconNormal) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.4, CGRectGetMinY(iconNormal) + 6.8) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 28.53, CGRectGetMinY(iconNormal) + 5.58)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.37, CGRectGetMinY(iconNormal) + 3.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.11, CGRectGetMinY(iconNormal) + 3.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.71, CGRectGetMinY(iconNormal) + 3.21)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.71, CGRectGetMinY(iconNormal) + 1.72)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.75, CGRectGetMinY(iconNormal) + 3.14) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.71, CGRectGetMinY(iconNormal) + 1.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.72, CGRectGetMinY(iconNormal) + 2.43)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.88, CGRectGetMinY(iconNormal) + 5.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 28.63, CGRectGetMinY(iconNormal) + 3.74) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.34, CGRectGetMinY(iconNormal) + 4.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.04, CGRectGetMinY(iconNormal) + 7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.42, CGRectGetMinY(iconNormal) + 5.72) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.81, CGRectGetMinY(iconNormal) + 6.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.31, CGRectGetMinY(iconNormal) + 8.72) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.28, CGRectGetMinY(iconNormal) + 7.63) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.31, CGRectGetMinY(iconNormal) + 8.16)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 30.99, CGRectGetMinY(iconNormal) + 10.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 31.32, CGRectGetMinY(iconNormal) + 9.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 31.21, CGRectGetMinY(iconNormal) + 9.89)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 29.97, CGRectGetMinY(iconNormal) + 12.55) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 30.76, CGRectGetMinY(iconNormal) + 11.16) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 30.42, CGRectGetMinY(iconNormal) + 11.84)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.06, CGRectGetMinY(iconNormal) + 17.06)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 27.03, CGRectGetMinY(iconNormal) + 17.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 27.06, CGRectGetMinY(iconNormal) + 17.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 27.05, CGRectGetMinY(iconNormal) + 17.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.88, CGRectGetMinY(iconNormal) + 23.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 26.93, CGRectGetMinY(iconNormal) + 17.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.88, CGRectGetMinY(iconNormal) + 23.49)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.07, CGRectGetMinY(iconNormal) + 24.78) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.76, CGRectGetMinY(iconNormal) + 23.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.07, CGRectGetMinY(iconNormal) + 24.78)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.51, CGRectGetMinY(iconNormal) + 32.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.55, CGRectGetMinY(iconNormal) + 27.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.51, CGRectGetMinY(iconNormal) + 32.13)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.85, CGRectGetMinY(iconNormal) + 31.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.51, CGRectGetMinY(iconNormal) + 32.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.18, CGRectGetMinY(iconNormal) + 31.92)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.35, CGRectGetMinY(iconNormal) + 32.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.11, CGRectGetMinY(iconNormal) + 31.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.35, CGRectGetMinY(iconNormal) + 32.04)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.88, CGRectGetMinY(iconNormal) + 39.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 8.85, CGRectGetMinY(iconNormal) + 39.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.88, CGRectGetMinY(iconNormal) + 39.7) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 8.87, CGRectGetMinY(iconNormal) + 39.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.61, CGRectGetMinY(iconNormal) + 44.62) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.48, CGRectGetMinY(iconNormal) + 39.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.61, CGRectGetMinY(iconNormal) + 44.62)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.6, CGRectGetMinY(iconNormal) + 43.93)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.25, CGRectGetMinY(iconNormal) + 35.16) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.6, CGRectGetMinY(iconNormal) + 43.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.16, CGRectGetMinY(iconNormal) + 35.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.23, CGRectGetMinY(iconNormal) + 35.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.24, CGRectGetMinY(iconNormal) + 35.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.23, CGRectGetMinY(iconNormal) + 35.15)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.37, CGRectGetMinY(iconNormal) + 31.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 2.23, CGRectGetMinY(iconNormal) + 35.15) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.73, CGRectGetMinY(iconNormal) + 33.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.87, CGRectGetMinY(iconNormal) + 24.26) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 4.37, CGRectGetMinY(iconNormal) + 28.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.68, CGRectGetMinY(iconNormal) + 24.82)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.8, CGRectGetMinY(iconNormal) + 24.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5.82, CGRectGetMinY(iconNormal) + 24.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 5.8, CGRectGetMinY(iconNormal) + 24.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.41, CGRectGetMinY(iconNormal) + 15.66) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5.8, CGRectGetMinY(iconNormal) + 24.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.15, CGRectGetMinY(iconNormal) + 16.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.39, CGRectGetMinY(iconNormal) + 15.65) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.4, CGRectGetMinY(iconNormal) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.39, CGRectGetMinY(iconNormal) + 15.65)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 9.18)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.6, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.56, CGRectGetMinY(iconNormal) + 9.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.6, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.61, CGRectGetMinY(iconNormal) + 9.22)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.8, CGRectGetMinY(iconNormal) + 10.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.41, CGRectGetMinY(iconNormal) + 10.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.8, CGRectGetMinY(iconNormal) + 10.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.41, CGRectGetMinY(iconNormal) + 10.7)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.58, CGRectGetMinY(iconNormal) + 11.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.21, CGRectGetMinY(iconNormal) + 10.57) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.87, CGRectGetMinY(iconNormal) + 10.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.14, CGRectGetMinY(iconNormal) + 13.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.43, CGRectGetMinY(iconNormal) + 11.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.95, CGRectGetMinY(iconNormal) + 12.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.2, CGRectGetMinY(iconNormal) + 14.82) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.22, CGRectGetMinY(iconNormal) + 14.07) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.23, CGRectGetMinY(iconNormal) + 14.45)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.24, CGRectGetMinY(iconNormal) + 14.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.51, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.86, CGRectGetMinY(iconNormal) + 14.51)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.88, CGRectGetMinY(iconNormal) + 14.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.18, CGRectGetMinY(iconNormal) + 14.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.06, CGRectGetMinY(iconNormal) + 14.37)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.6, CGRectGetMinY(iconNormal) + 9.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.49, CGRectGetMinY(iconNormal) + 12.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.6, CGRectGetMinY(iconNormal) + 9.21)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.39, CGRectGetMinY(iconNormal) + 4.9)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.9, CGRectGetMinY(iconNormal) + 2.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.98, CGRectGetMinY(iconNormal) + 3.98) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.48, CGRectGetMinY(iconNormal) + 3.32)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.84, CGRectGetMinY(iconNormal) + 1.76) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.49, CGRectGetMinY(iconNormal) + 2.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.13, CGRectGetMinY(iconNormal) + 1.96)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.71, CGRectGetMinY(iconNormal) + 1.72) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.75, CGRectGetMinY(iconNormal) + 1.49) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.71, CGRectGetMinY(iconNormal) + 1.48)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.17, CGRectGetMinY(iconNormal) + 15.08)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.38, CGRectGetMinY(iconNormal) + 16.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.81, CGRectGetMinY(iconNormal) + 15.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.21, CGRectGetMinY(iconNormal) + 16.12)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 25.84, CGRectGetMinY(iconNormal) + 16.22) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.38, CGRectGetMinY(iconNormal) + 16.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 25.8, CGRectGetMinY(iconNormal) + 16.27)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.17, CGRectGetMinY(iconNormal) + 15.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 25.37, CGRectGetMinY(iconNormal) + 15.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.8, CGRectGetMinY(iconNormal) + 15.51)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.17, CGRectGetMinY(iconNormal) + 15.08)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.1, CGRectGetMinY(iconNormal) + 15.7)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.61, CGRectGetMinY(iconNormal) + 16.48)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.81, CGRectGetMinY(iconNormal) + 15.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.61, CGRectGetMinY(iconNormal) + 16.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.16, CGRectGetMinY(iconNormal) + 16.17)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.61, CGRectGetMinY(iconNormal) + 16.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.15, CGRectGetMinY(iconNormal) + 16.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.61, CGRectGetMinY(iconNormal) + 16.52)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.91, CGRectGetMinY(iconNormal) + 17.49)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.24, CGRectGetMinY(iconNormal) + 17.23) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.62, CGRectGetMinY(iconNormal) + 17.14) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.24, CGRectGetMinY(iconNormal) + 17.23)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.27, CGRectGetMinY(iconNormal) + 17.58) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.24, CGRectGetMinY(iconNormal) + 17.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.96, CGRectGetMinY(iconNormal) + 17.35)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.31, CGRectGetMinY(iconNormal) + 19.01) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.71, CGRectGetMinY(iconNormal) + 17.9) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.06, CGRectGetMinY(iconNormal) + 18.38)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.44, CGRectGetMinY(iconNormal) + 20.27)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.22, CGRectGetMinY(iconNormal) + 18.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.26, CGRectGetMinY(iconNormal) + 19.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.54, CGRectGetMinY(iconNormal) + 19.19)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.25, CGRectGetMinY(iconNormal) + 18.66) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.93, CGRectGetMinY(iconNormal) + 18.74) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.61, CGRectGetMinY(iconNormal) + 18.64)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.15, CGRectGetMinY(iconNormal) + 19.12) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.9, CGRectGetMinY(iconNormal) + 18.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 11.64, CGRectGetMinY(iconNormal) + 18.72)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.97, CGRectGetMinY(iconNormal) + 20.51) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.67, CGRectGetMinY(iconNormal) + 19.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.37, CGRectGetMinY(iconNormal) + 19.93)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.11, CGRectGetMinY(iconNormal) + 25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 9.97, CGRectGetMinY(iconNormal) + 20.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.48, CGRectGetMinY(iconNormal) + 24.42)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.2, CGRectGetMinY(iconNormal) + 25.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.16, CGRectGetMinY(iconNormal) + 25.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.2, CGRectGetMinY(iconNormal) + 25.05)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.98, CGRectGetMinY(iconNormal) + 33.79)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.92, CGRectGetMinY(iconNormal) + 27.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 11.02, CGRectGetMinY(iconNormal) + 27.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.92, CGRectGetMinY(iconNormal) + 27.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.96, CGRectGetMinY(iconNormal) + 27.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.33, CGRectGetMinY(iconNormal) + 22.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 11.55, CGRectGetMinY(iconNormal) + 26.85) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.33, CGRectGetMinY(iconNormal) + 22.54)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.28, CGRectGetMinY(iconNormal) + 21.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.74, CGRectGetMinY(iconNormal) + 21.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.06, CGRectGetMinY(iconNormal) + 21.31)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.32, CGRectGetMinY(iconNormal) + 20.42) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.62, CGRectGetMinY(iconNormal) + 20.73) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.92, CGRectGetMinY(iconNormal) + 20.57)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.67, CGRectGetMinY(iconNormal) + 20.3) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.71, CGRectGetMinY(iconNormal) + 20.26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.13, CGRectGetMinY(iconNormal) + 20.2)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.23, CGRectGetMinY(iconNormal) + 20.94) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.2, CGRectGetMinY(iconNormal) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.72, CGRectGetMinY(iconNormal) + 20.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.8, CGRectGetMinY(iconNormal) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.39, CGRectGetMinY(iconNormal) + 21.71) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.76, CGRectGetMinY(iconNormal) + 22.59)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.61, CGRectGetMinY(iconNormal) + 22.62)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.68, CGRectGetMinY(iconNormal) + 22.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.61, CGRectGetMinY(iconNormal) + 22.62) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.63, CGRectGetMinY(iconNormal) + 22.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.19, CGRectGetMinY(iconNormal) + 21.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.7, CGRectGetMinY(iconNormal) + 22.63) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.19, CGRectGetMinY(iconNormal) + 21.88)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.84, CGRectGetMinY(iconNormal) + 21.34) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.28, CGRectGetMinY(iconNormal) + 22.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.57, CGRectGetMinY(iconNormal) + 21.84)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.33, CGRectGetMinY(iconNormal) + 18.93) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.01, CGRectGetMinY(iconNormal) + 20.77) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.51, CGRectGetMinY(iconNormal) + 19.97)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.28, CGRectGetMinY(iconNormal) + 17.79) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.26, CGRectGetMinY(iconNormal) + 18.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.24, CGRectGetMinY(iconNormal) + 18.16)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.24, CGRectGetMinY(iconNormal) + 18.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.96, CGRectGetMinY(iconNormal) + 17.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 17.62, CGRectGetMinY(iconNormal) + 18.11)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.5, CGRectGetMinY(iconNormal) + 17.69) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.24, CGRectGetMinY(iconNormal) + 18.42) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.33, CGRectGetMinY(iconNormal) + 18.25)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 13.1, CGRectGetMinY(iconNormal) + 15.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 13.8, CGRectGetMinY(iconNormal) + 17.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 13.33, CGRectGetMinY(iconNormal) + 16.57)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.08, CGRectGetMinY(iconNormal) + 12.15)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.64, CGRectGetMinY(iconNormal) + 13.2) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.48, CGRectGetMinY(iconNormal) + 12.29) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15, CGRectGetMinY(iconNormal) + 12.63)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.28, CGRectGetMinY(iconNormal) + 14.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.27, CGRectGetMinY(iconNormal) + 13.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.15, CGRectGetMinY(iconNormal) + 14.35)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.21, CGRectGetMinY(iconNormal) + 16.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 14.4, CGRectGetMinY(iconNormal) + 15.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 14.71, CGRectGetMinY(iconNormal) + 16.09)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.9, CGRectGetMinY(iconNormal) + 16.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.72, CGRectGetMinY(iconNormal) + 16.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.29, CGRectGetMinY(iconNormal) + 16.89)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.34, CGRectGetMinY(iconNormal) + 15.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.52, CGRectGetMinY(iconNormal) + 16.6) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18, CGRectGetMinY(iconNormal) + 16.26)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.7, CGRectGetMinY(iconNormal) + 13.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.69, CGRectGetMinY(iconNormal) + 15.19) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.81, CGRectGetMinY(iconNormal) + 14.61)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.77, CGRectGetMinY(iconNormal) + 12.48) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.6, CGRectGetMinY(iconNormal) + 13.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18.29, CGRectGetMinY(iconNormal) + 12.84)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.08, CGRectGetMinY(iconNormal) + 12.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.25, CGRectGetMinY(iconNormal) + 12.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.69, CGRectGetMinY(iconNormal) + 12.02)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.53, CGRectGetMinY(iconNormal) + 15.87)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.07, CGRectGetMinY(iconNormal) + 16.91) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 20.91, CGRectGetMinY(iconNormal) + 16.02) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.42, CGRectGetMinY(iconNormal) + 16.36)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.71, CGRectGetMinY(iconNormal) + 18.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.72, CGRectGetMinY(iconNormal) + 17.45) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.6, CGRectGetMinY(iconNormal) + 18.05)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 20.66, CGRectGetMinY(iconNormal) + 20.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.83, CGRectGetMinY(iconNormal) + 19.35) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.14, CGRectGetMinY(iconNormal) + 19.86)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.36, CGRectGetMinY(iconNormal) + 20.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 21.17, CGRectGetMinY(iconNormal) + 20.56) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.74, CGRectGetMinY(iconNormal) + 20.67)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.84, CGRectGetMinY(iconNormal) + 19.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.97, CGRectGetMinY(iconNormal) + 20.41) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.47, CGRectGetMinY(iconNormal) + 20.06)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 24.22, CGRectGetMinY(iconNormal) + 17.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.2, CGRectGetMinY(iconNormal) + 18.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 24.33, CGRectGetMinY(iconNormal) + 18.32)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 23.25, CGRectGetMinY(iconNormal) + 16.18) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.1, CGRectGetMinY(iconNormal) + 17.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.78, CGRectGetMinY(iconNormal) + 16.54)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 21.53, CGRectGetMinY(iconNormal) + 15.87) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 22.72, CGRectGetMinY(iconNormal) + 15.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.15, CGRectGetMinY(iconNormal) + 15.72)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.61, CGRectGetMinY(iconNormal) + 21.98)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.55, CGRectGetMinY(iconNormal) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.23, CGRectGetMinY(iconNormal) + 21.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.84, CGRectGetMinY(iconNormal) + 22.03)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 15.48, CGRectGetMinY(iconNormal) + 23.49) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.27, CGRectGetMinY(iconNormal) + 22.46) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 15.83, CGRectGetMinY(iconNormal) + 22.91)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.25, CGRectGetMinY(iconNormal) + 28.52) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 15.48, CGRectGetMinY(iconNormal) + 23.49) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.73, CGRectGetMinY(iconNormal) + 27.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 12.29, CGRectGetMinY(iconNormal) + 28.54) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 12.28, CGRectGetMinY(iconNormal) + 28.53) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.29, CGRectGetMinY(iconNormal) + 28.54)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.5, CGRectGetMinY(iconNormal) + 37.56)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.12, CGRectGetMinY(iconNormal) + 31.2)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 16.14, CGRectGetMinY(iconNormal) + 31.21) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.12, CGRectGetMinY(iconNormal) + 31.2) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 16.13, CGRectGetMinY(iconNormal) + 31.21)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.04, CGRectGetMinY(iconNormal) + 26.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 16.32, CGRectGetMinY(iconNormal) + 30.91) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.04, CGRectGetMinY(iconNormal) + 26.44)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 19.84, CGRectGetMinY(iconNormal) + 23.89) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.7, CGRectGetMinY(iconNormal) + 25.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 20.04, CGRectGetMinY(iconNormal) + 24.57)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 18.77, CGRectGetMinY(iconNormal) + 22.37) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 19.64, CGRectGetMinY(iconNormal) + 23.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 19.37, CGRectGetMinY(iconNormal) + 22.77)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 17.61, CGRectGetMinY(iconNormal) + 21.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 18.39, CGRectGetMinY(iconNormal) + 22.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 18, CGRectGetMinY(iconNormal) + 21.99)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.91, CGRectGetMinY(iconNormal) + 29.19)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 3.43, CGRectGetMinY(iconNormal) + 35.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 10.54, CGRectGetMinY(iconNormal) + 29.55) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 3.43, CGRectGetMinY(iconNormal) + 35.97)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.94, CGRectGetMinY(iconNormal) + 38.06) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 3.38, CGRectGetMinY(iconNormal) + 36.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 2.94, CGRectGetMinY(iconNormal) + 38.06)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.95, CGRectGetMinY(iconNormal) + 40.12)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 7.74, CGRectGetMinY(iconNormal) + 38.92) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 5.95, CGRectGetMinY(iconNormal) + 40.12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 7.59, CGRectGetMinY(iconNormal) + 39.02)];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 10.91, CGRectGetMinY(iconNormal) + 29.19) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 7.82, CGRectGetMinY(iconNormal) + 38.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 10.85, CGRectGetMinY(iconNormal) + 29.34)];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.77, CGRectGetMinY(iconNormal) + 39.11)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.96, CGRectGetMinY(iconNormal) + 42.95)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 5.13, CGRectGetMinY(iconNormal) + 40.73)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 2.77, CGRectGetMinY(iconNormal) + 39.11)];
            [bezier5Path closePath];
            [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1] setFill];
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
        
        //// IconNormal
        {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, CGRectGetMinX(frame) + 0.49473 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48487 * CGRectGetHeight(frame));
            CGContextRotateCTM(context, 1.23 * M_PI / 180);
            
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 5
            {
                CGContextSaveGState(context);
                CGContextSetAlpha(context, 0.38);
                CGContextBeginTransparencyLayer(context, NULL);
                
                
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(-10.99, 0.37)];
                [bezierPath addLineToPoint: CGPointMake(-16.27, 21.84)];
                [bezierPath addLineToPoint: CGPointMake(-14.25, 23.29)];
                [bezierPath addLineToPoint: CGPointMake(2.63, 9.27)];
                [bezierPath addLineToPoint: CGPointMake(12.63, -7.22)];
                [bezierPath addLineToPoint: CGPointMake(15.02, -11.33)];
                [bezierPath addCurveToPoint: CGPointMake(16.13, -16.69) controlPoint1: CGPointMake(15.02, -11.33) controlPoint2: CGPointMake(16.77, -14.08)];
                [bezierPath addCurveToPoint: CGPointMake(12.13, -22.02) controlPoint1: CGPointMake(15.49, -19.3) controlPoint2: CGPointMake(14.44, -20.46)];
                [bezierPath addCurveToPoint: CGPointMake(6.13, -23.11) controlPoint1: CGPointMake(9.82, -23.59) controlPoint2: CGPointMake(8.74, -23.37)];
                [bezierPath addCurveToPoint: CGPointMake(1.63, -19.94) controlPoint1: CGPointMake(3.51, -22.85) controlPoint2: CGPointMake(1.63, -19.94)];
                [bezierPath addLineToPoint: CGPointMake(-1.04, -15.94)];
                [bezierPath addLineToPoint: CGPointMake(-10.99, 0.37)];
                [bezierPath closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
                CGContextBeginTransparencyLayer(context, NULL);
                [bezierPath addClip];
                CGContextDrawRadialGradient(context, gradient,
                                            CGPointMake(-2.81, 6.02), 32.99,
                                            CGPointMake(-3.06, 5.01), 16.91,
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
                [bezier3Path moveToPoint: CGPointMake(-10.99, 0.37)];
                [bezier3Path addLineToPoint: CGPointMake(-16.27, 21.84)];
                [bezier3Path addLineToPoint: CGPointMake(-14.25, 23.29)];
                [bezier3Path addLineToPoint: CGPointMake(2.63, 9.27)];
                [bezier3Path addLineToPoint: CGPointMake(12.63, -7.22)];
                [bezier3Path addLineToPoint: CGPointMake(15.02, -11.33)];
                [bezier3Path addCurveToPoint: CGPointMake(16.13, -16.69) controlPoint1: CGPointMake(15.02, -11.33) controlPoint2: CGPointMake(16.77, -14.08)];
                [bezier3Path addCurveToPoint: CGPointMake(12.13, -22.02) controlPoint1: CGPointMake(15.49, -19.3) controlPoint2: CGPointMake(14.44, -20.46)];
                [bezier3Path addCurveToPoint: CGPointMake(6.13, -23.11) controlPoint1: CGPointMake(9.82, -23.59) controlPoint2: CGPointMake(8.74, -23.37)];
                [bezier3Path addCurveToPoint: CGPointMake(1.63, -19.94) controlPoint1: CGPointMake(3.51, -22.85) controlPoint2: CGPointMake(1.63, -19.94)];
                [bezier3Path addLineToPoint: CGPointMake(-1.04, -15.94)];
                [bezier3Path addLineToPoint: CGPointMake(-10.99, 0.37)];
                [bezier3Path closePath];
                CGContextSaveGState(context);
                [bezier3Path addClip];
                CGContextDrawRadialGradient(context, gradient2,
                                            CGPointMake(-1.44, 0.57), 27.06,
                                            CGPointMake(-0.54, -1.14), 16.91,
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextRestoreGState(context);
                
                
                CGContextEndTransparencyLayer(context);
                CGContextRestoreGState(context);
            }
            
            
            //// Bezier 4 Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, -0.2, -0.07);
            CGContextRotateCTM(context, 0.9 * M_PI / 180);
            
            UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
            [bezier4Path moveToPoint: CGPointMake(6.55, -20.34)];
            [bezier4Path addCurveToPoint: CGPointMake(4.02, -19.17) controlPoint1: CGPointMake(5.21, -20.38) controlPoint2: CGPointMake(4.02, -19.17)];
            [bezier4Path addCurveToPoint: CGPointMake(2.7, -17.3) controlPoint1: CGPointMake(4.02, -19.17) controlPoint2: CGPointMake(3.26, -18.25)];
            [bezier4Path addCurveToPoint: CGPointMake(2.6, -17.14) controlPoint1: CGPointMake(2.7, -17.3) controlPoint2: CGPointMake(2.66, -17.24)];
            [bezier4Path addCurveToPoint: CGPointMake(1.01, -14.47) controlPoint1: CGPointMake(2.24, -16.54) controlPoint2: CGPointMake(1.01, -14.47)];
            [bezier4Path addCurveToPoint: CGPointMake(8.11, -9.98) controlPoint1: CGPointMake(1.01, -14.47) controlPoint2: CGPointMake(5.35, -11.73)];
            [bezier4Path addCurveToPoint: CGPointMake(10.36, -8.57) controlPoint1: CGPointMake(9.41, -9.17) controlPoint2: CGPointMake(10.36, -8.57)];
            [bezier4Path addLineToPoint: CGPointMake(12.06, -11.45)];
            [bezier4Path addCurveToPoint: CGPointMake(13.07, -13.4) controlPoint1: CGPointMake(12.53, -12.24) controlPoint2: CGPointMake(13.07, -13.4)];
            [bezier4Path addCurveToPoint: CGPointMake(13.17, -16.02) controlPoint1: CGPointMake(13.07, -13.4) controlPoint2: CGPointMake(13.56, -14.91)];
            [bezier4Path addCurveToPoint: CGPointMake(10.59, -18.84) controlPoint1: CGPointMake(12.71, -16.9) controlPoint2: CGPointMake(11.79, -18.09)];
            [bezier4Path addCurveToPoint: CGPointMake(6.55, -20.34) controlPoint1: CGPointMake(9.31, -19.65) controlPoint2: CGPointMake(7.89, -20.31)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(7.83, -21.81)];
            [bezier4Path addCurveToPoint: CGPointMake(10.92, -20.5) controlPoint1: CGPointMake(8.84, -21.6) controlPoint2: CGPointMake(9.87, -21.17)];
            [bezier4Path addCurveToPoint: CGPointMake(13.12, -18.67) controlPoint1: CGPointMake(11.82, -19.93) controlPoint2: CGPointMake(12.55, -19.32)];
            [bezier4Path addCurveToPoint: CGPointMake(14.36, -16.76) controlPoint1: CGPointMake(13.69, -18.02) controlPoint2: CGPointMake(14.1, -17.39)];
            [bezier4Path addCurveToPoint: CGPointMake(14.69, -15.05) controlPoint1: CGPointMake(14.62, -16.14) controlPoint2: CGPointMake(14.66, -15.61)];
            [bezier4Path addCurveToPoint: CGPointMake(14.43, -13.24) controlPoint1: CGPointMake(14.72, -14.49) controlPoint2: CGPointMake(14.63, -13.88)];
            [bezier4Path addCurveToPoint: CGPointMake(13.49, -11.18) controlPoint1: CGPointMake(14.23, -12.59) controlPoint2: CGPointMake(13.92, -11.91)];
            [bezier4Path addLineToPoint: CGPointMake(10.75, -6.56)];
            [bezier4Path addCurveToPoint: CGPointMake(10.72, -6.58) controlPoint1: CGPointMake(10.75, -6.56) controlPoint2: CGPointMake(10.74, -6.57)];
            [bezier4Path addCurveToPoint: CGPointMake(6.81, 0.02) controlPoint1: CGPointMake(10.63, -6.42) controlPoint2: CGPointMake(6.81, 0.02)];
            [bezier4Path addCurveToPoint: CGPointMake(6.05, 1.34) controlPoint1: CGPointMake(6.7, 0.19) controlPoint2: CGPointMake(6.05, 1.34)];
            [bezier4Path addCurveToPoint: CGPointMake(1.77, 8.85) controlPoint1: CGPointMake(4.62, 3.84) controlPoint2: CGPointMake(1.77, 8.85)];
            [bezier4Path addCurveToPoint: CGPointMake(1.09, 8.45) controlPoint1: CGPointMake(1.77, 8.85) controlPoint2: CGPointMake(1.43, 8.66)];
            [bezier4Path addCurveToPoint: CGPointMake(1.6, 8.77) controlPoint1: CGPointMake(1.36, 8.62) controlPoint2: CGPointMake(1.6, 8.77)];
            [bezier4Path addLineToPoint: CGPointMake(-6.58, 16.74)];
            [bezier4Path addCurveToPoint: CGPointMake(-6.6, 16.73) controlPoint1: CGPointMake(-6.58, 16.74) controlPoint2: CGPointMake(-6.59, 16.74)];
            [bezier4Path addCurveToPoint: CGPointMake(-13.65, 21.93) controlPoint1: CGPointMake(-6.96, 16.99) controlPoint2: CGPointMake(-13.65, 21.93)];
            [bezier4Path addLineToPoint: CGPointMake(-14.69, 21.27)];
            [bezier4Path addCurveToPoint: CGPointMake(-13.37, 12.45) controlPoint1: CGPointMake(-14.69, 21.27) controlPoint2: CGPointMake(-13.44, 12.9)];
            [bezier4Path addCurveToPoint: CGPointMake(-13.39, 12.44) controlPoint1: CGPointMake(-13.38, 12.44) controlPoint2: CGPointMake(-13.39, 12.44)];
            [bezier4Path addCurveToPoint: CGPointMake(-12.38, 8.99) controlPoint1: CGPointMake(-13.39, 12.44) controlPoint2: CGPointMake(-12.94, 10.91)];
            [bezier4Path addCurveToPoint: CGPointMake(-10.16, 1.42) controlPoint1: CGPointMake(-11.49, 5.98) controlPoint2: CGPointMake(-10.32, 1.98)];
            [bezier4Path addCurveToPoint: CGPointMake(-10.23, 1.38) controlPoint1: CGPointMake(-10.2, 1.4) controlPoint2: CGPointMake(-10.23, 1.38)];
            [bezier4Path addCurveToPoint: CGPointMake(-4.94, -7.38) controlPoint1: CGPointMake(-10.23, 1.38) controlPoint2: CGPointMake(-5.18, -6.98)];
            [bezier4Path addCurveToPoint: CGPointMake(-4.96, -7.39) controlPoint1: CGPointMake(-4.95, -7.39) controlPoint2: CGPointMake(-4.96, -7.39)];
            [bezier4Path addLineToPoint: CGPointMake(-1.03, -14)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.99, -13.98) controlPoint1: CGPointMake(-1.03, -14) controlPoint2: CGPointMake(-0.99, -13.98)];
            [bezier4Path addLineToPoint: CGPointMake(-0.99, -13.97)];
            [bezier4Path addLineToPoint: CGPointMake(0.24, -13.18)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.13, -12.52) controlPoint1: CGPointMake(0.24, -13.18) controlPoint2: CGPointMake(-0.13, -12.52)];
            [bezier4Path addCurveToPoint: CGPointMake(2.06, -12.05) controlPoint1: CGPointMake(0.66, -12.68) controlPoint2: CGPointMake(1.34, -12.51)];
            [bezier4Path addCurveToPoint: CGPointMake(3.71, -9.69) controlPoint1: CGPointMake(2.93, -11.5) controlPoint2: CGPointMake(3.48, -10.71)];
            [bezier4Path addCurveToPoint: CGPointMake(3.81, -8.55) controlPoint1: CGPointMake(3.8, -9.3) controlPoint2: CGPointMake(3.83, -8.92)];
            [bezier4Path addCurveToPoint: CGPointMake(4.84, -8.98) controlPoint1: CGPointMake(4.12, -8.74) controlPoint2: CGPointMake(4.46, -8.88)];
            [bezier4Path addCurveToPoint: CGPointMake(7.49, -8.62) controlPoint1: CGPointMake(5.77, -9.22) controlPoint2: CGPointMake(6.66, -9.1)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.99, -13.98) controlPoint1: CGPointMake(4.01, -10.82) controlPoint2: CGPointMake(-0.99, -13.98)];
            [bezier4Path addLineToPoint: CGPointMake(1.63, -18.39)];
            [bezier4Path addCurveToPoint: CGPointMake(3.07, -20.43) controlPoint1: CGPointMake(2.19, -19.33) controlPoint2: CGPointMake(2.67, -20.01)];
            [bezier4Path addCurveToPoint: CGPointMake(4.96, -21.66) controlPoint1: CGPointMake(3.64, -21.02) controlPoint2: CGPointMake(4.27, -21.43)];
            [bezier4Path addCurveToPoint: CGPointMake(7.83, -21.81) controlPoint1: CGPointMake(5.87, -21.96) controlPoint2: CGPointMake(6.82, -22.01)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(7.79, -8.44)];
            [bezier4Path addCurveToPoint: CGPointMake(9.06, -6.63) controlPoint1: CGPointMake(8.45, -7.98) controlPoint2: CGPointMake(8.87, -7.43)];
            [bezier4Path addCurveToPoint: CGPointMake(9.5, -7.36) controlPoint1: CGPointMake(9.06, -6.63) controlPoint2: CGPointMake(9.47, -7.31)];
            [bezier4Path addCurveToPoint: CGPointMake(7.79, -8.44) controlPoint1: CGPointMake(9.02, -7.66) controlPoint2: CGPointMake(8.43, -8.03)];
            [bezier4Path addLineToPoint: CGPointMake(7.79, -8.44)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(-3.24, -7.4)];
            [bezier4Path addLineToPoint: CGPointMake(-3.71, -6.6)];
            [bezier4Path addCurveToPoint: CGPointMake(-4.53, -7.12) controlPoint1: CGPointMake(-3.71, -6.6) controlPoint2: CGPointMake(-4.17, -6.89)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.71, -6.56) controlPoint1: CGPointMake(-4.18, -6.88) controlPoint2: CGPointMake(-3.71, -6.56)];
            [bezier4Path addLineToPoint: CGPointMake(-4.37, -5.57)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.05, -5.88) controlPoint1: CGPointMake(-3.68, -5.95) controlPoint2: CGPointMake(-3.05, -5.88)];
            [bezier4Path addCurveToPoint: CGPointMake(-2.01, -5.57) controlPoint1: CGPointMake(-3.05, -5.88) controlPoint2: CGPointMake(-2.32, -5.78)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.92, -4.17) controlPoint1: CGPointMake(-1.56, -5.26) controlPoint2: CGPointMake(-1.19, -4.79)];
            [bezier4Path addLineToPoint: CGPointMake(-1.74, -2.89)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.01, -4.15) controlPoint1: CGPointMake(-1.94, -3.32) controlPoint2: CGPointMake(-2.68, -3.93)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.98, -4.42) controlPoint1: CGPointMake(-3.31, -4.35) controlPoint2: CGPointMake(-3.63, -4.44)];
            [bezier4Path addCurveToPoint: CGPointMake(-5.07, -3.91) controlPoint1: CGPointMake(-4.34, -4.39) controlPoint2: CGPointMake(-4.6, -4.33)];
            [bezier4Path addCurveToPoint: CGPointMake(-6.2, -2.48) controlPoint1: CGPointMake(-5.54, -3.5) controlPoint2: CGPointMake(-5.82, -3.07)];
            [bezier4Path addCurveToPoint: CGPointMake(-8.89, 2.11) controlPoint1: CGPointMake(-6.2, -2.48) controlPoint2: CGPointMake(-8.54, 1.52)];
            [bezier4Path addCurveToPoint: CGPointMake(-8.8, 2.17) controlPoint1: CGPointMake(-8.83, 2.15) controlPoint2: CGPointMake(-8.8, 2.17)];
            [bezier4Path addLineToPoint: CGPointMake(-11.69, 11.01)];
            [bezier4Path addLineToPoint: CGPointMake(-4.98, 4.58)];
            [bezier4Path addCurveToPoint: CGPointMake(-4.88, 4.64) controlPoint1: CGPointMake(-4.98, 4.58) controlPoint2: CGPointMake(-4.94, 4.6)];
            [bezier4Path addCurveToPoint: CGPointMake(-1.77, -0.62) controlPoint1: CGPointMake(-4.39, 3.8) controlPoint2: CGPointMake(-1.77, -0.62)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.87, -2.1) controlPoint1: CGPointMake(-1.38, -1.29) controlPoint2: CGPointMake(-1.08, -1.87)];
            [bezier4Path addCurveToPoint: CGPointMake(0.14, -2.81) controlPoint1: CGPointMake(-0.55, -2.47) controlPoint2: CGPointMake(-0.25, -2.64)];
            [bezier4Path addCurveToPoint: CGPointMake(1.48, -2.98) controlPoint1: CGPointMake(0.53, -2.98) controlPoint2: CGPointMake(0.94, -3.05)];
            [bezier4Path addCurveToPoint: CGPointMake(3.07, -2.39) controlPoint1: CGPointMake(2.02, -2.9) controlPoint2: CGPointMake(2.55, -2.7)];
            [bezier4Path addCurveToPoint: CGPointMake(4.75, 0.52) controlPoint1: CGPointMake(4.26, -1.67) controlPoint2: CGPointMake(4.66, -0.8)];
            [bezier4Path addLineToPoint: CGPointMake(5.51, -0.8)];
            [bezier4Path addCurveToPoint: CGPointMake(5.58, -0.76) controlPoint1: CGPointMake(5.51, -0.8) controlPoint2: CGPointMake(5.54, -0.79)];
            [bezier4Path addCurveToPoint: CGPointMake(6.06, -1.57) controlPoint1: CGPointMake(5.6, -0.79) controlPoint2: CGPointMake(6.06, -1.56)];
            [bezier4Path addCurveToPoint: CGPointMake(3.7, -2.01) controlPoint1: CGPointMake(5.16, -1.38) controlPoint2: CGPointMake(4.44, -1.55)];
            [bezier4Path addCurveToPoint: CGPointMake(2.09, -4.36) controlPoint1: CGPointMake(2.85, -2.55) controlPoint2: CGPointMake(2.31, -3.33)];
            [bezier4Path addCurveToPoint: CGPointMake(2.01, -5.5) controlPoint1: CGPointMake(2.01, -4.75) controlPoint2: CGPointMake(1.98, -5.13)];
            [bezier4Path addCurveToPoint: CGPointMake(0.98, -5.06) controlPoint1: CGPointMake(1.7, -5.31) controlPoint2: CGPointMake(1.35, -5.16)];
            [bezier4Path addCurveToPoint: CGPointMake(-1.78, -5.47) controlPoint1: CGPointMake(-0.01, -4.8) controlPoint2: CGPointMake(-0.93, -4.93)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.24, -7.4) controlPoint1: CGPointMake(-2.49, -5.92) controlPoint2: CGPointMake(-2.99, -6.54)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(-0.4, -11.06)];
            [bezier4Path addCurveToPoint: CGPointMake(-1.81, -9.96) controlPoint1: CGPointMake(-1, -10.9) controlPoint2: CGPointMake(-1.47, -10.53)];
            [bezier4Path addCurveToPoint: CGPointMake(-2.1, -8.16) controlPoint1: CGPointMake(-2.15, -9.38) controlPoint2: CGPointMake(-2.25, -8.79)];
            [bezier4Path addCurveToPoint: CGPointMake(-1.11, -6.74) controlPoint1: CGPointMake(-1.96, -7.54) controlPoint2: CGPointMake(-1.63, -7.07)];
            [bezier4Path addCurveToPoint: CGPointMake(0.59, -6.5) controlPoint1: CGPointMake(-0.59, -6.41) controlPoint2: CGPointMake(-0.02, -6.33)];
            [bezier4Path addCurveToPoint: CGPointMake(1.99, -7.57) controlPoint1: CGPointMake(1.2, -6.66) controlPoint2: CGPointMake(1.67, -7.02)];
            [bezier4Path addCurveToPoint: CGPointMake(2.28, -9.34) controlPoint1: CGPointMake(2.32, -8.11) controlPoint2: CGPointMake(2.41, -8.7)];
            [bezier4Path addCurveToPoint: CGPointMake(1.29, -10.79) controlPoint1: CGPointMake(2.16, -9.97) controlPoint2: CGPointMake(1.83, -10.46)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.4, -11.06) controlPoint1: CGPointMake(0.76, -11.13) controlPoint2: CGPointMake(0.2, -11.22)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(5.18, -7.55)];
            [bezier4Path addCurveToPoint: CGPointMake(3.76, -6.46) controlPoint1: CGPointMake(4.56, -7.38) controlPoint2: CGPointMake(4.09, -7.01)];
            [bezier4Path addCurveToPoint: CGPointMake(3.47, -4.65) controlPoint1: CGPointMake(3.43, -5.9) controlPoint2: CGPointMake(3.33, -5.3)];
            [bezier4Path addCurveToPoint: CGPointMake(4.48, -3.17) controlPoint1: CGPointMake(3.61, -4) controlPoint2: CGPointMake(3.94, -3.51)];
            [bezier4Path addCurveToPoint: CGPointMake(6.18, -2.9) controlPoint1: CGPointMake(5, -2.84) controlPoint2: CGPointMake(5.57, -2.75)];
            [bezier4Path addCurveToPoint: CGPointMake(7.62, -4.01) controlPoint1: CGPointMake(6.79, -3.06) controlPoint2: CGPointMake(7.27, -3.43)];
            [bezier4Path addCurveToPoint: CGPointMake(7.93, -5.84) controlPoint1: CGPointMake(7.97, -4.6) controlPoint2: CGPointMake(8.07, -5.21)];
            [bezier4Path addCurveToPoint: CGPointMake(6.91, -7.3) controlPoint1: CGPointMake(7.79, -6.47) controlPoint2: CGPointMake(7.45, -6.95)];
            [bezier4Path addCurveToPoint: CGPointMake(5.18, -7.55) controlPoint1: CGPointMake(6.37, -7.64) controlPoint2: CGPointMake(5.79, -7.72)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(1.5, -1.3)];
            [bezier4Path addCurveToPoint: CGPointMake(0.45, -0.99) controlPoint1: CGPointMake(1.11, -1.3) controlPoint2: CGPointMake(0.73, -1.21)];
            [bezier4Path addCurveToPoint: CGPointMake(-0.59, 0.3) controlPoint1: CGPointMake(0.17, -0.76) controlPoint2: CGPointMake(-0.25, -0.3)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.62, 5.44) controlPoint1: CGPointMake(-0.59, 0.3) controlPoint2: CGPointMake(-3.17, 4.67)];
            [bezier4Path addCurveToPoint: CGPointMake(-3.58, 5.46) controlPoint1: CGPointMake(-3.6, 5.45) controlPoint2: CGPointMake(-3.58, 5.46)];
            [bezier4Path addLineToPoint: CGPointMake(-6.04, 14.58)];
            [bezier4Path addLineToPoint: CGPointMake(0.35, 7.98)];
            [bezier4Path addCurveToPoint: CGPointMake(0.36, 7.99) controlPoint1: CGPointMake(0.35, 7.98) controlPoint2: CGPointMake(0.35, 7.98)];
            [bezier4Path addCurveToPoint: CGPointMake(3.08, 3.11) controlPoint1: CGPointMake(0.53, 7.68) controlPoint2: CGPointMake(3.08, 3.11)];
            [bezier4Path addCurveToPoint: CGPointMake(3.79, 0.53) controlPoint1: CGPointMake(3.71, 2.01) controlPoint2: CGPointMake(4.02, 1.2)];
            [bezier4Path addCurveToPoint: CGPointMake(2.66, -0.94) controlPoint1: CGPointMake(3.57, -0.13) controlPoint2: CGPointMake(3.28, -0.57)];
            [bezier4Path addCurveToPoint: CGPointMake(1.5, -1.3) controlPoint1: CGPointMake(2.27, -1.18) controlPoint2: CGPointMake(1.88, -1.3)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(-4.94, 6.16)];
            [bezier4Path addCurveToPoint: CGPointMake(-12.16, 13.22) controlPoint1: CGPointMake(-5.3, 6.54) controlPoint2: CGPointMake(-12.16, 13.22)];
            [bezier4Path addCurveToPoint: CGPointMake(-12.57, 15.32) controlPoint1: CGPointMake(-12.2, 13.42) controlPoint2: CGPointMake(-12.57, 15.32)];
            [bezier4Path addLineToPoint: CGPointMake(-9.48, 17.27)];
            [bezier4Path addCurveToPoint: CGPointMake(-7.74, 16) controlPoint1: CGPointMake(-9.48, 17.27) controlPoint2: CGPointMake(-7.89, 16.11)];
            [bezier4Path addCurveToPoint: CGPointMake(-4.94, 6.16) controlPoint1: CGPointMake(-7.67, 15.75) controlPoint2: CGPointMake(-4.99, 6.31)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(-12.71, 16.38)];
            [bezier4Path addLineToPoint: CGPointMake(-13.37, 20.24)];
            [bezier4Path addLineToPoint: CGPointMake(-10.29, 17.91)];
            [bezier4Path addLineToPoint: CGPointMake(-12.71, 16.38)];
            [bezier4Path closePath];
            CGContextSaveGState(context);
            [bezier4Path addClip];
            CGContextDrawLinearGradient(context, gradient3,
                                        CGPointMake(11.86, -22.1),
                                        CGPointMake(-14.64, 21.61),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
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
