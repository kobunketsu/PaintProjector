//
//  ImportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ImportButton.h"

@implementation ImportButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    UIGraphicsPushContext(ctx);
    
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = self.isHighlighted ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.675) green: (iconColorRGBA[1] * 0.675) blue: (iconColorRGBA[2] * 0.675) alpha: (iconColorRGBA[3] * 0.675 + 0.325)];
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
    NSString* textContent = @"Import";
    
    
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
    
    
    //// importReflection
    {
        //// arrow 2 Drawing
        UIBezierPath* arrow2Path = [UIBezierPath bezierPath];
        [arrow2Path moveToPoint: CGPointMake(79.12, 58.71)];
        [arrow2Path addCurveToPoint: CGPointMake(72.24, 59.52) controlPoint1: CGPointMake(76.31, 59.65) controlPoint2: CGPointMake(72.24, 59.52)];
        [arrow2Path addLineToPoint: CGPointMake(72.24, 56.82)];
        [arrow2Path addCurveToPoint: CGPointMake(77.98, 54.33) controlPoint1: CGPointMake(72.24, 56.82) controlPoint2: CGPointMake(77.98, 57.53)];
        [arrow2Path addCurveToPoint: CGPointMake(77.98, 51.45) controlPoint1: CGPointMake(77.98, 51.13) controlPoint2: CGPointMake(77.98, 51.45)];
        [arrow2Path addLineToPoint: CGPointMake(74.54, 51.45)];
        [arrow2Path addLineToPoint: CGPointMake(80.27, 49.14)];
        [arrow2Path addLineToPoint: CGPointMake(86, 51.45)];
        [arrow2Path addLineToPoint: CGPointMake(82.56, 51.45)];
        [arrow2Path addCurveToPoint: CGPointMake(82.56, 54.91) controlPoint1: CGPointMake(82.56, 51.45) controlPoint2: CGPointMake(82.56, 51.85)];
        [arrow2Path addCurveToPoint: CGPointMake(79.12, 58.71) controlPoint1: CGPointMake(82.56, 56.28) controlPoint2: CGPointMake(81.41, 57.95)];
        [arrow2Path closePath];
        CGContextSaveGState(context);
        [arrow2Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(79.12, 49.14), CGPointMake(79.12, 59.53), 0);
        CGContextRestoreGState(context);
        
        
        //// image 2 Drawing
        UIBezierPath* image2Path = [UIBezierPath bezierPath];
        [image2Path moveToPoint: CGPointMake(60.5, 60.57)];
        [image2Path addCurveToPoint: CGPointMake(60.48, 58.42) controlPoint1: CGPointMake(59.38, 59.98) controlPoint2: CGPointMake(59.36, 59.02)];
        [image2Path addCurveToPoint: CGPointMake(64.53, 58.4) controlPoint1: CGPointMake(61.59, 57.82) controlPoint2: CGPointMake(63.4, 57.81)];
        [image2Path addCurveToPoint: CGPointMake(64.56, 60.56) controlPoint1: CGPointMake(65.66, 58.99) controlPoint2: CGPointMake(65.67, 59.96)];
        [image2Path addCurveToPoint: CGPointMake(60.5, 60.57) controlPoint1: CGPointMake(63.45, 61.15) controlPoint2: CGPointMake(61.63, 61.16)];
        [image2Path closePath];
        [image2Path moveToPoint: CGPointMake(47.04, 59.24)];
        [image2Path addLineToPoint: CGPointMake(42.39, 54.38)];
        [image2Path addLineToPoint: CGPointMake(68.75, 54.29)];
        [image2Path addLineToPoint: CGPointMake(57.33, 57.37)];
        [image2Path addLineToPoint: CGPointMake(52.73, 56.17)];
        [image2Path addLineToPoint: CGPointMake(47.04, 59.24)];
        [image2Path closePath];
        [image2Path moveToPoint: CGPointMake(70, 61.59)];
        [image2Path addLineToPoint: CGPointMake(69.91, 54.89)];
        [image2Path addCurveToPoint: CGPointMake(67.6, 53.68) controlPoint1: CGPointMake(69.9, 54.22) controlPoint2: CGPointMake(68.86, 53.68)];
        [image2Path addLineToPoint: CGPointMake(42.38, 53.77)];
        [image2Path addCurveToPoint: CGPointMake(40.1, 55) controlPoint1: CGPointMake(41.11, 53.78) controlPoint2: CGPointMake(40.09, 54.33)];
        [image2Path addLineToPoint: CGPointMake(40.19, 61.7)];
        [image2Path addCurveToPoint: CGPointMake(42.5, 62.91) controlPoint1: CGPointMake(40.2, 62.37) controlPoint2: CGPointMake(41.23, 62.92)];
        [image2Path addLineToPoint: CGPointMake(67.72, 62.82)];
        [image2Path addCurveToPoint: CGPointMake(70, 61.59) controlPoint1: CGPointMake(68.98, 62.81) controlPoint2: CGPointMake(70, 62.26)];
        [image2Path closePath];
        CGContextSaveGState(context);
        [image2Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(55.05, 53.68), CGPointMake(55.05, 62.91), 0);
        CGContextRestoreGState(context);
    }
    
    
    //// importIcon
    {
        //// layer Drawing
        UIBezierPath* layerPath = [UIBezierPath bezierPath];
        [layerPath moveToPoint: CGPointMake(41.29, 49.44)];
        [layerPath addCurveToPoint: CGPointMake(43.28, 51.74) controlPoint1: CGPointMake(41.29, 50.71) controlPoint2: CGPointMake(42.18, 51.74)];
        [layerPath addLineToPoint: CGPointMake(79.05, 51.74)];
        [layerPath addCurveToPoint: CGPointMake(81.03, 49.44) controlPoint1: CGPointMake(80.14, 51.74) controlPoint2: CGPointMake(81.03, 50.71)];
        [layerPath addLineToPoint: CGPointMake(86, 43.7)];
        [layerPath addCurveToPoint: CGPointMake(84.01, 41.4) controlPoint1: CGPointMake(86, 42.43) controlPoint2: CGPointMake(85.11, 41.4)];
        [layerPath addLineToPoint: CGPointMake(48.25, 41.4)];
        [layerPath addCurveToPoint: CGPointMake(46.26, 43.7) controlPoint1: CGPointMake(47.15, 41.4) controlPoint2: CGPointMake(46.26, 42.43)];
        [layerPath addLineToPoint: CGPointMake(41.29, 49.44)];
        [layerPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [layerPath fill];
        
        ////// layer Inner Shadow
        CGRect layerBorderRect = CGRectInset([layerPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        layerBorderRect = CGRectOffset(layerBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        layerBorderRect = CGRectInset(CGRectUnion(layerBorderRect, [layerPath bounds]), -1, -1);
        
        UIBezierPath* layerNegativePath = [UIBezierPath bezierPathWithRect: layerBorderRect];
        [layerNegativePath appendPath: layerPath];
        layerNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(layerBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [layerPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(layerBorderRect.size.width), 0);
            [layerNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [layerNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// image Drawing
        UIBezierPath* imagePath = [UIBezierPath bezierPath];
        [imagePath moveToPoint: CGPointMake(60.5, 17.58)];
        [imagePath addCurveToPoint: CGPointMake(60.48, 21.75) controlPoint1: CGPointMake(59.38, 18.73) controlPoint2: CGPointMake(59.36, 20.59)];
        [imagePath addCurveToPoint: CGPointMake(64.53, 21.78) controlPoint1: CGPointMake(61.59, 22.9) controlPoint2: CGPointMake(63.4, 22.92)];
        [imagePath addCurveToPoint: CGPointMake(64.56, 17.61) controlPoint1: CGPointMake(65.66, 20.63) controlPoint2: CGPointMake(65.67, 18.77)];
        [imagePath addCurveToPoint: CGPointMake(60.5, 17.58) controlPoint1: CGPointMake(63.45, 16.46) controlPoint2: CGPointMake(61.63, 16.44)];
        [imagePath closePath];
        [imagePath moveToPoint: CGPointMake(47.04, 20.16)];
        [imagePath addLineToPoint: CGPointMake(42.39, 29.54)];
        [imagePath addLineToPoint: CGPointMake(68.75, 29.73)];
        [imagePath addLineToPoint: CGPointMake(57.33, 23.76)];
        [imagePath addLineToPoint: CGPointMake(52.73, 26.08)];
        [imagePath addLineToPoint: CGPointMake(47.04, 20.16)];
        [imagePath closePath];
        [imagePath moveToPoint: CGPointMake(70, 15.61)];
        [imagePath addLineToPoint: CGPointMake(69.91, 28.56)];
        [imagePath addCurveToPoint: CGPointMake(67.6, 30.9) controlPoint1: CGPointMake(69.9, 29.86) controlPoint2: CGPointMake(68.86, 30.91)];
        [imagePath addLineToPoint: CGPointMake(42.38, 30.72)];
        [imagePath addCurveToPoint: CGPointMake(40.1, 28.35) controlPoint1: CGPointMake(41.11, 30.71) controlPoint2: CGPointMake(40.09, 29.65)];
        [imagePath addLineToPoint: CGPointMake(40.19, 15.4)];
        [imagePath addCurveToPoint: CGPointMake(42.5, 13.06) controlPoint1: CGPointMake(40.2, 14.1) controlPoint2: CGPointMake(41.23, 13.05)];
        [imagePath addLineToPoint: CGPointMake(67.72, 13.24)];
        [imagePath addCurveToPoint: CGPointMake(70, 15.61) controlPoint1: CGPointMake(68.98, 13.25) controlPoint2: CGPointMake(70, 14.31)];
        [imagePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [imagePath fill];
        
        ////// image Inner Shadow
        CGRect imageBorderRect = CGRectInset([imagePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        imageBorderRect = CGRectOffset(imageBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        imageBorderRect = CGRectInset(CGRectUnion(imageBorderRect, [imagePath bounds]), -1, -1);
        
        UIBezierPath* imageNegativePath = [UIBezierPath bezierPathWithRect: imageBorderRect];
        [imageNegativePath appendPath: imagePath];
        imageNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(imageBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [imagePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(imageBorderRect.size.width), 0);
            [imageNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [imageNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// arrow Drawing
        UIBezierPath* arrowPath = [UIBezierPath bezierPath];
        [arrowPath moveToPoint: CGPointMake(79.12, 21.87)];
        [arrowPath addCurveToPoint: CGPointMake(72.24, 20.21) controlPoint1: CGPointMake(76.31, 19.96) controlPoint2: CGPointMake(72.24, 20.21)];
        [arrowPath addLineToPoint: CGPointMake(72.24, 25.74)];
        [arrowPath addCurveToPoint: CGPointMake(77.98, 30.81) controlPoint1: CGPointMake(72.24, 25.74) controlPoint2: CGPointMake(77.98, 24.27)];
        [arrowPath addCurveToPoint: CGPointMake(77.98, 36.7) controlPoint1: CGPointMake(77.98, 37.35) controlPoint2: CGPointMake(77.98, 36.7)];
        [arrowPath addLineToPoint: CGPointMake(74.54, 36.7)];
        [arrowPath addLineToPoint: CGPointMake(80.27, 41.4)];
        [arrowPath addLineToPoint: CGPointMake(86, 36.7)];
        [arrowPath addLineToPoint: CGPointMake(82.56, 36.7)];
        [arrowPath addCurveToPoint: CGPointMake(82.56, 29.63) controlPoint1: CGPointMake(82.56, 36.7) controlPoint2: CGPointMake(82.56, 35.87)];
        [arrowPath addCurveToPoint: CGPointMake(79.12, 21.87) controlPoint1: CGPointMake(82.56, 26.83) controlPoint2: CGPointMake(81.41, 23.43)];
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
        
    }
    
    
    //// Text Drawing
//    CGRect textRect = CGRectMake(33, 57, 61, 18);
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
//    [iconColor setFill];
//    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
//    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    

    
    UIGraphicsPopContext();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
   
   
}
*/

@end
