//
//  LayerDeleteDoneButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerDeleteDoneButton.h"

@implementation ADLayerDeleteDoneButton

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
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Group
    {
        //// Bezier Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 22, 22);
        CGContextRotateCTM(context, -45 * M_PI / 180);
        
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(2, -18.24)];
        [bezierPath addCurveToPoint: CGPointMake(2, -2) controlPoint1: CGPointMake(2, -18.24) controlPoint2: CGPointMake(2, -8.27)];
        [bezierPath addLineToPoint: CGPointMake(18.24, -2)];
        [bezierPath addCurveToPoint: CGPointMake(19.24, -1) controlPoint1: CGPointMake(18.79, -2) controlPoint2: CGPointMake(19.24, -1.55)];
        [bezierPath addLineToPoint: CGPointMake(19.24, 1)];
        [bezierPath addCurveToPoint: CGPointMake(18.24, 2) controlPoint1: CGPointMake(19.24, 1.55) controlPoint2: CGPointMake(18.79, 2)];
        [bezierPath addLineToPoint: CGPointMake(2, 2)];
        [bezierPath addCurveToPoint: CGPointMake(2, 18.24) controlPoint1: CGPointMake(2, 8.27) controlPoint2: CGPointMake(2, 18.24)];
        [bezierPath addCurveToPoint: CGPointMake(1, 19.24) controlPoint1: CGPointMake(2, 18.79) controlPoint2: CGPointMake(1.55, 19.24)];
        [bezierPath addLineToPoint: CGPointMake(-1, 19.24)];
        [bezierPath addCurveToPoint: CGPointMake(-2, 18.24) controlPoint1: CGPointMake(-1.55, 19.24) controlPoint2: CGPointMake(-2, 18.79)];
        [bezierPath addCurveToPoint: CGPointMake(-2, 2) controlPoint1: CGPointMake(-2, 18.24) controlPoint2: CGPointMake(-2, 8.27)];
        [bezierPath addLineToPoint: CGPointMake(-18.24, 2)];
        [bezierPath addCurveToPoint: CGPointMake(-19.24, 1) controlPoint1: CGPointMake(-18.79, 2) controlPoint2: CGPointMake(-19.24, 1.55)];
        [bezierPath addLineToPoint: CGPointMake(-19.24, -1)];
        [bezierPath addCurveToPoint: CGPointMake(-18.24, -2) controlPoint1: CGPointMake(-19.24, -1.55) controlPoint2: CGPointMake(-18.79, -2)];
        [bezierPath addLineToPoint: CGPointMake(-2, -2)];
        [bezierPath addCurveToPoint: CGPointMake(-2, -18.24) controlPoint1: CGPointMake(-2, -8.27) controlPoint2: CGPointMake(-2, -18.24)];
        [bezierPath addCurveToPoint: CGPointMake(-1, -19.24) controlPoint1: CGPointMake(-2, -18.79) controlPoint2: CGPointMake(-1.55, -19.24)];
        [bezierPath addLineToPoint: CGPointMake(1, -19.24)];
        [bezierPath addCurveToPoint: CGPointMake(2, -18.24) controlPoint1: CGPointMake(1.55, -19.24) controlPoint2: CGPointMake(2, -18.79)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [color setFill];
        [bezierPath fill];
        CGContextRestoreGState(context);
        
        
        CGContextRestoreGState(context);
    }

}


@end
