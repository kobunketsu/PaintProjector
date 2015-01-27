//
//  GridButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADGridButton.h"

@implementation ADGridButton

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
    NSString* textContent = @"Grid";
    
    
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
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(75, 11.5)];
        [bezierPath addLineToPoint: CGPointMake(75, 20)];
        [bezierPath addLineToPoint: CGPointMake(83.5, 20)];
        [bezierPath addCurveToPoint: CGPointMake(84.5, 21) controlPoint1: CGPointMake(84.05, 20) controlPoint2: CGPointMake(84.5, 20.45)];
        [bezierPath addCurveToPoint: CGPointMake(83.5, 22) controlPoint1: CGPointMake(84.5, 21.55) controlPoint2: CGPointMake(84.05, 22)];
        [bezierPath addLineToPoint: CGPointMake(75, 22)];
        [bezierPath addLineToPoint: CGPointMake(75, 40)];
        [bezierPath addLineToPoint: CGPointMake(83.5, 40)];
        [bezierPath addCurveToPoint: CGPointMake(84.5, 41) controlPoint1: CGPointMake(84.05, 40) controlPoint2: CGPointMake(84.5, 40.45)];
        [bezierPath addCurveToPoint: CGPointMake(83.5, 42) controlPoint1: CGPointMake(84.5, 41.55) controlPoint2: CGPointMake(84.05, 42)];
        [bezierPath addLineToPoint: CGPointMake(75, 42)];
        [bezierPath addLineToPoint: CGPointMake(75, 50.5)];
        [bezierPath addCurveToPoint: CGPointMake(74, 51.5) controlPoint1: CGPointMake(75, 51.05) controlPoint2: CGPointMake(74.55, 51.5)];
        [bezierPath addCurveToPoint: CGPointMake(73, 50.5) controlPoint1: CGPointMake(73.45, 51.5) controlPoint2: CGPointMake(73, 51.05)];
        [bezierPath addLineToPoint: CGPointMake(73, 42)];
        [bezierPath addLineToPoint: CGPointMake(55, 42)];
        [bezierPath addLineToPoint: CGPointMake(55, 50.5)];
        [bezierPath addCurveToPoint: CGPointMake(54, 51.5) controlPoint1: CGPointMake(55, 51.05) controlPoint2: CGPointMake(54.55, 51.5)];
        [bezierPath addCurveToPoint: CGPointMake(53, 50.5) controlPoint1: CGPointMake(53.45, 51.5) controlPoint2: CGPointMake(53, 51.05)];
        [bezierPath addLineToPoint: CGPointMake(53, 42)];
        [bezierPath addLineToPoint: CGPointMake(44.5, 42)];
        [bezierPath addCurveToPoint: CGPointMake(43.5, 41) controlPoint1: CGPointMake(43.95, 42) controlPoint2: CGPointMake(43.5, 41.55)];
        [bezierPath addCurveToPoint: CGPointMake(44.5, 40) controlPoint1: CGPointMake(43.5, 40.45) controlPoint2: CGPointMake(43.95, 40)];
        [bezierPath addLineToPoint: CGPointMake(53, 40)];
        [bezierPath addLineToPoint: CGPointMake(53, 22)];
        [bezierPath addLineToPoint: CGPointMake(44.5, 22)];
        [bezierPath addCurveToPoint: CGPointMake(43.5, 21) controlPoint1: CGPointMake(43.95, 22) controlPoint2: CGPointMake(43.5, 21.55)];
        [bezierPath addCurveToPoint: CGPointMake(44.5, 20) controlPoint1: CGPointMake(43.5, 20.45) controlPoint2: CGPointMake(43.95, 20)];
        [bezierPath addLineToPoint: CGPointMake(53, 20)];
        [bezierPath addLineToPoint: CGPointMake(53, 11.5)];
        [bezierPath addCurveToPoint: CGPointMake(54, 10.5) controlPoint1: CGPointMake(53, 10.95) controlPoint2: CGPointMake(53.45, 10.5)];
        [bezierPath addCurveToPoint: CGPointMake(55, 11.5) controlPoint1: CGPointMake(54.55, 10.5) controlPoint2: CGPointMake(55, 10.95)];
        [bezierPath addLineToPoint: CGPointMake(55, 20)];
        [bezierPath addLineToPoint: CGPointMake(73, 20)];
        [bezierPath addLineToPoint: CGPointMake(73, 11.5)];
        [bezierPath addCurveToPoint: CGPointMake(74, 10.5) controlPoint1: CGPointMake(73, 10.95) controlPoint2: CGPointMake(73.45, 10.5)];
        [bezierPath addCurveToPoint: CGPointMake(75, 11.5) controlPoint1: CGPointMake(74.55, 10.5) controlPoint2: CGPointMake(75, 10.95)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(73, 22)];
        [bezierPath addLineToPoint: CGPointMake(55, 22)];
        [bezierPath addLineToPoint: CGPointMake(55, 40)];
        [bezierPath addLineToPoint: CGPointMake(73, 40)];
        [bezierPath addLineToPoint: CGPointMake(73, 22)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [bezierPath fill];
        
        ////// Bezier Inner Shadow
        CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        bezierBorderRect = CGRectOffset(bezierBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
        
        UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
        [bezierNegativePath appendPath: bezierPath];
        bezierNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(bezierBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [bezierPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
            [bezierNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezierNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Reflection Drawing
        UIBezierPath* reflectionPath = [UIBezierPath bezierPath];
        [reflectionPath moveToPoint: CGPointMake(75, 52.96)];
        [reflectionPath addLineToPoint: CGPointMake(75, 56.9)];
        [reflectionPath addLineToPoint: CGPointMake(83.5, 56.9)];
        [reflectionPath addCurveToPoint: CGPointMake(84.5, 57.37) controlPoint1: CGPointMake(84.05, 56.9) controlPoint2: CGPointMake(84.5, 57.11)];
        [reflectionPath addCurveToPoint: CGPointMake(83.5, 57.83) controlPoint1: CGPointMake(84.5, 57.62) controlPoint2: CGPointMake(84.05, 57.83)];
        [reflectionPath addLineToPoint: CGPointMake(75, 57.83)];
        [reflectionPath addLineToPoint: CGPointMake(75, 66.17)];
        [reflectionPath addLineToPoint: CGPointMake(83.5, 66.17)];
        [reflectionPath addCurveToPoint: CGPointMake(84.5, 66.63) controlPoint1: CGPointMake(84.05, 66.17) controlPoint2: CGPointMake(84.5, 66.38)];
        [reflectionPath addCurveToPoint: CGPointMake(83.5, 67.1) controlPoint1: CGPointMake(84.5, 66.89) controlPoint2: CGPointMake(84.05, 67.1)];
        [reflectionPath addLineToPoint: CGPointMake(75, 67.1)];
        [reflectionPath addLineToPoint: CGPointMake(75, 71.04)];
        [reflectionPath addCurveToPoint: CGPointMake(74, 71.5) controlPoint1: CGPointMake(75, 71.29) controlPoint2: CGPointMake(74.55, 71.5)];
        [reflectionPath addCurveToPoint: CGPointMake(73, 71.04) controlPoint1: CGPointMake(73.45, 71.5) controlPoint2: CGPointMake(73, 71.29)];
        [reflectionPath addLineToPoint: CGPointMake(73, 67.1)];
        [reflectionPath addLineToPoint: CGPointMake(55, 67.1)];
        [reflectionPath addLineToPoint: CGPointMake(55, 71.04)];
        [reflectionPath addCurveToPoint: CGPointMake(54, 71.5) controlPoint1: CGPointMake(55, 71.29) controlPoint2: CGPointMake(54.55, 71.5)];
        [reflectionPath addCurveToPoint: CGPointMake(53, 71.04) controlPoint1: CGPointMake(53.45, 71.5) controlPoint2: CGPointMake(53, 71.29)];
        [reflectionPath addLineToPoint: CGPointMake(53, 67.1)];
        [reflectionPath addLineToPoint: CGPointMake(44.5, 67.1)];
        [reflectionPath addCurveToPoint: CGPointMake(43.5, 66.63) controlPoint1: CGPointMake(43.95, 67.1) controlPoint2: CGPointMake(43.5, 66.89)];
        [reflectionPath addCurveToPoint: CGPointMake(44.5, 66.17) controlPoint1: CGPointMake(43.5, 66.38) controlPoint2: CGPointMake(43.95, 66.17)];
        [reflectionPath addLineToPoint: CGPointMake(53, 66.17)];
        [reflectionPath addLineToPoint: CGPointMake(53, 57.83)];
        [reflectionPath addLineToPoint: CGPointMake(44.5, 57.83)];
        [reflectionPath addCurveToPoint: CGPointMake(43.5, 57.37) controlPoint1: CGPointMake(43.95, 57.83) controlPoint2: CGPointMake(43.5, 57.62)];
        [reflectionPath addCurveToPoint: CGPointMake(44.5, 56.9) controlPoint1: CGPointMake(43.5, 57.11) controlPoint2: CGPointMake(43.95, 56.9)];
        [reflectionPath addLineToPoint: CGPointMake(53, 56.9)];
        [reflectionPath addLineToPoint: CGPointMake(53, 52.96)];
        [reflectionPath addCurveToPoint: CGPointMake(54, 52.5) controlPoint1: CGPointMake(53, 52.71) controlPoint2: CGPointMake(53.45, 52.5)];
        [reflectionPath addCurveToPoint: CGPointMake(55, 52.96) controlPoint1: CGPointMake(54.55, 52.5) controlPoint2: CGPointMake(55, 52.71)];
        [reflectionPath addLineToPoint: CGPointMake(55, 56.9)];
        [reflectionPath addLineToPoint: CGPointMake(73, 56.9)];
        [reflectionPath addLineToPoint: CGPointMake(73, 52.96)];
        [reflectionPath addCurveToPoint: CGPointMake(74, 52.5) controlPoint1: CGPointMake(73, 52.71) controlPoint2: CGPointMake(73.45, 52.5)];
        [reflectionPath addCurveToPoint: CGPointMake(75, 52.96) controlPoint1: CGPointMake(74.55, 52.5) controlPoint2: CGPointMake(75, 52.71)];
        [reflectionPath closePath];
        [reflectionPath moveToPoint: CGPointMake(73, 57.83)];
        [reflectionPath addLineToPoint: CGPointMake(55, 57.83)];
        [reflectionPath addLineToPoint: CGPointMake(55, 66.17)];
        [reflectionPath addLineToPoint: CGPointMake(73, 66.17)];
        [reflectionPath addLineToPoint: CGPointMake(73, 57.83)];
        [reflectionPath closePath];
        CGContextSaveGState(context);
        [reflectionPath addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64, 52.5), CGPointMake(64, 71.5), 0);
        CGContextRestoreGState(context);
    }
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(34, 57, 61, 12);
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
