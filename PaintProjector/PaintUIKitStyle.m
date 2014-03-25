//
//  PaintUIKitStyle.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintUIKitStyle.h"

@implementation PaintUIKitStyle
+ (void)drawCrystalGradientInView:(UIView*)view{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor =  [UIColor colorWithRed: 0.902 green: 0.894 blue: 0.894 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.05];
    UIColor* gradientColor4 = [UIColor colorWithRed: 0.84 green: 0.821 blue: 0.821 alpha: 1];
    UIColor* gradientColor5 = [UIColor colorWithRed: 0.746 green: 0.773 blue: 0.782 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientPinkColors = [NSArray arrayWithObjects:
                                   (id)gradientColor.CGColor,
                                   (id)gradientColor5.CGColor,
                                   (id)gradientColor4.CGColor, nil];
    CGFloat gradientPinkLocations[] = {0, 0.7, 1};
    CGGradientRef gradientPink = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientPinkColors, gradientPinkLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, -6.1);
    CGFloat shadowBlurRadius = 6;
    
    //// Abstracted Attributes
    CGFloat groupAlpha = 0.95;
    
    CGRect frame = view.bounds;
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetAlpha(context, groupAlpha);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: frame byRoundingCorners: 0 cornerRadii: CGSizeMake(8, 8)];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [roundedRectanglePath addClip];
        CGContextDrawLinearGradient(context, gradientPink, CGPointMake(view.bounds.size.width * 0.5 , view.bounds.size.height), CGPointMake(view.bounds.size.width * 0.5, -0), 0);
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        [color setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientPink);
    CGColorSpaceRelease(colorSpace);
}
@end
