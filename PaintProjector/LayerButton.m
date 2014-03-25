//
//  LayerButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerButton.h"

@implementation LayerButton

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

-(void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor*)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 1];
//    UIColor* iconColor = [UIColor colorWithRed: 0.762 green: 0.762 blue: 0.762 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.8) green: (iconColorRGBA[1] * 0.8) blue: (iconColorRGBA[2] * 0.8) alpha: (iconColorRGBA[3] * 0.8 + 0.2)];
    UIColor* iconColorA50 = [iconColor colorWithAlphaComponent: 0.5];
    UIColor* iconColorA75 = [iconColor colorWithAlphaComponent: 0.75];
    
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
    CGRect layerIcon = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
    //// layerIcon
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.17500 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.04444 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.22500 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.20261 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.01990 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.22500 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.84444 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.22500 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.88889 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.17500 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.86899 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.22500 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.88889 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.20261 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 1.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.05000 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.95556 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.00000 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 1.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.02239 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.98010 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.00000 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.15556 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.00000 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.11111 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.05000 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.13101 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.00000 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.11111 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.02239 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.17500 * CGRectGetHeight(layerIcon))];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColorA50 setFill];
        [roundedRectanglePath fill];
        
        ////// Rounded Rectangle Inner Shadow
        CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1, -1);
        
        UIBezierPath* roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
        [roundedRectangleNegativePath appendPath: roundedRectanglePath];
        roundedRectangleNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(roundedRectangleBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [roundedRectanglePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangleBorderRect.size.width), 0);
            [roundedRectangleNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [roundedRectangleNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
        [roundedRectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.56250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.04444 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.61250 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.59011 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.01990 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.61250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.84444 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.61250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.88889 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.56250 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.86899 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.61250 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.88889 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.59011 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 1.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.43750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.95556 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.38750 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 1.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.40989 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.98010 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.38750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.15556 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.38750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.11111 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.43750 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.13101 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.38750 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.11111 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.40989 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.56250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColorA75 setFill];
        [roundedRectangle2Path fill];
        
        ////// Rounded Rectangle 2 Inner Shadow
        CGRect roundedRectangle2BorderRect = CGRectInset([roundedRectangle2Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        roundedRectangle2BorderRect = CGRectOffset(roundedRectangle2BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        roundedRectangle2BorderRect = CGRectInset(CGRectUnion(roundedRectangle2BorderRect, [roundedRectangle2Path bounds]), -1, -1);
        
        UIBezierPath* roundedRectangle2NegativePath = [UIBezierPath bezierPathWithRect: roundedRectangle2BorderRect];
        [roundedRectangle2NegativePath appendPath: roundedRectangle2Path];
        roundedRectangle2NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(roundedRectangle2BorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [roundedRectangle2Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangle2BorderRect.size.width), 0);
            [roundedRectangle2NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [roundedRectangle2NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPath];
        [roundedRectangle3Path moveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.93750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.04444 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.98750 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.96511 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.01990 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.98750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.84444 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.98750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.88889 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.93750 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.86899 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.98750 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.88889 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.96511 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 1.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.81250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.95556 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.76250 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 1.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.78489 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.98010 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.76250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.15556 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.76250 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.11111 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.81250 * CGRectGetHeight(layerIcon)) controlPoint1: CGPointMake(CGRectGetMinX(layerIcon) + 0.13101 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.76250 * CGRectGetHeight(layerIcon)) controlPoint2: CGPointMake(CGRectGetMinX(layerIcon) + 0.11111 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.78489 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(layerIcon) + 0.00000 * CGRectGetWidth(layerIcon), CGRectGetMinY(layerIcon) + 0.93750 * CGRectGetHeight(layerIcon))];
        [roundedRectangle3Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [roundedRectangle3Path fill];
        
        ////// Rounded Rectangle 3 Inner Shadow
        CGRect roundedRectangle3BorderRect = CGRectInset([roundedRectangle3Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        roundedRectangle3BorderRect = CGRectOffset(roundedRectangle3BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        roundedRectangle3BorderRect = CGRectInset(CGRectUnion(roundedRectangle3BorderRect, [roundedRectangle3Path bounds]), -1, -1);
        
        UIBezierPath* roundedRectangle3NegativePath = [UIBezierPath bezierPathWithRect: roundedRectangle3BorderRect];
        [roundedRectangle3NegativePath appendPath: roundedRectangle3Path];
        roundedRectangle3NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(roundedRectangle3BorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [roundedRectangle3Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangle3BorderRect.size.width), 0);
            [roundedRectangle3NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [roundedRectangle3NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect
{
}
*/

@end
