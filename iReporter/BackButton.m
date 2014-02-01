//
//  BackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BackButton.h"

@implementation BackButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 0.75];
    UIColor* iconColor = [UIColor colorWithRed: 0.238 green: 0.238 blue: 0.238 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.325 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
    UIColor* iconGlowGradientColor = [iconColor colorWithAlphaComponent: 0.23];
    UIColor* iconColorA50 = [iconColor colorWithAlphaComponent: 0.5];
    UIColor* iconGlowGradientColor2 = [iconColor colorWithAlphaComponent: 0];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconReflectionColor = [UIColor colorWithRed: 0.814 green: 0.814 blue: 0.814 alpha: 0];
    
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
    NSString* textContent = @"Gallery";
    
    
    //// Rectangle Drawing
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
    
    
    //// frameIcon
    {
        //// frame Drawing
        UIBezierPath* framePath = [UIBezierPath bezierPathWithRect: CGRectMake(43.5, 21.5, 16, 27)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColorA50 setFill];
        [framePath fill];
        
        ////// frame Inner Shadow
        CGRect frameBorderRect = CGRectInset([framePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        frameBorderRect = CGRectOffset(frameBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        frameBorderRect = CGRectInset(CGRectUnion(frameBorderRect, [framePath bounds]), -1, -1);
        
        UIBezierPath* frameNegativePath = [UIBezierPath bezierPathWithRect: frameBorderRect];
        [frameNegativePath appendPath: framePath];
        frameNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(frameBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [framePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(frameBorderRect.size.width), 0);
            [frameNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [frameNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setStroke];
        framePath.lineWidth = 3;
        [framePath stroke];
        CGContextRestoreGState(context);
        
        
        //// frame 2 Drawing
        UIBezierPath* frame2Path = [UIBezierPath bezierPathWithRect: CGRectMake(65.5, 35.5, 22, 16)];
        [iconColorA50 setFill];
        [frame2Path fill];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setStroke];
        frame2Path.lineWidth = 3;
        [frame2Path stroke];
        CGContextRestoreGState(context);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(46.5, 21.5)];
        [bezierPath addLineToPoint: CGPointMake(51.5, 13.5)];
        [bezierPath addLineToPoint: CGPointMake(56.5, 21.5)];
        [iconColor setStroke];
        bezierPath.lineWidth = 1;
        [bezierPath stroke];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(69.5, 34.5)];
        [bezier2Path addLineToPoint: CGPointMake(76.5, 29.5)];
        [bezier2Path addLineToPoint: CGPointMake(83.5, 34.5)];
        [iconColor setStroke];
        bezier2Path.lineWidth = 1;
        [bezier2Path stroke];
    }
    
    
    //// frameIcon 2
    {
        CGContextSaveGState(context);
        CGContextSetAlpha(context, 0.5);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// frame 3 Drawing
        UIBezierPath* frame3Path = [UIBezierPath bezierPathWithRect: CGRectMake(43.5, 57.5, 16, 14)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [frame3Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(51.5, 71.5), CGPointMake(51.5, 57.5), 0);
        CGContextEndTransparencyLayer(context);
        
        ////// frame 3 Inner Shadow
        CGRect frame3BorderRect = CGRectInset([frame3Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        frame3BorderRect = CGRectOffset(frame3BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        frame3BorderRect = CGRectInset(CGRectUnion(frame3BorderRect, [frame3Path bounds]), -1, -1);
        
        UIBezierPath* frame3NegativePath = [UIBezierPath bezierPathWithRect: frame3BorderRect];
        [frame3NegativePath appendPath: frame3Path];
        frame3NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(frame3BorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [frame3Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(frame3BorderRect.size.width), 0);
            [frame3NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [frame3NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        [iconColorA50 setStroke];
        frame3Path.lineWidth = 3;
        [frame3Path stroke];
        
        
        //// frame 4 Drawing
        UIBezierPath* frame4Path = [UIBezierPath bezierPathWithRect: CGRectMake(65.5, 56.5, 22, 8)];
        CGContextSaveGState(context);
        [frame4Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(76.5, 64.5), CGPointMake(76.5, 56.5), 0);
        CGContextRestoreGState(context);
        [iconColorA50 setStroke];
        frame4Path.lineWidth = 3;
        [frame4Path stroke];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(46.5, 71.64)];
        [bezier3Path addLineToPoint: CGPointMake(51.5, 75.74)];
        [bezier3Path addLineToPoint: CGPointMake(56.5, 71.64)];
        CGContextSaveGState(context);
        [bezier3Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(51.5, 71.64), CGPointMake(51.5, 75.74), 0);
        CGContextRestoreGState(context);
        [iconColorA50 setStroke];
        bezier3Path.lineWidth = 1;
        [bezier3Path stroke];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(69.5, 64.97)];
        [bezier5Path addLineToPoint: CGPointMake(76.5, 67.54)];
        [bezier5Path addLineToPoint: CGPointMake(83.5, 64.97)];
        CGContextSaveGState(context);
        [bezier5Path addClip];
        CGContextDrawLinearGradient(context, iconReflection, CGPointMake(76.5, 64.97), CGPointMake(76.5, 67.54), 0);
        CGContextRestoreGState(context);
        [iconColorA50 setStroke];
        bezier5Path.lineWidth = 1;
        [bezier5Path stroke];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
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
