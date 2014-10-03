//
//  LayerDeleteButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerClearButton.h"

@implementation ADLayerClearButton

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
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
//    UIColor* iconColor = [UIColor colorWithRed: 0.574 green: 0.574 blue: 0.574 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 27.79, 7);
    CGContextRotateCTM(context, 90 * M_PI / 180);
    
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(12, 15.79)];
    [bezier2Path addLineToPoint: CGPointMake(30, 15.79)];
    [bezier2Path addLineToPoint: CGPointMake(30, -4.21)];
    [bezier2Path addLineToPoint: CGPointMake(12, -4.21)];
    [bezier2Path addLineToPoint: CGPointMake(12, 15.79)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(0, -3.21)];
    [bezier2Path addLineToPoint: CGPointMake(0, 11.11)];
    [bezier2Path addCurveToPoint: CGPointMake(3.5, 14.79) controlPoint1: CGPointMake(0, 13.14) controlPoint2: CGPointMake(1.57, 14.79)];
    [bezier2Path addLineToPoint: CGPointMake(9, 14.79)];
    [bezier2Path addLineToPoint: CGPointMake(9, -4.21)];
    [bezier2Path addLineToPoint: CGPointMake(1, -4.21)];
    [bezier2Path addLineToPoint: CGPointMake(0, -3.21)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [iconColor setFill];
    [bezier2Path fill];
    CGContextRestoreGState(context);
    
    
    CGContextRestoreGState(context);

}


@end
