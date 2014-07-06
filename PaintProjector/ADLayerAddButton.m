//
//  LayerAddButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerAddButton.h"

@implementation ADLayerAddButton

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
    //    DebugLog(@"LayerButton drawLayer inContext");
    CGContextRef context = ctx;
    
    UIColor* color = iconColor;
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    UIColor* highlight = [UIColor whiteColor];
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    
    //// Group
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(26.17, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(37, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(37, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(26.17, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(26.17, 37)];
        [bezierPath addLineToPoint: CGPointMake(17.83, 37)];
        [bezierPath addLineToPoint: CGPointMake(17.83, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(7, 26.17)];
        [bezierPath addLineToPoint: CGPointMake(7, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(17.83, 17.83)];
        [bezierPath addLineToPoint: CGPointMake(17.83, 7)];
        [bezierPath addLineToPoint: CGPointMake(26.17, 7)];
        [bezierPath addLineToPoint: CGPointMake(26.17, 17.83)];
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
