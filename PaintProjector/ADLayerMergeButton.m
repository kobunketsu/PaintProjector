//
//  LayerMergeButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-23.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerMergeButton.h"

@implementation ADLayerMergeButton

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
    
    //// Shadow Declarations
    UIColor* highlight = UIColor.whiteColor;
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(24.06, 8.01)];
    [bezier3Path addCurveToPoint: CGPointMake(24.06, 29.64) controlPoint1: CGPointMake(24.06, 8.01) controlPoint2: CGPointMake(24.06, 22.3)];
    [bezier3Path addCurveToPoint: CGPointMake(33.78, 21.03) controlPoint1: CGPointMake(28, 26) controlPoint2: CGPointMake(33.78, 21.03)];
    [bezier3Path addCurveToPoint: CGPointMake(35.24, 21.03) controlPoint1: CGPointMake(34.18, 20.63) controlPoint2: CGPointMake(34.84, 20.63)];
    [bezier3Path addLineToPoint: CGPointMake(36.7, 22.46)];
    [bezier3Path addCurveToPoint: CGPointMake(36.7, 23.89) controlPoint1: CGPointMake(37.1, 22.86) controlPoint2: CGPointMake(37.1, 23.5)];
    [bezier3Path addLineToPoint: CGPointMake(22.82, 36.7)];
    [bezier3Path addCurveToPoint: CGPointMake(22, 37) controlPoint1: CGPointMake(22.6, 36.92) controlPoint2: CGPointMake(22.29, 37.02)];
    [bezier3Path addCurveToPoint: CGPointMake(21.29, 36.8) controlPoint1: CGPointMake(21.75, 37.02) controlPoint2: CGPointMake(21.5, 36.95)];
    [bezier3Path addCurveToPoint: CGPointMake(7.3, 23.89) controlPoint1: CGPointMake(21.18, 36.7) controlPoint2: CGPointMake(7.3, 23.89)];
    [bezier3Path addCurveToPoint: CGPointMake(7.3, 22.46) controlPoint1: CGPointMake(6.9, 23.5) controlPoint2: CGPointMake(6.9, 22.86)];
    [bezier3Path addLineToPoint: CGPointMake(8.76, 21.03)];
    [bezier3Path addCurveToPoint: CGPointMake(10.22, 21.03) controlPoint1: CGPointMake(9.16, 20.63) controlPoint2: CGPointMake(9.82, 20.63)];
    [bezier3Path addCurveToPoint: CGPointMake(19.94, 29.64) controlPoint1: CGPointMake(10.22, 21.03) controlPoint2: CGPointMake(16, 26)];
    [bezier3Path addCurveToPoint: CGPointMake(19.94, 8.01) controlPoint1: CGPointMake(19.94, 22.3) controlPoint2: CGPointMake(19.94, 8.01)];
    [bezier3Path addCurveToPoint: CGPointMake(20.97, 7) controlPoint1: CGPointMake(19.94, 7.45) controlPoint2: CGPointMake(20.4, 7)];
    [bezier3Path addLineToPoint: CGPointMake(23.03, 7)];
    [bezier3Path addCurveToPoint: CGPointMake(24.06, 8.01) controlPoint1: CGPointMake(23.6, 7) controlPoint2: CGPointMake(24.06, 7.45)];
    [bezier3Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, [highlight CGColor]);
    [color setFill];
    [bezier3Path fill];
    
    ////// Bezier 3 Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(bezier3Path.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [bezier3Path fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
}


@end
