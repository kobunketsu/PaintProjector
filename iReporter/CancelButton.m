//
//  CancelButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CancelButton.h"

@implementation CancelButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 0.75];
    UIColor* iconColor = [UIColor colorWithRed: 0.688 green: 0.286 blue: 0.284 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.325 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
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
    NSString* textContent = @"Cancel";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(-3, -43, 131, 112)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, iconGlowGradient,
                                CGPointMake(61.05, 23.12), 4.84,
                                CGPointMake(60.76, 55.6), 47.32,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(35, 57, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(45.5, 27.63)];
    [mainPath addLineToPoint: CGPointMake(45.5, 16.5)];
    [mainPath addLineToPoint: CGPointMake(56.63, 16.5)];
    [mainPath addLineToPoint: CGPointMake(45.5, 27.63)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(83.5, 27.63)];
    [mainPath addLineToPoint: CGPointMake(72.37, 16.5)];
    [mainPath addLineToPoint: CGPointMake(83.5, 16.5)];
    [mainPath addLineToPoint: CGPointMake(83.5, 27.63)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(83.5, 54.5)];
    [mainPath addLineToPoint: CGPointMake(72.37, 54.5)];
    [mainPath addLineToPoint: CGPointMake(83.5, 43.37)];
    [mainPath addLineToPoint: CGPointMake(83.5, 54.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(56.63, 54.5)];
    [mainPath addLineToPoint: CGPointMake(45.5, 54.5)];
    [mainPath addLineToPoint: CGPointMake(45.5, 43.37)];
    [mainPath addLineToPoint: CGPointMake(56.63, 54.5)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(57.58, 25.25)];
    [mainPath addLineToPoint: CGPointMake(65, 32.67)];
    [mainPath addLineToPoint: CGPointMake(72.42, 25.25)];
    [mainPath addCurveToPoint: CGPointMake(73.84, 25.25) controlPoint1: CGPointMake(72.82, 24.86) controlPoint2: CGPointMake(73.45, 24.86)];
    [mainPath addLineToPoint: CGPointMake(75.25, 26.66)];
    [mainPath addCurveToPoint: CGPointMake(75.25, 28.08) controlPoint1: CGPointMake(75.64, 27.05) controlPoint2: CGPointMake(75.64, 27.68)];
    [mainPath addLineToPoint: CGPointMake(67.83, 35.5)];
    [mainPath addLineToPoint: CGPointMake(75.25, 42.92)];
    [mainPath addCurveToPoint: CGPointMake(75.25, 44.34) controlPoint1: CGPointMake(75.64, 43.32) controlPoint2: CGPointMake(75.64, 43.95)];
    [mainPath addLineToPoint: CGPointMake(73.84, 45.75)];
    [mainPath addCurveToPoint: CGPointMake(72.42, 45.75) controlPoint1: CGPointMake(73.45, 46.14) controlPoint2: CGPointMake(72.82, 46.14)];
    [mainPath addLineToPoint: CGPointMake(65, 38.33)];
    [mainPath addLineToPoint: CGPointMake(57.58, 45.75)];
    [mainPath addCurveToPoint: CGPointMake(56.16, 45.75) controlPoint1: CGPointMake(57.18, 46.14) controlPoint2: CGPointMake(56.55, 46.14)];
    [mainPath addLineToPoint: CGPointMake(54.75, 44.34)];
    [mainPath addCurveToPoint: CGPointMake(54.75, 42.92) controlPoint1: CGPointMake(54.36, 43.95) controlPoint2: CGPointMake(54.36, 43.32)];
    [mainPath addLineToPoint: CGPointMake(62.17, 35.5)];
    [mainPath addLineToPoint: CGPointMake(54.75, 28.08)];
    [mainPath addCurveToPoint: CGPointMake(54.75, 26.66) controlPoint1: CGPointMake(54.36, 27.68) controlPoint2: CGPointMake(54.36, 27.05)];
    [mainPath addLineToPoint: CGPointMake(56.16, 25.25)];
    [mainPath addCurveToPoint: CGPointMake(57.58, 25.25) controlPoint1: CGPointMake(56.55, 24.86) controlPoint2: CGPointMake(57.18, 24.86)];
    [mainPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [mainPath fill];
    
    ////// Main Inner Shadow
    CGRect mainBorderRect = CGRectInset([mainPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    mainBorderRect = CGRectOffset(mainBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    mainBorderRect = CGRectInset(CGRectUnion(mainBorderRect, [mainPath bounds]), -1, -1);
    
    UIBezierPath* mainNegativePath = [UIBezierPath bezierPathWithRect: mainBorderRect];
    [mainNegativePath appendPath: mainPath];
    mainNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(mainBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [mainPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(mainBorderRect.size.width), 0);
        [mainNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [mainNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Reflection Drawing
    UIBezierPath* reflectionPath = [UIBezierPath bezierPath];
    [reflectionPath moveToPoint: CGPointMake(45.5, 60.06)];
    [reflectionPath addLineToPoint: CGPointMake(45.5, 54.5)];
    [reflectionPath addLineToPoint: CGPointMake(56.63, 54.5)];
    [reflectionPath addLineToPoint: CGPointMake(45.5, 60.06)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(83.5, 60.06)];
    [reflectionPath addLineToPoint: CGPointMake(72.37, 54.5)];
    [reflectionPath addLineToPoint: CGPointMake(83.5, 54.5)];
    [reflectionPath addLineToPoint: CGPointMake(83.5, 60.06)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(83.5, 73.5)];
    [reflectionPath addLineToPoint: CGPointMake(72.37, 73.5)];
    [reflectionPath addLineToPoint: CGPointMake(83.5, 67.94)];
    [reflectionPath addLineToPoint: CGPointMake(83.5, 73.5)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(56.63, 73.5)];
    [reflectionPath addLineToPoint: CGPointMake(45.5, 73.5)];
    [reflectionPath addLineToPoint: CGPointMake(45.5, 67.94)];
    [reflectionPath addLineToPoint: CGPointMake(56.63, 73.5)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(57.58, 58.87)];
    [reflectionPath addLineToPoint: CGPointMake(65, 62.59)];
    [reflectionPath addLineToPoint: CGPointMake(72.42, 58.87)];
    [reflectionPath addCurveToPoint: CGPointMake(73.84, 58.87) controlPoint1: CGPointMake(72.82, 58.68) controlPoint2: CGPointMake(73.45, 58.68)];
    [reflectionPath addLineToPoint: CGPointMake(75.25, 59.58)];
    [reflectionPath addCurveToPoint: CGPointMake(75.25, 60.29) controlPoint1: CGPointMake(75.64, 59.78) controlPoint2: CGPointMake(75.64, 60.09)];
    [reflectionPath addLineToPoint: CGPointMake(67.83, 64)];
    [reflectionPath addLineToPoint: CGPointMake(75.25, 67.71)];
    [reflectionPath addCurveToPoint: CGPointMake(75.25, 68.42) controlPoint1: CGPointMake(75.64, 67.91) controlPoint2: CGPointMake(75.64, 68.22)];
    [reflectionPath addLineToPoint: CGPointMake(73.84, 69.13)];
    [reflectionPath addCurveToPoint: CGPointMake(72.42, 69.13) controlPoint1: CGPointMake(73.45, 69.32) controlPoint2: CGPointMake(72.82, 69.32)];
    [reflectionPath addLineToPoint: CGPointMake(65, 65.41)];
    [reflectionPath addLineToPoint: CGPointMake(57.58, 69.13)];
    [reflectionPath addCurveToPoint: CGPointMake(56.16, 69.13) controlPoint1: CGPointMake(57.18, 69.32) controlPoint2: CGPointMake(56.55, 69.32)];
    [reflectionPath addLineToPoint: CGPointMake(54.75, 68.42)];
    [reflectionPath addCurveToPoint: CGPointMake(54.75, 67.71) controlPoint1: CGPointMake(54.36, 68.22) controlPoint2: CGPointMake(54.36, 67.91)];
    [reflectionPath addLineToPoint: CGPointMake(62.17, 64)];
    [reflectionPath addLineToPoint: CGPointMake(54.75, 60.29)];
    [reflectionPath addCurveToPoint: CGPointMake(54.75, 59.58) controlPoint1: CGPointMake(54.36, 60.09) controlPoint2: CGPointMake(54.36, 59.78)];
    [reflectionPath addLineToPoint: CGPointMake(56.16, 58.87)];
    [reflectionPath addCurveToPoint: CGPointMake(57.58, 58.87) controlPoint1: CGPointMake(56.55, 58.68) controlPoint2: CGPointMake(57.18, 58.68)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64.5, 54.5), CGPointMake(64.5, 73.5), 0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
