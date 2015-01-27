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

- (void)drawCanvas1WithFrame3: (CGRect)frame3 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
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
    CGRect iconNormal3 = CGRectMake(CGRectGetMinX(frame3) + floor((CGRectGetWidth(frame3) - 50.58) * 0.51370 + 0.17) + 0.33, CGRectGetMinY(frame3) + floor((CGRectGetHeight(frame3) - 44.7) * 0.45330 + 0.2) + 0.3, 50.58, 44.7);
    
    
    //// Export
    {
        //// IconNormal 3
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 2
            {
                //// Bezier 5 Drawing
                UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.67, CGRectGetMinY(iconNormal3) + 44)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 22.34, CGRectGetMinY(iconNormal3) + 44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 7.67, CGRectGetMinY(iconNormal3) + 44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 14.69, CGRectGetMinY(iconNormal3) + 44)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 22.34, CGRectGetMinY(iconNormal3) + 18.43)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 13.35, CGRectGetMinY(iconNormal3) + 26.48)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 10.43, CGRectGetMinY(iconNormal3) + 22.65)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 24.34, CGRectGetMinY(iconNormal3) + 8.62)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 39.12, CGRectGetMinY(iconNormal3) + 22.65)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 36, CGRectGetMinY(iconNormal3) + 26.48)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 26.92, CGRectGetMinY(iconNormal3) + 18.43)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 26.92, CGRectGetMinY(iconNormal3) + 44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 26.92, CGRectGetMinY(iconNormal3) + 18.43) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 27.03, CGRectGetMinY(iconNormal3) + 38.12)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 41.67, CGRectGetMinY(iconNormal3) + 44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 34.61, CGRectGetMinY(iconNormal3) + 44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 41.67, CGRectGetMinY(iconNormal3) + 44)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 46.67, CGRectGetMinY(iconNormal3) + 39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 44.43, CGRectGetMinY(iconNormal3) + 44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 46.67, CGRectGetMinY(iconNormal3) + 41.76)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 46.67, CGRectGetMinY(iconNormal3) + 5)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 41.67, CGRectGetMinY(iconNormal3)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 46.67, CGRectGetMinY(iconNormal3) + 2.24) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 44.43, CGRectGetMinY(iconNormal3))];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.67, CGRectGetMinY(iconNormal3))];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 2.67, CGRectGetMinY(iconNormal3) + 5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 4.91, CGRectGetMinY(iconNormal3)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 2.67, CGRectGetMinY(iconNormal3) + 2.24)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 2.67, CGRectGetMinY(iconNormal3) + 39)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal3) + 7.67, CGRectGetMinY(iconNormal3) + 44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal3) + 2.67, CGRectGetMinY(iconNormal3) + 41.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal3) + 4.91, CGRectGetMinY(iconNormal3) + 44)];
                [bezier5Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier5Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
