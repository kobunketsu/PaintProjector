//
//  DoneButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "DoneButton.h"

@implementation DoneButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0.342 green: 0.705 blue: 0.291 alpha: 1];
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
    NSString* textContent = @"Done";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(1, 0, 128, 80)];
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
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(75.73, 27.17)];
    [mainPath addLineToPoint: CGPointMake(61.59, 41.31)];
    [mainPath addLineToPoint: CGPointMake(60.17, 42.73)];
    [mainPath addCurveToPoint: CGPointMake(58.76, 42.73) controlPoint1: CGPointMake(59.78, 43.12) controlPoint2: CGPointMake(59.15, 43.12)];
    [mainPath addLineToPoint: CGPointMake(50.27, 34.24)];
    [mainPath addCurveToPoint: CGPointMake(50.27, 32.83) controlPoint1: CGPointMake(49.88, 33.85) controlPoint2: CGPointMake(49.88, 33.22)];
    [mainPath addLineToPoint: CGPointMake(51.69, 31.41)];
    [mainPath addCurveToPoint: CGPointMake(53.1, 31.41) controlPoint1: CGPointMake(52.08, 31.02) controlPoint2: CGPointMake(52.71, 31.02)];
    [mainPath addLineToPoint: CGPointMake(59.46, 37.78)];
    [mainPath addLineToPoint: CGPointMake(72.9, 24.34)];
    [mainPath addCurveToPoint: CGPointMake(74.31, 24.34) controlPoint1: CGPointMake(73.29, 23.95) controlPoint2: CGPointMake(73.92, 23.95)];
    [mainPath addLineToPoint: CGPointMake(75.73, 25.76)];
    [mainPath addCurveToPoint: CGPointMake(75.73, 27.17) controlPoint1: CGPointMake(76.12, 26.15) controlPoint2: CGPointMake(76.12, 26.78)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(48.74, 39.96)];
    [mainPath addLineToPoint: CGPointMake(41.58, 32.79)];
    [mainPath addLineToPoint: CGPointMake(48.74, 25.63)];
    [mainPath addLineToPoint: CGPointMake(48.74, 39.96)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(69.96, 18.74)];
    [mainPath addLineToPoint: CGPointMake(55.63, 18.74)];
    [mainPath addLineToPoint: CGPointMake(62.79, 11.58)];
    [mainPath addLineToPoint: CGPointMake(69.96, 18.74)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(85.42, 34.21)];
    [mainPath addLineToPoint: CGPointMake(78.26, 41.37)];
    [mainPath addLineToPoint: CGPointMake(78.26, 27.04)];
    [mainPath addLineToPoint: CGPointMake(85.42, 34.21)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(71.37, 48.26)];
    [mainPath addLineToPoint: CGPointMake(64.21, 55.42)];
    [mainPath addLineToPoint: CGPointMake(57.04, 48.26)];
    [mainPath addLineToPoint: CGPointMake(71.37, 48.26)];
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
    [reflectionPath moveToPoint: CGPointMake(57.8, 75.26)];
    [reflectionPath addLineToPoint: CGPointMake(64.5, 78.63)];
    [reflectionPath addLineToPoint: CGPointMake(71.2, 75.26)];
    [reflectionPath addLineToPoint: CGPointMake(57.8, 75.26)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(80.67, 63.76)];
    [reflectionPath addLineToPoint: CGPointMake(80.67, 70.5)];
    [reflectionPath addLineToPoint: CGPointMake(87.37, 67.13)];
    [reflectionPath addLineToPoint: CGPointMake(80.67, 63.76)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(64.5, 55.63)];
    [reflectionPath addLineToPoint: CGPointMake(57.8, 59)];
    [reflectionPath addLineToPoint: CGPointMake(71.2, 59)];
    [reflectionPath addLineToPoint: CGPointMake(64.5, 55.63)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(48.33, 63.76)];
    [reflectionPath addLineToPoint: CGPointMake(41.63, 67.13)];
    [reflectionPath addLineToPoint: CGPointMake(48.33, 70.5)];
    [reflectionPath addLineToPoint: CGPointMake(48.33, 63.76)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(76.73, 70.31)];
    [reflectionPath addLineToPoint: CGPointMake(62.59, 63.2)];
    [reflectionPath addLineToPoint: CGPointMake(61.17, 62.49)];
    [reflectionPath addCurveToPoint: CGPointMake(59.76, 62.49) controlPoint1: CGPointMake(60.78, 62.29) controlPoint2: CGPointMake(60.15, 62.29)];
    [reflectionPath addLineToPoint: CGPointMake(51.27, 66.76)];
    [reflectionPath addCurveToPoint: CGPointMake(51.27, 67.47) controlPoint1: CGPointMake(50.88, 66.95) controlPoint2: CGPointMake(50.88, 67.27)];
    [reflectionPath addLineToPoint: CGPointMake(52.69, 68.18)];
    [reflectionPath addCurveToPoint: CGPointMake(54.1, 68.18) controlPoint1: CGPointMake(53.08, 68.38) controlPoint2: CGPointMake(53.71, 68.38)];
    [reflectionPath addLineToPoint: CGPointMake(60.46, 64.98)];
    [reflectionPath addLineToPoint: CGPointMake(73.9, 71.73)];
    [reflectionPath addCurveToPoint: CGPointMake(75.31, 71.73) controlPoint1: CGPointMake(74.29, 71.93) controlPoint2: CGPointMake(74.92, 71.93)];
    [reflectionPath addLineToPoint: CGPointMake(76.73, 71.02)];
    [reflectionPath addCurveToPoint: CGPointMake(76.73, 70.31) controlPoint1: CGPointMake(77.12, 70.83) controlPoint2: CGPointMake(77.12, 70.51)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64.5, 55.63), CGPointMake(64.5, 78.63), 0);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(35, 57, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    
   
}


@end
