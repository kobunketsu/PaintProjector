//
//  LayerVisibleButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerVisibleButton.h"

@implementation LayerVisibleButton

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color = [UIColor colorWithRed: 0.559 green: 0.559 blue: 0.559 alpha: 1];
    CGFloat colorHSBA[4];
    [color getHue: &colorHSBA[0] saturation: &colorHSBA[1] brightness: &colorHSBA[2] alpha: &colorHSBA[3]];
    
    UIColor* color2 = [UIColor colorWithHue: colorHSBA[0] saturation: colorHSBA[1] brightness: 0.8 alpha: colorHSBA[3]];
    
    //// Shadow Declarations
    UIColor* highlight = [UIColor whiteColor];
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(30.25, 12.74)];
    [bezierPath addCurveToPoint: CGPointMake(40.77, 21.14) controlPoint1: CGPointMake(37, 14.84) controlPoint2: CGPointMake(40.77, 21.14)];
    [bezierPath addCurveToPoint: CGPointMake(30.25, 30.25) controlPoint1: CGPointMake(40.77, 21.14) controlPoint2: CGPointMake(37, 27.98)];
    [bezierPath addCurveToPoint: CGPointMake(13.76, 30.25) controlPoint1: CGPointMake(23.49, 32.53) controlPoint2: CGPointMake(20.51, 32.31)];
    [bezierPath addCurveToPoint: CGPointMake(3.23, 22.01) controlPoint1: CGPointMake(7, 28.19) controlPoint2: CGPointMake(3.23, 22.01)];
    [bezierPath addCurveToPoint: CGPointMake(13.76, 12.74) controlPoint1: CGPointMake(3.23, 22.01) controlPoint2: CGPointMake(7, 15.06)];
    [bezierPath addCurveToPoint: CGPointMake(30.25, 12.74) controlPoint1: CGPointMake(20.51, 10.43) controlPoint2: CGPointMake(23.49, 10.65)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
    [color2 setFill];
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
    
    
    if (!self.isVisible) {
        return;
    }
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(17, 16, 11, 11)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
    [color setFill];
    [ovalPath fill];
    
    ////// Oval Inner Shadow
    CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadowBlurRadius, -shadowBlurRadius);
    ovalBorderRect = CGRectOffset(ovalBorderRect, -shadowOffset.width, -shadowOffset.height);
    ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
    
    UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
    [ovalNegativePath appendPath: ovalPath];
    ovalNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(ovalBorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow.CGColor);
        
        [ovalPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
        [ovalNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [ovalNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    

}
-(void)setIsVisible:(BOOL)isVisible{
    _isVisible = isVisible;
    [self setNeedsDisplay];
}

@end
