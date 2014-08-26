//
//  ImportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADImportButton.h"

@implementation ADImportButton

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
    [self drawCanvas1WithFrame2:self.bounds ctx:ctx iconColor:iconColor];
}

- (void)drawCanvas1WithFrame2: (CGRect)frame2 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    //// General Declarations
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
    CGRect iconNormal2 = CGRectMake(CGRectGetMinX(frame2) + floor((CGRectGetWidth(frame2) - 50.89) * 0.51234 + 0.39) + 0.11, CGRectGetMinY(frame2) + floor((CGRectGetHeight(frame2) - 43.63) * 0.44183 + 0.2) + 0.3, 50.89, 43.63);
    
    
    //// Import
    {
        //// IconNormal 2
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group
            {
                //// Bezier 3 Drawing
                UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 0.32, CGRectGetMinY(iconNormal2) + 41.04)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 2.52, CGRectGetMinY(iconNormal2) + 43.63) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 0.32, CGRectGetMinY(iconNormal2) + 42.47) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 1.31, CGRectGetMinY(iconNormal2) + 43.63)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 43.18, CGRectGetMinY(iconNormal2) + 43.63)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 45.38, CGRectGetMinY(iconNormal2) + 41.04)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 50.89, CGRectGetMinY(iconNormal2) + 34.57)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 48.68, CGRectGetMinY(iconNormal2) + 31.98) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 50.89, CGRectGetMinY(iconNormal2) + 33.14) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 49.9, CGRectGetMinY(iconNormal2) + 31.98)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 8.03, CGRectGetMinY(iconNormal2) + 31.98)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 5.83, CGRectGetMinY(iconNormal2) + 34.57)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 0.32, CGRectGetMinY(iconNormal2) + 41.04)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.62, CGRectGetMinY(iconNormal2) + 5.1)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.59, CGRectGetMinY(iconNormal2) + 9.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 21.37, CGRectGetMinY(iconNormal2) + 6.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 21.36, CGRectGetMinY(iconNormal2) + 8.49)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 27.08, CGRectGetMinY(iconNormal2) + 9.83) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 23.82, CGRectGetMinY(iconNormal2) + 11.1) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 25.83, CGRectGetMinY(iconNormal2) + 11.12)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 27.11, CGRectGetMinY(iconNormal2) + 5.14) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 28.33, CGRectGetMinY(iconNormal2) + 8.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 28.34, CGRectGetMinY(iconNormal2) + 6.44)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.62, CGRectGetMinY(iconNormal2) + 5.1) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 25.88, CGRectGetMinY(iconNormal2) + 3.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 23.87, CGRectGetMinY(iconNormal2) + 3.82)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 7.69, CGRectGetMinY(iconNormal2) + 8.01)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 3.53, CGRectGetMinY(iconNormal2) + 15.59) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 4.85, CGRectGetMinY(iconNormal2) + 8.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 3.53, CGRectGetMinY(iconNormal2) + 15.59)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 29.76, CGRectGetMinY(iconNormal2) + 15.81)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 19.1, CGRectGetMinY(iconNormal2) + 12.07)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 14.89, CGRectGetMinY(iconNormal2) + 11.93)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 7.69, CGRectGetMinY(iconNormal2) + 8.01) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 14.89, CGRectGetMinY(iconNormal2) + 11.93) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 10.53, CGRectGetMinY(iconNormal2) + 7.09)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 33.14, CGRectGetMinY(iconNormal2) + 2.88)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 33.04, CGRectGetMinY(iconNormal2) + 17.49)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 30.48, CGRectGetMinY(iconNormal2) + 20.13) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 33.03, CGRectGetMinY(iconNormal2) + 18.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 31.89, CGRectGetMinY(iconNormal2) + 20.14)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 2.52, CGRectGetMinY(iconNormal2) + 19.92)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2), CGRectGetMinY(iconNormal2) + 17.25) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 1.12, CGRectGetMinY(iconNormal2) + 19.91) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) - 0.01, CGRectGetMinY(iconNormal2) + 18.71)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 0.1, CGRectGetMinY(iconNormal2) + 2.64)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 2.66, CGRectGetMinY(iconNormal2)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 0.11, CGRectGetMinY(iconNormal2) + 1.17) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 1.25, CGRectGetMinY(iconNormal2) - 0.01)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 30.62, CGRectGetMinY(iconNormal2) + 0.2)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 33.14, CGRectGetMinY(iconNormal2) + 2.88) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 32.02, CGRectGetMinY(iconNormal2) + 0.22) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 33.15, CGRectGetMinY(iconNormal2) + 1.41)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 43.26, CGRectGetMinY(iconNormal2) + 9.94)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 35.64, CGRectGetMinY(iconNormal2) + 8.07) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 40.14, CGRectGetMinY(iconNormal2) + 7.78) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 35.64, CGRectGetMinY(iconNormal2) + 8.07)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 35.64, CGRectGetMinY(iconNormal2) + 14.3)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 41.99, CGRectGetMinY(iconNormal2) + 20.02) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 35.64, CGRectGetMinY(iconNormal2) + 14.3) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 41.99, CGRectGetMinY(iconNormal2) + 12.65)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 41.99, CGRectGetMinY(iconNormal2) + 24.67) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 41.99, CGRectGetMinY(iconNormal2) + 27.4) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 41.99, CGRectGetMinY(iconNormal2) + 24.67)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 38.18, CGRectGetMinY(iconNormal2) + 24.67)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 44.53, CGRectGetMinY(iconNormal2) + 29.98)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 50.89, CGRectGetMinY(iconNormal2) + 24.67)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 47.07, CGRectGetMinY(iconNormal2) + 24.67)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 47.07, CGRectGetMinY(iconNormal2) + 18.7) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 47.07, CGRectGetMinY(iconNormal2) + 24.67) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 47.07, CGRectGetMinY(iconNormal2) + 25.74)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 43.26, CGRectGetMinY(iconNormal2) + 9.94) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 47.07, CGRectGetMinY(iconNormal2) + 15.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 45.8, CGRectGetMinY(iconNormal2) + 11.69)];
                [bezier3Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier3Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}
@end
