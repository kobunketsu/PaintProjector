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

- (void)setIsReversePaint:(BOOL)isReversePaint{
    _isReversePaint = isReversePaint;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
        if (self.isReversePaint) {
            [self drawReverseSelectedWithFrame:rect];
        }
        else{
            [self drawNormalSelectedWithFrame:rect];
        }
    }
    else{
        if (self.isReversePaint) {
            [self drawReverseWithFrame:rect];
        }
        else{
            [self drawNormalWithFrame:rect];
        }
    }
}

- (void)drawNormalSelectedWithFrame:(CGRect)rect
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

- (void)drawNormalWithFrame:(CGRect)rect{
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

- (void)drawReverseWithFrame: (CGRect)frame;
{
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
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor.CGColor, (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor, (id)gradientColor.CGColor], gradientLocations);
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconSpecularColor2.CGColor, (id)iconSpecularColor.CGColor], gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -4.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 63.5) * 0.50391 - 0) + 0.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43.48) * 0.42492 + 0.5), 63.5, 43.48);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 7.61)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 1.75)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 12.36)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 18.22)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.57, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.69, CGRectGetMinY(iconNormal) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.16, CGRectGetMinY(iconNormal) + 1.15)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.89, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.96, CGRectGetMinY(iconNormal) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.33, CGRectGetMinY(iconNormal) + 10.91)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.74, CGRectGetMinY(iconNormal) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.46, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.71, CGRectGetMinY(iconNormal) + 19.25)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.59, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 36.78, CGRectGetMinY(iconNormal) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 38.77, CGRectGetMinY(iconNormal) + 15.23)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 51.52, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 42.41, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 48.23, CGRectGetMinY(iconNormal) + 3.22)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 56.87, CGRectGetMinY(iconNormal) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 53.51, CGRectGetMinY(iconNormal) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 55.55, CGRectGetMinY(iconNormal) + 0.76)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 54.04, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 66.56, CGRectGetMinY(iconNormal) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 65.62, CGRectGetMinY(iconNormal) + 25.97)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.45, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.44, CGRectGetMinY(iconNormal) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.06, CGRectGetMinY(iconNormal) + 46.11)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.89, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 2.23, CGRectGetMinY(iconNormal) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 3.08, CGRectGetMinY(iconNormal) + 10.55)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 63.5, CGRectGetHeight(bezierBounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.09 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 12.74 * bezierResizeRatio), 9.2 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.25 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -4.93 * bezierResizeRatio), 32.17 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezierPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezierPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
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
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 7.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 1.75)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 12.36)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 18.22)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.57, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.69, CGRectGetMinY(iconNormal) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.16, CGRectGetMinY(iconNormal) + 1.15)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.89, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.96, CGRectGetMinY(iconNormal) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.33, CGRectGetMinY(iconNormal) + 10.91)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.74, CGRectGetMinY(iconNormal) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.46, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.71, CGRectGetMinY(iconNormal) + 19.25)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.59, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 36.78, CGRectGetMinY(iconNormal) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 38.77, CGRectGetMinY(iconNormal) + 15.23)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 51.52, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 42.41, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 48.23, CGRectGetMinY(iconNormal) + 3.22)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 56.87, CGRectGetMinY(iconNormal) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 53.51, CGRectGetMinY(iconNormal) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 55.55, CGRectGetMinY(iconNormal) + 0.76)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 54.04, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 66.56, CGRectGetMinY(iconNormal) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 65.62, CGRectGetMinY(iconNormal) + 25.97)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.45, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.44, CGRectGetMinY(iconNormal) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.06, CGRectGetMinY(iconNormal) + 46.11)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.89, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 2.23, CGRectGetMinY(iconNormal) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 3.08, CGRectGetMinY(iconNormal) + 10.55)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 63.5, CGRectGetHeight(bezier3Bounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -5.94 * bezier3ResizeRatio), 57.04 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.25 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -22.59 * bezier3ResizeRatio), 21.68 * bezier3ResizeRatio,
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

