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
    [mainPath moveToPoint: CGPointMake(51.47, 16.69)];
    [mainPath addLineToPoint: CGPointMake(64.37, 29.59)];
    [mainPath addLineToPoint: CGPointMake(77.26, 16.69)];
    [mainPath addCurveToPoint: CGPointMake(79.72, 16.69) controlPoint1: CGPointMake(77.94, 16.01) controlPoint2: CGPointMake(79.04, 16.01)];
    [mainPath addLineToPoint: CGPointMake(82.18, 19.15)];
    [mainPath addCurveToPoint: CGPointMake(82.18, 21.6) controlPoint1: CGPointMake(82.85, 19.83) controlPoint2: CGPointMake(82.85, 20.93)];
    [mainPath addLineToPoint: CGPointMake(69.28, 34.5)];
    [mainPath addLineToPoint: CGPointMake(82.18, 47.4)];
    [mainPath addCurveToPoint: CGPointMake(82.18, 49.85) controlPoint1: CGPointMake(82.85, 48.07) controlPoint2: CGPointMake(82.85, 49.17)];
    [mainPath addLineToPoint: CGPointMake(79.72, 52.31)];
    [mainPath addCurveToPoint: CGPointMake(77.26, 52.31) controlPoint1: CGPointMake(79.04, 52.99) controlPoint2: CGPointMake(77.94, 52.99)];
    [mainPath addLineToPoint: CGPointMake(64.37, 39.41)];
    [mainPath addLineToPoint: CGPointMake(51.47, 52.31)];
    [mainPath addCurveToPoint: CGPointMake(49.02, 52.31) controlPoint1: CGPointMake(50.79, 52.99) controlPoint2: CGPointMake(49.7, 52.99)];
    [mainPath addLineToPoint: CGPointMake(46.56, 49.85)];
    [mainPath addCurveToPoint: CGPointMake(46.56, 47.4) controlPoint1: CGPointMake(45.88, 49.17) controlPoint2: CGPointMake(45.88, 48.07)];
    [mainPath addLineToPoint: CGPointMake(59.46, 34.5)];
    [mainPath addLineToPoint: CGPointMake(46.56, 21.6)];
    [mainPath addCurveToPoint: CGPointMake(46.56, 19.15) controlPoint1: CGPointMake(45.88, 20.93) controlPoint2: CGPointMake(45.88, 19.83)];
    [mainPath addLineToPoint: CGPointMake(49.02, 16.69)];
    [mainPath addCurveToPoint: CGPointMake(51.47, 16.69) controlPoint1: CGPointMake(49.7, 16.01) controlPoint2: CGPointMake(50.79, 16.01)];
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
    [reflectionPath moveToPoint: CGPointMake(51.47, 52.93)];
    [reflectionPath addLineToPoint: CGPointMake(64.37, 59.27)];
    [reflectionPath addLineToPoint: CGPointMake(77.26, 52.93)];
    [reflectionPath addCurveToPoint: CGPointMake(79.72, 52.93) controlPoint1: CGPointMake(77.94, 52.6) controlPoint2: CGPointMake(79.04, 52.6)];
    [reflectionPath addLineToPoint: CGPointMake(82.18, 54.14)];
    [reflectionPath addCurveToPoint: CGPointMake(82.18, 55.35) controlPoint1: CGPointMake(82.85, 54.47) controlPoint2: CGPointMake(82.85, 55.01)];
    [reflectionPath addLineToPoint: CGPointMake(69.28, 61.68)];
    [reflectionPath addLineToPoint: CGPointMake(82.18, 68.02)];
    [reflectionPath addCurveToPoint: CGPointMake(82.18, 69.23) controlPoint1: CGPointMake(82.85, 68.35) controlPoint2: CGPointMake(82.85, 68.89)];
    [reflectionPath addLineToPoint: CGPointMake(79.72, 70.43)];
    [reflectionPath addCurveToPoint: CGPointMake(77.26, 70.43) controlPoint1: CGPointMake(79.04, 70.77) controlPoint2: CGPointMake(77.94, 70.77)];
    [reflectionPath addLineToPoint: CGPointMake(64.37, 64.1)];
    [reflectionPath addLineToPoint: CGPointMake(51.47, 70.43)];
    [reflectionPath addCurveToPoint: CGPointMake(49.02, 70.43) controlPoint1: CGPointMake(50.79, 70.77) controlPoint2: CGPointMake(49.7, 70.77)];
    [reflectionPath addLineToPoint: CGPointMake(46.56, 69.23)];
    [reflectionPath addCurveToPoint: CGPointMake(46.56, 68.02) controlPoint1: CGPointMake(45.88, 68.89) controlPoint2: CGPointMake(45.88, 68.35)];
    [reflectionPath addLineToPoint: CGPointMake(59.46, 61.68)];
    [reflectionPath addLineToPoint: CGPointMake(46.56, 55.35)];
    [reflectionPath addCurveToPoint: CGPointMake(46.56, 54.14) controlPoint1: CGPointMake(45.88, 55.01) controlPoint2: CGPointMake(45.88, 54.47)];
    [reflectionPath addLineToPoint: CGPointMake(49.02, 52.93)];
    [reflectionPath addCurveToPoint: CGPointMake(51.47, 52.93) controlPoint1: CGPointMake(49.7, 52.6) controlPoint2: CGPointMake(50.79, 52.6)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64.37, 52.68), CGPointMake(64.37, 70.68), 0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
