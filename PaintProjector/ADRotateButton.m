//
//  RotateButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADRotateButton.h"

@implementation ADRotateButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 0.75];
    UIColor* iconColor = [UIColor colorWithRed: 0.738 green: 0.709 blue: 0.347 alpha: 1];
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
    NSString* textContent = @"Rotate";
    
    
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
    
    
    //// Main
    {
        //// Hand Drawing
        UIBezierPath* handPath = [UIBezierPath bezierPath];
        [handPath moveToPoint: CGPointMake(67.24, 13.41)];
        [handPath addCurveToPoint: CGPointMake(67.24, 20.45) controlPoint1: CGPointMake(69.05, 15.36) controlPoint2: CGPointMake(69.05, 18.51)];
        [handPath addCurveToPoint: CGPointMake(67.05, 20.64) controlPoint1: CGPointMake(67.18, 20.51) controlPoint2: CGPointMake(67.11, 20.58)];
        [handPath addLineToPoint: CGPointMake(67.05, 19.42)];
        [handPath addCurveToPoint: CGPointMake(63.95, 16.1) controlPoint1: CGPointMake(67.05, 17.59) controlPoint2: CGPointMake(65.66, 16.1)];
        [handPath addCurveToPoint: CGPointMake(60.84, 19.42) controlPoint1: CGPointMake(62.23, 16.1) controlPoint2: CGPointMake(60.84, 17.59)];
        [handPath addLineToPoint: CGPointMake(60.84, 20.64)];
        [handPath addCurveToPoint: CGPointMake(60.65, 20.45) controlPoint1: CGPointMake(60.78, 20.58) controlPoint2: CGPointMake(60.72, 20.51)];
        [handPath addCurveToPoint: CGPointMake(60.65, 13.41) controlPoint1: CGPointMake(58.84, 18.51) controlPoint2: CGPointMake(58.84, 15.36)];
        [handPath addCurveToPoint: CGPointMake(67.24, 13.41) controlPoint1: CGPointMake(62.47, 11.47) controlPoint2: CGPointMake(65.42, 11.47)];
        [handPath closePath];
        [handPath moveToPoint: CGPointMake(65.69, 19.76)];
        [handPath addLineToPoint: CGPointMake(65.69, 25.15)];
        [handPath addLineToPoint: CGPointMake(72.67, 25.15)];
        [handPath addCurveToPoint: CGPointMake(75, 27.55) controlPoint1: CGPointMake(73.96, 25.15) controlPoint2: CGPointMake(75, 26.23)];
        [handPath addLineToPoint: CGPointMake(75, 34.15)];
        [handPath addCurveToPoint: CGPointMake(72.67, 36.55) controlPoint1: CGPointMake(75, 35.48) controlPoint2: CGPointMake(73.96, 36.55)];
        [handPath addLineToPoint: CGPointMake(62.78, 36.55)];
        [handPath addCurveToPoint: CGPointMake(60.45, 34.15) controlPoint1: CGPointMake(61.5, 36.55) controlPoint2: CGPointMake(60.45, 35.48)];
        [handPath addLineToPoint: CGPointMake(60.45, 27.55)];
        [handPath addCurveToPoint: CGPointMake(62.2, 25.23) controlPoint1: CGPointMake(60.45, 26.44) controlPoint2: CGPointMake(61.2, 25.5)];
        [handPath addLineToPoint: CGPointMake(62.2, 19.76)];
        [handPath addCurveToPoint: CGPointMake(63.95, 17.36) controlPoint1: CGPointMake(62.2, 18.43) controlPoint2: CGPointMake(62.98, 17.36)];
        [handPath addCurveToPoint: CGPointMake(65.69, 19.76) controlPoint1: CGPointMake(64.91, 17.36) controlPoint2: CGPointMake(65.69, 18.43)];
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
        
        
        
        //// Rotate Drawing
        UIBezierPath* rotatePath = [UIBezierPath bezierPath];
        [rotatePath moveToPoint: CGPointMake(78.14, 19.88)];
        [rotatePath addCurveToPoint: CGPointMake(78.14, 48.97) controlPoint1: CGPointMake(85.95, 27.91) controlPoint2: CGPointMake(85.95, 40.94)];
        [rotatePath addCurveToPoint: CGPointMake(49.86, 48.97) controlPoint1: CGPointMake(70.33, 57.01) controlPoint2: CGPointMake(57.67, 57.01)];
        [rotatePath addCurveToPoint: CGPointMake(49.86, 19.88) controlPoint1: CGPointMake(42.05, 40.94) controlPoint2: CGPointMake(42.05, 27.91)];
        [rotatePath addCurveToPoint: CGPointMake(50.24, 19.5) controlPoint1: CGPointMake(49.98, 19.75) controlPoint2: CGPointMake(50.11, 19.62)];
        [rotatePath addLineToPoint: CGPointMake(48.96, 17.27)];
        [rotatePath addLineToPoint: CGPointMake(52.94, 17.28)];
        [rotatePath addLineToPoint: CGPointMake(53.09, 17.18)];
        [rotatePath addLineToPoint: CGPointMake(53.18, 17.28)];
        [rotatePath addLineToPoint: CGPointMake(58.74, 17.3)];
        [rotatePath addLineToPoint: CGPointMake(54.04, 26.12)];
        [rotatePath addLineToPoint: CGPointMake(52.14, 22.82)];
        [rotatePath addCurveToPoint: CGPointMake(52.43, 46.33) controlPoint1: CGPointMake(46.04, 29.42) controlPoint2: CGPointMake(46.14, 39.85)];
        [rotatePath addCurveToPoint: CGPointMake(75.57, 46.33) controlPoint1: CGPointMake(58.82, 52.9) controlPoint2: CGPointMake(69.18, 52.9)];
        [rotatePath addCurveToPoint: CGPointMake(75.57, 22.52) controlPoint1: CGPointMake(81.96, 39.76) controlPoint2: CGPointMake(81.96, 29.1)];
        [rotatePath addCurveToPoint: CGPointMake(72.46, 20.02) controlPoint1: CGPointMake(74.62, 21.54) controlPoint2: CGPointMake(73.57, 20.7)];
        [rotatePath addCurveToPoint: CGPointMake(74.64, 17) controlPoint1: CGPointMake(73.24, 18.95) controlPoint2: CGPointMake(73.98, 17.92)];
        [rotatePath addCurveToPoint: CGPointMake(78.14, 19.88) controlPoint1: CGPointMake(75.88, 17.8) controlPoint2: CGPointMake(77.06, 18.76)];
        [rotatePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [rotatePath fill];
        
        ////// Rotate Inner Shadow
        CGRect rotateBorderRect = CGRectInset([rotatePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        rotateBorderRect = CGRectOffset(rotateBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        rotateBorderRect = CGRectInset(CGRectUnion(rotateBorderRect, [rotatePath bounds]), -1, -1);
        
        UIBezierPath* rotateNegativePath = [UIBezierPath bezierPathWithRect: rotateBorderRect];
        [rotateNegativePath appendPath: rotatePath];
        rotateNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(rotateBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [rotatePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(rotateBorderRect.size.width), 0);
            [rotateNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [rotateNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    //// Reflection Drawing
    UIBezierPath* reflectionPath = [UIBezierPath bezierPath];
    [reflectionPath moveToPoint: CGPointMake(67.24, 76.21)];
    [reflectionPath addCurveToPoint: CGPointMake(67.24, 72.62) controlPoint1: CGPointMake(69.05, 75.22) controlPoint2: CGPointMake(69.05, 73.61)];
    [reflectionPath addCurveToPoint: CGPointMake(67.05, 72.52) controlPoint1: CGPointMake(67.18, 72.58) controlPoint2: CGPointMake(67.11, 72.55)];
    [reflectionPath addLineToPoint: CGPointMake(67.05, 73.14)];
    [reflectionPath addCurveToPoint: CGPointMake(63.95, 74.84) controlPoint1: CGPointMake(67.05, 74.08) controlPoint2: CGPointMake(65.66, 74.84)];
    [reflectionPath addCurveToPoint: CGPointMake(60.84, 73.14) controlPoint1: CGPointMake(62.23, 74.84) controlPoint2: CGPointMake(60.84, 74.08)];
    [reflectionPath addLineToPoint: CGPointMake(60.84, 72.52)];
    [reflectionPath addCurveToPoint: CGPointMake(60.65, 72.62) controlPoint1: CGPointMake(60.78, 72.55) controlPoint2: CGPointMake(60.72, 72.58)];
    [reflectionPath addCurveToPoint: CGPointMake(60.65, 76.21) controlPoint1: CGPointMake(58.84, 73.61) controlPoint2: CGPointMake(58.84, 75.22)];
    [reflectionPath addCurveToPoint: CGPointMake(67.24, 76.21) controlPoint1: CGPointMake(62.47, 77.2) controlPoint2: CGPointMake(65.42, 77.2)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(65.69, 72.97)];
    [reflectionPath addLineToPoint: CGPointMake(65.69, 70.21)];
    [reflectionPath addLineToPoint: CGPointMake(72.67, 70.21)];
    [reflectionPath addCurveToPoint: CGPointMake(75, 68.98) controlPoint1: CGPointMake(73.96, 70.21) controlPoint2: CGPointMake(75, 69.66)];
    [reflectionPath addLineToPoint: CGPointMake(75, 65.61)];
    [reflectionPath addCurveToPoint: CGPointMake(72.67, 64.39) controlPoint1: CGPointMake(75, 64.93) controlPoint2: CGPointMake(73.96, 64.39)];
    [reflectionPath addLineToPoint: CGPointMake(62.78, 64.39)];
    [reflectionPath addCurveToPoint: CGPointMake(60.45, 65.61) controlPoint1: CGPointMake(61.5, 64.39) controlPoint2: CGPointMake(60.45, 64.93)];
    [reflectionPath addLineToPoint: CGPointMake(60.45, 68.98)];
    [reflectionPath addCurveToPoint: CGPointMake(62.2, 70.17) controlPoint1: CGPointMake(60.45, 69.56) controlPoint2: CGPointMake(61.2, 70.04)];
    [reflectionPath addLineToPoint: CGPointMake(62.2, 72.97)];
    [reflectionPath addCurveToPoint: CGPointMake(63.95, 74.2) controlPoint1: CGPointMake(62.2, 73.65) controlPoint2: CGPointMake(62.98, 74.2)];
    [reflectionPath addCurveToPoint: CGPointMake(65.69, 72.97) controlPoint1: CGPointMake(64.91, 74.2) controlPoint2: CGPointMake(65.69, 73.65)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(78.14, 72.91)];
    [reflectionPath addCurveToPoint: CGPointMake(78.14, 58.04) controlPoint1: CGPointMake(85.95, 68.8) controlPoint2: CGPointMake(85.95, 62.14)];
    [reflectionPath addCurveToPoint: CGPointMake(49.86, 58.04) controlPoint1: CGPointMake(70.33, 53.93) controlPoint2: CGPointMake(57.67, 53.93)];
    [reflectionPath addCurveToPoint: CGPointMake(49.86, 72.91) controlPoint1: CGPointMake(42.05, 62.14) controlPoint2: CGPointMake(42.05, 68.8)];
    [reflectionPath addCurveToPoint: CGPointMake(50.24, 73.1) controlPoint1: CGPointMake(49.98, 72.97) controlPoint2: CGPointMake(50.11, 73.04)];
    [reflectionPath addLineToPoint: CGPointMake(48.96, 74.24)];
    [reflectionPath addLineToPoint: CGPointMake(52.94, 74.24)];
    [reflectionPath addLineToPoint: CGPointMake(53.09, 74.29)];
    [reflectionPath addLineToPoint: CGPointMake(53.18, 74.23)];
    [reflectionPath addLineToPoint: CGPointMake(58.74, 74.22)];
    [reflectionPath addLineToPoint: CGPointMake(54.04, 69.72)];
    [reflectionPath addLineToPoint: CGPointMake(52.14, 71.4)];
    [reflectionPath addCurveToPoint: CGPointMake(52.43, 59.39) controlPoint1: CGPointMake(46.04, 68.03) controlPoint2: CGPointMake(46.14, 62.7)];
    [reflectionPath addCurveToPoint: CGPointMake(75.57, 59.39) controlPoint1: CGPointMake(58.82, 56.03) controlPoint2: CGPointMake(69.18, 56.03)];
    [reflectionPath addCurveToPoint: CGPointMake(75.57, 71.56) controlPoint1: CGPointMake(81.96, 62.75) controlPoint2: CGPointMake(81.96, 68.2)];
    [reflectionPath addCurveToPoint: CGPointMake(72.46, 72.84) controlPoint1: CGPointMake(74.62, 72.06) controlPoint2: CGPointMake(73.57, 72.49)];
    [reflectionPath addCurveToPoint: CGPointMake(74.64, 74.38) controlPoint1: CGPointMake(73.24, 73.38) controlPoint2: CGPointMake(73.98, 73.91)];
    [reflectionPath addCurveToPoint: CGPointMake(78.14, 72.91) controlPoint1: CGPointMake(75.88, 73.97) controlPoint2: CGPointMake(77.06, 73.48)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(64, 54.96), CGPointMake(64, 76.96), 0);
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
