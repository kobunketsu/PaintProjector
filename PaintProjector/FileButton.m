//
//  FileButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "FileButton.h"

@implementation FileButton

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
//        [self setTitleColor:[UIColor colorWithRed:72/255.0 green:110/255.0 blue:224/255.0 alpha:1] forState:UIControlStateSelected];
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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.387];
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0.201 blue: 1 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 0.707 green: 0.815 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.225 green: 0.424 blue: 0.988 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0.135 blue: 0.514 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.354 green: 0.543 blue: 0.938 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 0.498 green: 0.661 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.113 green: 0.312 blue: 0.994 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0.54, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
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
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconSelected = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
    //// IconSelected
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.5);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.04545 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.09019 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.79506 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18471 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.69388 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.10927 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.74818 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.14078 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.82817 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.16513 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.89044 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18112 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.84978 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15235 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.87766 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15951 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.97142 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.31806 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.95543 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.38032 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.98419 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.33967 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.97704 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.36754 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.92038 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.40105 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.92221 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.59082 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.93499 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.46336 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.93560 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.52829 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.95235 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.60862 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.96837 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.67088 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.97397 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62139 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.98114 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.64926 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.88747 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80786 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.82521 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82388 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.87470 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82948 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.84683 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.83665 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.80102 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80960 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63637 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.90982 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.75281 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.85651 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.69634 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.88992 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.95455 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.59091 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.97965 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.61601 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.43182 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.95455 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.40671 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.97965 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.91667 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.19466 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80534 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.31614 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.89759 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.24980 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.86048 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.16283 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82388 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.10058 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80786 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.14122 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.83665 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.11334 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82948 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.01967 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.67088 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.03569 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.60862 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.00691 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.64926 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.01408 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62139 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07483 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58551 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07770 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.59036 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07989 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.39986 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07777 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.40346 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.03865 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.38032 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.02266 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.31806 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.01704 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.36754 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.00988 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.33967 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.10364 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18112 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.16590 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.16513 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.11642 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15951 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.14429 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15235 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.20265 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18687 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.08333 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.25616 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.13601 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.31950 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.10149 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.04545 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.43182 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.02035 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.40671 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.59091 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.04545 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.61601 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.02035 * CGRectGetHeight(iconSelected))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.30715 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.30715 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.30715 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.69285 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.20065 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41366 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.20065 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58634 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.69285 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.69285 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.41366 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.79935 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.58634 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.79935 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.69285 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.30715 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.79935 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58634 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.79935 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41366 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.30715 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.30715 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.58634 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.20065 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.41366 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.20065 * CGRectGetHeight(iconSelected))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.58035 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58035 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.58035 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41965 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.62473 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.53598 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.62473 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.46402 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.41965 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41965 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.53598 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.37527 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.46402 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.37527 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.41965 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58035 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.37527 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.46402 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.37527 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.53598 * CGRectGetHeight(iconSelected))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.58035 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58035 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.46402 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62473 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.53598 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62473 * CGRectGetHeight(iconSelected))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 42.43, CGRectGetHeight(bezier5Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.36 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -4.87 * bezier5ResizeRatio), 27.16 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.12 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + 10.68 * bezier5ResizeRatio), 11.39 * bezier5ResizeRatio,
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
        
        
        //// Group 2
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 6 Drawing
            UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
            [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.04545 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.09019 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.79506 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18471 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.69388 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.10927 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.74818 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.14078 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.82817 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.16513 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.89044 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18112 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.84978 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15235 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.87766 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15951 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.97142 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.31806 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.95543 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.38032 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.98419 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.33967 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.97704 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.36754 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.92038 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.40105 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.92221 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.59082 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.93499 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.46336 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.93560 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.52829 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.95235 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.60862 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.96837 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.67088 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.97397 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62139 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.98114 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.64926 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.88747 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80786 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.82521 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82388 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.87470 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82948 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.84683 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.83665 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.80102 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80960 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63637 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.90982 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.75281 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.85651 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.69634 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.88992 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.95455 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.59091 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.97965 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.61601 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.43182 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.95455 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.40671 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 1.00000 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.97965 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.91667 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.19466 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80534 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.31614 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.89759 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.24980 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.86048 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.16283 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82388 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.10058 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.80786 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.14122 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.83665 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.11334 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.82948 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.01967 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.67088 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.03569 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.60862 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.00691 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.64926 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.01408 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62139 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07483 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58551 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07770 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.59036 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07989 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.39986 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.07777 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.40346 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.03865 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.38032 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.02266 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.31806 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.01704 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.36754 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.00988 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.33967 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.10364 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18112 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.16590 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.16513 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.11642 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15951 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.14429 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.15235 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.20265 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.18687 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.08333 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.25616 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.13601 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.31950 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.10149 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.04545 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.43182 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.38636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.02035 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.40671 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected))];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.59091 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.04545 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.61601 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.00000 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.63636 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.02035 * CGRectGetHeight(iconSelected))];
            [bezier6Path closePath];
            [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.30715 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.30715 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.30715 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.69285 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.20065 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41366 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.20065 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58634 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.69285 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.69285 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.41366 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.79935 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.58634 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.79935 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.69285 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.30715 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.79935 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58634 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.79935 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41366 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.30715 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.30715 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.58634 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.20065 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.41366 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.20065 * CGRectGetHeight(iconSelected))];
            [bezier6Path closePath];
            [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.58035 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58035 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.58035 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41965 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.62473 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.53598 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.62473 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.46402 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.41965 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.41965 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.53598 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.37527 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.46402 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.37527 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.41965 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58035 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.37527 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.46402 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.37527 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.53598 * CGRectGetHeight(iconSelected))];
            [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconSelected) + 0.58035 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.58035 * CGRectGetHeight(iconSelected)) controlPoint1: CGPointMake(CGRectGetMinX(iconSelected) + 0.46402 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62473 * CGRectGetHeight(iconSelected)) controlPoint2: CGPointMake(CGRectGetMinX(iconSelected) + 0.53598 * CGRectGetWidth(iconSelected), CGRectGetMinY(iconSelected) + 0.62473 * CGRectGetHeight(iconSelected))];
            [bezier6Path closePath];
            CGContextSaveGState(context);
            [bezier6Path addClip];
            CGRect bezier6Bounds = CGPathGetPathBoundingBox(bezier6Path.CGPath);
            CGFloat bezier6ResizeRatio = MIN(CGRectGetWidth(bezier6Bounds) / 42.43, CGRectGetHeight(bezier6Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier6Bounds) + 0.36 * bezier6ResizeRatio, CGRectGetMidY(bezier6Bounds) + -4.87 * bezier6ResizeRatio), 46.89 * bezier6ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier6Bounds) + 0.6 * bezier6ResizeRatio, CGRectGetMidY(bezier6Bounds) + -22.4 * bezier6ResizeRatio), 21.35 * bezier6ResizeRatio,
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
    CGFloat gradient2Locations[] = {0.54, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
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
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Basic
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09019 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79506 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18471 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.69388 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10927 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.74818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14078 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.82817 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.16513 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89044 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18112 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84978 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15235 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15951 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.97142 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31806 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.95543 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38032 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98419 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33967 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.97704 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36754 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.92038 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40105 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.92221 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59082 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.93499 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46336 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.93560 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52829 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.95235 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60862 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.96837 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67088 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.97397 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62139 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98114 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64926 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88747 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80786 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.82521 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82388 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82948 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.84683 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83665 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80102 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80960 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63637 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90982 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.75281 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85651 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.69634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88992 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95455 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.97965 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61601 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40671 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.97965 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91667 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19466 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80534 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31614 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89759 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24980 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86048 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16283 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82388 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80786 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14122 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83665 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11334 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82948 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.01967 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67088 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.03569 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60862 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64926 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.01408 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62139 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07483 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58551 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07770 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59036 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07989 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39986 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07777 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40346 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.03865 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38032 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.02266 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31806 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.01704 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36754 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00988 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33967 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18112 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16590 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.16513 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11642 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15951 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15235 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.20265 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18687 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08333 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25616 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13601 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.31950 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10149 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02035 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40671 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61601 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02035 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30715 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69285 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.20065 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41366 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.20065 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58634 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69285 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69285 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41366 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79935 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79935 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69285 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30715 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.79935 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58634 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79935 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41366 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30715 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20065 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41366 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20065 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58035 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58035 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58035 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41965 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53598 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46402 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41965 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41965 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.53598 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37527 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46402 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37527 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41965 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58035 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37527 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46402 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37527 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53598 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58035 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58035 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46402 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62473 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.53598 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62473 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 42.43, CGRectGetHeight(bezierBounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.36 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -4.87 * bezierResizeRatio), 27.16 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.12 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 10.68 * bezierResizeRatio), 11.39 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezierBorderRect = CGRectOffset(bezierBorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
            
            UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
            [bezierNegativePath appendPath: bezierPath];
            bezierNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezierBorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezierPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                [bezierNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezierNegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// DetailAdd
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.25);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04545 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09019 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.79506 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18471 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.69388 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10927 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.74818 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.14078 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.82817 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.16513 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.89044 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18112 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.84978 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15235 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.87766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15951 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.97142 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31806 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.95543 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38032 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98419 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33967 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.97704 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36754 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.92038 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40105 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.92221 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59082 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.93499 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46336 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.93560 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52829 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.95235 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60862 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.96837 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67088 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.97397 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62139 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98114 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64926 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88747 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80786 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.82521 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82388 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.87470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82948 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.84683 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83665 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.80102 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80960 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63637 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90982 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.75281 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.85651 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.69634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88992 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95455 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.97965 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61601 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.40671 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.97965 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.91667 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.19466 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80534 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.31614 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.89759 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.24980 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86048 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16283 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82388 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.80786 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.14122 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.83665 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11334 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.82948 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.01967 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.67088 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.03569 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.60862 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.64926 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.01408 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62139 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07483 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58551 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07770 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59036 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07989 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.39986 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.07777 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.40346 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.03865 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38032 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.02266 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.31806 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.01704 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.36754 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00988 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.33967 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10364 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18112 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.16590 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.16513 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11642 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15951 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14429 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15235 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.20265 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.18687 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08333 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25616 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13601 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.31950 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10149 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04545 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.43182 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.38636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02035 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.40671 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.59091 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61601 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.63636 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.02035 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30715 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69285 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.20065 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41366 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.20065 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58634 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69285 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69285 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.41366 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79935 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.58634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.79935 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69285 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30715 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.79935 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58634 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.79935 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41366 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30715 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.30715 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.58634 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20065 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.41366 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.20065 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58035 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58035 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58035 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41965 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.62473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53598 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.62473 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46402 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41965 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.41965 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.53598 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37527 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46402 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.37527 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41965 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58035 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.37527 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.46402 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.37527 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53598 * CGRectGetHeight(iconNormal))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58035 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.58035 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46402 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62473 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.53598 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.62473 * CGRectGetHeight(iconNormal))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 42.43, CGRectGetHeight(bezier3Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0.86 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -0.33 * bezier3ResizeRatio), 63.34 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.05 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -22.25 * bezier3ResizeRatio), 21.99 * bezier3ResizeRatio,
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
