//
//  ADLayerDeleteButton.m
//  PaintProjector
//
//  Created by kobunketsu on 9/26/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLayerDeleteButton.h"

@implementation ADLayerDeleteButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
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
        [bezier2Path moveToPoint: CGPointMake(36, 20)];
        [bezier2Path addCurveToPoint: CGPointMake(37, 21) controlPoint1: CGPointMake(36.55, 20) controlPoint2: CGPointMake(37, 20.45)];
        [bezier2Path addLineToPoint: CGPointMake(37, 23)];
        [bezier2Path addCurveToPoint: CGPointMake(36, 24) controlPoint1: CGPointMake(37, 23.55) controlPoint2: CGPointMake(36.55, 24)];
        [bezier2Path addLineToPoint: CGPointMake(8, 24)];
        [bezier2Path addCurveToPoint: CGPointMake(7, 23) controlPoint1: CGPointMake(7.45, 24) controlPoint2: CGPointMake(7, 23.55)];
        [bezier2Path addLineToPoint: CGPointMake(7, 21)];
        [bezier2Path addCurveToPoint: CGPointMake(8, 20) controlPoint1: CGPointMake(7, 20.45) controlPoint2: CGPointMake(7.45, 20)];
        [bezier2Path addLineToPoint: CGPointMake(36, 20)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [color setFill];
        [bezier2Path fill];
        CGContextRestoreGState(context);
        
    }

}
@end
