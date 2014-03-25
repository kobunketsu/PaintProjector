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

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 1];
//    UIColor* iconColor = [UIColor colorWithRed: 0.647 green: 0.275 blue: 0.42 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.675) green: (iconColorRGBA[1] * 0.675) blue: (iconColorRGBA[2] * 0.675) alpha: (iconColorRGBA[3] * 0.675 + 0.325)];
    UIColor* iconColorA50 = [iconColor colorWithAlphaComponent: 0.5];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Frames
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect importIcon = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 51, 44);
    
    
    //// importIcon
    {
        //// layer Drawing
        UIBezierPath* layerPath = [UIBezierPath bezierPath];
        [layerPath moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.02810 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.93435 * CGRectGetHeight(importIcon))];
        [layerPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.07130 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99321 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.02810 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.96685 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.04744 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99321 * CGRectGetHeight(importIcon))];
        [layerPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.84882 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99321 * CGRectGetHeight(importIcon))];
        [layerPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.89201 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.93435 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.87267 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99321 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.89201 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.96685 * CGRectGetHeight(importIcon))];
        [layerPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 1.00000 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.78719 * CGRectGetHeight(importIcon))];
        [layerPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.95680 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.72833 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 1.00000 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.75468 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.98066 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.72833 * CGRectGetHeight(importIcon))];
        [layerPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.17929 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.72833 * CGRectGetHeight(importIcon))];
        [layerPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.13609 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.78719 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.15543 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.72833 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.13609 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.75468 * CGRectGetHeight(importIcon))];
        [layerPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.02810 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.93435 * CGRectGetHeight(importIcon))];
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
        [imagePath moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.44573 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.11753 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.44511 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.22425 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.42123 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.14680 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.42096 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.19458 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.53322 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.22500 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.46927 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.25393 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.50872 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.25427 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.53384 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.11828 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.55772 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.19574 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.55800 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.14796 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.44573 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.11753 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.50968 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.08861 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.47023 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.08827 * CGRectGetHeight(importIcon))];
        [imagePath closePath];
        [imagePath moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.15297 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.18350 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.05189 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.42414 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.62505 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.42900 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.37673 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.27596 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.27670 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.33549 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.15297 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.18350 * CGRectGetHeight(importIcon))];
        [imagePath closePath];
        [imagePath moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.65207 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.06700 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.65014 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.39903 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.59996 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.45898 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.64995 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.43237 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.62748 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.45921 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.05172 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.45432 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.00223 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.39353 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.02419 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.45409 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.00204 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.42687 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.00415 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.06150 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.05434 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00155 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.00434 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.02815 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.02681 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00131 * CGRectGetHeight(importIcon))];
        [imagePath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.60258 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00620 * CGRectGetHeight(importIcon))];
        [imagePath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.65207 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.06700 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.63010 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00644 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.65226 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.03365 * CGRectGetHeight(importIcon))];
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
        [arrowPath moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.85048 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.22742 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.70095 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.18498 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.78928 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.17834 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.70095 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.18498 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.70095 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.32660 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.82556 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.45666 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.70095 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.32660 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.82556 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.28898 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.82556 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60759 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.82556 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.62433 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.82556 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60759 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.75080 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60759 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.87540 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.72833 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 1.00000 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60759 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.92524 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60759 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.92524 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.42647 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.92524 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60759 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.92524 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.58653 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.85048 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.22742 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.92524 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.35470 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.90023 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.26732 * CGRectGetHeight(importIcon))];
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
    
    
}
@end
