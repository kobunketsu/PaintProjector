//
//  ExportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ExportButton.h"

@implementation ExportButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0.511 green: 0.352 blue: 0.707 alpha: 1];
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
    NSString* textContent = @"Export";
    
    
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
    
    
    //// importIcon
    {
        //// arrow Drawing
        UIBezierPath* arrowPath = [UIBezierPath bezierPath];
        [arrowPath moveToPoint: CGPointMake(48.19, 24.8)];
        [arrowPath addCurveToPoint: CGPointMake(47.53, 39.68) controlPoint1: CGPointMake(46.27, 27.62) controlPoint2: CGPointMake(47.53, 39.68)];
        [arrowPath addLineToPoint: CGPointMake(52.06, 39.68)];
        [arrowPath addCurveToPoint: CGPointMake(52.06, 28.73) controlPoint1: CGPointMake(52.06, 39.68) controlPoint2: CGPointMake(51.98, 33.65)];
        [arrowPath addCurveToPoint: CGPointMake(54.13, 26.95) controlPoint1: CGPointMake(52.07, 27.5) controlPoint2: CGPointMake(53.48, 26.97)];
        [arrowPath addCurveToPoint: CGPointMake(60.01, 26.95) controlPoint1: CGPointMake(56.89, 26.87) controlPoint2: CGPointMake(60.01, 26.95)];
        [arrowPath addLineToPoint: CGPointMake(60.01, 30.39)];
        [arrowPath addLineToPoint: CGPointMake(64.72, 24.66)];
        [arrowPath addLineToPoint: CGPointMake(60.01, 18.93)];
        [arrowPath addLineToPoint: CGPointMake(60.01, 22.36)];
        [arrowPath addCurveToPoint: CGPointMake(53.95, 22.36) controlPoint1: CGPointMake(60.01, 22.36) controlPoint2: CGPointMake(60.19, 22.36)];
        [arrowPath addCurveToPoint: CGPointMake(48.19, 24.8) controlPoint1: CGPointMake(51.15, 22.36) controlPoint2: CGPointMake(49.74, 22.52)];
        [arrowPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColorA50 setFill];
        [arrowPath fill];
        
        ////// arrow Inner Shadow
        CGRect arrowBorderRect = CGRectInset([arrowPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        arrowBorderRect = CGRectOffset(arrowBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        arrowBorderRect = CGRectInset(CGRectUnion(arrowBorderRect, [arrowPath bounds]), -1, -1);
        
        UIBezierPath* arrowNegativePath = [UIBezierPath bezierPathWithRect: arrowBorderRect];
        [arrowNegativePath appendPath: arrowPath];
        arrowNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(arrowBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [arrowPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(arrowBorderRect.size.width), 0);
            [arrowNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [arrowNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(71.17, 45.44)];
        [bezier2Path addCurveToPoint: CGPointMake(71.17, 47.56) controlPoint1: CGPointMake(69.61, 46.03) controlPoint2: CGPointMake(69.61, 46.97)];
        [bezier2Path addCurveToPoint: CGPointMake(76.83, 47.56) controlPoint1: CGPointMake(72.73, 48.15) controlPoint2: CGPointMake(75.27, 48.15)];
        [bezier2Path addCurveToPoint: CGPointMake(76.83, 45.44) controlPoint1: CGPointMake(78.39, 46.97) controlPoint2: CGPointMake(78.39, 46.03)];
        [bezier2Path addCurveToPoint: CGPointMake(71.17, 45.44) controlPoint1: CGPointMake(75.27, 44.85) controlPoint2: CGPointMake(72.73, 44.85)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(50, 46)];
        [bezier2Path addLineToPoint: CGPointMake(44, 51)];
        [bezier2Path addLineToPoint: CGPointMake(78, 51)];
        [bezier2Path addLineToPoint: CGPointMake(59, 48)];
        [bezier2Path addLineToPoint: CGPointMake(55, 49)];
        [bezier2Path addLineToPoint: CGPointMake(50, 46)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(86, 44.7)];
        [bezier2Path addLineToPoint: CGPointMake(81.03, 50.44)];
        [bezier2Path addCurveToPoint: CGPointMake(79.05, 52.74) controlPoint1: CGPointMake(81.03, 51.71) controlPoint2: CGPointMake(80.14, 52.74)];
        [bezier2Path addLineToPoint: CGPointMake(43.28, 52.74)];
        [bezier2Path addCurveToPoint: CGPointMake(41.29, 50.44) controlPoint1: CGPointMake(42.18, 52.74) controlPoint2: CGPointMake(41.29, 51.71)];
        [bezier2Path addLineToPoint: CGPointMake(46.26, 44.7)];
        [bezier2Path addCurveToPoint: CGPointMake(48.25, 42.4) controlPoint1: CGPointMake(46.26, 43.43) controlPoint2: CGPointMake(47.15, 42.4)];
        [bezier2Path addLineToPoint: CGPointMake(84.01, 42.4)];
        [bezier2Path addCurveToPoint: CGPointMake(86, 44.7) controlPoint1: CGPointMake(85.11, 42.4) controlPoint2: CGPointMake(86, 43.43)];
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
        
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(80.8, 16.45)];
        [bezier3Path addCurveToPoint: CGPointMake(82.54, 18.19) controlPoint1: CGPointMake(80.8, 17.41) controlPoint2: CGPointMake(81.58, 18.19)];
        [bezier3Path addLineToPoint: CGPointMake(86.02, 18.19)];
        [bezier3Path addCurveToPoint: CGPointMake(80.8, 12.98) controlPoint1: CGPointMake(86.98, 18.19) controlPoint2: CGPointMake(80.8, 12.03)];
        [bezier3Path addLineToPoint: CGPointMake(80.8, 16.45)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(79.06, 13.07)];
        [bezier3Path addLineToPoint: CGPointMake(79.06, 17.32)];
        [bezier3Path addCurveToPoint: CGPointMake(81.67, 19.92) controlPoint1: CGPointMake(79.06, 18.28) controlPoint2: CGPointMake(80.71, 19.92)];
        [bezier3Path addLineToPoint: CGPointMake(85.95, 19.92)];
        [bezier3Path addLineToPoint: CGPointMake(85.79, 36.95)];
        [bezier3Path addCurveToPoint: CGPointMake(83.15, 38.93) controlPoint1: CGPointMake(85.78, 38.05) controlPoint2: CGPointMake(84.59, 38.93)];
        [bezier3Path addLineToPoint: CGPointMake(68.73, 38.85)];
        [bezier3Path addCurveToPoint: CGPointMake(66.13, 36.85) controlPoint1: CGPointMake(67.28, 38.84) controlPoint2: CGPointMake(66.12, 37.95)];
        [bezier3Path addLineToPoint: CGPointMake(66.33, 14.99)];
        [bezier3Path addCurveToPoint: CGPointMake(68.97, 13.01) controlPoint1: CGPointMake(66.34, 13.89) controlPoint2: CGPointMake(67.52, 13.01)];
        [bezier3Path addLineToPoint: CGPointMake(79.06, 13.07)];
        [bezier3Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [bezier3Path fill];
        
        ////// Bezier 3 Inner Shadow
        CGRect bezier3BorderRect = CGRectInset([bezier3Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        bezier3BorderRect = CGRectOffset(bezier3BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        bezier3BorderRect = CGRectInset(CGRectUnion(bezier3BorderRect, [bezier3Path bounds]), -1, -1);
        
        UIBezierPath* bezier3NegativePath = [UIBezierPath bezierPathWithRect: bezier3BorderRect];
        [bezier3NegativePath appendPath: bezier3Path];
        bezier3NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(bezier3BorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [bezier3Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier3BorderRect.size.width), 0);
            [bezier3NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezier3NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 57, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// importIcon 2
    {
        //// arrow 2 Drawing
        UIBezierPath* arrow2Path = [UIBezierPath bezierPath];
        [arrow2Path moveToPoint: CGPointMake(48.19, 63.1)];
        [arrow2Path addCurveToPoint: CGPointMake(47.53, 54.16) controlPoint1: CGPointMake(46.27, 61.69) controlPoint2: CGPointMake(47.53, 54.16)];
        [arrow2Path addLineToPoint: CGPointMake(52.06, 54.16)];
        [arrow2Path addCurveToPoint: CGPointMake(52.06, 61.13) controlPoint1: CGPointMake(52.06, 54.16) controlPoint2: CGPointMake(51.98, 58.68)];
        [arrow2Path addCurveToPoint: CGPointMake(54.13, 62.02) controlPoint1: CGPointMake(52.07, 61.75) controlPoint2: CGPointMake(53.48, 62.02)];
        [arrow2Path addCurveToPoint: CGPointMake(60.01, 62.02) controlPoint1: CGPointMake(56.89, 62.07) controlPoint2: CGPointMake(60.01, 62.02)];
        [arrow2Path addLineToPoint: CGPointMake(60.01, 60.31)];
        [arrow2Path addLineToPoint: CGPointMake(64.72, 63.17)];
        [arrow2Path addLineToPoint: CGPointMake(60.01, 66.04)];
        [arrow2Path addLineToPoint: CGPointMake(60.01, 64.32)];
        [arrow2Path addCurveToPoint: CGPointMake(53.95, 64.32) controlPoint1: CGPointMake(60.01, 64.32) controlPoint2: CGPointMake(60.19, 64.32)];
        [arrow2Path addCurveToPoint: CGPointMake(48.19, 63.1) controlPoint1: CGPointMake(51.15, 64.32) controlPoint2: CGPointMake(49.74, 64.24)];
        [arrow2Path closePath];
        CGContextSaveGState(context);
        [arrow2Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(55.92, 54.16), CGPointMake(55.92, 66.04), 0);
        CGContextRestoreGState(context);
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(80.8, 65.77)];
        [bezier4Path addCurveToPoint: CGPointMake(82.54, 64.91) controlPoint1: CGPointMake(80.8, 65.3) controlPoint2: CGPointMake(81.58, 64.91)];
        [bezier4Path addLineToPoint: CGPointMake(86.02, 64.91)];
        [bezier4Path addCurveToPoint: CGPointMake(80.8, 67.51) controlPoint1: CGPointMake(86.98, 64.91) controlPoint2: CGPointMake(80.8, 67.99)];
        [bezier4Path addLineToPoint: CGPointMake(80.8, 65.77)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(79.06, 67.46)];
        [bezier4Path addLineToPoint: CGPointMake(79.06, 65.34)];
        [bezier4Path addCurveToPoint: CGPointMake(81.67, 64.04) controlPoint1: CGPointMake(79.06, 64.86) controlPoint2: CGPointMake(80.71, 64.04)];
        [bezier4Path addLineToPoint: CGPointMake(85.95, 64.04)];
        [bezier4Path addLineToPoint: CGPointMake(85.79, 55.52)];
        [bezier4Path addCurveToPoint: CGPointMake(83.15, 54.54) controlPoint1: CGPointMake(85.78, 54.97) controlPoint2: CGPointMake(84.59, 54.53)];
        [bezier4Path addLineToPoint: CGPointMake(68.73, 54.58)];
        [bezier4Path addCurveToPoint: CGPointMake(66.13, 55.58) controlPoint1: CGPointMake(67.28, 54.58) controlPoint2: CGPointMake(66.12, 55.03)];
        [bezier4Path addLineToPoint: CGPointMake(66.33, 66.51)];
        [bezier4Path addCurveToPoint: CGPointMake(68.97, 67.49) controlPoint1: CGPointMake(66.34, 67.06) controlPoint2: CGPointMake(67.52, 67.5)];
        [bezier4Path addLineToPoint: CGPointMake(79.06, 67.46)];
        [bezier4Path closePath];
        CGContextSaveGState(context);
        [bezier4Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(76.12, 54.54), CGPointMake(76.12, 67.56), 0);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    
 
    
}


@end
