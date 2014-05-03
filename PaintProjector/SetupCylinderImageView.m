//
//  SetupCylinderImageView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupCylinderImageView.h"

@implementation SetupCylinderImageView

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
    UIColor* fillColor2 = [UIColor colorWithRed: 0.494 green: 0.494 blue: 0.494 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.941];
    UIColor* innerShadowColor = [UIColor colorWithRed: 0.326 green: 0.326 blue: 0.326 alpha: 1];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0.653 green: 0.653 blue: 0.653 alpha: 0.498];
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
    UIColor* highlight = hightlightColor;
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 66);
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 47) * 0.52632 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 47) * 0.47368 + 0.5), 47, 47);
    
    
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
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.06383 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88298 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11702 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.93617 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.06383 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91236 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.08764 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.93617 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88298 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.93617 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.93617 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88298 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91236 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.93617 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.93617 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91236 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.93617 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.11702 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88298 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06383 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.93617 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.08764 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.91236 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06383 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11702 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06383 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.06383 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.11702 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.08764 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06383 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.06383 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.08764 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.06383 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88298 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88298 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.11702 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11702 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00000 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05239 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.05239 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00000 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88298 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00000 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 1.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.11702 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.94761 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00000 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05239 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 1.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88298 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88298 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94761 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.94761 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11702 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88298 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.05239 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.00000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94761 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.68085 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53191 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.89362 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.61702 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.77625 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53191 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.89362 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.61702 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.89362 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89362 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.12766 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89362 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.68085 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53191 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.12766 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89362 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.50000 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53191 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56348 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.52130 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.10638 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.87234 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.37975 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60597 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.10638 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.87234 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.10638 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53723 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.31915 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42553 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.10638 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53723 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.22375 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42553 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56348 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.52130 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.38609 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42553 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.47634 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44419 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84118 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.28799 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84118 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13754 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.88273 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.24644 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.88273 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17909 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.69073 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13754 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.79964 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09600 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.73228 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09600 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.69073 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.28799 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.64919 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17909 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.64919 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.24644 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84118 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.28799 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.73228 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32954 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.79964 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32954 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
            [fillColor2 setFill];
            [bezier2Path fill];
            
            ////// Bezier 2 Inner Shadow
            CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -innerShadowBlurRadius, -innerShadowBlurRadius);
            bezier2BorderRect = CGRectOffset(bezier2BorderRect, -innerShadowOffset.width, -innerShadowOffset.height);
            bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
            
            UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
            [bezier2NegativePath appendPath: bezier2Path];
            bezier2NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = innerShadowOffset.width + round(bezier2BorderRect.size.width);
                CGFloat yOffset = innerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            innerShadowBlurRadius,
                                            innerShadow.CGColor);
                
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
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    

}


@end
