//
//  DeleteButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "DeleteButton.h"

@implementation DeleteButton

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
    UIColor* iconColor = [UIColor colorWithRed: 0.341 green: 0.341 blue: 0.341 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.2 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
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
    NSString* textContent = @"Delete";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(-2, -43, 131, 112)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, iconGlowGradient,
                                CGPointMake(62.05, 23.12), 4.84,
                                CGPointMake(61.76, 55.6), 47.32,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(33, 56, 61, 18);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
    [iconColor setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
    CGContextRestoreGState(context);
    
    
    
    //// Delete Reflection Drawing
    UIBezierPath* deleteReflectionPath = [UIBezierPath bezierPath];
    [deleteReflectionPath moveToPoint: CGPointMake(56, 64.23)];
    [deleteReflectionPath addLineToPoint: CGPointMake(56, 62.77)];
    [deleteReflectionPath addLineToPoint: CGPointMake(71, 62.77)];
    [deleteReflectionPath addLineToPoint: CGPointMake(71, 64.23)];
    [deleteReflectionPath addLineToPoint: CGPointMake(56, 64.23)];
    [deleteReflectionPath closePath];
    [deleteReflectionPath moveToPoint: CGPointMake(79, 72.04)];
    [deleteReflectionPath addLineToPoint: CGPointMake(79, 54.96)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(76, 53.5) controlPoint1: CGPointMake(79, 54.16) controlPoint2: CGPointMake(77.66, 53.5)];
    [deleteReflectionPath addLineToPoint: CGPointMake(51, 53.5)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(48, 54.96) controlPoint1: CGPointMake(49.34, 53.5) controlPoint2: CGPointMake(48, 54.16)];
    [deleteReflectionPath addLineToPoint: CGPointMake(48, 72.04)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(51, 73.5) controlPoint1: CGPointMake(48, 72.84) controlPoint2: CGPointMake(49.34, 73.5)];
    [deleteReflectionPath addLineToPoint: CGPointMake(76, 73.5)];
    [deleteReflectionPath addCurveToPoint: CGPointMake(79, 72.04) controlPoint1: CGPointMake(77.66, 73.5) controlPoint2: CGPointMake(79, 72.84)];
    [deleteReflectionPath closePath];
    CGContextSaveGState(context);
    [deleteReflectionPath addClip];
    CGContextDrawLinearGradient(context, iconReflection, CGPointMake(63.5, 53.5), CGPointMake(63.5, 73.5), 0);
    CGContextRestoreGState(context);
    
    
    //// Delete Drawing
    UIBezierPath* deletePath = [UIBezierPath bezierPath];
    [deletePath moveToPoint: CGPointMake(56, 32)];
    [deletePath addLineToPoint: CGPointMake(56, 35)];
    [deletePath addLineToPoint: CGPointMake(71, 35)];
    [deletePath addLineToPoint: CGPointMake(71, 32)];
    [deletePath addLineToPoint: CGPointMake(56, 32)];
    [deletePath closePath];
    [deletePath moveToPoint: CGPointMake(79, 16)];
    [deletePath addLineToPoint: CGPointMake(79, 51)];
    [deletePath addCurveToPoint: CGPointMake(76, 54) controlPoint1: CGPointMake(79, 52.66) controlPoint2: CGPointMake(77.66, 54)];
    [deletePath addLineToPoint: CGPointMake(51, 54)];
    [deletePath addCurveToPoint: CGPointMake(48, 51) controlPoint1: CGPointMake(49.34, 54) controlPoint2: CGPointMake(48, 52.66)];
    [deletePath addLineToPoint: CGPointMake(48, 16)];
    [deletePath addCurveToPoint: CGPointMake(51, 13) controlPoint1: CGPointMake(48, 14.34) controlPoint2: CGPointMake(49.34, 13)];
    [deletePath addLineToPoint: CGPointMake(76, 13)];
    [deletePath addCurveToPoint: CGPointMake(79, 16) controlPoint1: CGPointMake(77.66, 13) controlPoint2: CGPointMake(79, 14.34)];
    [deletePath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [deletePath fill];
    
    ////// Delete Inner Shadow
    CGRect deleteBorderRect = CGRectInset([deletePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    deleteBorderRect = CGRectOffset(deleteBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    deleteBorderRect = CGRectInset(CGRectUnion(deleteBorderRect, [deletePath bounds]), -1, -1);
    
    UIBezierPath* deleteNegativePath = [UIBezierPath bezierPathWithRect: deleteBorderRect];
    [deleteNegativePath appendPath: deletePath];
    deleteNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(deleteBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [deletePath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(deleteBorderRect.size.width), 0);
        [deleteNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [deleteNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(iconReflection);
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
