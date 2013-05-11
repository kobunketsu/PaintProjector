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
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(35, 57, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Main Drawing
    UIBezierPath* mainPath = [UIBezierPath bezierPath];
    [mainPath moveToPoint: CGPointMake(87.93, 22.71)];
    [mainPath addLineToPoint: CGPointMake(63.93, 46.98)];
    [mainPath addLineToPoint: CGPointMake(61.53, 49.41)];
    [mainPath addCurveToPoint: CGPointMake(59.13, 49.41) controlPoint1: CGPointMake(60.86, 50.08) controlPoint2: CGPointMake(59.79, 50.08)];
    [mainPath addLineToPoint: CGPointMake(44.72, 34.85)];
    [mainPath addCurveToPoint: CGPointMake(44.72, 32.42) controlPoint1: CGPointMake(44.06, 34.18) controlPoint2: CGPointMake(44.06, 33.09)];
    [mainPath addLineToPoint: CGPointMake(47.12, 29.99)];
    [mainPath addCurveToPoint: CGPointMake(49.52, 29.99) controlPoint1: CGPointMake(47.79, 29.32) controlPoint2: CGPointMake(48.86, 29.32)];
    [mainPath addLineToPoint: CGPointMake(60.33, 40.91)];
    [mainPath addLineToPoint: CGPointMake(83.13, 17.86)];
    [mainPath addCurveToPoint: CGPointMake(85.53, 17.86) controlPoint1: CGPointMake(83.79, 17.19) controlPoint2: CGPointMake(84.87, 17.19)];
    [mainPath addLineToPoint: CGPointMake(87.93, 20.28)];
    [mainPath addCurveToPoint: CGPointMake(87.93, 22.71) controlPoint1: CGPointMake(88.59, 20.95) controlPoint2: CGPointMake(88.59, 22.04)];
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
    [reflectionPath moveToPoint: CGPointMake(87.93, 63.22)];
    [reflectionPath addLineToPoint: CGPointMake(63.93, 51.29)];
    [reflectionPath addLineToPoint: CGPointMake(61.53, 50.1)];
    [reflectionPath addCurveToPoint: CGPointMake(59.13, 50.1) controlPoint1: CGPointMake(60.86, 49.77) controlPoint2: CGPointMake(59.79, 49.77)];
    [reflectionPath addLineToPoint: CGPointMake(44.72, 57.26)];
    [reflectionPath addCurveToPoint: CGPointMake(44.72, 58.45) controlPoint1: CGPointMake(44.06, 57.59) controlPoint2: CGPointMake(44.06, 58.12)];
    [reflectionPath addLineToPoint: CGPointMake(47.12, 59.64)];
    [reflectionPath addCurveToPoint: CGPointMake(49.52, 59.64) controlPoint1: CGPointMake(47.79, 59.97) controlPoint2: CGPointMake(48.86, 59.97)];
    [reflectionPath addLineToPoint: CGPointMake(60.33, 54.28)];
    [reflectionPath addLineToPoint: CGPointMake(83.13, 65.61)];
    [reflectionPath addCurveToPoint: CGPointMake(85.53, 65.61) controlPoint1: CGPointMake(83.79, 65.94) controlPoint2: CGPointMake(84.87, 65.94)];
    [reflectionPath addLineToPoint: CGPointMake(87.93, 64.41)];
    [reflectionPath addCurveToPoint: CGPointMake(87.93, 63.22) controlPoint1: CGPointMake(88.59, 64.08) controlPoint2: CGPointMake(88.59, 63.55)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(66.33, 49.85), CGPointMake(66.33, 65.85), 0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    
   
}


@end
