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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* highlight = UIColor.whiteColor;
    CGSize highlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat highlightBlurRadius = 0;
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
    [bezier5Path moveToPoint: CGPointMake(27.01, 9.34)];
    [bezier5Path addLineToPoint: CGPointMake(35.33, 9.37)];
    [bezier5Path addCurveToPoint: CGPointMake(37, 9.95) controlPoint1: CGPointMake(36.25, 9.37) controlPoint2: CGPointMake(37, 9.19)];
    [bezier5Path addCurveToPoint: CGPointMake(35.33, 12.62) controlPoint1: CGPointMake(37, 10.7) controlPoint2: CGPointMake(36.25, 12.62)];
    [bezier5Path addLineToPoint: CGPointMake(33.7, 12.62)];
    [bezier5Path addLineToPoint: CGPointMake(33.03, 33.62)];
    [bezier5Path addCurveToPoint: CGPointMake(30.36, 37) controlPoint1: CGPointMake(33.03, 35.49) controlPoint2: CGPointMake(31.84, 37)];
    [bezier5Path addLineToPoint: CGPointMake(13.64, 37)];
    [bezier5Path addCurveToPoint: CGPointMake(10.97, 33.62) controlPoint1: CGPointMake(12.16, 37) controlPoint2: CGPointMake(10.97, 35.49)];
    [bezier5Path addLineToPoint: CGPointMake(10.3, 12.62)];
    [bezier5Path addLineToPoint: CGPointMake(8.67, 12.62)];
    [bezier5Path addCurveToPoint: CGPointMake(7, 9.95) controlPoint1: CGPointMake(7.75, 12.62) controlPoint2: CGPointMake(7, 10.64)];
    [bezier5Path addCurveToPoint: CGPointMake(8.67, 9.37) controlPoint1: CGPointMake(7, 9.25) controlPoint2: CGPointMake(7.75, 9.37)];
    [bezier5Path addLineToPoint: CGPointMake(17.03, 9.37)];
    [bezier5Path addCurveToPoint: CGPointMake(19.36, 7) controlPoint1: CGPointMake(17.03, 9.37) controlPoint2: CGPointMake(18.44, 7)];
    [bezier5Path addLineToPoint: CGPointMake(24.7, 7)];
    [bezier5Path addCurveToPoint: CGPointMake(27.01, 9.34) controlPoint1: CGPointMake(25.56, 7) controlPoint2: CGPointMake(26.86, 9.08)];
    [bezier5Path closePath];
    [bezier5Path moveToPoint: CGPointMake(27.61, 21.26)];
    [bezier5Path addLineToPoint: CGPointMake(16.31, 21.26)];
    [bezier5Path addCurveToPoint: CGPointMake(14.99, 22.65) controlPoint1: CGPointMake(15.58, 21.26) controlPoint2: CGPointMake(14.99, 21.88)];
    [bezier5Path addLineToPoint: CGPointMake(14.99, 23.35)];
    [bezier5Path addCurveToPoint: CGPointMake(16.31, 24.75) controlPoint1: CGPointMake(14.99, 24.12) controlPoint2: CGPointMake(15.58, 24.75)];
    [bezier5Path addLineToPoint: CGPointMake(27.61, 24.75)];
    [bezier5Path addCurveToPoint: CGPointMake(28.94, 23.35) controlPoint1: CGPointMake(28.34, 24.75) controlPoint2: CGPointMake(28.94, 24.12)];
    [bezier5Path addLineToPoint: CGPointMake(28.94, 22.65)];
    [bezier5Path addCurveToPoint: CGPointMake(27.61, 21.26) controlPoint1: CGPointMake(28.94, 21.88) controlPoint2: CGPointMake(28.34, 21.26)];
    [bezier5Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, [highlight CGColor]);
    [iconColor setFill];
    [bezier5Path fill];
    
    ////// Bezier 5 Inner Shadow
    CGContextSaveGState(context);
    UIRectClip(bezier5Path.bounds);
    CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
    
    CGContextSetAlpha(context, CGColorGetAlpha([shadow CGColor]));
    CGContextBeginTransparencyLayer(context, NULL);
    {
        UIColor* opaqueShadow = [shadow colorWithAlphaComponent: 1];
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [opaqueShadow CGColor]);
        CGContextSetBlendMode(context, kCGBlendModeSourceOut);
        CGContextBeginTransparencyLayer(context, NULL);
        
        [opaqueShadow setFill];
        [bezier5Path fill];
        
        CGContextEndTransparencyLayer(context);
    }
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);

    
}


@end
