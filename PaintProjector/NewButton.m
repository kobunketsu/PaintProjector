//
//  NewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "NewButton.h"

@implementation NewButton

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
- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
        [self drawSelected];
//        [self setTitleColor:[UIColor colorWithRed:247/255.0 green:167/255.0 blue:211/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        [self drawNormal];
//        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawSelected
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0.949 blue: 0.78 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.8 green: 0.759 blue: 0.624 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.52 green: 0.373 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 1 green: 0.972 blue: 0.9 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 0.983 blue: 0.94 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.9 green: 0.854 blue: 0.702 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -3.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.49351 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 51, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24894 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.83459 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07099 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.91583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14240 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.90537 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35549 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68711 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40685 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.69082 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33135 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.68341 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48234 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00264 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45740 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73771 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94539 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77040 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89535 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88476 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83486 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58008 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00603 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34875 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03116 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19380 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12930 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.04723 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62118 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31445 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35841 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00558 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58908 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.02994 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.25955 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28490 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24329 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22557 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24152 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26149 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28947 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27757 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30832 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.30856 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31036 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20924 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34896 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26858 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23266 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31468 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28369 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18379 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15275 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.13649 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40064 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.13473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43655 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22197 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46453 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.17078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48338 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.20177 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48543 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38431 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24393 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40772 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.20788 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36090 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.17689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35885 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66547 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14428 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64206 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23151 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67004 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18033 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68889 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21131 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69093 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58982 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25171 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64915 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25348 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61323 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21743 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56640 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.18644 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56436 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64407 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79290 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72078 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59802 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77309 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77947 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.74778 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.69013 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81271 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75075 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79251 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.74810 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63093 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.80820 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70305 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79415 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65074 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70205 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61112 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64143 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63132 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33291 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79055 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31665 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73122 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.31489 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76714 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40213 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79512 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35094 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81397 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38193 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81601 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40607 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71489 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.42233 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77423 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42409 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73831 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38804 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69148 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35705 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68944 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 49.96, CGRectGetHeight(bezier5Bounds) / 43.34);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.31 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -0.09 * bezier5ResizeRatio), 11.04 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.21 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -4.71 * bezier5ResizeRatio), 40.76 * bezier5ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 5 Inner Shadow
            CGRect bezier5BorderRect = CGRectInset([bezier5Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier5BorderRect = CGRectOffset(bezier5BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier5BorderRect = CGRectInset(CGRectUnion(bezier5BorderRect, [bezier5Path bounds]), -1, -1);
            
            UIBezierPath* bezier5NegativePath = [UIBezierPath bezierPathWithRect: bezier5BorderRect];
            [bezier5NegativePath appendPath: bezier5Path];
            bezier5NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier5BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier5Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier5BorderRect.size.width), 0);
                [bezier5NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier5NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24894 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.83459 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07099 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.91583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14240 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.90537 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35549 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68711 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40685 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.69082 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33135 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.68341 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48234 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00264 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45740 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73771 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94539 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77040 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89535 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88476 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83486 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58008 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00603 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34875 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03116 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19380 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12930 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.04723 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62118 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31445 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35841 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00558 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58908 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.02994 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.25955 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28490 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24329 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22557 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24152 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26149 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28947 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27757 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30832 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.30856 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31036 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20924 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34896 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26858 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23266 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31468 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28369 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18379 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15275 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.13649 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40064 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.13473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43655 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22197 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46453 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.17078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48338 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.20177 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48543 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38431 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24393 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40772 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.20788 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36090 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.17689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35885 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66547 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14428 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64206 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23151 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67004 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18033 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68889 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21131 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69093 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58982 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25171 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64915 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25348 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61323 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21743 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56640 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.18644 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56436 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64407 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79290 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72078 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59802 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77309 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77947 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.74778 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.69013 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81271 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75075 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79251 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.74810 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63093 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.80820 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70305 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79415 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65074 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70205 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61112 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64143 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63132 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33291 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79055 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31665 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73122 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.31489 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76714 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40213 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79512 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35094 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81397 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38193 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81601 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40607 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71489 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.42233 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77423 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42409 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73831 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38804 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69148 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35705 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68944 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 49.96, CGRectGetHeight(bezier2Bounds) / 43.34);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.08 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 1.55 * bezier2ResizeRatio), 48.76 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.18 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.02 * bezier2ResizeRatio), 20.5 * bezier2ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    
    
}

