//
//  NewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADNewButton.h"

@implementation ADNewButton

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
- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
        [self drawNormalSelectedWithFrame:rect];
//        [self setTitleColor:[UIColor colorWithRed:247/255.0 green:167/255.0 blue:211/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        [self drawNormalWithFrame:rect];
//        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
@end
