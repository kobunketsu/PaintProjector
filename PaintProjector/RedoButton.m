//
//  RedoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "RedoButton.h"

@implementation RedoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    UIColor* iconColor = [UIColor colorWithRed: 0.75 green: 0.75 blue: 0.75 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.325 alpha: iconColorHSBA[3]];
    
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
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 51, 44);
    
    
    //// Group
    {
        //// Main Drawing
        UIBezierPath* mainPath = [UIBezierPath bezierPath];
        [mainPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.64207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.92486 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.80303 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.73587 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.33074 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.73587 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.10975 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.62839 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.25076 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.73587 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.17077 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.70004 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.10975 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.10945 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + -0.01230 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.48509 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + -0.01230 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.25275 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.33074 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00197 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.17077 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.03779 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.25076 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00197 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.33074 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.14310 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.19475 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.20924 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.28152 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.14310 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.23230 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.16515 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.19475 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52860 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.11964 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29743 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.11964 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44041 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.33074 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.59474 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.23230 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.57269 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.28152 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.59474 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.80303 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.59474 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40574 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.69868 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33927 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.98106 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.65979 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.69868 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.99133 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.92486 * CGRectGetHeight(group))];
        [mainPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        [iconColor setFill];
        [mainPath fill];
        
        ////// Main Inner Shadow
        CGRect mainBorderRect = CGRectInset([mainPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        mainBorderRect = CGRectOffset(mainBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        mainBorderRect = CGRectInset(CGRectUnion(mainBorderRect, [mainPath bounds]), -1, -1);
        
        UIBezierPath* mainNegativePath = [UIBezierPath bezierPathWithRect: mainBorderRect];
        [mainNegativePath appendPath: mainPath];
        mainNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(mainBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [mainPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(mainBorderRect.size.width), 0);
            [mainNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [mainNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
}
@end
