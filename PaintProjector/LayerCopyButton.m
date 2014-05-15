//
//  LayerCopyButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-24.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerCopyButton.h"

@implementation LayerCopyButton

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
- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
//    UIColor* color = [UIColor colorWithRed: 0.558 green: 0.558 blue: 0.56 alpha: 1];
    UIColor* color = iconColor;
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    UIColor* highlight = [UIColor whiteColor];
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    
    //// Group 2
    {
        CGContextSaveGState(context);
        CGContextSetAlpha(context, 0.5);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(29.17, 17.83)];
        [bezier2Path addLineToPoint: CGPointMake(40, 17.83)];
        [bezier2Path addLineToPoint: CGPointMake(40, 26.17)];
        [bezier2Path addLineToPoint: CGPointMake(29.17, 26.17)];
        [bezier2Path addLineToPoint: CGPointMake(29.17, 37)];
        [bezier2Path addLineToPoint: CGPointMake(20.83, 37)];
        [bezier2Path addLineToPoint: CGPointMake(20.83, 26.17)];
        [bezier2Path addLineToPoint: CGPointMake(10, 26.17)];
        [bezier2Path addLineToPoint: CGPointMake(10, 17.83)];
        [bezier2Path addLineToPoint: CGPointMake(20.83, 17.83)];
        [bezier2Path addLineToPoint: CGPointMake(20.83, 7)];
        [bezier2Path addLineToPoint: CGPointMake(29.17, 7)];
        [bezier2Path addLineToPoint: CGPointMake(29.17, 17.83)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
        [color setFill];
        [bezier2Path fill];
        
        ////// Bezier 2 Inner Shadow
        CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -shadowBlurRadius, -shadowBlurRadius);
        bezier2BorderRect = CGRectOffset(bezier2BorderRect, -shadowOffset.width, -shadowOffset.height);
        bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
        
        UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
        [bezier2NegativePath appendPath: bezier2Path];
        bezier2NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadowOffset.width + round(bezier2BorderRect.size.width);
            CGFloat yOffset = shadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadowBlurRadius,
                                        shadow.CGColor);
            
            [bezier2Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier2BorderRect.size.width), 0);
            [bezier2NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezier2NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Group
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(24.17, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(35, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(35, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(24.17, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(24.17, 37)];
        [bezierPath addLineToPoint: CGPointMake(15.83, 37)];
        [bezierPath addLineToPoint: CGPointMake(15.83, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(5, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(5, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(15.83, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(15.83, 7)];
        [bezierPath addLineToPoint: CGPointMake(24.17, 7)];
        [bezierPath addLineToPoint: CGPointMake(24.17, 17.83)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
        [color setFill];
        [bezierPath fill];
        
        ////// Bezier Inner Shadow
        CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -shadowBlurRadius, -shadowBlurRadius);
        bezierBorderRect = CGRectOffset(bezierBorderRect, -shadowOffset.width, -shadowOffset.height);
        bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
        
        UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
        [bezierNegativePath appendPath: bezierPath];
        bezierNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadowOffset.width + round(bezierBorderRect.size.width);
            CGFloat yOffset = shadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadowBlurRadius,
                                        shadow.CGColor);
            
            [bezierPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
            [bezierNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezierNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    

    
}


@end
