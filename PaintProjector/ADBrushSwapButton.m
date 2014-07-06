//
//  BrushSwapButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADBrushSwapButton.h"

@implementation ADBrushSwapButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconColor = [UIColor colorWithRed: 0.991 green: 0.744 blue: 0.281 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.5) green: (iconColorRGBA[1] * 0.5) blue: (iconColorRGBA[2] * 0.5) alpha: (iconColorRGBA[3] * 0.5 + 0.5)];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 0.863 blue: 0.526 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.911 green: 0.713 blue: 0.225 alpha: 1];
    UIColor* shadow4Color = [UIColor colorWithRed: 0.951 green: 0.951 blue: 0.951 alpha: 1];
    UIColor* shadow3Color = [UIColor colorWithRed: 0.347 green: 0.347 blue: 0.347 alpha: 0.542];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.27, 0.54, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor2.CGColor, (id)[UIColor colorWithRed: 0.955 green: 0.788 blue: 0.375 alpha: 1].CGColor, (id)gradientColor.CGColor, (id)gradientColor2.CGColor], gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow4 = shadow4Color;
    CGSize shadow4Offset = CGSizeMake(0.1, 1.1);
    CGFloat shadow4BlurRadius = 1;
    UIColor* shadow3 = shadow3Color;
    CGSize shadow3Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow3BlurRadius = 1;
    
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 27) * 0.53846 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 27) * 0.46154 + 0.5), 27, 27);
    
    
    //// Group
    {
        //// Oval 2 Drawing
        CGRect oval2Rect = CGRectMake(CGRectGetMinX(group), CGRectGetMinY(group), 27, 27);
        UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: oval2Rect];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, [shadow4 CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        [oval2Path addClip];
        CGFloat oval2ResizeRatio = MIN(CGRectGetWidth(oval2Rect) / 27, CGRectGetHeight(oval2Rect) / 27);
        CGContextDrawRadialGradient(context, gradient,
                                    CGPointMake(CGRectGetMidX(oval2Rect) + -0.23 * oval2ResizeRatio, CGRectGetMidY(oval2Rect) + 2.73 * oval2ResizeRatio), 14.61 * oval2ResizeRatio,
                                    CGPointMake(CGRectGetMidX(oval2Rect) + 0.15 * oval2ResizeRatio, CGRectGetMidY(oval2Rect) + 2.31 * oval2ResizeRatio), 11.42 * oval2ResizeRatio,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextEndTransparencyLayer(context);
        
        ////// Oval 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(oval2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([shadow3 CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [shadow3 colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, shadow3Offset, shadow3BlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [oval2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 13.5, CGRectGetMinY(group) + 7)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 17.14, CGRectGetMinY(group) + 12.63) controlPoint1: CGPointMake(CGRectGetMinX(group) + 13.5, CGRectGetMinY(group) + 7) controlPoint2: CGPointMake(CGRectGetMinX(group) + 16.27, CGRectGetMinY(group) + 11.04)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 18, CGRectGetMinY(group) + 12.63)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 17, CGRectGetMinY(group) + 24)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 10, CGRectGetMinY(group) + 24)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 9, CGRectGetMinY(group) + 12.63)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 9.86, CGRectGetMinY(group) + 12.63)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 13.5, CGRectGetMinY(group) + 7) controlPoint1: CGPointMake(CGRectGetMinX(group) + 10.73, CGRectGetMinY(group) + 11.04) controlPoint2: CGPointMake(CGRectGetMinX(group) + 13.5, CGRectGetMinY(group) + 7)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, [shadow4 CGColor]);
        [iconShadowColorColor setFill];
        [bezierPath fill];
        
        ////// Bezier Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(bezierPath.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([shadow3 CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [shadow3 colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, shadow3Offset, shadow3BlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [bezierPath fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}



@end
