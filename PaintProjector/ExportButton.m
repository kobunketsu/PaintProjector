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
//    UIColor* iconColor = [UIColor colorWithRed: 0.448 green: 0.274 blue: 0.702 alpha: 1];
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
    CGRect importIcon = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.42857 + 0.5), 51, 45);
    
    
    //// importIcon
    {
        //// arrow Drawing
        UIBezierPath* arrowPath = [UIBezierPath bezierPath];
        [arrowPath moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.15904 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.29853 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.14455 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.66867 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.11669 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.36856 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.14455 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.66867 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.24463 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.66867 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.24463 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.39625 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.24463 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.66867 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.24304 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.51859 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.29048 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.35193 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.24503 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.36563 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.27607 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.35230 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.42073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.35193 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.35152 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.34991 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.42073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.35193 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.42073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.43748 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.52493 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.29489 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.42073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.15230 * CGRectGetHeight(importIcon))];
        [arrowPath addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.42073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.23785 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.28656 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.23785 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.42073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.23785 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.42469 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.23785 * CGRectGetHeight(importIcon))];
        [arrowPath addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.15904 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.29853 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.22462 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.23785 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.19347 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.24159 * CGRectGetHeight(importIcon))];
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
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.66762 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.81191 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.66762 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.86468 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.63305 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.82648 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.63305 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.85011 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.79279 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.86468 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.70218 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.87925 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.75822 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.87925 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.79279 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.81191 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.82735 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.85011 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.82735 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.82648 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.66762 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.81191 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.75822 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.79733 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.70218 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.79733 * CGRectGetHeight(importIcon))];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.19915 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.82585 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.06638 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.95024 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.81871 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.95024 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.39829 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.87561 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.30978 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.90049 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.19915 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.82585 * CGRectGetHeight(importIcon))];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.99573 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.79352 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.88581 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.93630 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.84185 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99341 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.88581 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.96784 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.86613 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99341 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.05044 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99341 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.00648 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.93630 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.02616 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.99341 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.00648 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.96784 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.11639 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.79352 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.16036 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.73641 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.11639 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.76198 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.13608 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.73641 * CGRectGetHeight(importIcon))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.95176 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.73641 * CGRectGetHeight(importIcon))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.99573 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.79352 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.97605 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.73641 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.99573 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.76198 * CGRectGetHeight(importIcon))];
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
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.88063 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.09075 * CGRectGetHeight(importIcon))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.91911 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.13389 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.88063 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.11458 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.89786 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.13389 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.99607 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.13389 * CGRectGetHeight(importIcon))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.88063 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00449 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 1.01732 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.13389 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.88063 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + -0.01933 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.88063 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.09075 * CGRectGetHeight(importIcon))];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.84215 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00667 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.84215 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.11232 * CGRectGetHeight(importIcon))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.89987 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.17702 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.84215 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.13614 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.87862 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.17702 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.99465 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.17702 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.99099 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.60078 * CGRectGetHeight(importIcon))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.93259 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.64988 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.99077 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.62809 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.96462 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.65007 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.61362 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.64797 * CGRectGetHeight(importIcon))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.55604 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.59819 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.58159 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.64778 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.55581 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.62549 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.56051 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.05432 * CGRectGetHeight(importIcon))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.61891 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00523 * CGRectGetHeight(importIcon)) controlPoint1: CGPointMake(CGRectGetMinX(importIcon) + 0.56073 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.02701 * CGRectGetHeight(importIcon)) controlPoint2: CGPointMake(CGRectGetMinX(importIcon) + 0.58688 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00503 * CGRectGetHeight(importIcon))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(importIcon) + 0.84215 * CGRectGetWidth(importIcon), CGRectGetMinY(importIcon) + 0.00667 * CGRectGetHeight(importIcon))];
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
    
    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
}
*/

@end
