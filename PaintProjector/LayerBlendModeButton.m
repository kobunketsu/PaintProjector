//
//  LayerBlendModeButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerBlendModeButton.h"

@implementation LayerBlendModeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor3 = [UIColor colorWithRed: 0.783 green: 0.783 blue: 0.783 alpha: 1];
    CGFloat gradientColor3HSBA[4];
    [gradientColor3 getHue: &gradientColor3HSBA[0] saturation: &gradientColor3HSBA[1] brightness: &gradientColor3HSBA[2] alpha: &gradientColor3HSBA[3]];
    
    UIColor* gradientColor2 = [UIColor colorWithHue: gradientColor3HSBA[0] saturation: gradientColor3HSBA[1] brightness: 0.8 alpha: gradientColor3HSBA[3]];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor3.CGColor,
                               (id)[UIColor colorWithRed: 0.81 green: 0.81 blue: 0.81 alpha: 1].CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0.01, 0.5, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Group
    {
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(9, 4, 27, 27)];
        CGContextSaveGState(context);
        [ovalPath addClip];
        CGContextDrawLinearGradient(context, gradient, CGPointMake(22.5, 4), CGPointMake(22.5, 31), 0);
        CGContextRestoreGState(context);
    }
    
    
    //// Group 3
    {
        CGContextSaveGState(context);
        CGContextSetBlendMode(context, kCGBlendModeOverlay);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Oval 2 Drawing
        UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(9, 14, 27, 27)];
        CGContextSaveGState(context);
        [oval2Path addClip];
        CGContextDrawLinearGradient(context, gradient, CGPointMake(22.5, 14), CGPointMake(22.5, 41), 0);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
