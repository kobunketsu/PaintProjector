//
//  SetupButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SetupButton.h"

@implementation SetupButton

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
    UIColor* gradientColor = [UIColor colorWithRed: 0.725 green: 0.863 blue: 0.859 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0.464 green: 0.864 blue: 0.906 alpha: 0.516];
    UIColor* gradientCylinderProjectColor = [UIColor colorWithRed: 0.342 green: 0.529 blue: 0.713 alpha: 1];
    UIColor* gradientCylinderProjectColor2 = [UIColor colorWithRed: 0.216 green: 0.279 blue: 0.699 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor3 = [UIColor colorWithRed: 0.633 green: 0.879 blue: 0.944 alpha: 1];
    UIColor* shadowColor3 = [UIColor colorWithRed: 0.679 green: 0.814 blue: 1 alpha: 0.524];
    
    //// Gradient Declarations
    NSArray* gradientCylinderProjectColors = [NSArray arrayWithObjects:
                                              (id)gradientCylinderProjectColor.CGColor,
                                              (id)gradientCylinderProjectColor2.CGColor, nil];
    CGFloat gradientCylinderProjectLocations[] = {0, 1};
    CGGradientRef gradientCylinderProject = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientCylinderProjectColors, gradientCylinderProjectLocations);
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor3.CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0.54, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* cylinderProjectInnerShadow = gradientColor;
    CGSize cylinderProjectInnerShadowOffset = CGSizeMake(0.1, -1.1);
    CGFloat cylinderProjectInnerShadowBlurRadius = 2;
    UIColor* glow = shadowColor2;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 10;
    UIColor* shadow = shadowColor3;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 64) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 64, 44);
    
    
    //// Group 3
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.16230 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02661 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13363 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.15229 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06131 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.14470 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09717 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.38410 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21264 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.41239 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15248 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.39059 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.19079 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.40002 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17032 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.60095 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15248 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.46446 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07738 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.54888 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07738 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.62859 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21051 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.61291 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.16974 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.62213 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18946 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.86198 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13512 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.83834 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02771 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.85624 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09853 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.84832 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06254 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.91491 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00789 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.92756 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05739 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91959 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02418 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.92381 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04070 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94254 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05355 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98064 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09240 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.96043 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04896 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.97749 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06635 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98749 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.14898 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.96080 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20444 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.99064 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17502 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.97869 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.19985 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94861 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20757 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94759 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.33887 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.95121 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25126 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.95087 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29526 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.95781 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34082 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98615 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39451 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.97582 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34426 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.98851 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36830 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45148 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94414 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49274 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.97867 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.47770 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.96215 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49617 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.92404 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48891 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88478 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60984 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91390 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53065 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.90081 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.57119 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.90292 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63163 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.90736 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69903 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91694 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.64846 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.91892 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67864 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88224 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74335 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.83593 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74981 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.87068 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76375 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.84995 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76664 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.82024 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.73097 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.81844 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.73365 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.73600 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82951 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.79302 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77100 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.76532 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.80296 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.74378 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85071 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.73028 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91550 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.75235 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.87403 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.74630 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90304 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.69547 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94259 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.65095 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92294 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.67945 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95506 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.65952 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94626 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.64054 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89458 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.54667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92395 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.60992 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90933 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.57843 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91912 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.54667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95192 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.51333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.54667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.97848 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.53174 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.48667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95192 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.46826 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.45333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.97848 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92394 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.33286 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88041 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.41229 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91770 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.37171 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90319 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.32427 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90379 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.27976 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92344 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.31571 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92711 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.29578 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.93590 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.24494 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89635 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.23144 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.83155 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.22892 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88389 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.22288 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85488 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.24055 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.80674 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.18650 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74079 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.22167 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.78715 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.20359 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76516 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.17898 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74981 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13268 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74335 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.16497 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76664 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.14424 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76375 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.10755 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69903 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11199 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63163 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.09599 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67864 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.09798 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.64846 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.12027 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.62169 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.07609 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48950 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.10199 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.57969 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.08727 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53532 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05908 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49274 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.02219 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45148 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.04107 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49617 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.02455 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.47770 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01707 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39451 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.04541 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34082 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.01471 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36830 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.02740 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34426 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05246 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.33948 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05137 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20794 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.04914 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29579 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.04877 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25171 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.03772 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20444 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.14898 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.01983 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.19985 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.00788 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17502 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01788 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09240 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05598 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05355 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.02103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06635 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.03809 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04896 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.07236 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05775 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.08740 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00000 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.07673 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.03823 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.08175 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01896 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.16230 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02661 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22047 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35645 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.43349 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25802 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.43349 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.31890 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.55381 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35645 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.48556 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39400 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.52777 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39400 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.55381 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22047 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.57984 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.31890 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.57984 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25802 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22047 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.52777 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18292 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.48556 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18292 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13183 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21999 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.24514 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65837 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.12591 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.37754 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.16368 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53801 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.27237 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69533 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.25400 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67145 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.26308 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.68377 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.40653 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41543 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.37350 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29806 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.38596 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38176 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.37495 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34019 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13183 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21999 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.87132 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22094 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.63990 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29571 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.60636 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41617 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.63878 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.33895 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.62760 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38174 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.74058 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69620 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.76850 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65837 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.75011 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.68439 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.75943 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67178 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.87132 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22094 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.84980 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53825 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.88097 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.37819 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45576 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.46624 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.32102 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74734 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.69185 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74805 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.43733 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85289 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.57545 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85313 * CGRectGetHeight(group3))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.55696 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.46662 * CGRectGetHeight(group3))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45576 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.46624 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.52458 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48561 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.48808 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48548 * CGRectGetHeight(group3))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGContextDrawLinearGradient(context, gradientCylinderProject,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds), CGRectGetMinY(bezier3Bounds)),
                                        CGPointMake(CGRectGetMidX(bezier3Bounds), CGRectGetMaxY(bezier3Bounds)),
                                        0);
            CGContextRestoreGState(context);
            
            ////// Bezier 3 Inner Shadow
            CGRect bezier3BorderRect = CGRectInset([bezier3Path bounds], -cylinderProjectInnerShadowBlurRadius, -cylinderProjectInnerShadowBlurRadius);
            bezier3BorderRect = CGRectOffset(bezier3BorderRect, -cylinderProjectInnerShadowOffset.width, -cylinderProjectInnerShadowOffset.height);
            bezier3BorderRect = CGRectInset(CGRectUnion(bezier3BorderRect, [bezier3Path bounds]), -1, -1);
            
            UIBezierPath* bezier3NegativePath = [UIBezierPath bezierPathWithRect: bezier3BorderRect];
            [bezier3NegativePath appendPath: bezier3Path];
            bezier3NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = cylinderProjectInnerShadowOffset.width + round(bezier3BorderRect.size.width);
                CGFloat yOffset = cylinderProjectInnerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            cylinderProjectInnerShadowBlurRadius,
                                            cylinderProjectInnerShadow.CGColor);
                
                [bezier3Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier3BorderRect.size.width), 0);
                [bezier3NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier3NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 2
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextSetAlpha(context, 0.5);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.16230 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02661 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13363 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.15229 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06131 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.14470 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09717 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.38410 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21264 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.41239 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15248 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.39059 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.19079 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.40002 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17032 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.60095 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15248 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.46446 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07738 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.54888 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.07738 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.62859 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21051 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.61291 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.16974 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.62213 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18946 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.86198 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.13512 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.83834 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02771 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.85624 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09853 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.84832 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06254 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.91491 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00789 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.92756 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05739 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91959 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02418 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.92381 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04070 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94254 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05355 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98064 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09240 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.96043 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04896 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.97749 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06635 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98749 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.14898 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.96080 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20444 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.99064 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17502 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.97869 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.19985 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94861 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20757 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94759 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.33887 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.95121 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25126 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.95087 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29526 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.95781 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34082 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98615 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39451 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.97582 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34426 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.98851 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36830 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.98103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45148 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.94414 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49274 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.97867 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.47770 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.96215 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49617 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.92404 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48891 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88478 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60984 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91390 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53065 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.90081 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.57119 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.90292 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63163 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.90736 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69903 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.91694 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.64846 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.91892 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67864 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.88224 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74335 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.83593 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74981 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.87068 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76375 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.84995 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76664 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.82024 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.73097 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.81844 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.73365 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.73600 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82951 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.79302 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77100 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.76532 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.80296 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.74378 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85071 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.73028 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91550 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.75235 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.87403 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.74630 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90304 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.69547 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94259 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.65095 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92294 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.67945 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95506 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.65952 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.94626 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.64054 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89458 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.54667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92395 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.60992 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90933 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.57843 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91912 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.54667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95192 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.51333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.54667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.97848 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.53174 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.48667 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95192 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.46826 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.00000 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.45333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.97848 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45333 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92394 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.33286 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88041 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.41229 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.91770 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.37171 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90319 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.32427 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.90379 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.27976 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92344 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.31571 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.92711 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.29578 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.93590 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.24494 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.89635 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.23144 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.83155 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.22892 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.88389 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.22288 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85488 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.24055 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.80674 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.18650 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74079 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.22167 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.78715 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.20359 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76516 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.17898 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74981 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13268 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74335 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.16497 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76664 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.14424 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.76375 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.10755 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69903 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11199 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63163 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.09599 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67864 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.09798 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.64846 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.12027 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.62169 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.07609 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48950 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.10199 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.57969 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.08727 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53532 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05908 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49274 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.02219 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.45148 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.04107 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.49617 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.02455 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.47770 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01707 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39451 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.04541 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34082 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.01471 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36830 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.02740 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34426 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05246 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.33948 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05137 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20794 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.04914 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29579 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.04877 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25171 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.03772 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20444 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.14898 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.01983 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.19985 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.00788 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.17502 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.01788 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09240 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.05598 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05355 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.02103 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06635 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.03809 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04896 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.07236 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05775 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.08740 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.00000 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.07673 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.03823 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.08175 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01896 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.16230 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02661 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22047 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35645 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.43349 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25802 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.43349 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.31890 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.55381 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35645 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.48556 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39400 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.52777 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.39400 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.55381 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22047 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.57984 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.31890 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.57984 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25802 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45953 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22047 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.52777 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18292 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.48556 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18292 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13183 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21999 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.24514 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65837 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.12591 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.37754 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.16368 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53801 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.27237 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69533 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.25400 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67145 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.26308 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.68377 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.40653 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41543 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.37350 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29806 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.38596 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38176 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.37495 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34019 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.13183 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.21999 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.87132 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22094 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.63990 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29571 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.60636 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.41617 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.63878 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.33895 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.62760 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38174 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.74058 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.69620 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.76850 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65837 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.75011 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.68439 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.75943 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.67178 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.87132 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.22094 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.84980 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.53825 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.88097 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.37819 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45576 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.46624 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.32102 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74734 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.69185 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.74805 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.43733 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85289 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.57545 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.85313 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.55696 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.46662 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45576 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.46624 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.52458 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48561 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.48808 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.48548 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 62.56, CGRectGetHeight(bezierBounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.2 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -24.96 * bezierResizeRatio), 22.37 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.37 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 3.4 * bezierResizeRatio), 37.95 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientCylinderProject);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
