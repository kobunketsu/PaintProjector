//
//  LayerVisibleButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerVisibleButton.h"

@implementation ADLayerVisibleButton

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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color = iconColor;
    UIColor* color2 = [UIColor colorWithRed: 0.852 green: 0.844 blue: 0.844 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(30.25, 12.74)];
    [bezierPath addCurveToPoint: CGPointMake(40.77, 21.14) controlPoint1: CGPointMake(37, 14.84) controlPoint2: CGPointMake(40.77, 21.14)];
    [bezierPath addCurveToPoint: CGPointMake(30.25, 30.25) controlPoint1: CGPointMake(40.77, 21.14) controlPoint2: CGPointMake(37, 27.98)];
    [bezierPath addCurveToPoint: CGPointMake(13.76, 30.25) controlPoint1: CGPointMake(23.49, 32.53) controlPoint2: CGPointMake(20.51, 32.31)];
    [bezierPath addCurveToPoint: CGPointMake(3.23, 22.01) controlPoint1: CGPointMake(7, 28.19) controlPoint2: CGPointMake(3.23, 22.01)];
    [bezierPath addCurveToPoint: CGPointMake(13.76, 12.74) controlPoint1: CGPointMake(3.23, 22.01) controlPoint2: CGPointMake(7, 15.06)];
    [bezierPath addCurveToPoint: CGPointMake(30.25, 12.74) controlPoint1: CGPointMake(20.51, 10.43) controlPoint2: CGPointMake(23.49, 10.65)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [color2 setFill];
    [bezierPath fill];
    CGContextRestoreGState(context);
    
    if (!self.isVisible) {
        return;
    }
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(17, 16, 11, 11)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [color setFill];
    [ovalPath fill];
    CGContextRestoreGState(context);
}
-(void)setIsVisible:(BOOL)isVisible{
    _isVisible = isVisible;
    [self setNeedsDisplay];
}

@end
