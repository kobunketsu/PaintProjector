//
//  LayerDeleteButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerClearButton.h"

@implementation ADLayerClearButton

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
- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* color = iconColor;
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
//    UIColor* color = [UIColor colorWithRed: 0.559 green: 0.559 blue: 0.559 alpha: 1];
    
    //// Shadow Declarations
    UIColor* highlight = [UIColor whiteColor];
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(37.5, 18.33)];
    [bezierPath addLineToPoint: CGPointMake(37.5, 26.67)];
    [bezierPath addLineToPoint: CGPointMake(7.5, 26.67)];
    [bezierPath addLineToPoint: CGPointMake(7.5, 18.33)];
    [bezierPath addLineToPoint: CGPointMake(37.5, 18.33)];
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


@end
