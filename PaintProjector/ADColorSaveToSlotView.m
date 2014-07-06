//
//  ColorSaveToSlotView.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADColorSaveToSlotView.h"

@implementation ADColorSaveToSlotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _color = [UIColor redColor];
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
    CGFloat colorRGBA[4];
    [self.color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    CGFloat colorHSBA[4];
    [self.color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
    
    UIColor* color2 = [UIColor colorWithRed: (colorRGBA[0] * 0.6 + 0.4) green: (colorRGBA[1] * 0.6 + 0.4) blue: (colorRGBA[2] * 0.6 + 0.4) alpha: (colorRGBA[3] * 0.6 + 0.4)];
    UIColor* shadowColor2 = [UIColor colorWithHue: colorHSBA[0] saturation: colorHSBA[1] brightness: 0.7 alpha: colorHSBA[3]];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)self.color.CGColor,
                               (id)color2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 3.1);
    CGFloat shadowBlurRadius = 5;
    UIColor* shadow2 = shadowColor2;
    CGSize shadow2Offset = CGSizeMake(0.1, -3.1);
    CGFloat shadow2BlurRadius = 9.5;
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath moveToPoint: CGPointMake(31.96, 32.96)];
    [ovalPath addCurveToPoint: CGPointMake(31.96, 11.04) controlPoint1: CGPointMake(38.01, 26.91) controlPoint2: CGPointMake(38.01, 17.09)];
    [ovalPath addCurveToPoint: CGPointMake(20.79, -0.5) controlPoint1: CGPointMake(28.88, 7.96) controlPoint2: CGPointMake(20.79, -0.5)];
    [ovalPath addCurveToPoint: CGPointMake(10.04, 11.04) controlPoint1: CGPointMake(20.79, -0.5) controlPoint2: CGPointMake(13.01, 8.07)];
    [ovalPath addCurveToPoint: CGPointMake(10.04, 32.96) controlPoint1: CGPointMake(3.99, 17.09) controlPoint2: CGPointMake(3.99, 26.91)];
    [ovalPath addCurveToPoint: CGPointMake(31.96, 32.96) controlPoint1: CGPointMake(16.09, 39.01) controlPoint2: CGPointMake(25.91, 39.01)];
    [ovalPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, gradient,
                                CGPointMake(21.1, 23.23), 1.64,
                                CGPointMake(22.37, 35.58), 25.85,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextEndTransparencyLayer(context);
    
    ////// Oval Inner Shadow
    CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadow2BlurRadius, -shadow2BlurRadius);
    ovalBorderRect = CGRectOffset(ovalBorderRect, -shadow2Offset.width, -shadow2Offset.height);
    ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
    
    UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
    [ovalNegativePath appendPath: ovalPath];
    ovalNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadow2Offset.width + round(ovalBorderRect.size.width);
        CGFloat yOffset = shadow2Offset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadow2BlurRadius,
                                    shadow2.CGColor);
        
        [ovalPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
        [ovalNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [ovalNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
