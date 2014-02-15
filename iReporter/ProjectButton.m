//
//  ProjectButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ProjectButton.h"

@implementation ProjectButton

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
    // Drawing code
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.693 green: 0.594 blue: 0.301 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.9 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
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
    NSString* textContent = @"Project";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -41, 131, 112)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, iconGlowGradient,
                                CGPointMake(64.05, 25.12), 4.84,
                                CGPointMake(63.76, 57.6), 47.32,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 57, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// projectIcon Drawing
    UIBezierPath* projectIconPath = [UIBezierPath bezierPath];
    [projectIconPath moveToPoint: CGPointMake(59.33, 23.64)];
    [projectIconPath addLineToPoint: CGPointMake(46, 23.64)];
    [projectIconPath addCurveToPoint: CGPointMake(44.67, 25.08) controlPoint1: CGPointMake(45.26, 23.64) controlPoint2: CGPointMake(44.67, 24.28)];
    [projectIconPath addCurveToPoint: CGPointMake(46, 26.52) controlPoint1: CGPointMake(44.67, 25.88) controlPoint2: CGPointMake(45.26, 26.52)];
    [projectIconPath addLineToPoint: CGPointMake(59.33, 26.52)];
    [projectIconPath addCurveToPoint: CGPointMake(60.67, 25.08) controlPoint1: CGPointMake(60.07, 26.52) controlPoint2: CGPointMake(60.67, 25.88)];
    [projectIconPath addCurveToPoint: CGPointMake(59.33, 23.64) controlPoint1: CGPointMake(60.67, 24.28) controlPoint2: CGPointMake(60.07, 23.64)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(59.33, 27.96)];
    [projectIconPath addLineToPoint: CGPointMake(46, 27.96)];
    [projectIconPath addCurveToPoint: CGPointMake(44.67, 29.4) controlPoint1: CGPointMake(45.26, 27.96) controlPoint2: CGPointMake(44.67, 28.6)];
    [projectIconPath addCurveToPoint: CGPointMake(46, 30.84) controlPoint1: CGPointMake(44.67, 30.2) controlPoint2: CGPointMake(45.26, 30.84)];
    [projectIconPath addLineToPoint: CGPointMake(59.33, 30.84)];
    [projectIconPath addCurveToPoint: CGPointMake(60.67, 29.4) controlPoint1: CGPointMake(60.07, 30.84) controlPoint2: CGPointMake(60.67, 30.2)];
    [projectIconPath addCurveToPoint: CGPointMake(59.33, 27.96) controlPoint1: CGPointMake(60.67, 28.6) controlPoint2: CGPointMake(60.07, 27.96)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(79.97, 25.84)];
    [projectIconPath addCurveToPoint: CGPointMake(79.97, 32.96) controlPoint1: CGPointMake(81.79, 27.8) controlPoint2: CGPointMake(81.79, 31)];
    [projectIconPath addCurveToPoint: CGPointMake(73.37, 32.96) controlPoint1: CGPointMake(78.14, 34.93) controlPoint2: CGPointMake(75.19, 34.93)];
    [projectIconPath addCurveToPoint: CGPointMake(73.37, 25.84) controlPoint1: CGPointMake(71.54, 31) controlPoint2: CGPointMake(71.54, 27.8)];
    [projectIconPath addCurveToPoint: CGPointMake(79.97, 25.84) controlPoint1: CGPointMake(75.19, 23.87) controlPoint2: CGPointMake(78.14, 23.87)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(59.33, 32.28)];
    [projectIconPath addLineToPoint: CGPointMake(46, 32.28)];
    [projectIconPath addCurveToPoint: CGPointMake(44.67, 33.72) controlPoint1: CGPointMake(45.26, 32.28) controlPoint2: CGPointMake(44.67, 32.92)];
    [projectIconPath addCurveToPoint: CGPointMake(46, 35.16) controlPoint1: CGPointMake(44.67, 34.52) controlPoint2: CGPointMake(45.26, 35.16)];
    [projectIconPath addLineToPoint: CGPointMake(59.33, 35.16)];
    [projectIconPath addCurveToPoint: CGPointMake(60.67, 33.72) controlPoint1: CGPointMake(60.07, 35.16) controlPoint2: CGPointMake(60.67, 34.52)];
    [projectIconPath addCurveToPoint: CGPointMake(59.33, 32.28) controlPoint1: CGPointMake(60.67, 32.92) controlPoint2: CGPointMake(60.07, 32.28)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(70.07, 22.27)];
    [projectIconPath addCurveToPoint: CGPointMake(70.07, 36.53) controlPoint1: CGPointMake(66.42, 26.21) controlPoint2: CGPointMake(66.42, 32.59)];
    [projectIconPath addCurveToPoint: CGPointMake(83.27, 36.53) controlPoint1: CGPointMake(73.71, 40.46) controlPoint2: CGPointMake(79.62, 40.46)];
    [projectIconPath addCurveToPoint: CGPointMake(83.27, 22.27) controlPoint1: CGPointMake(86.91, 32.59) controlPoint2: CGPointMake(86.91, 26.21)];
    [projectIconPath addCurveToPoint: CGPointMake(70.07, 22.27) controlPoint1: CGPointMake(79.62, 18.34) controlPoint2: CGPointMake(73.71, 18.34)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(90, 20.76)];
    [projectIconPath addLineToPoint: CGPointMake(90, 38.04)];
    [projectIconPath addCurveToPoint: CGPointMake(84.67, 43.8) controlPoint1: CGPointMake(90, 41.22) controlPoint2: CGPointMake(87.61, 43.8)];
    [projectIconPath addLineToPoint: CGPointMake(43.33, 43.8)];
    [projectIconPath addCurveToPoint: CGPointMake(38, 38.04) controlPoint1: CGPointMake(40.39, 43.8) controlPoint2: CGPointMake(38, 41.22)];
    [projectIconPath addLineToPoint: CGPointMake(38, 20.76)];
    [projectIconPath addCurveToPoint: CGPointMake(43.33, 15) controlPoint1: CGPointMake(38, 17.58) controlPoint2: CGPointMake(40.39, 15)];
    [projectIconPath addLineToPoint: CGPointMake(84.67, 15)];
    [projectIconPath addCurveToPoint: CGPointMake(90, 20.76) controlPoint1: CGPointMake(87.61, 15) controlPoint2: CGPointMake(90, 17.58)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(44.67, 48.12)];
    [projectIconPath addCurveToPoint: CGPointMake(47.33, 51) controlPoint1: CGPointMake(44.67, 49.71) controlPoint2: CGPointMake(45.86, 51)];
    [projectIconPath addLineToPoint: CGPointMake(51.33, 51)];
    [projectIconPath addCurveToPoint: CGPointMake(54, 48.12) controlPoint1: CGPointMake(52.81, 51) controlPoint2: CGPointMake(54, 49.71)];
    [projectIconPath addLineToPoint: CGPointMake(54, 45.24)];
    [projectIconPath addLineToPoint: CGPointMake(44.67, 45.24)];
    [projectIconPath addLineToPoint: CGPointMake(44.67, 48.12)];
    [projectIconPath closePath];
    [projectIconPath moveToPoint: CGPointMake(74, 48.12)];
    [projectIconPath addCurveToPoint: CGPointMake(76.67, 51) controlPoint1: CGPointMake(74, 49.71) controlPoint2: CGPointMake(75.19, 51)];
    [projectIconPath addLineToPoint: CGPointMake(80.67, 51)];
    [projectIconPath addCurveToPoint: CGPointMake(83.33, 48.12) controlPoint1: CGPointMake(82.14, 51) controlPoint2: CGPointMake(83.33, 49.71)];
    [projectIconPath addLineToPoint: CGPointMake(83.33, 45.24)];
    [projectIconPath addLineToPoint: CGPointMake(74, 45.24)];
    [projectIconPath addLineToPoint: CGPointMake(74, 48.12)];
    [projectIconPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [projectIconPath fill];
    
    ////// projectIcon Inner Shadow
    CGRect projectIconBorderRect = CGRectInset([projectIconPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    projectIconBorderRect = CGRectOffset(projectIconBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    projectIconBorderRect = CGRectInset(CGRectUnion(projectIconBorderRect, [projectIconPath bounds]), -1, -1);
    
    UIBezierPath* projectIconNegativePath = [UIBezierPath bezierPathWithRect: projectIconBorderRect];
    [projectIconNegativePath appendPath: projectIconPath];
    projectIconNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(projectIconBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [projectIconPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(projectIconBorderRect.size.width), 0);
        [projectIconNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [projectIconNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// projectRelectionIcon Drawing
    UIBezierPath* projectRelectionIconPath = [UIBezierPath bezierPath];
    [projectRelectionIconPath moveToPoint: CGPointMake(59.33, 59.2)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(46, 59.2)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(44.67, 59.9) controlPoint1: CGPointMake(45.26, 59.2) controlPoint2: CGPointMake(44.67, 59.51)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(46, 60.6) controlPoint1: CGPointMake(44.67, 60.29) controlPoint2: CGPointMake(45.26, 60.6)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(59.33, 60.6)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(60.67, 59.9) controlPoint1: CGPointMake(60.07, 60.6) controlPoint2: CGPointMake(60.67, 60.29)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(59.33, 59.2) controlPoint1: CGPointMake(60.67, 59.51) controlPoint2: CGPointMake(60.07, 59.2)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(59.33, 61.3)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(46, 61.3)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(44.67, 62) controlPoint1: CGPointMake(45.26, 61.3) controlPoint2: CGPointMake(44.67, 61.61)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(46, 62.7) controlPoint1: CGPointMake(44.67, 62.39) controlPoint2: CGPointMake(45.26, 62.7)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(59.33, 62.7)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(60.67, 62) controlPoint1: CGPointMake(60.07, 62.7) controlPoint2: CGPointMake(60.67, 62.39)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(59.33, 61.3) controlPoint1: CGPointMake(60.67, 61.61) controlPoint2: CGPointMake(60.07, 61.3)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(79.97, 60.27)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(79.97, 63.73) controlPoint1: CGPointMake(81.79, 61.22) controlPoint2: CGPointMake(81.79, 62.78)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(73.37, 63.73) controlPoint1: CGPointMake(78.14, 64.69) controlPoint2: CGPointMake(75.19, 64.69)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(73.37, 60.27) controlPoint1: CGPointMake(71.54, 62.78) controlPoint2: CGPointMake(71.54, 61.22)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(79.97, 60.27) controlPoint1: CGPointMake(75.19, 59.31) controlPoint2: CGPointMake(78.14, 59.31)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(59.33, 63.4)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(46, 63.4)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(44.67, 64.1) controlPoint1: CGPointMake(45.26, 63.4) controlPoint2: CGPointMake(44.67, 63.71)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(46, 64.8) controlPoint1: CGPointMake(44.67, 64.49) controlPoint2: CGPointMake(45.26, 64.8)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(59.33, 64.8)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(60.67, 64.1) controlPoint1: CGPointMake(60.07, 64.8) controlPoint2: CGPointMake(60.67, 64.49)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(59.33, 63.4) controlPoint1: CGPointMake(60.67, 63.71) controlPoint2: CGPointMake(60.07, 63.4)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(70.07, 58.54)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(70.07, 65.46) controlPoint1: CGPointMake(66.42, 60.45) controlPoint2: CGPointMake(66.42, 63.55)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(83.27, 65.46) controlPoint1: CGPointMake(73.71, 67.38) controlPoint2: CGPointMake(79.62, 67.38)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(83.27, 58.54) controlPoint1: CGPointMake(86.91, 63.55) controlPoint2: CGPointMake(86.91, 60.45)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(70.07, 58.54) controlPoint1: CGPointMake(79.62, 56.62) controlPoint2: CGPointMake(73.71, 56.62)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(90, 57.8)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(90, 66.2)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(84.67, 69) controlPoint1: CGPointMake(90, 67.75) controlPoint2: CGPointMake(87.61, 69)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(43.33, 69)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(38, 66.2) controlPoint1: CGPointMake(40.39, 69) controlPoint2: CGPointMake(38, 67.75)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(38, 57.8)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(43.33, 55) controlPoint1: CGPointMake(38, 56.25) controlPoint2: CGPointMake(40.39, 55)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(84.67, 55)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(90, 57.8) controlPoint1: CGPointMake(87.61, 55) controlPoint2: CGPointMake(90, 56.25)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(45, 54)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(54, 54)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(54, 52.5)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(51, 51) controlPoint1: CGPointMake(54, 51.67) controlPoint2: CGPointMake(52.66, 51)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(48, 51)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(45, 52.5) controlPoint1: CGPointMake(46.34, 51) controlPoint2: CGPointMake(45, 51.67)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(45, 54)];
    [projectRelectionIconPath closePath];
    [projectRelectionIconPath moveToPoint: CGPointMake(74, 54)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(83, 54)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(83, 52.5)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(80, 51) controlPoint1: CGPointMake(83, 51.67) controlPoint2: CGPointMake(81.66, 51)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(77, 51)];
    [projectRelectionIconPath addCurveToPoint: CGPointMake(74, 52.5) controlPoint1: CGPointMake(75.34, 51) controlPoint2: CGPointMake(74, 51.67)];
    [projectRelectionIconPath addLineToPoint: CGPointMake(74, 54)];
    [projectRelectionIconPath closePath];
    CGContextSaveGState(context);
    [projectRelectionIconPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64, 51), CGPointMake(64, 69), 0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    
    
}


@end
