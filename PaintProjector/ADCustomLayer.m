//
//  CustomLayer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCustomLayer.h"

@implementation ADCustomLayer

-(id)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        // Initialization code
        _baseColorR = 0.5;
        _baseColorG = 0.5;
        _baseColorB = 0.5;
    }
    return self;
}


+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"baseColorR"] || [key isEqualToString:@"baseColorG"] || [key isEqualToString:@"baseColorB"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

//- (id<CAAction>)actionForKey:(NSString *)event{
//    
//}


//-(void)drawInContext:(CGContextRef)ctx{
//    DebugLog(@"CustomLayer drawInContext");
//    
//    UIGraphicsPushContext(ctx);
//
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Color Declarations
//    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
//    UIColor* iconColor = [UIColor colorWithCGColor:self.baseColor];
//    CGFloat iconColorRGBA[4];
//    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
//    
//    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.675) green: (iconColorRGBA[1] * 0.675) blue: (iconColorRGBA[2] * 0.675) alpha: (iconColorRGBA[3] * 0.675 + 0.325)];
//    UIColor* iconGlowGradientColor = [iconColor colorWithAlphaComponent: 0.23];
//    UIColor* iconColorA50 = [iconColor colorWithAlphaComponent: 0.5];
//    UIColor* iconColorA75 = [iconColor colorWithAlphaComponent: 0.75];
//    UIColor* iconGlowGradientColor2 = [iconColor colorWithAlphaComponent: 0];
//    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    UIColor* iconReflectionColor = [UIColor colorWithRed: 0.849 green: 0.849 blue: 0.849 alpha: 0];
//    
//    //// Gradient Declarations
//    NSArray* iconReflectionColors = [NSArray arrayWithObjects:
//                                     (id)iconColorA50.CGColor,
//                                     (id)iconReflectionColor.CGColor, nil];
//    CGFloat iconReflectionLocations[] = {0, 1};
//    CGGradientRef iconReflection = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconReflectionColors, iconReflectionLocations);
//    NSArray* iconGlowGradientColors = [NSArray arrayWithObjects:
//                                       (id)iconGlowGradientColor.CGColor,
//                                       (id)iconGlowGradientColor2.CGColor, nil];
//    CGFloat iconGlowGradientLocations[] = {0, 1};
//    CGGradientRef iconGlowGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconGlowGradientColors, iconGlowGradientLocations);
//    
//    //// Shadow Declarations
//    UIColor* iconHighlight = iconHighlightColor;
//    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
//    CGFloat iconHighlightBlurRadius = 0;
//    UIColor* iconShadow = iconShadowColorColor;
//    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
//    CGFloat iconShadowBlurRadius = 0;
//    UIColor* labelHightlight = labelHightlightColor;
//    CGSize labelHightlightOffset = CGSizeMake(0.1, 1.1);
//    CGFloat labelHightlightBlurRadius = 0;
//    
//    //// Abstracted Attributes
//    NSString* textContent = @"Layer";
//    
//    
//    //// Rectangle Drawing
//    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
//    CGContextRestoreGState(context);
//    
//    
//    
//    //// Oval Drawing
//    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -41, 131, 112)];
//    CGContextSaveGState(context);
//    [ovalPath addClip];
//    CGContextDrawRadialGradient(context, iconGlowGradient,
//                                CGPointMake(64.05, 25.12), 4.84,
//                                CGPointMake(63.76, 57.6), 47.32,
//                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
//    CGContextRestoreGState(context);
//    
//    
//    //// Text Drawing
//    CGRect textRect = CGRectMake(33, 57, 61, 18);
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
//    [iconColor setFill];
//    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
//    CGContextRestoreGState(context);
//    
//    
//    
//    //// layerIcon
//    {
//        //// Rounded Rectangle Drawing
//        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
//        [roundedRectanglePath moveToPoint: CGPointMake(44, 18.83)];
//        [roundedRectanglePath addCurveToPoint: CGPointMake(45.73, 20.78) controlPoint1: CGPointMake(44, 19.9) controlPoint2: CGPointMake(44.78, 20.78)];
//        [roundedRectanglePath addLineToPoint: CGPointMake(76.93, 20.78)];
//        [roundedRectanglePath addCurveToPoint: CGPointMake(78.67, 18.83) controlPoint1: CGPointMake(77.89, 20.78) controlPoint2: CGPointMake(78.67, 19.9)];
//        [roundedRectanglePath addLineToPoint: CGPointMake(83, 13.95)];
//        [roundedRectanglePath addCurveToPoint: CGPointMake(81.27, 12) controlPoint1: CGPointMake(83, 12.87) controlPoint2: CGPointMake(82.22, 12)];
//        [roundedRectanglePath addLineToPoint: CGPointMake(50.07, 12)];
//        [roundedRectanglePath addCurveToPoint: CGPointMake(48.33, 13.95) controlPoint1: CGPointMake(49.11, 12) controlPoint2: CGPointMake(48.33, 12.87)];
//        [roundedRectanglePath addLineToPoint: CGPointMake(44, 18.83)];
//        [roundedRectanglePath closePath];
//        CGContextSaveGState(context);
//        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
//        [iconColorA50 setFill];
//        [roundedRectanglePath fill];
//        
//        ////// Rounded Rectangle Inner Shadow
//        CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
//        roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
//        roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1, -1);
//        
//        UIBezierPath* roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
//        [roundedRectangleNegativePath appendPath: roundedRectanglePath];
//        roundedRectangleNegativePath.usesEvenOddFillRule = YES;
//        
//        CGContextSaveGState(context);
//        {
//            CGFloat xOffset = iconShadowOffset.width + round(roundedRectangleBorderRect.size.width);
//            CGFloat yOffset = iconShadowOffset.height;
//            CGContextSetShadowWithColor(context,
//                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
//                                        iconShadowBlurRadius,
//                                        iconShadow.CGColor);
//            
//            [roundedRectanglePath addClip];
//            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangleBorderRect.size.width), 0);
//            [roundedRectangleNegativePath applyTransform: transform];
//            [[UIColor grayColor] setFill];
//            [roundedRectangleNegativePath fill];
//        }
//        CGContextRestoreGState(context);
//        
//        CGContextRestoreGState(context);
//        
//        
//        
//        //// Rounded Rectangle 2 Drawing
//        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
//        [roundedRectangle2Path moveToPoint: CGPointMake(44, 33.94)];
//        [roundedRectangle2Path addCurveToPoint: CGPointMake(45.73, 35.89) controlPoint1: CGPointMake(44, 35.01) controlPoint2: CGPointMake(44.78, 35.89)];
//        [roundedRectangle2Path addLineToPoint: CGPointMake(76.93, 35.89)];
//        [roundedRectangle2Path addCurveToPoint: CGPointMake(78.67, 33.94) controlPoint1: CGPointMake(77.89, 35.89) controlPoint2: CGPointMake(78.67, 35.01)];
//        [roundedRectangle2Path addLineToPoint: CGPointMake(83, 29.06)];
//        [roundedRectangle2Path addCurveToPoint: CGPointMake(81.27, 27.11) controlPoint1: CGPointMake(83, 27.99) controlPoint2: CGPointMake(82.22, 27.11)];
//        [roundedRectangle2Path addLineToPoint: CGPointMake(50.07, 27.11)];
//        [roundedRectangle2Path addCurveToPoint: CGPointMake(48.33, 29.06) controlPoint1: CGPointMake(49.11, 27.11) controlPoint2: CGPointMake(48.33, 27.99)];
//        [roundedRectangle2Path addLineToPoint: CGPointMake(44, 33.94)];
//        [roundedRectangle2Path closePath];
//        CGContextSaveGState(context);
//        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
//        [iconColorA75 setFill];
//        [roundedRectangle2Path fill];
//        
//        ////// Rounded Rectangle 2 Inner Shadow
//        CGRect roundedRectangle2BorderRect = CGRectInset([roundedRectangle2Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
//        roundedRectangle2BorderRect = CGRectOffset(roundedRectangle2BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
//        roundedRectangle2BorderRect = CGRectInset(CGRectUnion(roundedRectangle2BorderRect, [roundedRectangle2Path bounds]), -1, -1);
//        
//        UIBezierPath* roundedRectangle2NegativePath = [UIBezierPath bezierPathWithRect: roundedRectangle2BorderRect];
//        [roundedRectangle2NegativePath appendPath: roundedRectangle2Path];
//        roundedRectangle2NegativePath.usesEvenOddFillRule = YES;
//        
//        CGContextSaveGState(context);
//        {
//            CGFloat xOffset = iconShadowOffset.width + round(roundedRectangle2BorderRect.size.width);
//            CGFloat yOffset = iconShadowOffset.height;
//            CGContextSetShadowWithColor(context,
//                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
//                                        iconShadowBlurRadius,
//                                        iconShadow.CGColor);
//            
//            [roundedRectangle2Path addClip];
//            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangle2BorderRect.size.width), 0);
//            [roundedRectangle2NegativePath applyTransform: transform];
//            [[UIColor grayColor] setFill];
//            [roundedRectangle2NegativePath fill];
//        }
//        CGContextRestoreGState(context);
//        
//        CGContextRestoreGState(context);
//        
//        
//        
//        //// Rounded Rectangle 3 Drawing
//        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPath];
//        [roundedRectangle3Path moveToPoint: CGPointMake(44, 48.56)];
//        [roundedRectangle3Path addCurveToPoint: CGPointMake(45.73, 50.51) controlPoint1: CGPointMake(44, 49.64) controlPoint2: CGPointMake(44.78, 50.51)];
//        [roundedRectangle3Path addLineToPoint: CGPointMake(76.93, 50.51)];
//        [roundedRectangle3Path addCurveToPoint: CGPointMake(78.67, 48.56) controlPoint1: CGPointMake(77.89, 50.51) controlPoint2: CGPointMake(78.67, 49.64)];
//        [roundedRectangle3Path addLineToPoint: CGPointMake(83, 43.69)];
//        [roundedRectangle3Path addCurveToPoint: CGPointMake(81.27, 41.74) controlPoint1: CGPointMake(83, 42.61) controlPoint2: CGPointMake(82.22, 41.74)];
//        [roundedRectangle3Path addLineToPoint: CGPointMake(50.07, 41.74)];
//        [roundedRectangle3Path addCurveToPoint: CGPointMake(48.33, 43.69) controlPoint1: CGPointMake(49.11, 41.74) controlPoint2: CGPointMake(48.33, 42.61)];
//        [roundedRectangle3Path addLineToPoint: CGPointMake(44, 48.56)];
//        [roundedRectangle3Path closePath];
//        CGContextSaveGState(context);
//        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
//        [iconColor setFill];
//        [roundedRectangle3Path fill];
//        
//        ////// Rounded Rectangle 3 Inner Shadow
//        CGRect roundedRectangle3BorderRect = CGRectInset([roundedRectangle3Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
//        roundedRectangle3BorderRect = CGRectOffset(roundedRectangle3BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
//        roundedRectangle3BorderRect = CGRectInset(CGRectUnion(roundedRectangle3BorderRect, [roundedRectangle3Path bounds]), -1, -1);
//        
//        UIBezierPath* roundedRectangle3NegativePath = [UIBezierPath bezierPathWithRect: roundedRectangle3BorderRect];
//        [roundedRectangle3NegativePath appendPath: roundedRectangle3Path];
//        roundedRectangle3NegativePath.usesEvenOddFillRule = YES;
//        
//        CGContextSaveGState(context);
//        {
//            CGFloat xOffset = iconShadowOffset.width + round(roundedRectangle3BorderRect.size.width);
//            CGFloat yOffset = iconShadowOffset.height;
//            CGContextSetShadowWithColor(context,
//                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
//                                        iconShadowBlurRadius,
//                                        iconShadow.CGColor);
//            
//            [roundedRectangle3Path addClip];
//            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangle3BorderRect.size.width), 0);
//            [roundedRectangle3NegativePath applyTransform: transform];
//            [[UIColor grayColor] setFill];
//            [roundedRectangle3NegativePath fill];
//        }
//        CGContextRestoreGState(context);
//        
//        CGContextRestoreGState(context);
//        
//    }
//    
//    
//    //// Bezier Drawing
//    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
//    [bezierPath moveToPoint: CGPointMake(44, 56.54)];
//    [bezierPath addCurveToPoint: CGPointMake(45.73, 57.56) controlPoint1: CGPointMake(44, 57.1) controlPoint2: CGPointMake(44.78, 57.56)];
//    [bezierPath addLineToPoint: CGPointMake(76.93, 57.56)];
//    [bezierPath addCurveToPoint: CGPointMake(78.67, 56.54) controlPoint1: CGPointMake(77.89, 57.56) controlPoint2: CGPointMake(78.67, 57.1)];
//    [bezierPath addLineToPoint: CGPointMake(83, 54.01)];
//    [bezierPath addCurveToPoint: CGPointMake(81.27, 53) controlPoint1: CGPointMake(83, 53.45) controlPoint2: CGPointMake(82.22, 53)];
//    [bezierPath addLineToPoint: CGPointMake(50.07, 53)];
//    [bezierPath addCurveToPoint: CGPointMake(48.33, 54.01) controlPoint1: CGPointMake(49.11, 53) controlPoint2: CGPointMake(48.33, 53.45)];
//    [bezierPath addLineToPoint: CGPointMake(44, 56.54)];
//    [bezierPath closePath];
//    [bezierPath moveToPoint: CGPointMake(44, 64.39)];
//    [bezierPath addCurveToPoint: CGPointMake(45.73, 65.41) controlPoint1: CGPointMake(44, 64.95) controlPoint2: CGPointMake(44.78, 65.41)];
//    [bezierPath addLineToPoint: CGPointMake(76.93, 65.41)];
//    [bezierPath addCurveToPoint: CGPointMake(78.67, 64.39) controlPoint1: CGPointMake(77.89, 65.41) controlPoint2: CGPointMake(78.67, 64.95)];
//    [bezierPath addLineToPoint: CGPointMake(83, 61.86)];
//    [bezierPath addCurveToPoint: CGPointMake(81.27, 60.85) controlPoint1: CGPointMake(83, 61.3) controlPoint2: CGPointMake(82.22, 60.85)];
//    [bezierPath addLineToPoint: CGPointMake(50.07, 60.85)];
//    [bezierPath addCurveToPoint: CGPointMake(48.33, 61.86) controlPoint1: CGPointMake(49.11, 60.85) controlPoint2: CGPointMake(48.33, 61.3)];
//    [bezierPath addLineToPoint: CGPointMake(44, 64.39)];
//    [bezierPath closePath];
//    [bezierPath moveToPoint: CGPointMake(44, 71.99)];
//    [bezierPath addCurveToPoint: CGPointMake(45.73, 73) controlPoint1: CGPointMake(44, 72.55) controlPoint2: CGPointMake(44.78, 73)];
//    [bezierPath addLineToPoint: CGPointMake(76.93, 73)];
//    [bezierPath addCurveToPoint: CGPointMake(78.67, 71.99) controlPoint1: CGPointMake(77.89, 73) controlPoint2: CGPointMake(78.67, 72.55)];
//    [bezierPath addLineToPoint: CGPointMake(83, 69.46)];
//    [bezierPath addCurveToPoint: CGPointMake(81.27, 68.44) controlPoint1: CGPointMake(83, 68.9) controlPoint2: CGPointMake(82.22, 68.44)];
//    [bezierPath addLineToPoint: CGPointMake(50.07, 68.44)];
//    [bezierPath addCurveToPoint: CGPointMake(48.33, 69.46) controlPoint1: CGPointMake(49.11, 68.44) controlPoint2: CGPointMake(48.33, 68.9)];
//    [bezierPath addLineToPoint: CGPointMake(44, 71.99)];
//    [bezierPath closePath];
//    CGContextSaveGState(context);
//    [bezierPath addClip];
//    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(63.5, 53), CGPointMake(63.5, 73), 0);
//    CGContextRestoreGState(context);
//    
//    
//    //// Cleanup
//    CGGradientRelease(iconReflection);
//    CGGradientRelease(iconGlowGradient);
//    CGColorSpaceRelease(colorSpace);
//    
//
//    UIGraphicsPopContext();
//
//    [super drawInContext:ctx];
//}


@end
