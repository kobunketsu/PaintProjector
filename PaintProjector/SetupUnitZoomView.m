//
//  SetupUnitZoomView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupUnitZoomView.h"

@implementation SetupUnitZoomView

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
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 55) * 0.45455 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 38) * 0.50000 + 0.5), 55, 38);
    
    
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
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.58027 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36037 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.58027 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.11976 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.62432 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29393 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.62432 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18620 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.42077 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.11976 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.53623 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05332 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.46482 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05332 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.42077 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36037 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.37672 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18620 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.37672 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29393 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.58027 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36037 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.46482 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42681 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.53623 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42681 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11705 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01369 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.23660 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06200 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.14469 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02196 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.19892 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.03975 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.36643 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.30331 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.28940 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09317 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34206 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.26098 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50452 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45028 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.39080 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34565 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.42600 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45028 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.64260 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.30331 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.58304 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45028 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.61417 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35908 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.81318 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06200 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.67103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.24755 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.76174 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.08666 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.89659 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02007 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.84413 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04716 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.87607 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.03077 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.85250 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82142 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.04787 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25911 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.03317 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60269 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82142 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65583 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.05953 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.35334 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.05953 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11673 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01359 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.02564 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60071 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.03895 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25287 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11705 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01369 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, hightlightOffset, hightlightBlurRadius, hightlight.CGColor);
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
