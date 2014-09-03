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
    CGRect iconNormal2 = CGRectMake(CGRectGetMinX(frame2) + floor((CGRectGetWidth(frame2) - 50.89) * 0.51234 + 0.39) + 0.11, CGRectGetMinY(frame2) + floor((CGRectGetHeight(frame2) - 44) * 0.44444 - 0.5) + 1, 50.89, 44);
    
    
    //// Import
    {
        //// IconNormal 2
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group
            {
                //// Bezier 12 Drawing
                UIBezierPath* bezier12Path = UIBezierPath.bezierPath;
                [bezier12Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 7.89, CGRectGetMinY(iconNormal2))];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.56, CGRectGetMinY(iconNormal2)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 7.89, CGRectGetMinY(iconNormal2)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 14.9, CGRectGetMinY(iconNormal2))];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 22.56, CGRectGetMinY(iconNormal2) + 25.57)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 14.15, CGRectGetMinY(iconNormal2) + 17.52)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 10.65, CGRectGetMinY(iconNormal2) + 21.35)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 24.56, CGRectGetMinY(iconNormal2) + 35.38)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 39.34, CGRectGetMinY(iconNormal2) + 21.35)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 35.52, CGRectGetMinY(iconNormal2) + 17.52)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 26.89, CGRectGetMinY(iconNormal2) + 26)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 27.14, CGRectGetMinY(iconNormal2)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 26.89, CGRectGetMinY(iconNormal2) + 26) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 27.25, CGRectGetMinY(iconNormal2) + 5.88)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 41.89, CGRectGetMinY(iconNormal2)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 34.82, CGRectGetMinY(iconNormal2)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 41.89, CGRectGetMinY(iconNormal2))];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 46.89, CGRectGetMinY(iconNormal2) + 5) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 44.65, CGRectGetMinY(iconNormal2)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 46.89, CGRectGetMinY(iconNormal2) + 2.24)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 46.89, CGRectGetMinY(iconNormal2) + 39)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 41.89, CGRectGetMinY(iconNormal2) + 44) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 46.89, CGRectGetMinY(iconNormal2) + 41.76) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 44.65, CGRectGetMinY(iconNormal2) + 44)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 7.89, CGRectGetMinY(iconNormal2) + 44)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 2.89, CGRectGetMinY(iconNormal2) + 39) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 5.12, CGRectGetMinY(iconNormal2) + 44) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 2.89, CGRectGetMinY(iconNormal2) + 41.76)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 2.89, CGRectGetMinY(iconNormal2) + 5)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal2) + 7.89, CGRectGetMinY(iconNormal2)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal2) + 2.89, CGRectGetMinY(iconNormal2) + 2.24) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal2) + 5.12, CGRectGetMinY(iconNormal2))];
                [bezier12Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier12Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
