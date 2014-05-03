//
//  SetupEyeView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupEyeView.h"

@implementation SetupEyeView

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
    UIColor* fillColor2 = [UIColor colorWithRed: 0.495 green: 0.495 blue: 0.495 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.933];
    UIColor* innerShadowColor = [UIColor colorWithRed: 0.327 green: 0.327 blue: 0.327 alpha: 1];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0.663 green: 0.663 blue: 0.663 alpha: 0.498];
    UIColor* hightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 13;
    UIColor* shadow = shadowColor4;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* innerShadow = innerShadowColor;
    CGSize innerShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat innerShadowBlurRadius = 0;
    UIColor* hightlight = hightlightColor;
    CGSize hightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat hightlightBlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 66);
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 54) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 34) * 0.46875 + 0.5), 54, 34);
    
    
    //// Group 3
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.33248 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20453 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.33248 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76606 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.23485 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35959 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.23485 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.61100 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.68604 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76606 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.43011 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92112 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.58840 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92112 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.68604 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20453 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.78367 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.61100 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.78367 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35959 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.33248 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20453 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.58840 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04947 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.43011 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04947 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50385 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00003 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.80118 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13931 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.50385 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00003 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.67714 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00106 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.99998 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49422 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.92521 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.27756 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.99998 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49422 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.80118 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.86069 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.99998 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49422 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.92431 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.71956 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50746 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.99990 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.67804 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00182 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.50746 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.99990 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.19882 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.86069 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.50746 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.99990 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.32567 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.99743 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.00006 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.51177 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.07198 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.72395 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.00006 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.51177 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.19882 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13931 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.00006 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.51177 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.07288 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.28195 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50385 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00003 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.32477 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.00333 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.50385 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00003 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.59709 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59537 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.59709 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34580 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.64048 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.52646 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.64048 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41472 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.43995 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34580 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.55369 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.27689 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.48334 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.27689 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.43995 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59537 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.39656 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41472 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.39656 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.52646 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.59709 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59537 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.48334 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.66429 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.55369 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.66429 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, hightlightOffset, hightlightBlurRadius, hightlight.CGColor);
            [fillColor2 setFill];
            [bezier3Path fill];
            
            ////// Bezier 3 Inner Shadow
            CGRect bezier3BorderRect = CGRectInset([bezier3Path bounds], -innerShadowBlurRadius, -innerShadowBlurRadius);
            bezier3BorderRect = CGRectOffset(bezier3BorderRect, -innerShadowOffset.width, -innerShadowOffset.height);
            bezier3BorderRect = CGRectInset(CGRectUnion(bezier3BorderRect, [bezier3Path bounds]), -1, -1);
            
            UIBezierPath* bezier3NegativePath = [UIBezierPath bezierPathWithRect: bezier3BorderRect];
            [bezier3NegativePath appendPath: bezier3Path];
            bezier3NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = innerShadowOffset.width + round(bezier3BorderRect.size.width);
                CGFloat yOffset = innerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            innerShadowBlurRadius,
                                            innerShadow.CGColor);
                
                [bezier3Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier3BorderRect.size.width), 0);
                [bezier3NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier3NegativePath fill];
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


@end
