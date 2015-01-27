//
//  ClearButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADClearButton.h"

@implementation ADClearButton

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
    [self drawCanvas1WithFrame6:self.bounds ctx:ctx iconColor:iconColor];
    
}
- (void)drawCanvas1WithFrame6: (CGRect)frame6 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
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
    CGRect iconNormal6 = CGRectMake(CGRectGetMinX(frame6) + floor((CGRectGetWidth(frame6) - 43) * 0.50103 - 0.05) + 0.55, CGRectGetMinY(frame6) + floor((CGRectGetHeight(frame6) - 43) * 0.42065 + 0.06) + 0.44, 43, 43);
    
    
    //// Clear
    {
        //// IconNormal 6
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 8
            {
                //// Bezier 8 Drawing
                UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 28.69, CGRectGetMinY(iconNormal6) + 3.36)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 40.61, CGRectGetMinY(iconNormal6) + 3.39)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 43, CGRectGetMinY(iconNormal6) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 41.93, CGRectGetMinY(iconNormal6) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 43, CGRectGetMinY(iconNormal6) + 3.14)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 40.61, CGRectGetMinY(iconNormal6) + 8.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 43, CGRectGetMinY(iconNormal6) + 5.31) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 41.93, CGRectGetMinY(iconNormal6) + 8.05)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 38.27, CGRectGetMinY(iconNormal6) + 8.05)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 37.31, CGRectGetMinY(iconNormal6) + 38.16)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 33.49, CGRectGetMinY(iconNormal6) + 43) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 37.31, CGRectGetMinY(iconNormal6) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 35.6, CGRectGetMinY(iconNormal6) + 43)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 9.51, CGRectGetMinY(iconNormal6) + 43)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 5.69, CGRectGetMinY(iconNormal6) + 38.16) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 7.4, CGRectGetMinY(iconNormal6) + 43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 5.69, CGRectGetMinY(iconNormal6) + 40.83)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 4.73, CGRectGetMinY(iconNormal6) + 8.05)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 2.39, CGRectGetMinY(iconNormal6) + 8.05)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6), CGRectGetMinY(iconNormal6) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 1.07, CGRectGetMinY(iconNormal6) + 8.05) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6), CGRectGetMinY(iconNormal6) + 5.22)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 2.39, CGRectGetMinY(iconNormal6) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6), CGRectGetMinY(iconNormal6) + 3.23) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 1.07, CGRectGetMinY(iconNormal6) + 3.39)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 14.38, CGRectGetMinY(iconNormal6) + 3.39)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 17.72, CGRectGetMinY(iconNormal6)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 14.38, CGRectGetMinY(iconNormal6) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 16.4, CGRectGetMinY(iconNormal6))];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 25.37, CGRectGetMinY(iconNormal6))];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 28.71, CGRectGetMinY(iconNormal6) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 26.69, CGRectGetMinY(iconNormal6)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 28.71, CGRectGetMinY(iconNormal6) + 3.39)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 28.69, CGRectGetMinY(iconNormal6) + 3.36)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 29.54, CGRectGetMinY(iconNormal6) + 20.44)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 13.35, CGRectGetMinY(iconNormal6) + 20.44)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 11.45, CGRectGetMinY(iconNormal6) + 22.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 12.3, CGRectGetMinY(iconNormal6) + 20.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 11.45, CGRectGetMinY(iconNormal6) + 21.33)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 11.45, CGRectGetMinY(iconNormal6) + 23.44)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 13.35, CGRectGetMinY(iconNormal6) + 25.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 11.45, CGRectGetMinY(iconNormal6) + 24.54) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 12.3, CGRectGetMinY(iconNormal6) + 25.44)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 29.54, CGRectGetMinY(iconNormal6) + 25.44)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 31.45, CGRectGetMinY(iconNormal6) + 23.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 30.59, CGRectGetMinY(iconNormal6) + 25.44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 31.45, CGRectGetMinY(iconNormal6) + 24.54)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 31.45, CGRectGetMinY(iconNormal6) + 22.44)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal6) + 29.54, CGRectGetMinY(iconNormal6) + 20.44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal6) + 31.45, CGRectGetMinY(iconNormal6) + 21.33) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal6) + 30.59, CGRectGetMinY(iconNormal6) + 20.44)];
                [bezier8Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier8Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
