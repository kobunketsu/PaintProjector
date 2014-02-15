//
//  CopyButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CopyButton.h"

@implementation CopyButton

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
    NSString* textContent = @"Copy";
    
    
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
    
    
    //// Delete Reflection Drawing
    UIBezierPath* deleteReflectionPath = [UIBezierPath bezierPath];
    [deleteReflectionPath moveToPoint: CGPointMake(79, 72.04)];
    [deleteReflectionPath addLineToPoint: CGPointMake(79, 54.96)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(76, 53.5) controlPoint1: CGPointMake(79, 54.16) controlPoint2: CGPointMake(77.66, 53.5)];
    [deleteReflectionPath addLineToPoint: CGPointMake(51, 53.5)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(48, 54.96) controlPoint1: CGPointMake(49.34, 53.5) controlPoint2: CGPointMake(48, 54.16)];
    [deleteReflectionPath addLineToPoint: CGPointMake(48, 72.04)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(51, 73.5) controlPoint1: CGPointMake(48, 72.84) controlPoint2: CGPointMake(49.34, 73.5)];
    [deleteReflectionPath addLineToPoint: CGPointMake(76, 73.5)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(79, 72.04) controlPoint1: CGPointMake(77.66, 73.5) controlPoint2: CGPointMake(79, 72.84)];
    [deleteReflectionPath closePath];
    CGContextSaveGState(context);
    [deleteReflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(63.5, 53.5), CGPointMake(63.5, 73.5), 0);
    CGContextRestoreGState(context);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(85, 10)];
    [bezierPath addLineToPoint: CGPointMake(85, 45)];
    [bezierPath addCurveToPoint: CGPointMake(82, 48) controlPoint1: CGPointMake(85, 46.66) controlPoint2: CGPointMake(83.66, 48)];
    [bezierPath addLineToPoint: CGPointMake(80, 48)];
    [bezierPath addLineToPoint: CGPointMake(80, 15)];
    [bezierPath addCurveToPoint: CGPointMake(77, 12) controlPoint1: CGPointMake(80, 13.34) controlPoint2: CGPointMake(78.66, 12)];
    [bezierPath addLineToPoint: CGPointMake(54, 12)];
    [bezierPath addLineToPoint: CGPointMake(54, 10)];
    [bezierPath addCurveToPoint: CGPointMake(57, 7) controlPoint1: CGPointMake(54, 8.34) controlPoint2: CGPointMake(55.34, 7)];
    [bezierPath addLineToPoint: CGPointMake(82, 7)];
    [bezierPath addCurveToPoint: CGPointMake(85, 10) controlPoint1: CGPointMake(83.66, 7) controlPoint2: CGPointMake(85, 8.34)];
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
    
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 56, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(64.35, 25.26)];
    [bezier2Path addCurveToPoint: CGPointMake(59.34, 27.47) controlPoint1: CGPointMake(62.22, 25.26) controlPoint2: CGPointMake(60.55, 26)];
    [bezier2Path addCurveToPoint: CGPointMake(57.66, 32.68) controlPoint1: CGPointMake(58.22, 28.82) controlPoint2: CGPointMake(57.66, 30.56)];
    [bezier2Path addCurveToPoint: CGPointMake(59.89, 38.86) controlPoint1: CGPointMake(57.66, 35.46) controlPoint2: CGPointMake(58.4, 37.52)];
    [bezier2Path addCurveToPoint: CGPointMake(64.09, 40.37) controlPoint1: CGPointMake(61.03, 39.87) controlPoint2: CGPointMake(62.43, 40.37)];
    [bezier2Path addCurveToPoint: CGPointMake(68.7, 38.53) controlPoint1: CGPointMake(66.03, 40.37) controlPoint2: CGPointMake(67.56, 39.76)];
    [bezier2Path addCurveToPoint: CGPointMake(70.38, 34.73) controlPoint1: CGPointMake(69.65, 37.5) controlPoint2: CGPointMake(70.21, 36.24)];
    [bezier2Path addLineToPoint: CGPointMake(68.49, 34.73)];
    [bezier2Path addCurveToPoint: CGPointMake(67.6, 37.01) controlPoint1: CGPointMake(68.29, 35.67) controlPoint2: CGPointMake(68, 36.43)];
    [bezier2Path addCurveToPoint: CGPointMake(64.33, 38.66) controlPoint1: CGPointMake(66.85, 38.11) controlPoint2: CGPointMake(65.76, 38.66)];
    [bezier2Path addCurveToPoint: CGPointMake(60.82, 37.09) controlPoint1: CGPointMake(62.77, 38.66) controlPoint2: CGPointMake(61.6, 38.14)];
    [bezier2Path addCurveToPoint: CGPointMake(59.64, 33.01) controlPoint1: CGPointMake(60.03, 36.05) controlPoint2: CGPointMake(59.64, 34.69)];
    [bezier2Path addCurveToPoint: CGPointMake(60.94, 28.44) controlPoint1: CGPointMake(59.64, 30.96) controlPoint2: CGPointMake(60.07, 29.44)];
    [bezier2Path addCurveToPoint: CGPointMake(64.37, 26.95) controlPoint1: CGPointMake(61.81, 27.45) controlPoint2: CGPointMake(62.95, 26.95)];
    [bezier2Path addCurveToPoint: CGPointMake(67.07, 27.76) controlPoint1: CGPointMake(65.53, 26.95) controlPoint2: CGPointMake(66.43, 27.22)];
    [bezier2Path addCurveToPoint: CGPointMake(68.35, 29.96) controlPoint1: CGPointMake(67.71, 28.3) controlPoint2: CGPointMake(68.14, 29.04)];
    [bezier2Path addLineToPoint: CGPointMake(70.25, 29.96)];
    [bezier2Path addCurveToPoint: CGPointMake(68.58, 26.7) controlPoint1: CGPointMake(70.13, 28.74) controlPoint2: CGPointMake(69.58, 27.66)];
    [bezier2Path addCurveToPoint: CGPointMake(64.35, 25.26) controlPoint1: CGPointMake(67.57, 25.74) controlPoint2: CGPointMake(66.16, 25.26)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(79, 16)];
    [bezier2Path addLineToPoint: CGPointMake(79, 51)];
    [bezier2Path addCurveToPoint: CGPointMake(76, 54) controlPoint1: CGPointMake(79, 52.66) controlPoint2: CGPointMake(77.66, 54)];
    [bezier2Path addLineToPoint: CGPointMake(51, 54)];
    [bezier2Path addCurveToPoint: CGPointMake(48, 51) controlPoint1: CGPointMake(49.34, 54) controlPoint2: CGPointMake(48, 52.66)];
    [bezier2Path addLineToPoint: CGPointMake(48, 16)];
    [bezier2Path addCurveToPoint: CGPointMake(51, 13) controlPoint1: CGPointMake(48, 14.34) controlPoint2: CGPointMake(49.34, 13)];
    [bezier2Path addLineToPoint: CGPointMake(76, 13)];
    [bezier2Path addCurveToPoint: CGPointMake(79, 16) controlPoint1: CGPointMake(77.66, 13) controlPoint2: CGPointMake(79, 14.34)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [bezier2Path fill];
    
    ////// Bezier 2 Inner Shadow
    CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    bezier2BorderRect = CGRectOffset(bezier2BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
    
    UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
    [bezier2NegativePath appendPath: bezier2Path];
    bezier2NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(bezier2BorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [bezier2Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier2BorderRect.size.width), 0);
        [bezier2NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [bezier2NegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
