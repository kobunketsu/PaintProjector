//
//  RedoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADRedoButton.h"

@implementation ADRedoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    [self drawCanvas1WithFrame5:self.bounds ctx:ctx iconColor:iconColor];
}

- (void)drawCanvas1WithFrame5: (CGRect)frame5 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
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
    CGRect iconNormal5 = CGRectMake(CGRectGetMinX(frame5) + floor((CGRectGetWidth(frame5) - 47.05) * 0.49032 + 0.5), CGRectGetMinY(frame5) + floor((CGRectGetHeight(frame5) - 43.53) * 0.41369 + 0.12) + 0.38, 47.05, 43.53);
    
    
    //// Redo
    {
        //// IconNormal 5
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 6
            {
                //// Bezier 6 Drawing
                UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
                [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 30.19, CGRectGetMinY(iconNormal5) + 40.61)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 38.24, CGRectGetMinY(iconNormal5) + 31.62)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 14.63, CGRectGetMinY(iconNormal5) + 31.62)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 4.58, CGRectGetMinY(iconNormal5) + 27.56) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal5) + 10.63, CGRectGetMinY(iconNormal5) + 31.62) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal5) + 7.63, CGRectGetMinY(iconNormal5) + 30.72)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 4.58, CGRectGetMinY(iconNormal5) + 4.73) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal5) - 1.53, CGRectGetMinY(iconNormal5) + 21.26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal5) - 1.53, CGRectGetMinY(iconNormal5) + 11.03)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 14.63, CGRectGetMinY(iconNormal5)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal5) + 7.63, CGRectGetMinY(iconNormal5) + 1.58) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal5) + 10.63, CGRectGetMinY(iconNormal5))];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 14.63, CGRectGetMinY(iconNormal5) + 5.21)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 7.83, CGRectGetMinY(iconNormal5) + 8.12) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal5) + 12.17, CGRectGetMinY(iconNormal5) + 5.21) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal5) + 9.7, CGRectGetMinY(iconNormal5) + 6.18)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 7.83, CGRectGetMinY(iconNormal5) + 24.17) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal5) + 4.07, CGRectGetMinY(iconNormal5) + 12) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal5) + 4.07, CGRectGetMinY(iconNormal5) + 20.29)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 14.63, CGRectGetMinY(iconNormal5) + 27.08) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal5) + 9.7, CGRectGetMinY(iconNormal5) + 26.11) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal5) + 12.17, CGRectGetMinY(iconNormal5) + 27.08)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 38.05, CGRectGetMinY(iconNormal5) + 26.62)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 30.05, CGRectGetMinY(iconNormal5) + 17.62)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 33.02, CGRectGetMinY(iconNormal5) + 14.84)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 47.05, CGRectGetMinY(iconNormal5) + 29.62)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 33.02, CGRectGetMinY(iconNormal5) + 43.53)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal5) + 30.19, CGRectGetMinY(iconNormal5) + 40.61)];
                [bezier6Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier6Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
