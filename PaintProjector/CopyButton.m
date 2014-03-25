//
//  CopyButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CopyButton.h"

@implementation CopyButton

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
    
    //// Rectangle Drawing
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// ADD Drawing
    UIBezierPath* aDDPath = [UIBezierPath bezierPath];
    [aDDPath moveToPoint: CGPointMake(65, 26)];
    [aDDPath addLineToPoint: CGPointMake(62, 26)];
    [aDDPath addLineToPoint: CGPointMake(62, 32)];
    [aDDPath addLineToPoint: CGPointMake(56, 32)];
    [aDDPath addLineToPoint: CGPointMake(56, 35)];
    [aDDPath addLineToPoint: CGPointMake(62, 35)];
    [aDDPath addLineToPoint: CGPointMake(62, 41)];
    [aDDPath addLineToPoint: CGPointMake(65, 41)];
    [aDDPath addLineToPoint: CGPointMake(65, 35)];
    [aDDPath addLineToPoint: CGPointMake(71, 35)];
    [aDDPath addLineToPoint: CGPointMake(71, 32)];
    [aDDPath addLineToPoint: CGPointMake(65, 32)];
    [aDDPath addLineToPoint: CGPointMake(65, 26)];
    [aDDPath closePath];
    [aDDPath moveToPoint: CGPointMake(79, 16)];
    [aDDPath addLineToPoint: CGPointMake(79, 51)];
    [aDDPath addCurveToPoint: CGPointMake(76, 54) controlPoint1: CGPointMake(79, 52.66) controlPoint2: CGPointMake(77.66, 54)];
    [aDDPath addLineToPoint: CGPointMake(51, 54)];
    [aDDPath addCurveToPoint: CGPointMake(48, 51) controlPoint1: CGPointMake(49.34, 54) controlPoint2: CGPointMake(48, 52.66)];
    [aDDPath addLineToPoint: CGPointMake(48, 16)];
    [aDDPath addCurveToPoint: CGPointMake(51, 13) controlPoint1: CGPointMake(48, 14.34) controlPoint2: CGPointMake(49.34, 13)];
    [aDDPath addLineToPoint: CGPointMake(76, 13)];
    [aDDPath addCurveToPoint: CGPointMake(79, 16) controlPoint1: CGPointMake(77.66, 13) controlPoint2: CGPointMake(79, 14.34)];
    [aDDPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [aDDPath fill];
    
    ////// ADD Inner Shadow
    CGRect aDDBorderRect = CGRectInset([aDDPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    aDDBorderRect = CGRectOffset(aDDBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    aDDBorderRect = CGRectInset(CGRectUnion(aDDBorderRect, [aDDPath bounds]), -1, -1);
    
    UIBezierPath* aDDNegativePath = [UIBezierPath bezierPathWithRect: aDDBorderRect];
    [aDDNegativePath appendPath: aDDPath];
    aDDNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(aDDBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [aDDPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(aDDBorderRect.size.width), 0);
        [aDDNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [aDDNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
}


@end
