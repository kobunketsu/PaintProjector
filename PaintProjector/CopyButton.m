//
//  CopyButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CopyButton.h"

@implementation CopyButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.855 green: 1 blue: 0 alpha: 1];
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
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 51, 44);
    
    
    //// Group
    {
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.90196 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49020 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.11364 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.47059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.10108 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.47059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.88636 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49020 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.89892 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.47937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.90196 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.92157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.88636 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.91279 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.92157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.89892 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.92157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.11364 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.90196 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.92157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.10108 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.91279 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.92157 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.95930 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.96489 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.47059 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.39216 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.42727 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.39216 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.95930 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.39216 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.39216 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04070 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.42727 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.92157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.96489 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04070 * CGRectGetHeight(group))];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.31373 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.09804 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.07843 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.11364 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.08721 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.07843 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.10108 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.07843 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.88636 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.09804 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.07843 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.89892 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.08721 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.31373 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.39216 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.31373 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.95930 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.34884 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.07843 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.90909 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.03511 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.95930 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.07843 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04070 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.03511 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.39216 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.31373 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.09091 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.34884 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.31373 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.04070 * CGRectGetHeight(group))];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32955 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46591 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.84314 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46591 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.87255 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.85938 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46591 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.87255 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.48117 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.84314 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.53409 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.87255 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.51883 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.85938 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.53409 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.53409 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.67045 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.69608 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.70455 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.68928 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.71232 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.70455 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.66667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.67045 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.67983 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.70455 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.66667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.68928 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.53409 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54902 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.53409 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.51961 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53278 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.53409 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.51961 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.51883 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54902 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46591 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51961 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.48117 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53278 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46591 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46591 * CGRectGetHeight(group))];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32955 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.69608 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29545 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.66667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31072 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.67983 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29545 * CGRectGetHeight(group))];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32955 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.71232 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29545 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.72549 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31072 * CGRectGetHeight(group))];
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


@end
