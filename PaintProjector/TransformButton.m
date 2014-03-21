//
//  TransformButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "TransformButton.h"

@implementation TransformButton

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
    BOOL isHighlighted = self.tag == 1;
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = isHighlighted ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconHighlightColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0 + 1) green: (iconColorRGBA[1] * 0 + 1) blue: (iconColorRGBA[2] * 0 + 1) alpha: (iconColorRGBA[3] * 0 + 1)];
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.5) green: (iconColorRGBA[1] * 0.5) blue: (iconColorRGBA[2] * 0.5) alpha: (iconColorRGBA[3] * 0.5 + 0.5)];
    UIColor* gradientColor = [iconColor colorWithAlphaComponent: 0.05];
    UIColor* icongGlowFadeColor = [iconColor colorWithAlphaComponent: 0];
    UIColor* iconGlowGradientColor = [iconColor colorWithAlphaComponent: 0.23];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
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
    NSString* textContent = @"Transform";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// transformIcon Drawing
    UIBezierPath* transformIconPath = [UIBezierPath bezierPath];
    [transformIconPath moveToPoint: CGPointMake(70.25, 18.13)];
    [transformIconPath addLineToPoint: CGPointMake(65.29, 18.13)];
    [transformIconPath addLineToPoint: CGPointMake(65.29, 29.28)];
    [transformIconPath addLineToPoint: CGPointMake(76.16, 29.28)];
    [transformIconPath addLineToPoint: CGPointMake(76.04, 24.37)];
    [transformIconPath addLineToPoint: CGPointMake(83.54, 30.84)];
    [transformIconPath addLineToPoint: CGPointMake(76.38, 37.93)];
    [transformIconPath addLineToPoint: CGPointMake(76.25, 32.71)];
    [transformIconPath addLineToPoint: CGPointMake(65.29, 32.71)];
    [transformIconPath addLineToPoint: CGPointMake(65.29, 43.96)];
    [transformIconPath addLineToPoint: CGPointMake(70.1, 43.85)];
    [transformIconPath addLineToPoint: CGPointMake(63.77, 51.5)];
    [transformIconPath addLineToPoint: CGPointMake(56.82, 44.19)];
    [transformIconPath addLineToPoint: CGPointMake(61.94, 44.06)];
    [transformIconPath addLineToPoint: CGPointMake(61.94, 32.71)];
    [transformIconPath addLineToPoint: CGPointMake(50.87, 32.71)];
    [transformIconPath addLineToPoint: CGPointMake(50.87, 37.78)];
    [transformIconPath addLineToPoint: CGPointMake(43.54, 30.99)];
    [transformIconPath addLineToPoint: CGPointMake(50.87, 24.21)];
    [transformIconPath addLineToPoint: CGPointMake(50.87, 29.28)];
    [transformIconPath addLineToPoint: CGPointMake(61.94, 29.28)];
    [transformIconPath addLineToPoint: CGPointMake(61.94, 18.13)];
    [transformIconPath addLineToPoint: CGPointMake(56.97, 18.13)];
    [transformIconPath addLineToPoint: CGPointMake(63.61, 11.5)];
    [transformIconPath addLineToPoint: CGPointMake(70.25, 18.13)];
    [transformIconPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [transformIconPath fill];
    
    ////// transformIcon Inner Shadow
    CGRect transformIconBorderRect = CGRectInset([transformIconPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    transformIconBorderRect = CGRectOffset(transformIconBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    transformIconBorderRect = CGRectInset(CGRectUnion(transformIconBorderRect, [transformIconPath bounds]), -1, -1);
    
    UIBezierPath* transformIconNegativePath = [UIBezierPath bezierPathWithRect: transformIconBorderRect];
    [transformIconNegativePath appendPath: transformIconPath];
    transformIconNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(transformIconBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [transformIconPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(transformIconBorderRect.size.width), 0);
        [transformIconNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [transformIconNegativePath fill];
    }
    CGContextRestoreGState(context);
    
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
    
    
    //// transformIcon 2 Drawing
    UIBezierPath* transformIcon2Path = [UIBezierPath bezierPath];
    [transformIcon2Path moveToPoint: CGPointMake(70.25, 54.32)];
    [transformIcon2Path addLineToPoint: CGPointMake(65.29, 54.32)];
    [transformIcon2Path addLineToPoint: CGPointMake(65.29, 59.89)];
    [transformIcon2Path addLineToPoint: CGPointMake(76.16, 59.89)];
    [transformIcon2Path addLineToPoint: CGPointMake(76.04, 57.44)];
    [transformIcon2Path addLineToPoint: CGPointMake(83.54, 60.67)];
    [transformIcon2Path addLineToPoint: CGPointMake(76.38, 64.22)];
    [transformIcon2Path addLineToPoint: CGPointMake(76.25, 61.6)];
    [transformIcon2Path addLineToPoint: CGPointMake(65.29, 61.6)];
    [transformIcon2Path addLineToPoint: CGPointMake(65.29, 67.23)];
    [transformIcon2Path addLineToPoint: CGPointMake(70.1, 67.17)];
    [transformIcon2Path addLineToPoint: CGPointMake(63.77, 71)];
    [transformIcon2Path addLineToPoint: CGPointMake(56.82, 67.34)];
    [transformIcon2Path addLineToPoint: CGPointMake(61.94, 67.28)];
    [transformIcon2Path addLineToPoint: CGPointMake(61.94, 61.6)];
    [transformIcon2Path addLineToPoint: CGPointMake(50.87, 61.6)];
    [transformIcon2Path addLineToPoint: CGPointMake(50.87, 64.14)];
    [transformIcon2Path addLineToPoint: CGPointMake(43.54, 60.75)];
    [transformIcon2Path addLineToPoint: CGPointMake(50.87, 57.36)];
    [transformIcon2Path addLineToPoint: CGPointMake(50.87, 59.89)];
    [transformIcon2Path addLineToPoint: CGPointMake(61.94, 59.89)];
    [transformIcon2Path addLineToPoint: CGPointMake(61.94, 54.32)];
    [transformIcon2Path addLineToPoint: CGPointMake(56.97, 54.32)];
    [transformIcon2Path addLineToPoint: CGPointMake(63.61, 51)];
    [transformIcon2Path addLineToPoint: CGPointMake(70.25, 54.32)];
    [transformIcon2Path closePath];
    CGContextSaveGState(context);
    [transformIcon2Path addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(63.54, 51), CGPointMake(63.54, 71), 0);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
//    CGRect textRect = CGRectMake(35, 57, 61, 12);
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
//    [iconColor setFill];
//    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
//    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(gradient);
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
