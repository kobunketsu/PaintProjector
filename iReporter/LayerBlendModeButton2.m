//
//  LayerBlendModeButton2.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-30.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerBlendModeButton2.h"

@implementation LayerBlendModeButton2

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
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color = [UIColor colorWithRed: 0.533 green: 0.994 blue: 1 alpha: 1];
    UIColor* gradient2Color = [UIColor colorWithRed: 0.094 green: 0.979 blue: 0.384 alpha: 1];
    UIColor* gradient3Color = [UIColor colorWithRed: 0.496 green: 0.719 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)color.CGColor,
                                (id)gradient2Color.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    NSArray* gradient3Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)gradient3Color.CGColor, nil];
    CGFloat gradient3Locations[] = {0, 1};
    CGGradientRef gradient3 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient3Colors, gradient3Locations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 3.1);
    CGFloat shadowBlurRadius = 2;
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(12.1, 3.9)];
        [bezier2Path addCurveToPoint: CGPointMake(31.9, 3.9) controlPoint1: CGPointMake(17.57, 9.37) controlPoint2: CGPointMake(26.43, 9.37)];
        [bezier2Path addCurveToPoint: CGPointMake(34.88, -0.5) controlPoint1: CGPointMake(33.2, 2.6) controlPoint2: CGPointMake(34.2, 1.1)];
        [bezier2Path addCurveToPoint: CGPointMake(31.9, 14.9) controlPoint1: CGPointMake(37.06, 4.6) controlPoint2: CGPointMake(36.06, 10.74)];
        [bezier2Path addCurveToPoint: CGPointMake(12.1, 14.9) controlPoint1: CGPointMake(26.43, 20.37) controlPoint2: CGPointMake(17.57, 20.37)];
        [bezier2Path addCurveToPoint: CGPointMake(9.12, -0.5) controlPoint1: CGPointMake(7.94, 10.74) controlPoint2: CGPointMake(6.94, 4.6)];
        [bezier2Path addCurveToPoint: CGPointMake(12.1, 3.9) controlPoint1: CGPointMake(9.8, 1.1) controlPoint2: CGPointMake(10.8, 2.6)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGContextDrawLinearGradient(context, gradient3, CGPointMake(22, -0.5), CGPointMake(22, 19), 0);
        CGContextRestoreGState(context);
        [[UIColor whiteColor] setStroke];
        bezier2Path.lineWidth = 2;
        [bezier2Path stroke];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(31.9, 3.9)];
        [bezier5Path addCurveToPoint: CGPointMake(12.1, 3.9) controlPoint1: CGPointMake(26.43, 9.37) controlPoint2: CGPointMake(17.57, 9.37)];
        [bezier5Path addCurveToPoint: CGPointMake(9.12, -0.5) controlPoint1: CGPointMake(10.8, 2.6) controlPoint2: CGPointMake(9.8, 1.1)];
        [bezier5Path addLineToPoint: CGPointMake(34.88, -0.5)];
        [bezier5Path addCurveToPoint: CGPointMake(31.9, 3.9) controlPoint1: CGPointMake(34.2, 1.1) controlPoint2: CGPointMake(33.2, 2.6)];
        [bezier5Path closePath];
        CGContextSaveGState(context);
        [bezier5Path addClip];
        CGContextDrawLinearGradient(context, gradient2, CGPointMake(22, -0.5), CGPointMake(22, 8), 0);
        CGContextRestoreGState(context);
        [[UIColor whiteColor] setStroke];
        bezier5Path.lineWidth = 2;
        [bezier5Path stroke];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient2);
    CGGradientRelease(gradient3);
    CGColorSpaceRelease(colorSpace);
    
  
}


@end
