//
//  EyeDropperIndicatorView.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-13.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "EyeDropperIndicatorView.h"

@implementation EyeDropperIndicatorView
@synthesize color = _color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _color = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.5];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(44.8, 44.8)];
    [bezierPath addCurveToPoint: CGPointMake(44.8, 104.2) controlPoint1: CGPointMake(28.4, 61.2) controlPoint2: CGPointMake(28.4, 87.8)];
    [bezierPath addCurveToPoint: CGPointMake(104.2, 104.2) controlPoint1: CGPointMake(61.2, 120.6) controlPoint2: CGPointMake(87.8, 120.6)];
    [bezierPath addCurveToPoint: CGPointMake(104.2, 44.8) controlPoint1: CGPointMake(120.6, 87.8) controlPoint2: CGPointMake(120.6, 61.2)];
    [bezierPath addCurveToPoint: CGPointMake(44.8, 44.8) controlPoint1: CGPointMake(87.8, 28.4) controlPoint2: CGPointMake(61.2, 28.4)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(119.75, 29.25)];
    [bezierPath addCurveToPoint: CGPointMake(119.75, 119.75) controlPoint1: CGPointMake(144.75, 54.24) controlPoint2: CGPointMake(144.75, 94.76)];
    [bezierPath addCurveToPoint: CGPointMake(29.25, 119.75) controlPoint1: CGPointMake(94.76, 144.75) controlPoint2: CGPointMake(54.24, 144.75)];
    [bezierPath addCurveToPoint: CGPointMake(29.25, 29.25) controlPoint1: CGPointMake(4.25, 94.76) controlPoint2: CGPointMake(4.25, 54.24)];
    [bezierPath addCurveToPoint: CGPointMake(119.75, 29.25) controlPoint1: CGPointMake(54.24, 4.25) controlPoint2: CGPointMake(94.76, 4.25)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [_color setFill];
    [bezierPath fill];
    CGContextRestoreGState(context);
    
    [[UIColor whiteColor] setStroke];
    bezierPath.lineWidth = 2;
    [bezierPath stroke];
    
    //// cross Drawing
    UIBezierPath* crossPath = [UIBezierPath bezierPath];
    [crossPath moveToPoint: CGPointMake(75, 74)];
    [crossPath addLineToPoint: CGPointMake(94, 74)];
    [crossPath addLineToPoint: CGPointMake(94, 76)];
    [crossPath addLineToPoint: CGPointMake(75, 76)];
    [crossPath addLineToPoint: CGPointMake(75, 95)];
    [crossPath addLineToPoint: CGPointMake(73, 95)];
    [crossPath addLineToPoint: CGPointMake(73, 76)];
    [crossPath addLineToPoint: CGPointMake(54, 76)];
    [crossPath addLineToPoint: CGPointMake(54, 74)];
    [crossPath addLineToPoint: CGPointMake(73, 74)];
    [crossPath addLineToPoint: CGPointMake(73, 55)];
    [crossPath addLineToPoint: CGPointMake(75, 55)];
    [crossPath addLineToPoint: CGPointMake(75, 74)];
    [crossPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [[UIColor whiteColor] setFill];
    [crossPath fill];
    CGContextRestoreGState(context);

}

- (void)setColor:(UIColor *)color {
    _color = color;
    [self setNeedsDisplay];
}

@end
