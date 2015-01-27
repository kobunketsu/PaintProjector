//
//  LayerButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerButton.h"

@implementation ADLayerButton

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

-(void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor*)iconColor{
    [self drawCanvas1WithFrame8:self.bounds ctx:ctx iconColor:iconColor];
}
- (void)drawCanvas1WithFrame8: (CGRect)frame8 ctx:(CGContextRef)ctx iconColor:(UIColor*)iconColor
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
    CGRect iconNormal8 = CGRectMake(CGRectGetMinX(frame8) + floor((CGRectGetWidth(frame8) - 44) * 0.51923 + 0.5), CGRectGetMinY(frame8) + floor((CGRectGetHeight(frame8) - 43.45) * 0.43776 - 0.05) + 0.55, 44, 43.45);
    
    
    //// Layer
    {
        //// IconNormal 8
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 11
            {
                //// Bezier 11 Drawing
                UIBezierPath* bezier11Path = UIBezierPath.bezierPath;
                [bezier11Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 7.7)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 1.96, CGRectGetMinY(iconNormal8) + 9.9) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 8.92) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal8) + 0.88, CGRectGetMinY(iconNormal8) + 9.9)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 37.16, CGRectGetMinY(iconNormal8) + 9.9)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 39.11, CGRectGetMinY(iconNormal8) + 7.7)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 44, CGRectGetMinY(iconNormal8) + 2.2)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 42.04, CGRectGetMinY(iconNormal8)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal8) + 44, CGRectGetMinY(iconNormal8) + 0.98) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal8) + 43.12, CGRectGetMinY(iconNormal8))];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 6.84, CGRectGetMinY(iconNormal8))];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 4.89, CGRectGetMinY(iconNormal8) + 2.2)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 7.7)];
                [bezier11Path closePath];
                [bezier11Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 24.75)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 1.96, CGRectGetMinY(iconNormal8) + 26.95) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 25.97) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal8) + 0.88, CGRectGetMinY(iconNormal8) + 26.95)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 37.16, CGRectGetMinY(iconNormal8) + 26.95)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 39.11, CGRectGetMinY(iconNormal8) + 24.75)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 44, CGRectGetMinY(iconNormal8) + 19.25)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 42.04, CGRectGetMinY(iconNormal8) + 17.05) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal8) + 44, CGRectGetMinY(iconNormal8) + 18.03) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal8) + 43.12, CGRectGetMinY(iconNormal8) + 17.05)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 6.84, CGRectGetMinY(iconNormal8) + 17.05)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 4.89, CGRectGetMinY(iconNormal8) + 19.25)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 24.75)];
                [bezier11Path closePath];
                [bezier11Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 41.25)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 1.96, CGRectGetMinY(iconNormal8) + 43.45) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 42.47) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal8) + 0.88, CGRectGetMinY(iconNormal8) + 43.45)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 37.16, CGRectGetMinY(iconNormal8) + 43.45)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 39.11, CGRectGetMinY(iconNormal8) + 41.25)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 44, CGRectGetMinY(iconNormal8) + 35.75)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 42.04, CGRectGetMinY(iconNormal8) + 33.55) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal8) + 44, CGRectGetMinY(iconNormal8) + 34.53) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal8) + 43.12, CGRectGetMinY(iconNormal8) + 33.55)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 6.84, CGRectGetMinY(iconNormal8) + 33.55)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8) + 4.89, CGRectGetMinY(iconNormal8) + 35.75)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal8), CGRectGetMinY(iconNormal8) + 41.25)];
                [bezier11Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier11Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