- (void)drawReverseSelectedWithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.227 green: 0.227 blue: 0.227 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconColor.CGColor, (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor, (id)gradientColor.CGColor], gradientLocations);
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)iconSpecularColor2.CGColor, (id)iconSpecularColor.CGColor], gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -4.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 63.5) * 0.50391 - 0) + 0.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43.48) * 0.42492 + 0.5), 63.5, 43.48);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, [glow CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 7.61)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 1.75)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 12.36)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 18.22)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.57, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.69, CGRectGetMinY(iconNormal) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.16, CGRectGetMinY(iconNormal) + 1.15)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.89, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.96, CGRectGetMinY(iconNormal) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.33, CGRectGetMinY(iconNormal) + 10.91)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.74, CGRectGetMinY(iconNormal) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.46, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.71, CGRectGetMinY(iconNormal) + 19.25)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.59, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 36.78, CGRectGetMinY(iconNormal) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 38.77, CGRectGetMinY(iconNormal) + 15.23)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 51.52, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 42.41, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 48.23, CGRectGetMinY(iconNormal) + 3.22)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 56.87, CGRectGetMinY(iconNormal) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 53.51, CGRectGetMinY(iconNormal) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 55.55, CGRectGetMinY(iconNormal) + 0.76)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 54.04, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 66.56, CGRectGetMinY(iconNormal) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 65.62, CGRectGetMinY(iconNormal) + 25.97)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.45, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.44, CGRectGetMinY(iconNormal) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.06, CGRectGetMinY(iconNormal) + 46.11)];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.89, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 2.23, CGRectGetMinY(iconNormal) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 3.08, CGRectGetMinY(iconNormal) + 10.55)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 63.5, CGRectGetHeight(bezierBounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.09 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 12.74 * bezierResizeRatio), 9.2 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.25 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -4.93 * bezierResizeRatio), 32.17 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGContextSaveGState(context);
            UIRectClip(bezierPath.bounds);
            CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
            
            CGContextSetAlpha(context, CGColorGetAlpha([iconHighlight CGColor]));
            CGContextBeginTransparencyLayer(context, NULL);
            {
                UIColor* opaqueShadow = [iconHighlight colorWithAlphaComponent: 1];
                CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, [opaqueShadow CGColor]);
                CGContextSetBlendMode(context, kCGBlendModeSourceOut);
                CGContextBeginTransparencyLayer(context, NULL);
                
                [opaqueShadow setFill];
                [bezierPath fill];
                
                CGContextEndTransparencyLayer(context);
            }
            CGContextEndTransparencyLayer(context);
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
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 39.42, CGRectGetMinY(iconNormal) + 7.61)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 1.75)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 26.38, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 23.55, CGRectGetMinY(iconNormal) + 12.36)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 36.6, CGRectGetMinY(iconNormal) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 29.2, CGRectGetMinY(iconNormal) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 33.78, CGRectGetMinY(iconNormal) + 18.22)];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 14.57, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 8.69, CGRectGetMinY(iconNormal) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 12.16, CGRectGetMinY(iconNormal) + 1.15)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 22.89, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 17.96, CGRectGetMinY(iconNormal) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 21.33, CGRectGetMinY(iconNormal) + 10.91)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 31.74, CGRectGetMinY(iconNormal) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 24.46, CGRectGetMinY(iconNormal) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 26.71, CGRectGetMinY(iconNormal) + 19.25)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 40.59, CGRectGetMinY(iconNormal) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 36.78, CGRectGetMinY(iconNormal) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 38.77, CGRectGetMinY(iconNormal) + 15.23)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 51.52, CGRectGetMinY(iconNormal) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 42.41, CGRectGetMinY(iconNormal) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 48.23, CGRectGetMinY(iconNormal) + 3.22)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 56.87, CGRectGetMinY(iconNormal) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 53.51, CGRectGetMinY(iconNormal) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 55.55, CGRectGetMinY(iconNormal) + 0.76)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 54.04, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 66.56, CGRectGetMinY(iconNormal) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 65.62, CGRectGetMinY(iconNormal) + 25.97)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 9.45, CGRectGetMinY(iconNormal) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 41.44, CGRectGetMinY(iconNormal) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 22.06, CGRectGetMinY(iconNormal) + 46.11)];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.89, CGRectGetMinY(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) - 2.23, CGRectGetMinY(iconNormal) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) - 3.08, CGRectGetMinY(iconNormal) + 10.55)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 6.91, CGRectGetMinY(iconNormal) + 0)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 63.5, CGRectGetHeight(bezier3Bounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -5.94 * bezier3ResizeRatio), 57.04 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.25 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -22.59 * bezier3ResizeRatio), 21.68 * bezier3ResizeRatio,
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
