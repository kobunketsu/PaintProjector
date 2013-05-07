//
//  ScaleButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ScaleButton.h"

@implementation ScaleButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0.571 green: 0.445 blue: 0.707 alpha: 1];
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
                                     (id)iconReflectionColor.CGColor,
                                     (id)iconColorA50.CGColor, nil];
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
    NSString* textContent = @"Scale";
    
    
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
        //// Rectangle Src Drawing
        UIBezierPath* rectangleSrcPath = [UIBezierPath bezierPathWithRect: CGRectMake(44, 35, 19, 20)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [rectangleSrcPath fill];
        
        ////// Rectangle Src Inner Shadow
        CGRect rectangleSrcBorderRect = CGRectInset([rectangleSrcPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        rectangleSrcBorderRect = CGRectOffset(rectangleSrcBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        rectangleSrcBorderRect = CGRectInset(CGRectUnion(rectangleSrcBorderRect, [rectangleSrcPath bounds]), -1, -1);
        
        UIBezierPath* rectangleSrcNegativePath = [UIBezierPath bezierPathWithRect: rectangleSrcBorderRect];
        [rectangleSrcNegativePath appendPath: rectangleSrcPath];
        rectangleSrcNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(rectangleSrcBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [rectangleSrcPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(rectangleSrcBorderRect.size.width), 0);
            [rectangleSrcNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [rectangleSrcNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Rectangle Scaled Drawing
        UIBezierPath* rectangleScaledPath = [UIBezierPath bezierPath];
        [rectangleScaledPath moveToPoint: CGPointMake(82.4, 55)];
        [rectangleScaledPath addLineToPoint: CGPointMake(64.95, 55)];
        [rectangleScaledPath addLineToPoint: CGPointMake(64.95, 35.39)];
        [rectangleScaledPath addLineToPoint: CGPointMake(65.14, 35.59)];
        [rectangleScaledPath addLineToPoint: CGPointMake(74.86, 25.8)];
        [rectangleScaledPath addLineToPoint: CGPointMake(76.42, 27.38)];
        [rectangleScaledPath addLineToPoint: CGPointMake(77.79, 20.99)];
        [rectangleScaledPath addLineToPoint: CGPointMake(71.45, 22.37)];
        [rectangleScaledPath addLineToPoint: CGPointMake(73.01, 23.94)];
        [rectangleScaledPath addLineToPoint: CGPointMake(63.29, 33.72)];
        [rectangleScaledPath addLineToPoint: CGPointMake(63.48, 33.92)];
        [rectangleScaledPath addLineToPoint: CGPointMake(44, 33.92)];
        [rectangleScaledPath addLineToPoint: CGPointMake(44, 16.35)];
        [rectangleScaledPath addLineToPoint: CGPointMake(82.4, 16.35)];
        [rectangleScaledPath addLineToPoint: CGPointMake(82.4, 55)];
        [rectangleScaledPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColorA50 setFill];
        [rectangleScaledPath fill];
        
        ////// Rectangle Scaled Inner Shadow
        CGRect rectangleScaledBorderRect = CGRectInset([rectangleScaledPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        rectangleScaledBorderRect = CGRectOffset(rectangleScaledBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        rectangleScaledBorderRect = CGRectInset(CGRectUnion(rectangleScaledBorderRect, [rectangleScaledPath bounds]), -1, -1);
        
        UIBezierPath* rectangleScaledNegativePath = [UIBezierPath bezierPathWithRect: rectangleScaledBorderRect];
        [rectangleScaledNegativePath appendPath: rectangleScaledPath];
        rectangleScaledNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(rectangleScaledBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [rectangleScaledPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(rectangleScaledBorderRect.size.width), 0);
            [rectangleScaledNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [rectangleScaledNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Hand Drawing
        UIBezierPath* handPath = [UIBezierPath bezierPath];
        [handPath moveToPoint: CGPointMake(84.24, 13.41)];
        [handPath addCurveToPoint: CGPointMake(84.24, 20.45) controlPoint1: CGPointMake(86.05, 15.36) controlPoint2: CGPointMake(86.05, 18.51)];
        [handPath addCurveToPoint: CGPointMake(84.05, 20.64) controlPoint1: CGPointMake(84.18, 20.51) controlPoint2: CGPointMake(84.11, 20.58)];
        [handPath addLineToPoint: CGPointMake(84.05, 19.42)];
        [handPath addCurveToPoint: CGPointMake(80.95, 16.1) controlPoint1: CGPointMake(84.05, 17.59) controlPoint2: CGPointMake(82.66, 16.1)];
        [handPath addCurveToPoint: CGPointMake(77.84, 19.42) controlPoint1: CGPointMake(79.23, 16.1) controlPoint2: CGPointMake(77.84, 17.59)];
        [handPath addLineToPoint: CGPointMake(77.84, 20.64)];
        [handPath addCurveToPoint: CGPointMake(77.65, 20.45) controlPoint1: CGPointMake(77.78, 20.58) controlPoint2: CGPointMake(77.72, 20.51)];
        [handPath addCurveToPoint: CGPointMake(77.65, 13.41) controlPoint1: CGPointMake(75.84, 18.51) controlPoint2: CGPointMake(75.84, 15.36)];
        [handPath addCurveToPoint: CGPointMake(84.24, 13.41) controlPoint1: CGPointMake(79.47, 11.47) controlPoint2: CGPointMake(82.42, 11.47)];
        [handPath closePath];
        [handPath moveToPoint: CGPointMake(82.69, 19.76)];
        [handPath addLineToPoint: CGPointMake(82.69, 25.15)];
        [handPath addLineToPoint: CGPointMake(89.67, 25.15)];
        [handPath addCurveToPoint: CGPointMake(92, 27.55) controlPoint1: CGPointMake(90.96, 25.15) controlPoint2: CGPointMake(92, 26.23)];
        [handPath addLineToPoint: CGPointMake(92, 34.15)];
        [handPath addCurveToPoint: CGPointMake(89.67, 36.55) controlPoint1: CGPointMake(92, 35.48) controlPoint2: CGPointMake(90.96, 36.55)];
        [handPath addLineToPoint: CGPointMake(79.78, 36.55)];
        [handPath addCurveToPoint: CGPointMake(77.45, 34.15) controlPoint1: CGPointMake(78.5, 36.55) controlPoint2: CGPointMake(77.45, 35.48)];
        [handPath addLineToPoint: CGPointMake(77.45, 27.55)];
        [handPath addCurveToPoint: CGPointMake(79.2, 25.23) controlPoint1: CGPointMake(77.45, 26.44) controlPoint2: CGPointMake(78.2, 25.5)];
        [handPath addLineToPoint: CGPointMake(79.2, 19.76)];
        [handPath addCurveToPoint: CGPointMake(80.95, 17.36) controlPoint1: CGPointMake(79.2, 18.43) controlPoint2: CGPointMake(79.98, 17.36)];
        [handPath addCurveToPoint: CGPointMake(82.69, 19.76) controlPoint1: CGPointMake(81.91, 17.36) controlPoint2: CGPointMake(82.69, 18.43)];
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
        
    }
    
    
    //// Reflection Drawing
    UIBezierPath* reflectionPath = [UIBezierPath bezierPath];
    [reflectionPath moveToPoint: CGPointMake(63, 65)];
    [reflectionPath addLineToPoint: CGPointMake(44, 65)];
    [reflectionPath addLineToPoint: CGPointMake(44, 55)];
    [reflectionPath addLineToPoint: CGPointMake(63, 55)];
    [reflectionPath addLineToPoint: CGPointMake(63, 65)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(82.4, 64.22)];
    [reflectionPath addLineToPoint: CGPointMake(89.67, 64.22)];
    [reflectionPath addCurveToPoint: CGPointMake(92, 65.42) controlPoint1: CGPointMake(90.96, 64.22) controlPoint2: CGPointMake(92, 64.76)];
    [reflectionPath addLineToPoint: CGPointMake(92, 68.72)];
    [reflectionPath addCurveToPoint: CGPointMake(89.67, 69.92) controlPoint1: CGPointMake(92, 69.39) controlPoint2: CGPointMake(90.96, 69.92)];
    [reflectionPath addLineToPoint: CGPointMake(82.69, 69.92)];
    [reflectionPath addLineToPoint: CGPointMake(82.69, 72.62)];
    [reflectionPath addCurveToPoint: CGPointMake(82.4, 73.29) controlPoint1: CGPointMake(82.69, 72.87) controlPoint2: CGPointMake(82.58, 73.1)];
    [reflectionPath addLineToPoint: CGPointMake(82.4, 74.26)];
    [reflectionPath addCurveToPoint: CGPointMake(84.05, 72.79) controlPoint1: CGPointMake(83.38, 73.98) controlPoint2: CGPointMake(84.05, 73.43)];
    [reflectionPath addLineToPoint: CGPointMake(84.05, 72.18)];
    [reflectionPath addCurveToPoint: CGPointMake(84.24, 72.28) controlPoint1: CGPointMake(84.11, 72.21) controlPoint2: CGPointMake(84.18, 72.24)];
    [reflectionPath addCurveToPoint: CGPointMake(84.24, 75.79) controlPoint1: CGPointMake(86.05, 73.25) controlPoint2: CGPointMake(86.05, 74.82)];
    [reflectionPath addCurveToPoint: CGPointMake(77.65, 75.79) controlPoint1: CGPointMake(82.42, 76.76) controlPoint2: CGPointMake(79.47, 76.76)];
    [reflectionPath addCurveToPoint: CGPointMake(76.32, 74.33) controlPoint1: CGPointMake(76.88, 75.38) controlPoint2: CGPointMake(76.44, 74.86)];
    [reflectionPath addLineToPoint: CGPointMake(44, 74.33)];
    [reflectionPath addLineToPoint: CGPointMake(44, 65.54)];
    [reflectionPath addLineToPoint: CGPointMake(63.48, 65.54)];
    [reflectionPath addLineToPoint: CGPointMake(63.29, 65.64)];
    [reflectionPath addLineToPoint: CGPointMake(73.01, 70.53)];
    [reflectionPath addLineToPoint: CGPointMake(71.45, 71.32)];
    [reflectionPath addLineToPoint: CGPointMake(77.79, 72.01)];
    [reflectionPath addLineToPoint: CGPointMake(76.42, 68.81)];
    [reflectionPath addLineToPoint: CGPointMake(74.86, 69.6)];
    [reflectionPath addLineToPoint: CGPointMake(65.14, 64.71)];
    [reflectionPath addLineToPoint: CGPointMake(64.95, 64.8)];
    [reflectionPath addLineToPoint: CGPointMake(64.95, 55)];
    [reflectionPath addLineToPoint: CGPointMake(82.4, 55)];
    [reflectionPath addLineToPoint: CGPointMake(82.4, 64.22)];
    [reflectionPath closePath];
    [reflectionPath moveToPoint: CGPointMake(82.12, 74.33)];
    [reflectionPath addLineToPoint: CGPointMake(79.77, 74.33)];
    [reflectionPath addCurveToPoint: CGPointMake(80.95, 74.45) controlPoint1: CGPointMake(80.13, 74.41) controlPoint2: CGPointMake(80.53, 74.45)];
    [reflectionPath addCurveToPoint: CGPointMake(82.12, 74.33) controlPoint1: CGPointMake(81.36, 74.45) controlPoint2: CGPointMake(81.76, 74.41)];
    [reflectionPath closePath];
    CGContextSaveGState(context);
    [reflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(68, 76.52), CGPointMake(68, 55), 0);
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
