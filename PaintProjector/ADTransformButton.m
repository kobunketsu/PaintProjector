//
//  TransformButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformButton.h"

@implementation ADTransformButton

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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 45) * 0.51807 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.45714 + 0.5), 45, 45);
    
    
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
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18889 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.55556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18889 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.55556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43333 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43333 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34862 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49444 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64027 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54444 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.55556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54444 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.55556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80000 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80000 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.98889 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.35417 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80000 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80000 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54444 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54444 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64027 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49444 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34862 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43333 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43333 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.44444 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18889 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.35417 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18889 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.50000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18889 * CGRectGetHeight(iconNormal))];
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
