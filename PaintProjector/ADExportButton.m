//
//  ExportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADExportButton.h"

@implementation ADExportButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.284];
//    UIColor* iconColor = [UIColor colorWithRed: 0.554 green: 0.554 blue: 0.554 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.8 + 0.2) green: (iconColorRGBA[1] * 0.8 + 0.2) blue: (iconColorRGBA[2] * 0.8 + 0.2) alpha: (iconColorRGBA[3] * 0.8 + 0.2)];
    CGFloat gradientColorRGBA[4];
    [gradientColor getRed: &gradientColorRGBA[0] green: &gradientColorRGBA[1] blue: &gradientColorRGBA[2] alpha: &gradientColorRGBA[3]];
    
    UIColor* iconSpecularColor = [UIColor colorWithRed: (gradientColorRGBA[0] * 0.9 + 0.1) green: (gradientColorRGBA[1] * 0.9 + 0.1) blue: (gradientColorRGBA[2] * 0.9 + 0.1) alpha: (gradientColorRGBA[3] * 0.9 + 0.1)];
    CGFloat iconSpecularColorRGBA[4];
    [iconSpecularColor getRed: &iconSpecularColorRGBA[0] green: &iconSpecularColorRGBA[1] blue: &iconSpecularColorRGBA[2] alpha: &iconSpecularColorRGBA[3]];
    
    UIColor* glowColor = [UIColor colorWithRed: (iconSpecularColorRGBA[0] * 1 + 0) green: (iconSpecularColorRGBA[1] * 1 + 0) blue: (iconSpecularColorRGBA[2] * 1 + 0) alpha: (iconSpecularColorRGBA[3] * 1 + 0)];
    UIColor* iconShadowTempColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.3) green: (iconColorRGBA[1] * 0.3) blue: (iconColorRGBA[2] * 0.3) alpha: (iconColorRGBA[3] * 0.3 + 0.7)];
    UIColor* iconShadowColor = [iconShadowTempColor colorWithAlphaComponent: 0.1];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -2.1);
    CGFloat iconHighlightBlurRadius = 2;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 2;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 4;
    
    //// Frames
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.51948 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.45714 + 0.5), 51, 45);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 1);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15904 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29853 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66867 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36856 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66867 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.24463 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66867 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.24463 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39625 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24463 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66867 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51859 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29048 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35193 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24503 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36563 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.27607 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35230 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35193 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35152 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34991 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35193 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43748 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.52493 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29489 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15230 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.42073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23785 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.28656 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23785 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.42073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23785 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42469 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23785 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15904 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29853 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.22462 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23785 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.19347 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24159 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66762 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81191 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66762 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86468 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.63305 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82648 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.63305 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85011 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79279 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86468 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70218 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87925 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75822 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87925 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79279 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81191 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.82735 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85011 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82735 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82648 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66762 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81191 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.75822 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79733 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70218 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79733 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82585 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06638 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95024 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.81871 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95024 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39829 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87561 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30978 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90049 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82585 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99573 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79352 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88581 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93630 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84185 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99341 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.05044 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99341 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00648 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93630 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.02616 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99341 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00648 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.96784 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11639 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79352 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16036 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73641 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.95176 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73641 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99573 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79352 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.97605 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73641 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.99573 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76198 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88063 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09075 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91911 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13389 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88063 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11458 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89786 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13389 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99607 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13389 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88063 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00449 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.01732 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13389 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88063 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.01933 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88063 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09075 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84215 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00667 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84215 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11232 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17702 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84215 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87862 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17702 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99465 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.17702 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99099 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60078 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93259 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64988 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.99077 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62809 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96462 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65007 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61362 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64797 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.55604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59819 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58159 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64778 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.55581 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62549 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56051 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.05432 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61891 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00522 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.56073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00503 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84215 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00667 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            [iconColor setFill];
            [bezier4Path fill];
            
            ////// Bezier 4 Inner Shadow
            CGRect bezier4BorderRect = CGRectInset([bezier4Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier4BorderRect = CGRectOffset(bezier4BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier4BorderRect = CGRectInset(CGRectUnion(bezier4BorderRect, [bezier4Path bounds]), -1, -1);
            
            UIBezierPath* bezier4NegativePath = [UIBezierPath bezierPathWithRect: bezier4BorderRect];
            [bezier4NegativePath appendPath: bezier4Path];
            bezier4NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier4BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier4Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier4BorderRect.size.width), 0);
                [bezier4NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier4NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
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
