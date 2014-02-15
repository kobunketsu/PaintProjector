//
//  ShareButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/31/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ShareButton.h"

@implementation ShareButton

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.271 green: 0.271 blue: 0.271 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.2 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPath];
    [oval2Path moveToPoint: CGPointMake(63.56, 67)];
    [oval2Path addCurveToPoint: CGPointMake(78.79, 55.58) controlPoint1: CGPointMake(63.56, 67) controlPoint2: CGPointMake(73.79, 60.59)];
    [oval2Path addCurveToPoint: CGPointMake(92.03, 34.02) controlPoint1: CGPointMake(84.17, 50.17) controlPoint2: CGPointMake(89.9, 43.94)];
    [oval2Path addCurveToPoint: CGPointMake(88.23, 16.84) controlPoint1: CGPointMake(94.15, 24.09) controlPoint2: CGPointMake(92.99, 21.61)];
    [oval2Path addCurveToPoint: CGPointMake(72.07, 13.95) controlPoint1: CGPointMake(85.21, 13.81) controlPoint2: CGPointMake(77.21, 11.42)];
    [oval2Path addCurveToPoint: CGPointMake(62.77, 20.58) controlPoint1: CGPointMake(68.36, 15.77) controlPoint2: CGPointMake(62.77, 20.58)];
    [oval2Path addCurveToPoint: CGPointMake(54.45, 14.74) controlPoint1: CGPointMake(62.77, 20.58) controlPoint2: CGPointMake(57.43, 16.33)];
    [oval2Path addCurveToPoint: CGPointMake(39.23, 16.84) controlPoint1: CGPointMake(49.41, 12.05) controlPoint2: CGPointMake(42.34, 13.72)];
    [oval2Path addCurveToPoint: CGPointMake(34.46, 34.96) controlPoint1: CGPointMake(34.23, 21.85) controlPoint2: CGPointMake(32.57, 25.04)];
    [oval2Path addCurveToPoint: CGPointMake(47.73, 55.58) controlPoint1: CGPointMake(36.35, 44.88) controlPoint2: CGPointMake(42.58, 50.41)];
    [oval2Path addCurveToPoint: CGPointMake(63.56, 67) controlPoint1: CGPointMake(52.88, 60.74) controlPoint2: CGPointMake(63.56, 67)];
    [oval2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [oval2Path fill];
    
    ////// Oval 2 Inner Shadow
    CGRect oval2BorderRect = CGRectInset([oval2Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    oval2BorderRect = CGRectOffset(oval2BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    oval2BorderRect = CGRectInset(CGRectUnion(oval2BorderRect, [oval2Path bounds]), -1, -1);
    
    UIBezierPath* oval2NegativePath = [UIBezierPath bezierPathWithRect: oval2BorderRect];
    [oval2NegativePath appendPath: oval2Path];
    oval2NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(oval2BorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [oval2Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(oval2BorderRect.size.width), 0);
        [oval2NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [oval2NegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    

}


@end
