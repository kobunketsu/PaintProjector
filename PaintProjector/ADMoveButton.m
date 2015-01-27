//
//  MoveButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADMoveButton.h"

@implementation ADMoveButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0.406 green: 0.632 blue: 0.704 alpha: 1];
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
    NSString* textContent = @"Move";
    
    
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
    
    
    //// Main
    {
        //// Hand Drawing
        UIBezierPath* handPath = [UIBezierPath bezierPath];
        [handPath moveToPoint: CGPointMake(67.24, 28.41)];
        [handPath addCurveToPoint: CGPointMake(67.24, 35.45) controlPoint1: CGPointMake(69.05, 30.36) controlPoint2: CGPointMake(69.05, 33.51)];
        [handPath addCurveToPoint: CGPointMake(67.05, 35.64) controlPoint1: CGPointMake(67.18, 35.51) controlPoint2: CGPointMake(67.11, 35.58)];
        [handPath addLineToPoint: CGPointMake(67.05, 34.42)];
        [handPath addCurveToPoint: CGPointMake(63.95, 31.1) controlPoint1: CGPointMake(67.05, 32.59) controlPoint2: CGPointMake(65.66, 31.1)];
        [handPath addCurveToPoint: CGPointMake(60.84, 34.42) controlPoint1: CGPointMake(62.23, 31.1) controlPoint2: CGPointMake(60.84, 32.59)];
        [handPath addLineToPoint: CGPointMake(60.84, 35.64)];
        [handPath addCurveToPoint: CGPointMake(60.65, 35.45) controlPoint1: CGPointMake(60.78, 35.58) controlPoint2: CGPointMake(60.72, 35.51)];
        [handPath addCurveToPoint: CGPointMake(60.65, 28.41) controlPoint1: CGPointMake(58.84, 33.51) controlPoint2: CGPointMake(58.84, 30.36)];
        [handPath addCurveToPoint: CGPointMake(67.24, 28.41) controlPoint1: CGPointMake(62.47, 26.47) controlPoint2: CGPointMake(65.42, 26.47)];
        [handPath closePath];
        [handPath moveToPoint: CGPointMake(65.69, 34.76)];
        [handPath addLineToPoint: CGPointMake(65.69, 40.15)];
        [handPath addLineToPoint: CGPointMake(72.67, 40.15)];
        [handPath addCurveToPoint: CGPointMake(75, 42.55) controlPoint1: CGPointMake(73.96, 40.15) controlPoint2: CGPointMake(75, 41.23)];
        [handPath addLineToPoint: CGPointMake(75, 49.15)];
        [handPath addCurveToPoint: CGPointMake(72.67, 51.55) controlPoint1: CGPointMake(75, 50.48) controlPoint2: CGPointMake(73.96, 51.55)];
        [handPath addLineToPoint: CGPointMake(62.78, 51.55)];
        [handPath addCurveToPoint: CGPointMake(60.45, 49.15) controlPoint1: CGPointMake(61.5, 51.55) controlPoint2: CGPointMake(60.45, 50.48)];
        [handPath addLineToPoint: CGPointMake(60.45, 42.55)];
        [handPath addCurveToPoint: CGPointMake(62.2, 40.23) controlPoint1: CGPointMake(60.45, 41.44) controlPoint2: CGPointMake(61.2, 40.5)];
        [handPath addLineToPoint: CGPointMake(62.2, 34.76)];
        [handPath addCurveToPoint: CGPointMake(63.95, 32.36) controlPoint1: CGPointMake(62.2, 33.43) controlPoint2: CGPointMake(62.98, 32.36)];
        [handPath addCurveToPoint: CGPointMake(65.69, 34.76) controlPoint1: CGPointMake(64.91, 32.36) controlPoint2: CGPointMake(65.69, 33.43)];
        [handPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [handPath fill];
        
        ////// Hand Inner Shadow
        CGRect handBorderRect = CGRectInset([handPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        handBorderRect = CGRectOffset(handBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        handBorderRect = CGRectInset(CGRectUnion(handBorderRect, [handPath bounds]), -1, -1);
        
        UIBezierPath* handNegativePath = [UIBezierPath bezierPathWithRect: handBorderRect];
        [handNegativePath appendPath: handPath];
        handNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(handBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [handPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(handBorderRect.size.width), 0);
            [handNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [handNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Move Drawing
        UIBezierPath* movePath = [UIBezierPath bezierPath];
        [movePath moveToPoint: CGPointMake(70.25, 18.13)];
        [movePath addLineToPoint: CGPointMake(65.29, 18.13)];
        [movePath addLineToPoint: CGPointMake(65.29, 24)];
        [movePath addLineToPoint: CGPointMake(61.94, 24)];
        [movePath addLineToPoint: CGPointMake(61.94, 18.13)];
        [movePath addLineToPoint: CGPointMake(56.97, 18.13)];
        [movePath addLineToPoint: CGPointMake(63.61, 11.5)];
        [movePath addLineToPoint: CGPointMake(70.25, 18.13)];
        [movePath closePath];
        [movePath moveToPoint: CGPointMake(50.87, 29.28)];
        [movePath addLineToPoint: CGPointMake(56, 29.28)];
        [movePath addLineToPoint: CGPointMake(56, 32.71)];
        [movePath addLineToPoint: CGPointMake(50.87, 32.71)];
        [movePath addLineToPoint: CGPointMake(50.87, 37.78)];
        [movePath addLineToPoint: CGPointMake(43.54, 30.99)];
        [movePath addLineToPoint: CGPointMake(50.87, 24.21)];
        [movePath addLineToPoint: CGPointMake(50.87, 29.28)];
        [movePath closePath];
        [movePath moveToPoint: CGPointMake(83.54, 30.84)];
        [movePath addLineToPoint: CGPointMake(76.38, 37.93)];
        [movePath addLineToPoint: CGPointMake(76.25, 32.71)];
        [movePath addLineToPoint: CGPointMake(71, 32.71)];
        [movePath addLineToPoint: CGPointMake(71, 29.28)];
        [movePath addLineToPoint: CGPointMake(76.16, 29.28)];
        [movePath addLineToPoint: CGPointMake(76.04, 24.37)];
        [movePath addLineToPoint: CGPointMake(83.54, 30.84)];
        [movePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [movePath fill];
        
        ////// Move Inner Shadow
        CGRect moveBorderRect = CGRectInset([movePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        moveBorderRect = CGRectOffset(moveBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        moveBorderRect = CGRectInset(CGRectUnion(moveBorderRect, [movePath bounds]), -1, -1);
        
        UIBezierPath* moveNegativePath = [UIBezierPath bezierPathWithRect: moveBorderRect];
        [moveNegativePath appendPath: movePath];
        moveNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(moveBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [movePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(moveBorderRect.size.width), 0);
            [moveNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [moveNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    //// Reflection Drawing
    UIBezierPath* reflectionPath = [UIBezierPath bezierPath];
    [reflectionPath moveToPoint: CGPointMake(67.74, 63.51)];
    [reflectionPath addCurveToPoint: CGPointMake(67.74, 60.07) controlPoint1: CGPointMake(69.55, 62.56) controlPoint2: CGPointMake(69.55, 61.02)];
    [reflectionPath addCurveToPoint: CGPointMake(67.55, 59.98) controlPoint1: CGPointMake(67.68, 60.04) controlPoint2: CGPointMake(67.61, 60.01)];
    [reflectionPath addLineToPoint: CGPointMake(67.55, 60.58)];
    [reflectionPath addCurveToPoint: CGPointMake(64.45, 62.19) controlPoint1: CGPointMake(67.55, 61.47) controlPoint2: CGPointMake(66.16, 62.19)];
    [reflectionPath addCurveToPoint: CGPointMake(61.34, 60.58) controlPoint1: CGPointMake(62.73, 62.19) controlPoint2: CGPointMake(61.34, 61.47)];
    [reflectionPath addLineToPoint: CGPointMake(61.34, 59.98)];
    [reflectionPath addCurveToPoint: CGPointMake(61.15, 60.07) controlPoint1: CGPointMake(61.28, 60.01) controlPoint2: CGPointMake(61.22, 60.04)];
    [reflectionPath addCurveToPoint: CGPointMake(61.15, 63.51) controlPoint1: CGPointMake(59.34, 61.02) controlPoint2: CGPointMake(59.34, 62.56)];
    [reflectionPath addCurveToPoint: CGPointMake(67.74, 63.51) controlPoint1: CGPointMake(62.97, 64.45) controlPoint2: CGPointMake(65.92, 64.45)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(66.19, 60.41)];
    [reflectionPath addLineToPoint: CGPointMake(66.19, 57.78)];
    [reflectionPath addLineToPoint: CGPointMake(73.17, 57.78)];
    [reflectionPath addCurveToPoint: CGPointMake(75.5, 56.61) controlPoint1: CGPointMake(74.46, 57.78) controlPoint2: CGPointMake(75.5, 57.25)];
    [reflectionPath addLineToPoint: CGPointMake(75.5, 53.39)];
    [reflectionPath addCurveToPoint: CGPointMake(73.17, 52.22) controlPoint1: CGPointMake(75.5, 52.74) controlPoint2: CGPointMake(74.46, 52.22)];
    [reflectionPath addLineToPoint: CGPointMake(63.28, 52.22)];
    [reflectionPath addCurveToPoint: CGPointMake(60.95, 53.39) controlPoint1: CGPointMake(62, 52.22) controlPoint2: CGPointMake(60.95, 52.74)];
    [reflectionPath addLineToPoint: CGPointMake(60.95, 56.61)];
    [reflectionPath addCurveToPoint: CGPointMake(62.7, 57.74) controlPoint1: CGPointMake(60.95, 57.15) controlPoint2: CGPointMake(61.7, 57.61)];
    [reflectionPath addLineToPoint: CGPointMake(62.7, 60.41)];
    [reflectionPath addCurveToPoint: CGPointMake(64.45, 61.58) controlPoint1: CGPointMake(62.7, 61.06) controlPoint2: CGPointMake(63.48, 61.58)];
    [reflectionPath addCurveToPoint: CGPointMake(66.19, 60.41) controlPoint1: CGPointMake(65.41, 61.58) controlPoint2: CGPointMake(66.19, 61.06)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(70.75, 68.52)];
    [reflectionPath addLineToPoint: CGPointMake(65.79, 68.52)];
    [reflectionPath addLineToPoint: CGPointMake(65.79, 65.66)];
    [reflectionPath addLineToPoint: CGPointMake(62.44, 65.66)];
    [reflectionPath addLineToPoint: CGPointMake(62.44, 68.52)];
    [reflectionPath addLineToPoint: CGPointMake(57.47, 68.52)];
    [reflectionPath addLineToPoint: CGPointMake(64.11, 71.76)];
    [reflectionPath addLineToPoint: CGPointMake(70.75, 68.52)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(51.37, 63.08)];
    [reflectionPath addLineToPoint: CGPointMake(56.5, 63.08)];
    [reflectionPath addLineToPoint: CGPointMake(56.5, 61.41)];
    [reflectionPath addLineToPoint: CGPointMake(51.37, 61.41)];
    [reflectionPath addLineToPoint: CGPointMake(51.37, 58.94)];
    [reflectionPath addLineToPoint: CGPointMake(44.04, 62.25)];
    [reflectionPath addLineToPoint: CGPointMake(51.37, 65.56)];
    [reflectionPath addLineToPoint: CGPointMake(51.37, 63.08)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(84.04, 62.32)];
    [reflectionPath addLineToPoint: CGPointMake(76.88, 58.86)];
    [reflectionPath addLineToPoint: CGPointMake(76.75, 61.41)];
    [reflectionPath addLineToPoint: CGPointMake(71.5, 61.41)];
    [reflectionPath addLineToPoint: CGPointMake(71.5, 63.08)];
    [reflectionPath addLineToPoint: CGPointMake(76.66, 63.08)];
    [reflectionPath addLineToPoint: CGPointMake(76.54, 65.48)];
    [reflectionPath addLineToPoint: CGPointMake(84.04, 62.32)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64.04, 52.22), CGPointMake(64.04, 71.76), 0);
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