- (void)drawNormal{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.227 green: 0.227 blue: 0.227 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -3.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.49351 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 51, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78200 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24894 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.83459 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07099 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.91583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14240 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.90537 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35549 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68711 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40685 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.69082 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33135 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.68341 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48234 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00264 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45740 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73771 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94539 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77040 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89535 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88476 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83486 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58008 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00603 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34875 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03116 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19380 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12930 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.04723 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62118 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31445 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78200 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35841 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00558 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58908 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.02994 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.25955 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28490 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24329 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22557 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24152 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26149 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28947 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27757 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30832 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.30856 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31036 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20924 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34896 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26858 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23266 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31468 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28369 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18379 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15275 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.13649 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40064 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.13473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43655 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22197 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46453 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.17078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48338 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.20177 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48543 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38431 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24393 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40772 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.20788 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36090 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.17689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35885 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66547 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14428 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64206 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23151 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67004 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18033 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68889 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21131 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69093 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58982 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25171 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64915 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25348 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61323 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21743 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56640 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.18644 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56436 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64407 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79290 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72078 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59802 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77309 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77947 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.74778 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.69013 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81271 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75075 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79251 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.74810 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63093 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.80820 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70305 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79415 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65074 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70205 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61112 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64143 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63132 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33291 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79055 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31665 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73122 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.31489 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76714 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40213 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79512 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35094 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81397 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38193 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81601 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40607 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71489 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.42233 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77423 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42409 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73831 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38804 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69148 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35705 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68944 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 49.96, CGRectGetHeight(bezier5Bounds) / 43.34);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.31 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -0.09 * bezier5ResizeRatio), 11.04 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.21 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -4.71 * bezier5ResizeRatio), 40.76 * bezier5ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 5 Inner Shadow
            CGRect bezier5BorderRect = CGRectInset([bezier5Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier5BorderRect = CGRectOffset(bezier5BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier5BorderRect = CGRectInset(CGRectUnion(bezier5BorderRect, [bezier5Path bounds]), -1, -1);
            
            UIBezierPath* bezier5NegativePath = [UIBezierPath bezierPathWithRect: bezier5BorderRect];
            [bezier5NegativePath appendPath: bezier5Path];
            bezier5NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier5BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier5Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier5BorderRect.size.width), 0);
                [bezier5NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier5NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91060 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.24894 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.83459 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.07099 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.91583 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14240 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.90537 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35549 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68711 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40685 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.79970 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31069 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.69082 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33135 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.68341 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48234 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.99304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.78477 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50096 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00264 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45740 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.73771 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94539 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77040 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.89535 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88476 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15915 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83486 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58008 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00603 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34875 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03116 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19380 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12930 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.04723 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62118 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31445 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.78201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04937 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35841 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.00558 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58908 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.02994 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.25955 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28490 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24329 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.22557 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24152 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26149 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28947 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27757 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30832 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.30856 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31036 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20924 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34896 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.26858 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23266 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.26349 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20468 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31468 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28369 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18379 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15275 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.13649 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40064 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.13473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43655 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22197 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46453 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.17078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48338 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.20177 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.48543 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22591 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38431 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.24217 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24393 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40772 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15669 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37974 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.20788 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36090 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.17689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.35885 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.66547 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14604 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60614 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14428 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64206 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23151 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67004 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18033 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68889 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21131 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69093 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.23545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58982 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25171 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64915 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25348 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61323 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16624 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58525 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21743 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56640 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.18644 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.56436 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.64407 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79290 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72078 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59802 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77309 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77947 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.74778 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.69013 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81271 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.75075 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79251 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.74810 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63093 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.80820 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70305 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79415 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65074 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.61270 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67605 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70205 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.61112 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.64143 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.63132 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33291 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79055 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31665 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73122 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.31489 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.76714 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40213 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79512 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.35094 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81397 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38193 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81601 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40607 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71489 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.42233 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77423 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.42409 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73831 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33685 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.71033 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38804 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69148 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.35705 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68944 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 49.96, CGRectGetHeight(bezier2Bounds) / 43.34);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.08 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 1.55 * bezier2ResizeRatio), 48.76 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.18 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.02 * bezier2ResizeRatio), 20.5 * bezier2ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    
    
}@end
