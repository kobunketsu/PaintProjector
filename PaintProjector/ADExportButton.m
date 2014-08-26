//
//  ExportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADExportButton.h"

@implementation ADExportButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    [self drawCanvas1WithFrame3:self.bounds ctx:ctx iconColor:iconColor];
}
- (void)drawCanvas1WithFrame3: (CGRect)frame3 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
//    UIColor* iconColor = [UIColor colorWithRed: 0.484 green: 0.484 blue: 0.484 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconGradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.9) green: (iconColorRGBA[1] * 0.9) blue: (iconColorRGBA[2] * 0.9) alpha: (iconColorRGBA[3] * 0.9 + 0.1)];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.138];
    
    //dynamic change color
    if(self.isSelected || self.isHighlighted){
        iconShadowColor = iconGradientColor = [UIColor whiteColor];
    }
    
    //// Shadow Declarations
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat iconShadowBlurRadius = 10;
    UIColor* iconGradient = iconGradientColor;
    CGSize iconGradientOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconGradientBlurRadius = 0;
    
    
    //// Subframes
    CGRect iconNormal3 = CGRectMake(CGRectGetMinX(frame3) + floor((CGRectGetWidth(frame3) - 50.58) * 0.51370 + 0.17) + 0.33, CGRectGetMinY(frame3) + floor((CGRectGetHeight(frame3) - 44.61) * 0.45468 + 0.2) + 0.3, 50.58, 44.61);
    
    
    //// Export
    {
        //// IconNormal 3
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 2
            {
                //// Bezier 4 Drawing
                UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.78, CGRectGetMinY(iconNormal3) + 13.34)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.04, CGRectGetMinY(iconNormal3) + 30) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 5.62, CGRectGetMinY(iconNormal3) + 16.5) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 7.04, CGRectGetMinY(iconNormal3) + 30)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 12.15, CGRectGetMinY(iconNormal3) + 30)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 12.15, CGRectGetMinY(iconNormal3) + 17.74) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 12.15, CGRectGetMinY(iconNormal3) + 30) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 12.06, CGRectGetMinY(iconNormal3) + 23.25)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 14.48, CGRectGetMinY(iconNormal3) + 15.75) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 12.17, CGRectGetMinY(iconNormal3) + 16.36) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 13.75, CGRectGetMinY(iconNormal3) + 15.76)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 21.13, CGRectGetMinY(iconNormal3) + 15.75) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 17.6, CGRectGetMinY(iconNormal3) + 15.66) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 21.13, CGRectGetMinY(iconNormal3) + 15.75)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 21.13, CGRectGetMinY(iconNormal3) + 19.6)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 26.44, CGRectGetMinY(iconNormal3) + 13.18)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 21.13, CGRectGetMinY(iconNormal3) + 6.76)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 21.13, CGRectGetMinY(iconNormal3) + 10.61)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 14.28, CGRectGetMinY(iconNormal3) + 10.61) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 21.13, CGRectGetMinY(iconNormal3) + 10.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 21.33, CGRectGetMinY(iconNormal3) + 10.61)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.78, CGRectGetMinY(iconNormal3) + 13.34) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 11.13, CGRectGetMinY(iconNormal3) + 10.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 9.54, CGRectGetMinY(iconNormal3) + 10.78)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 34.72, CGRectGetMinY(iconNormal3) + 35.45)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 34.72, CGRectGetMinY(iconNormal3) + 37.82) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 32.96, CGRectGetMinY(iconNormal3) + 36.1) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 32.96, CGRectGetMinY(iconNormal3) + 37.17)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 41.1, CGRectGetMinY(iconNormal3) + 37.82) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 36.48, CGRectGetMinY(iconNormal3) + 38.48) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 39.34, CGRectGetMinY(iconNormal3) + 38.48)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 41.1, CGRectGetMinY(iconNormal3) + 35.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 42.86, CGRectGetMinY(iconNormal3) + 37.17) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 42.86, CGRectGetMinY(iconNormal3) + 36.1)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 34.72, CGRectGetMinY(iconNormal3) + 35.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 39.34, CGRectGetMinY(iconNormal3) + 34.79) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 36.48, CGRectGetMinY(iconNormal3) + 34.79)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 10.83, CGRectGetMinY(iconNormal3) + 36.07)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 5.06, CGRectGetMinY(iconNormal3) + 40.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 6.98, CGRectGetMinY(iconNormal3) + 36.24) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 5.06, CGRectGetMinY(iconNormal3) + 40.67)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 39.42, CGRectGetMinY(iconNormal3) + 40.67)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 20.98, CGRectGetMinY(iconNormal3) + 38.31)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 16.47, CGRectGetMinY(iconNormal3) + 38.43)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 10.83, CGRectGetMinY(iconNormal3) + 36.07) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 16.47, CGRectGetMinY(iconNormal3) + 38.43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 14.67, CGRectGetMinY(iconNormal3) + 35.91)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 50.45, CGRectGetMinY(iconNormal3) + 35.62)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 44.85, CGRectGetMinY(iconNormal3) + 42.04)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 42.6, CGRectGetMinY(iconNormal3) + 44.61)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 2.24, CGRectGetMinY(iconNormal3) + 44.61)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3), CGRectGetMinY(iconNormal3) + 42.04) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 1, CGRectGetMinY(iconNormal3) + 44.61) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3), CGRectGetMinY(iconNormal3) + 43.46)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 5.61, CGRectGetMinY(iconNormal3) + 35.62)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.85, CGRectGetMinY(iconNormal3) + 33.05)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 48.21, CGRectGetMinY(iconNormal3) + 33.05)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 50.45, CGRectGetMinY(iconNormal3) + 35.62) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 49.45, CGRectGetMinY(iconNormal3) + 33.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 50.45, CGRectGetMinY(iconNormal3) + 34.2)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 44.58, CGRectGetMinY(iconNormal3) + 4)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 46.54, CGRectGetMinY(iconNormal3) + 5.94) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 44.58, CGRectGetMinY(iconNormal3) + 5.07) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 45.46, CGRectGetMinY(iconNormal3) + 5.94)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 50.47, CGRectGetMinY(iconNormal3) + 5.94)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 44.58, CGRectGetMinY(iconNormal3) + 0.11) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 51.55, CGRectGetMinY(iconNormal3) + 5.94) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 44.58, CGRectGetMinY(iconNormal3) - 0.96)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 44.58, CGRectGetMinY(iconNormal3) + 4)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 42.62, CGRectGetMinY(iconNormal3) + 0.21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 42.62, CGRectGetMinY(iconNormal3) + 4.97)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 45.56, CGRectGetMinY(iconNormal3) + 7.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 42.62, CGRectGetMinY(iconNormal3) + 6.04) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 44.48, CGRectGetMinY(iconNormal3) + 7.88)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 50.4, CGRectGetMinY(iconNormal3) + 7.88)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 50.21, CGRectGetMinY(iconNormal3) + 26.95)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 47.23, CGRectGetMinY(iconNormal3) + 29.16) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 50.2, CGRectGetMinY(iconNormal3) + 28.18) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 48.87, CGRectGetMinY(iconNormal3) + 29.16)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 30.96, CGRectGetMinY(iconNormal3) + 29.07)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 28.03, CGRectGetMinY(iconNormal3) + 26.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 29.33, CGRectGetMinY(iconNormal3) + 29.06) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 28.02, CGRectGetMinY(iconNormal3) + 28.06)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 28.26, CGRectGetMinY(iconNormal3) + 2.36)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 31.23, CGRectGetMinY(iconNormal3) + 0.15) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 28.27, CGRectGetMinY(iconNormal3) + 1.13) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 29.6, CGRectGetMinY(iconNormal3) + 0.14)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 42.62, CGRectGetMinY(iconNormal3) + 0.21)];
                [bezier4Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier4Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }}


@end
