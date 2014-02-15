//
//  PrintButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PrintButton.h"

@implementation PrintButton

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
    NSString* textContent = @"Print";
    
    
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
    
    
    //// PrintReflection Drawing
    UIBezierPath* printReflectionPath = [UIBezierPath bezierPath];
    [printReflectionPath moveToPoint: CGPointMake(78.27, 65.29)];
    [printReflectionPath addLineToPoint: CGPointMake(78.27, 64.59)];
    [printReflectionPath addLineToPoint: CGPointMake(73.87, 64.59)];
    [printReflectionPath addLineToPoint: CGPointMake(73.87, 66)];
    [printReflectionPath addLineToPoint: CGPointMake(76.07, 66)];
    [printReflectionPath addCurveToPoint: CGPointMake(78.27, 65.29) controlPoint1: CGPointMake(77.28, 66) controlPoint2: CGPointMake(78.27, 65.68)];
    [printReflectionPath closePath];
    [printReflectionPath moveToPoint: CGPointMake(72.99, 64.3)];
    [printReflectionPath addLineToPoint: CGPointMake(78.27, 64.3)];
    [printReflectionPath addLineToPoint: CGPointMake(78.27, 62.04)];
    [printReflectionPath addLineToPoint: CGPointMake(44.85, 62.04)];
    [printReflectionPath addLineToPoint: CGPointMake(44.85, 66)];
    [printReflectionPath addLineToPoint: CGPointMake(72.99, 66)];
    [printReflectionPath addLineToPoint: CGPointMake(72.99, 64.3)];
    [printReflectionPath closePath];
    [printReflectionPath moveToPoint: CGPointMake(48.37, 60.35)];
    [printReflectionPath addLineToPoint: CGPointMake(45.73, 60.35)];
    [printReflectionPath addLineToPoint: CGPointMake(45.73, 59.5)];
    [printReflectionPath addLineToPoint: CGPointMake(48.37, 59.5)];
    [printReflectionPath addLineToPoint: CGPointMake(48.37, 60.35)];
    [printReflectionPath closePath];
    [printReflectionPath moveToPoint: CGPointMake(43.97, 60.35)];
    [printReflectionPath addLineToPoint: CGPointMake(41.34, 60.35)];
    [printReflectionPath addLineToPoint: CGPointMake(41.34, 59.5)];
    [printReflectionPath addLineToPoint: CGPointMake(43.97, 59.5)];
    [printReflectionPath addLineToPoint: CGPointMake(43.97, 60.35)];
    [printReflectionPath closePath];
    [printReflectionPath moveToPoint: CGPointMake(78.27, 58.09)];
    [printReflectionPath addLineToPoint: CGPointMake(44.85, 58.09)];
    [printReflectionPath addCurveToPoint: CGPointMake(43.97, 57.8) controlPoint1: CGPointMake(44.37, 58.09) controlPoint2: CGPointMake(43.97, 57.96)];
    [printReflectionPath addLineToPoint: CGPointMake(43.97, 57.24)];
    [printReflectionPath addCurveToPoint: CGPointMake(44.85, 56.96) controlPoint1: CGPointMake(43.97, 57.08) controlPoint2: CGPointMake(44.37, 56.96)];
    [printReflectionPath addLineToPoint: CGPointMake(78.27, 56.96)];
    [printReflectionPath addCurveToPoint: CGPointMake(79.15, 57.24) controlPoint1: CGPointMake(78.75, 56.96) controlPoint2: CGPointMake(79.15, 57.08)];
    [printReflectionPath addLineToPoint: CGPointMake(79.15, 57.8)];
    [printReflectionPath addCurveToPoint: CGPointMake(78.27, 58.09) controlPoint1: CGPointMake(79.15, 57.96) controlPoint2: CGPointMake(78.75, 58.09)];
    [printReflectionPath closePath];
    [printReflectionPath moveToPoint: CGPointMake(87.5, 60.21)];
    [printReflectionPath addLineToPoint: CGPointMake(87.5, 56.53)];
    [printReflectionPath addCurveToPoint: CGPointMake(84.86, 55.68) controlPoint1: CGPointMake(87.5, 56.06) controlPoint2: CGPointMake(86.32, 55.68)];
    [printReflectionPath addLineToPoint: CGPointMake(81.33, 55.68)];
    [printReflectionPath addLineToPoint: CGPointMake(85.95, 53)];
    [printReflectionPath addLineToPoint: CGPointMake(37.77, 53)];
    [printReflectionPath addLineToPoint: CGPointMake(41.98, 55.68)];
    [printReflectionPath addLineToPoint: CGPointMake(39.14, 55.68)];
    [printReflectionPath addCurveToPoint: CGPointMake(36.5, 56.53) controlPoint1: CGPointMake(37.68, 55.68) controlPoint2: CGPointMake(36.5, 56.06)];
    [printReflectionPath addLineToPoint: CGPointMake(36.5, 60.21)];
    [printReflectionPath addCurveToPoint: CGPointMake(39.14, 61.05) controlPoint1: CGPointMake(36.5, 60.67) controlPoint2: CGPointMake(37.68, 61.05)];
    [printReflectionPath addLineToPoint: CGPointMake(84.86, 61.05)];
    [printReflectionPath addCurveToPoint: CGPointMake(87.5, 60.21) controlPoint1: CGPointMake(86.32, 61.05) controlPoint2: CGPointMake(87.5, 60.67)];
    [printReflectionPath closePath];
    CGContextSaveGState(context);
    [printReflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(62, 53), CGPointMake(62, 66), 0);
    CGContextRestoreGState(context);
    
    
    //// Print Drawing
    UIBezierPath* printPath = [UIBezierPath bezierPath];
    [printPath moveToPoint: CGPointMake(78.27, 15.17)];
    [printPath addLineToPoint: CGPointMake(78.27, 17.35)];
    [printPath addLineToPoint: CGPointMake(73.87, 17.35)];
    [printPath addLineToPoint: CGPointMake(73.87, 13)];
    [printPath addLineToPoint: CGPointMake(76.07, 13)];
    [printPath addCurveToPoint: CGPointMake(78.27, 15.17) controlPoint1: CGPointMake(77.28, 13) controlPoint2: CGPointMake(78.27, 13.97)];
    [printPath closePath];
    [printPath moveToPoint: CGPointMake(72.99, 18.22)];
    [printPath addLineToPoint: CGPointMake(78.27, 18.22)];
    [printPath addLineToPoint: CGPointMake(78.27, 25.17)];
    [printPath addLineToPoint: CGPointMake(44.85, 25.17)];
    [printPath addLineToPoint: CGPointMake(44.85, 13)];
    [printPath addLineToPoint: CGPointMake(72.99, 13)];
    [printPath addLineToPoint: CGPointMake(72.99, 18.22)];
    [printPath closePath];
    [printPath moveToPoint: CGPointMake(48.37, 30.39)];
    [printPath addLineToPoint: CGPointMake(45.73, 30.39)];
    [printPath addLineToPoint: CGPointMake(45.73, 33)];
    [printPath addLineToPoint: CGPointMake(48.37, 33)];
    [printPath addLineToPoint: CGPointMake(48.37, 30.39)];
    [printPath closePath];
    [printPath moveToPoint: CGPointMake(43.97, 30.39)];
    [printPath addLineToPoint: CGPointMake(41.34, 30.39)];
    [printPath addLineToPoint: CGPointMake(41.34, 33)];
    [printPath addLineToPoint: CGPointMake(43.97, 33)];
    [printPath addLineToPoint: CGPointMake(43.97, 30.39)];
    [printPath closePath];
    [printPath moveToPoint: CGPointMake(78.27, 37.35)];
    [printPath addLineToPoint: CGPointMake(44.85, 37.35)];
    [printPath addCurveToPoint: CGPointMake(43.97, 38.22) controlPoint1: CGPointMake(44.37, 37.35) controlPoint2: CGPointMake(43.97, 37.74)];
    [printPath addLineToPoint: CGPointMake(43.97, 39.96)];
    [printPath addCurveToPoint: CGPointMake(44.85, 40.83) controlPoint1: CGPointMake(43.97, 40.44) controlPoint2: CGPointMake(44.37, 40.83)];
    [printPath addLineToPoint: CGPointMake(78.27, 40.83)];
    [printPath addCurveToPoint: CGPointMake(79.15, 39.96) controlPoint1: CGPointMake(78.75, 40.83) controlPoint2: CGPointMake(79.15, 40.44)];
    [printPath addLineToPoint: CGPointMake(79.15, 38.22)];
    [printPath addCurveToPoint: CGPointMake(78.27, 37.35) controlPoint1: CGPointMake(79.15, 37.74) controlPoint2: CGPointMake(78.75, 37.35)];
    [printPath closePath];
    [printPath moveToPoint: CGPointMake(87.5, 30.83)];
    [printPath addLineToPoint: CGPointMake(87.5, 42.13)];
    [printPath addCurveToPoint: CGPointMake(84.86, 44.74) controlPoint1: CGPointMake(87.5, 43.57) controlPoint2: CGPointMake(86.32, 44.74)];
    [printPath addLineToPoint: CGPointMake(81.33, 44.74)];
    [printPath addLineToPoint: CGPointMake(85.95, 53)];
    [printPath addLineToPoint: CGPointMake(37.77, 53)];
    [printPath addLineToPoint: CGPointMake(41.98, 44.74)];
    [printPath addLineToPoint: CGPointMake(39.14, 44.74)];
    [printPath addCurveToPoint: CGPointMake(36.5, 42.13) controlPoint1: CGPointMake(37.68, 44.74) controlPoint2: CGPointMake(36.5, 43.57)];
    [printPath addLineToPoint: CGPointMake(36.5, 30.83)];
    [printPath addCurveToPoint: CGPointMake(39.14, 28.22) controlPoint1: CGPointMake(36.5, 29.39) controlPoint2: CGPointMake(37.68, 28.22)];
    [printPath addLineToPoint: CGPointMake(84.86, 28.22)];
    [printPath addCurveToPoint: CGPointMake(87.5, 30.83) controlPoint1: CGPointMake(86.32, 28.22) controlPoint2: CGPointMake(87.5, 29.39)];
    [printPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [printPath fill];
    
    ////// Print Inner Shadow
    CGRect printBorderRect = CGRectInset([printPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    printBorderRect = CGRectOffset(printBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    printBorderRect = CGRectInset(CGRectUnion(printBorderRect, [printPath bounds]), -1, -1);
    
    UIBezierPath* printNegativePath = [UIBezierPath bezierPathWithRect: printBorderRect];
    [printNegativePath appendPath: printPath];
    printNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(printBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [printPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(printBorderRect.size.width), 0);
        [printNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [printNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 57, 61, 18);
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
