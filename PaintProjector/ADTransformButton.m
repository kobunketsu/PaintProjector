//
//  TransformButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformButton.h"

@implementation ADTransformButton

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
    [self drawCanvas1WithFrame7:self.bounds ctx:ctx iconColor:iconColor];
}
- (void)drawCanvas1WithFrame7: (CGRect)frame7 ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
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
    CGRect iconNormal7 = CGRectMake(CGRectGetMinX(frame7) + floor((CGRectGetWidth(frame7) - 44.5) * 0.50971 + 0.25) + 0.25, CGRectGetMinY(frame7) + floor((CGRectGetHeight(frame7) - 44.5) * 0.45070) + 0.5, 44.5, 44.5);
    
    
    //// Transform
    {
        //// IconNormal 7
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, [iconShadow CGColor]);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Group 9
            {
                //// Bezier 9 Drawing
                UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
                [bezier9Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 28.81, CGRectGetMinY(iconNormal7) + 8.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 24.75, CGRectGetMinY(iconNormal7) + 8.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 24.75, CGRectGetMinY(iconNormal7) + 19.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 36, CGRectGetMinY(iconNormal7) + 19.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 36, CGRectGetMinY(iconNormal7) + 15.69)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 44.5, CGRectGetMinY(iconNormal7) + 22.25)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 36, CGRectGetMinY(iconNormal7) + 28.81)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 36, CGRectGetMinY(iconNormal7) + 24.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 24.75, CGRectGetMinY(iconNormal7) + 24.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 24.75, CGRectGetMinY(iconNormal7) + 36)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 28.81, CGRectGetMinY(iconNormal7) + 36)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 22.25, CGRectGetMinY(iconNormal7) + 44.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 15.69, CGRectGetMinY(iconNormal7) + 36)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 19.75, CGRectGetMinY(iconNormal7) + 36)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 19.75, CGRectGetMinY(iconNormal7) + 24.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 8.5, CGRectGetMinY(iconNormal7) + 24.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 8.5, CGRectGetMinY(iconNormal7) + 28.81)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7), CGRectGetMinY(iconNormal7) + 22.25)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 8.5, CGRectGetMinY(iconNormal7) + 15.69)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 8.5, CGRectGetMinY(iconNormal7) + 19.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 19.75, CGRectGetMinY(iconNormal7) + 19.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 19.75, CGRectGetMinY(iconNormal7) + 8.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 15.69, CGRectGetMinY(iconNormal7) + 8.5)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 22.25, CGRectGetMinY(iconNormal7))];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal7) + 28.81, CGRectGetMinY(iconNormal7) + 8.5)];
                [bezier9Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, iconGradientOffset, iconGradientBlurRadius, [iconGradient CGColor]);
                [iconColor setFill];
                [bezier9Path fill];
                CGContextRestoreGState(context);
                
            }
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
}

@end
