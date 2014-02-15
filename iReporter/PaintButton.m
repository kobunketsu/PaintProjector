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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.341 green: 0.341 blue: 0.341 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.2 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
    UIColor* iconGlowGradientColor = [iconColor colorWithAlphaComponent: 0.23];
    UIColor* iconColorA50 = [iconColor colorWithAlphaComponent: 0.5];
    UIColor* iconGlowGradientColor2 = [iconColor colorWithAlphaComponent: 0];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconReflectionColor = [UIColor colorWithRed: 0.849 green: 0.849 blue: 0.849 alpha: 0];
    
    //// Gradient Declarations
    NSArray* iconReflectionColors = [NSArray arrayWithObjects:
                                     (id)iconColorA50.CGColor,
                                     (id)iconReflectionColor.CGColor, nil];
    CGFloat iconReflectionLocations[] = {0, 1};
    CGGradientRef iconReflection = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconReflectionColors, iconReflectionLocations);
    NSArray* iconGlowGradientColors = [NSArray arrayWithObjects:
                                       (id)iconGlowGradientColor.CGColor,
                                       (id)iconGlowGradientColor2.CGColor, nil];
    CGFloat iconGlowGradientLocations[] = {0, 1};
    CGGradientRef iconGlowGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconGlowGradientColors, iconGlowGradientLocations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    UIColor* labelHightlight = labelHightlightColor;
    CGSize labelHightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat labelHightlightBlurRadius = 0;
    
    //// Abstracted Attributes
    NSString* textContent = @"Paint";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(-2, -43, 131, 112)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, iconGlowGradient,
                                CGPointMake(62.05, 23.12), 4.84,
                                CGPointMake(61.76, 55.6), 47.32,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Paint Reflection Drawing
    UIBezierPath* paintReflectionPath = [UIBezierPath bezierPath];
    [paintReflectionPath moveToPoint: CGPointMake(52.44, 64.99)];
    [paintReflectionPath addCurveToPoint: CGPointMake(52.43, 57.23) controlPoint1: CGPointMake(52.15, 64.76) controlPoint2: CGPointMake(52.43, 57.23)];
    [paintReflectionPath addLineToPoint: CGPointMake(68.11, 61.11)];
    [paintReflectionPath addLineToPoint: CGPointMake(52.43, 64.99)];
    [paintReflectionPath addLineToPoint: CGPointMake(52.44, 64.99)];
    [paintReflectionPath closePath];
    [paintReflectionPath moveToPoint: CGPointMake(50.7, 66.88)];
    [paintReflectionPath addLineToPoint: CGPointMake(72.43, 61.51)];
    [paintReflectionPath addCurveToPoint: CGPointMake(73.25, 61.11) controlPoint1: CGPointMake(72.43, 61.51) controlPoint2: CGPointMake(73.22, 61.3)];
    [paintReflectionPath addCurveToPoint: CGPointMake(72.55, 60.74) controlPoint1: CGPointMake(73.28, 60.92) controlPoint2: CGPointMake(72.55, 60.74)];
    [paintReflectionPath addLineToPoint: CGPointMake(50.65, 55.16)];
    [paintReflectionPath addCurveToPoint: CGPointMake(49.4, 55.09) controlPoint1: CGPointMake(50.65, 55.16) controlPoint2: CGPointMake(49.81, 54.98)];
    [paintReflectionPath addCurveToPoint: CGPointMake(49, 55.57) controlPoint1: CGPointMake(48.98, 55.19) controlPoint2: CGPointMake(49, 55.57)];
    [paintReflectionPath addLineToPoint: CGPointMake(49, 66.4)];
    [paintReflectionPath addCurveToPoint: CGPointMake(49.4, 66.97) controlPoint1: CGPointMake(49, 66.4) controlPoint2: CGPointMake(48.97, 66.85)];
    [paintReflectionPath addCurveToPoint: CGPointMake(50.7, 66.88) controlPoint1: CGPointMake(49.79, 67.08) controlPoint2: CGPointMake(50.58, 66.9)];
    [paintReflectionPath closePath];
    [paintReflectionPath moveToPoint: CGPointMake(80.6, 68.81)];
    [paintReflectionPath addLineToPoint: CGPointMake(62.47, 73.31)];
    [paintReflectionPath addLineToPoint: CGPointMake(55.4, 68.17)];
    [paintReflectionPath addLineToPoint: CGPointMake(73.53, 63.67)];
    [paintReflectionPath addLineToPoint: CGPointMake(80.6, 68.81)];
    [paintReflectionPath closePath];
    [paintReflectionPath moveToPoint: CGPointMake(74.61, 61.93)];
    [paintReflectionPath addLineToPoint: CGPointMake(51.3, 67.72)];
    [paintReflectionPath addLineToPoint: CGPointMake(61.39, 75.05)];
    [paintReflectionPath addLineToPoint: CGPointMake(84.7, 69.26)];
    [paintReflectionPath addLineToPoint: CGPointMake(74.61, 61.93)];
    [paintReflectionPath closePath];
    CGContextSaveGState(context);
    [paintReflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection,
                                CGPointMake(67.32, 55.43),
                                CGPointMake(66.85, 74.97),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 56, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Paint Drawing
    UIBezierPath* paintPath = [UIBezierPath bezierPath];
    [paintPath moveToPoint: CGPointMake(52.44, 31.67)];
    [paintPath addCurveToPoint: CGPointMake(52.43, 49.94) controlPoint1: CGPointMake(52.15, 32.22) controlPoint2: CGPointMake(52.43, 49.94)];
    [paintPath addLineToPoint: CGPointMake(68.11, 40.81)];
    [paintPath addLineToPoint: CGPointMake(52.43, 31.68)];
    [paintPath addLineToPoint: CGPointMake(52.44, 31.67)];
    [paintPath closePath];
    [paintPath moveToPoint: CGPointMake(50.7, 27.24)];
    [paintPath addLineToPoint: CGPointMake(72.43, 39.87)];
    [paintPath addCurveToPoint: CGPointMake(73.25, 40.81) controlPoint1: CGPointMake(72.43, 39.87) controlPoint2: CGPointMake(73.22, 40.36)];
    [paintPath addCurveToPoint: CGPointMake(72.55, 41.68) controlPoint1: CGPointMake(73.28, 41.26) controlPoint2: CGPointMake(72.55, 41.68)];
    [paintPath addLineToPoint: CGPointMake(50.65, 54.8)];
    [paintPath addCurveToPoint: CGPointMake(49.4, 54.98) controlPoint1: CGPointMake(50.65, 54.8) controlPoint2: CGPointMake(49.81, 55.23)];
    [paintPath addCurveToPoint: CGPointMake(49, 53.83) controlPoint1: CGPointMake(48.98, 54.74) controlPoint2: CGPointMake(49, 53.83)];
    [paintPath addLineToPoint: CGPointMake(49, 28.36)];
    [paintPath addCurveToPoint: CGPointMake(49.4, 27.03) controlPoint1: CGPointMake(49, 28.36) controlPoint2: CGPointMake(48.97, 27.31)];
    [paintPath addCurveToPoint: CGPointMake(50.7, 27.24) controlPoint1: CGPointMake(49.79, 26.77) controlPoint2: CGPointMake(50.58, 27.18)];
    [paintPath closePath];
    [paintPath moveToPoint: CGPointMake(80.6, 22.7)];
    [paintPath addLineToPoint: CGPointMake(62.47, 12.1)];
    [paintPath addLineToPoint: CGPointMake(55.4, 24.19)];
    [paintPath addLineToPoint: CGPointMake(73.53, 34.79)];
    [paintPath addLineToPoint: CGPointMake(80.6, 22.7)];
    [paintPath closePath];
    [paintPath moveToPoint: CGPointMake(74.61, 38.89)];
    [paintPath addLineToPoint: CGPointMake(51.3, 25.27)];
    [paintPath addLineToPoint: CGPointMake(61.39, 8)];
    [paintPath addLineToPoint: CGPointMake(84.7, 21.62)];
    [paintPath addLineToPoint: CGPointMake(74.61, 38.89)];
    [paintPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [paintPath fill];
    
    ////// Paint Inner Shadow
    CGRect paintBorderRect = CGRectInset([paintPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    paintBorderRect = CGRectOffset(paintBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    paintBorderRect = CGRectInset(CGRectUnion(paintBorderRect, [paintPath bounds]), -1, -1);
    
    UIBezierPath* paintNegativePath = [UIBezierPath bezierPathWithRect: paintBorderRect];
    [paintNegativePath appendPath: paintPath];
    paintNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(paintBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [paintPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(paintBorderRect.size.width), 0);
        [paintNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [paintNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    
  
}


@end
