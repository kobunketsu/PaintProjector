//
//  SetupCylinderButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupCylinderView.h"

@implementation SetupCylinderView

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
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.941];
    UIColor* innerShadowColor = [UIColor colorWithRed: 0.327 green: 0.327 blue: 0.327 alpha: 1];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0.375 green: 0.375 blue: 0.375 alpha: 0.498];
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
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 31) * 0.51429 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.38095 + 0.5), 31, 45);
    
    
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
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84533 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29888 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84533 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07889 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.03605 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23814 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.03605 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13964 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15467 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07889 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65461 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01815 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34539 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01815 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15467 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29888 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.03605 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13964 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.03605 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23814 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84533 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29888 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.34539 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35963 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.65461 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35963 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15467 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34333 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84533 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34333 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.34539 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.40408 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.65461 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.40408 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98837 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23333 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.94069 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.31295 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.98837 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.27314 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98837 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.83333 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98837 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85556 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98339 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85556 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84533 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94333 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.96892 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88767 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.92290 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91862 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15467 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94333 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65461 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00408 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34539 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00408 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01661 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85556 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.07710 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91862 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.03108 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88767 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01163 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85556 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01163 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23333 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15467 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34333 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.01163 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.27314 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.05931 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.31295 * CGRectGetHeight(group3))];
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
