//
//  UndoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADUndoButton.h"

@implementation ADUndoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    [self drawCanvas1WithFrame4:self.bounds ctx:ctx iconColor:iconColor];
}

- (void)drawCanvas1WithFrame4: (CGRect)frame4 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
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
    CGRect iconNormal4 = CGRectMake(CGRectGetMinX(frame4) + floor((CGRectGetWidth(frame4) - 47.05) * 0.49032 + 0.5), CGRectGetMinY(frame4) + floor((CGRectGetHeight(frame4) - 43.53) * 0.41369 + 0.12) + 0.38, 47.05, 43.53);
    
    
    //// Undo
    {
        //// IconNormal 4
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 3
            {
                //// Bezier 2 Drawing
                UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 16.86, CGRectGetMinY(iconNormal4) + 2.92)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 8.81, CGRectGetMinY(iconNormal4) + 11.91)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 32.43, CGRectGetMinY(iconNormal4) + 11.91)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 42.48, CGRectGetMinY(iconNormal4) + 15.97) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal4) + 36.43, CGRectGetMinY(iconNormal4) + 11.91) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal4) + 39.42, CGRectGetMinY(iconNormal4) + 12.82)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 42.48, CGRectGetMinY(iconNormal4) + 38.8) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal4) + 48.58, CGRectGetMinY(iconNormal4) + 22.27) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal4) + 48.58, CGRectGetMinY(iconNormal4) + 32.5)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 32.43, CGRectGetMinY(iconNormal4) + 43.53) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal4) + 39.42, CGRectGetMinY(iconNormal4) + 41.96) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal4) + 36.43, CGRectGetMinY(iconNormal4) + 43.53)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 32.43, CGRectGetMinY(iconNormal4) + 38.32)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 39.23, CGRectGetMinY(iconNormal4) + 35.41) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal4) + 34.89, CGRectGetMinY(iconNormal4) + 38.32) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal4) + 37.35, CGRectGetMinY(iconNormal4) + 37.35)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 39.23, CGRectGetMinY(iconNormal4) + 19.36) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal4) + 42.98, CGRectGetMinY(iconNormal4) + 31.53) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal4) + 42.98, CGRectGetMinY(iconNormal4) + 23.24)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 32.43, CGRectGetMinY(iconNormal4) + 16.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal4) + 37.35, CGRectGetMinY(iconNormal4) + 17.42) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal4) + 34.89, CGRectGetMinY(iconNormal4) + 16.45)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 9, CGRectGetMinY(iconNormal4) + 16.91)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 17, CGRectGetMinY(iconNormal4) + 25.91)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 14.03, CGRectGetMinY(iconNormal4) + 28.69)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4), CGRectGetMinY(iconNormal4) + 13.91)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 14.03, CGRectGetMinY(iconNormal4))];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal4) + 16.86, CGRectGetMinY(iconNormal4) + 2.92)];
                [bezier2Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier2Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
