//
//  FreeTransformButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "FreeTransformButton.h"

@implementation FreeTransformButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.879 green: 0.874 blue: 1 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.569 green: 0.561 blue: 0.577 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.244 alpha: iconColorHSBA[3]];
    UIColor* icongGlowFadeColor = [iconColor colorWithAlphaComponent: 0];
    UIColor* iconGlowGradientColor = [iconColor colorWithAlphaComponent: 0.23];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.05];
    
    //// Gradient Declarations
    NSArray* iconReflectionColors = [NSArray arrayWithObjects:
                                     (id)iconColor.CGColor,
                                     (id)gradientColor.CGColor, nil];
    CGFloat iconReflectionLocations[] = {0, 1};
    CGGradientRef iconReflection = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconReflectionColors, iconReflectionLocations);
    NSArray* iconGlowGradientColors = [NSArray arrayWithObjects:
                                       (id)iconGlowGradientColor.CGColor,
                                       (id)icongGlowFadeColor.CGColor, nil];
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
    NSString* textContent = @"Free";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -43, 131, 112)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, iconGlowGradient,
                                CGPointMake(64.05, 23.12), 4.84,
                                CGPointMake(63.76, 55.6), 47.32,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(74.72, 13.09)];
    [mainPath addCurveToPoint: CGPointMake(74.72, 23.16) controlPoint1: CGPointMake(77.36, 15.87) controlPoint2: CGPointMake(77.36, 20.38)];
    [mainPath addCurveToPoint: CGPointMake(74.45, 23.43) controlPoint1: CGPointMake(74.64, 23.26) controlPoint2: CGPointMake(74.54, 23.35)];
    [mainPath addLineToPoint: CGPointMake(74.45, 21.69)];
    [mainPath addCurveToPoint: CGPointMake(69.94, 16.94) controlPoint1: CGPointMake(74.45, 19.06) controlPoint2: CGPointMake(72.43, 16.94)];
    [mainPath addCurveToPoint: CGPointMake(65.44, 21.69) controlPoint1: CGPointMake(67.46, 16.94) controlPoint2: CGPointMake(65.44, 19.06)];
    [mainPath addLineToPoint: CGPointMake(65.44, 23.43)];
    [mainPath addCurveToPoint: CGPointMake(65.16, 23.16) controlPoint1: CGPointMake(65.34, 23.35) controlPoint2: CGPointMake(65.25, 23.26)];
    [mainPath addCurveToPoint: CGPointMake(65.16, 13.09) controlPoint1: CGPointMake(62.52, 20.38) controlPoint2: CGPointMake(62.52, 15.87)];
    [mainPath addCurveToPoint: CGPointMake(74.72, 13.09) controlPoint1: CGPointMake(67.8, 10.3) controlPoint2: CGPointMake(72.08, 10.3)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(72.48, 22.17)];
    [mainPath addLineToPoint: CGPointMake(72.48, 36.68)];
    [mainPath addLineToPoint: CGPointMake(82.62, 36.68)];
    [mainPath addCurveToPoint: CGPointMake(86, 40.11) controlPoint1: CGPointMake(84.49, 36.68) controlPoint2: CGPointMake(86, 38.21)];
    [mainPath addLineToPoint: CGPointMake(86, 49.56)];
    [mainPath addCurveToPoint: CGPointMake(82.62, 53) controlPoint1: CGPointMake(86, 51.46) controlPoint2: CGPointMake(84.49, 53)];
    [mainPath addLineToPoint: CGPointMake(68.25, 53)];
    [mainPath addCurveToPoint: CGPointMake(62.26, 47.33) controlPoint1: CGPointMake(66.39, 53) controlPoint2: CGPointMake(62.26, 47.33)];
    [mainPath addLineToPoint: CGPointMake(56.66, 47.33)];
    [mainPath addCurveToPoint: CGPointMake(53.76, 44.46) controlPoint1: CGPointMake(55.06, 47.33) controlPoint2: CGPointMake(53.76, 46.04)];
    [mainPath addCurveToPoint: CGPointMake(56.66, 41.6) controlPoint1: CGPointMake(53.76, 42.88) controlPoint2: CGPointMake(55.06, 41.6)];
    [mainPath addCurveToPoint: CGPointMake(64.87, 41.6) controlPoint1: CGPointMake(56.66, 41.6) controlPoint2: CGPointMake(62.61, 41.7)];
    [mainPath addCurveToPoint: CGPointMake(67.41, 36.78) controlPoint1: CGPointMake(67.13, 40.61) controlPoint2: CGPointMake(67.06, 42.23)];
    [mainPath addLineToPoint: CGPointMake(67.41, 22.17)];
    [mainPath addCurveToPoint: CGPointMake(69.94, 18.73) controlPoint1: CGPointMake(67.41, 20.27) controlPoint2: CGPointMake(68.54, 18.73)];
    [mainPath addCurveToPoint: CGPointMake(72.48, 22.17) controlPoint1: CGPointMake(71.34, 18.73) controlPoint2: CGPointMake(72.48, 20.27)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(48.27, 39.67)];
    [mainPath addCurveToPoint: CGPointMake(58.63, 39.67) controlPoint1: CGPointMake(51.13, 37.1) controlPoint2: CGPointMake(55.77, 37.1)];
    [mainPath addCurveToPoint: CGPointMake(58.91, 39.94) controlPoint1: CGPointMake(58.73, 39.76) controlPoint2: CGPointMake(58.82, 39.85)];
    [mainPath addLineToPoint: CGPointMake(57.11, 39.94)];
    [mainPath addCurveToPoint: CGPointMake(52.23, 44.32) controlPoint1: CGPointMake(54.42, 39.94) controlPoint2: CGPointMake(52.23, 41.9)];
    [mainPath addCurveToPoint: CGPointMake(57.11, 48.7) controlPoint1: CGPointMake(52.23, 46.73) controlPoint2: CGPointMake(54.42, 48.7)];
    [mainPath addLineToPoint: CGPointMake(58.91, 48.7)];
    [mainPath addCurveToPoint: CGPointMake(58.63, 48.96) controlPoint1: CGPointMake(58.82, 48.79) controlPoint2: CGPointMake(58.73, 48.87)];
    [mainPath addCurveToPoint: CGPointMake(48.27, 48.96) controlPoint1: CGPointMake(55.77, 51.53) controlPoint2: CGPointMake(51.13, 51.53)];
    [mainPath addCurveToPoint: CGPointMake(48.27, 39.67) controlPoint1: CGPointMake(45.4, 46.4) controlPoint2: CGPointMake(45.4, 42.24)];
    [mainPath closePath];
    [mainPath moveToPoint: CGPointMake(59.48, 23.69)];
    [mainPath addLineToPoint: CGPointMake(57.97, 21.52)];
    [mainPath addCurveToPoint: CGPointMake(55.38, 23.62) controlPoint1: CGPointMake(57.06, 22.13) controlPoint2: CGPointMake(56.19, 22.83)];
    [mainPath addCurveToPoint: CGPointMake(50.66, 31.36) controlPoint1: CGPointMake(53.08, 25.85) controlPoint2: CGPointMake(51.5, 28.53)];
    [mainPath addLineToPoint: CGPointMake(53.06, 31.36)];
    [mainPath addLineToPoint: CGPointMake(48.53, 38.98)];
    [mainPath addLineToPoint: CGPointMake(44, 31.36)];
    [mainPath addLineToPoint: CGPointMake(46.52, 31.36)];
    [mainPath addCurveToPoint: CGPointMake(52.55, 20.87) controlPoint1: CGPointMake(47.46, 27.52) controlPoint2: CGPointMake(49.47, 23.87)];
    [mainPath addCurveToPoint: CGPointMake(55.73, 18.3) controlPoint1: CGPointMake(53.55, 19.91) controlPoint2: CGPointMake(54.61, 19.05)];
    [mainPath addLineToPoint: CGPointMake(54.41, 16.4)];
    [mainPath addLineToPoint: CGPointMake(63.44, 15.77)];
    [mainPath addLineToPoint: CGPointMake(59.48, 23.69)];
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
    [reflectionPath moveToPoint: CGPointMake(75.53, 73.91)];
    [reflectionPath addCurveToPoint: CGPointMake(75.53, 68.88) controlPoint1: CGPointMake(78.17, 72.52) controlPoint2: CGPointMake(78.17, 70.27)];
    [reflectionPath addCurveToPoint: CGPointMake(75.26, 68.74) controlPoint1: CGPointMake(75.44, 68.83) controlPoint2: CGPointMake(75.35, 68.78)];
    [reflectionPath addLineToPoint: CGPointMake(75.26, 69.61)];
    [reflectionPath addCurveToPoint: CGPointMake(70.75, 71.99) controlPoint1: CGPointMake(75.26, 70.93) controlPoint2: CGPointMake(73.24, 71.99)];
    [reflectionPath addCurveToPoint: CGPointMake(66.24, 69.61) controlPoint1: CGPointMake(68.26, 71.99) controlPoint2: CGPointMake(66.24, 70.93)];
    [reflectionPath addLineToPoint: CGPointMake(66.24, 68.74)];
    [reflectionPath addCurveToPoint: CGPointMake(65.97, 68.88) controlPoint1: CGPointMake(66.15, 68.78) controlPoint2: CGPointMake(66.06, 68.83)];
    [reflectionPath addCurveToPoint: CGPointMake(65.97, 73.91) controlPoint1: CGPointMake(63.33, 70.27) controlPoint2: CGPointMake(63.33, 72.52)];
    [reflectionPath addCurveToPoint: CGPointMake(75.53, 73.91) controlPoint1: CGPointMake(68.61, 75.3) controlPoint2: CGPointMake(72.89, 75.3)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(73.28, 69.37)];
    [reflectionPath addLineToPoint: CGPointMake(73.28, 62.12)];
    [reflectionPath addLineToPoint: CGPointMake(83.42, 62.12)];
    [reflectionPath addCurveToPoint: CGPointMake(86.8, 60.4) controlPoint1: CGPointMake(85.29, 62.12) controlPoint2: CGPointMake(86.8, 61.35)];
    [reflectionPath addLineToPoint: CGPointMake(86.8, 55.67)];
    [reflectionPath addCurveToPoint: CGPointMake(83.42, 53.96) controlPoint1: CGPointMake(86.8, 54.73) controlPoint2: CGPointMake(85.29, 53.96)];
    [reflectionPath addLineToPoint: CGPointMake(69.06, 53.96)];
    [reflectionPath addCurveToPoint: CGPointMake(63.06, 56.79) controlPoint1: CGPointMake(67.19, 53.96) controlPoint2: CGPointMake(63.06, 56.79)];
    [reflectionPath addLineToPoint: CGPointMake(57.47, 56.79)];
    [reflectionPath addCurveToPoint: CGPointMake(54.56, 58.23) controlPoint1: CGPointMake(55.86, 56.79) controlPoint2: CGPointMake(54.56, 57.43)];
    [reflectionPath addCurveToPoint: CGPointMake(57.47, 59.66) controlPoint1: CGPointMake(54.56, 59.02) controlPoint2: CGPointMake(55.86, 59.66)];
    [reflectionPath addCurveToPoint: CGPointMake(65.68, 59.66) controlPoint1: CGPointMake(57.47, 59.66) controlPoint2: CGPointMake(63.41, 59.61)];
    [reflectionPath addCurveToPoint: CGPointMake(68.21, 62.06) controlPoint1: CGPointMake(67.93, 60.15) controlPoint2: CGPointMake(67.86, 59.34)];
    [reflectionPath addLineToPoint: CGPointMake(68.21, 69.37)];
    [reflectionPath addCurveToPoint: CGPointMake(70.75, 71.09) controlPoint1: CGPointMake(68.21, 70.32) controlPoint2: CGPointMake(69.35, 71.09)];
    [reflectionPath addCurveToPoint: CGPointMake(73.28, 69.37) controlPoint1: CGPointMake(72.15, 71.09) controlPoint2: CGPointMake(73.28, 70.32)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(49.07, 60.62)];
    [reflectionPath addCurveToPoint: CGPointMake(59.44, 60.62) controlPoint1: CGPointMake(51.93, 61.9) controlPoint2: CGPointMake(56.57, 61.9)];
    [reflectionPath addCurveToPoint: CGPointMake(59.72, 60.49) controlPoint1: CGPointMake(59.53, 60.58) controlPoint2: CGPointMake(59.63, 60.53)];
    [reflectionPath addLineToPoint: CGPointMake(57.92, 60.49)];
    [reflectionPath addCurveToPoint: CGPointMake(53.03, 58.3) controlPoint1: CGPointMake(55.22, 60.49) controlPoint2: CGPointMake(53.03, 59.51)];
    [reflectionPath addCurveToPoint: CGPointMake(57.92, 56.11) controlPoint1: CGPointMake(53.03, 57.09) controlPoint2: CGPointMake(55.22, 56.11)];
    [reflectionPath addLineToPoint: CGPointMake(59.72, 56.11)];
    [reflectionPath addCurveToPoint: CGPointMake(59.44, 55.98) controlPoint1: CGPointMake(59.63, 56.06) controlPoint2: CGPointMake(59.53, 56.02)];
    [reflectionPath addCurveToPoint: CGPointMake(49.07, 55.98) controlPoint1: CGPointMake(56.57, 54.69) controlPoint2: CGPointMake(51.93, 54.69)];
    [reflectionPath addCurveToPoint: CGPointMake(49.07, 60.62) controlPoint1: CGPointMake(46.21, 57.26) controlPoint2: CGPointMake(46.21, 59.34)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(60.28, 68.61)];
    [reflectionPath addLineToPoint: CGPointMake(58.77, 69.7)];
    [reflectionPath addCurveToPoint: CGPointMake(56.18, 68.65) controlPoint1: CGPointMake(57.86, 69.39) controlPoint2: CGPointMake(56.99, 69.04)];
    [reflectionPath addCurveToPoint: CGPointMake(51.46, 64.78) controlPoint1: CGPointMake(53.88, 67.53) controlPoint2: CGPointMake(52.31, 66.19)];
    [reflectionPath addLineToPoint: CGPointMake(53.86, 64.78)];
    [reflectionPath addLineToPoint: CGPointMake(49.33, 60.97)];
    [reflectionPath addLineToPoint: CGPointMake(44.8, 64.78)];
    [reflectionPath addLineToPoint: CGPointMake(47.33, 64.78)];
    [reflectionPath addCurveToPoint: CGPointMake(53.35, 70.02) controlPoint1: CGPointMake(48.26, 66.7) controlPoint2: CGPointMake(50.27, 68.52)];
    [reflectionPath addCurveToPoint: CGPointMake(56.53, 71.31) controlPoint1: CGPointMake(54.35, 70.5) controlPoint2: CGPointMake(55.41, 70.93)];
    [reflectionPath addLineToPoint: CGPointMake(55.21, 72.26)];
    [reflectionPath addLineToPoint: CGPointMake(64.24, 72.57)];
    [reflectionPath addLineToPoint: CGPointMake(60.28, 68.61)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(65.8, 53.96), CGPointMake(65.8, 74.96), 0);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(35, 57, 61, 12);
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
