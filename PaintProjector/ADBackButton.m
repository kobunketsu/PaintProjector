//
//  BackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADBackButton.h"

@implementation ADBackButton

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
//        [self setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        [self drawNormal];
//        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

- (void)drawSelected
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0.95 blue: 0.777 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.802 green: 0.761 blue: 0.623 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.516 green: 0.369 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 1 green: 0.972 blue: 0.902 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 0.983 blue: 0.94 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.901 green: 0.855 blue: 0.7 alpha: 1].CGColor,
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
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
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 44, CGRectGetHeight(bezier5Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + 10.15 * bezier5ResizeRatio), 10.23 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -3.84 * bezier5ResizeRatio), 25.99 * bezier5ResizeRatio,
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
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.30801 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 44, CGRectGetHeight(bezierBounds) / 44);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.21 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -22.25 * bezierResizeRatio), 63.79 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -20.65 * bezierResizeRatio), 21.83 * bezierResizeRatio,
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
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
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 44, CGRectGetHeight(bezier5Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + 10.15 * bezier5ResizeRatio), 10.23 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -3.84 * bezier5ResizeRatio), 25.99 * bezier5ResizeRatio,
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
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38636 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37619 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14654 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.30801 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70455 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71472 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.88636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87619 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41927 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58073 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.12381 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.72727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.75000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.73982 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29545 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.51018 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28528 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.50000 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58536 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68790 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71009 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60755 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.66571 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62974 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.43763 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.54018 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.56237 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45982 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.51799 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.48201 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.28991 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91518 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93737 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.39245 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89299 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41464 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85701 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31210 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83482 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37026 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.33429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.81263 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.09091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.04070 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.90909 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.95930 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 44, CGRectGetHeight(bezierBounds) / 44);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.21 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -22.25 * bezierResizeRatio), 63.79 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -20.65 * bezierResizeRatio), 21.83 * bezierResizeRatio,
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
@end
