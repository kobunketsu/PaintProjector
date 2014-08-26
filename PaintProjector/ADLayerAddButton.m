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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = iconColor;
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(24, 8)];
        [bezier2Path addCurveToPoint: CGPointMake(24, 20) controlPoint1: CGPointMake(24, 8) controlPoint2: CGPointMake(24, 13.73)];
        [bezier2Path addLineToPoint: CGPointMake(36, 20)];
        [bezier2Path addCurveToPoint: CGPointMake(37, 21) controlPoint1: CGPointMake(36.55, 20) controlPoint2: CGPointMake(37, 20.45)];
        [bezier2Path addLineToPoint: CGPointMake(37, 23)];
        [bezier2Path addCurveToPoint: CGPointMake(36, 24) controlPoint1: CGPointMake(37, 23.55) controlPoint2: CGPointMake(36.55, 24)];
        [bezier2Path addLineToPoint: CGPointMake(24, 24)];
        [bezier2Path addCurveToPoint: CGPointMake(24, 36) controlPoint1: CGPointMake(24, 30.27) controlPoint2: CGPointMake(24, 36)];
        [bezier2Path addCurveToPoint: CGPointMake(23, 37) controlPoint1: CGPointMake(24, 36.55) controlPoint2: CGPointMake(23.55, 37)];
        [bezier2Path addLineToPoint: CGPointMake(21, 37)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 36) controlPoint1: CGPointMake(20.45, 37) controlPoint2: CGPointMake(20, 36.55)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 24) controlPoint1: CGPointMake(20, 36) controlPoint2: CGPointMake(20, 30.27)];
        [bezier2Path addLineToPoint: CGPointMake(8, 24)];
        [bezier2Path addCurveToPoint: CGPointMake(7, 23) controlPoint1: CGPointMake(7.45, 24) controlPoint2: CGPointMake(7, 23.55)];
        [bezier2Path addLineToPoint: CGPointMake(7, 21)];
        [bezier2Path addCurveToPoint: CGPointMake(8, 20) controlPoint1: CGPointMake(7, 20.45) controlPoint2: CGPointMake(7.45, 20)];
        [bezier2Path addLineToPoint: CGPointMake(20, 20)];
        [bezier2Path addCurveToPoint: CGPointMake(20, 8) controlPoint1: CGPointMake(20, 13.73) controlPoint2: CGPointMake(20, 8)];
        [bezier2Path addCurveToPoint: CGPointMake(21, 7) controlPoint1: CGPointMake(20, 7.45) controlPoint2: CGPointMake(20.45, 7)];
        [bezier2Path addLineToPoint: CGPointMake(23, 7)];
        [bezier2Path addCurveToPoint: CGPointMake(24, 8) controlPoint1: CGPointMake(23.55, 7) controlPoint2: CGPointMake(24, 7.45)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [color setFill];
        [bezier2Path fill];
        CGContextRestoreGState(context);
        
    }

}


@end
