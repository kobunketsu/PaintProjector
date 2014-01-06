//
//  BackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BackButton.h"

@implementation BackButton

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
    NSString* textContent = @"Back";
    
    
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
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(69.61, 73.02)];
    [bezier2Path addCurveToPoint: CGPointMake(69.61, 71.62) controlPoint1: CGPointMake(70.39, 72.63) controlPoint2: CGPointMake(70.39, 72)];
    [bezier2Path addLineToPoint: CGPointMake(52.83, 63.31)];
    [bezier2Path addLineToPoint: CGPointMake(69.61, 55)];
    [bezier2Path addCurveToPoint: CGPointMake(69.61, 53.6) controlPoint1: CGPointMake(70.39, 54.61) controlPoint2: CGPointMake(70.39, 53.98)];
    [bezier2Path addCurveToPoint: CGPointMake(66.78, 53.6) controlPoint1: CGPointMake(68.83, 53.21) controlPoint2: CGPointMake(67.56, 53.21)];
    [bezier2Path addLineToPoint: CGPointMake(49.3, 62.25)];
    [bezier2Path addCurveToPoint: CGPointMake(47.82, 63.31) controlPoint1: CGPointMake(48.97, 62.3) controlPoint2: CGPointMake(47.76, 63.02)];
    [bezier2Path addCurveToPoint: CGPointMake(49.3, 64.36) controlPoint1: CGPointMake(47.76, 63.59) controlPoint2: CGPointMake(48.97, 64.32)];
    [bezier2Path addLineToPoint: CGPointMake(66.78, 73.02)];
    [bezier2Path addCurveToPoint: CGPointMake(69.61, 73.02) controlPoint1: CGPointMake(67.56, 73.4) controlPoint2: CGPointMake(68.83, 73.4)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    [bezier2Path addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(59, 53.31), CGPointMake(59, 73.31), 0);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 56, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(69.61, 13.39)];
    [bezierPath addCurveToPoint: CGPointMake(69.61, 16.22) controlPoint1: CGPointMake(70.39, 14.17) controlPoint2: CGPointMake(70.39, 15.44)];
    [bezierPath addLineToPoint: CGPointMake(52.83, 33)];
    [bezierPath addLineToPoint: CGPointMake(69.61, 49.78)];
    [bezierPath addCurveToPoint: CGPointMake(69.61, 52.61) controlPoint1: CGPointMake(70.39, 50.56) controlPoint2: CGPointMake(70.39, 51.83)];
    [bezierPath addCurveToPoint: CGPointMake(66.78, 52.61) controlPoint1: CGPointMake(68.83, 53.39) controlPoint2: CGPointMake(67.56, 53.39)];
    [bezierPath addLineToPoint: CGPointMake(49.3, 35.13)];
    [bezierPath addCurveToPoint: CGPointMake(47.82, 33) controlPoint1: CGPointMake(48.97, 35.04) controlPoint2: CGPointMake(47.76, 33.57)];
    [bezierPath addCurveToPoint: CGPointMake(49.3, 30.87) controlPoint1: CGPointMake(47.76, 32.43) controlPoint2: CGPointMake(48.97, 30.96)];
    [bezierPath addLineToPoint: CGPointMake(66.78, 13.39)];
    [bezierPath addCurveToPoint: CGPointMake(69.61, 13.39) controlPoint1: CGPointMake(67.56, 12.61) controlPoint2: CGPointMake(68.83, 12.61)];
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
    
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
