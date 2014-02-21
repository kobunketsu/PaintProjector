//
//  CylinderProjectRootView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CylinderProjectRootView.h"

@implementation CylinderProjectRootView

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
    UIColor* fillColor = [UIColor colorWithRed: 0.347 green: 0.32 blue: 0.29 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.011 green: 0.035 blue: 0.05 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.505 green: 0.505 blue: 0.505 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)fillColor.CGColor,
                               (id)strokeColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.87};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradientLightColors = [NSArray arrayWithObjects:
                                    (id)gradientColor.CGColor,
                                    (id)[UIColor colorWithRed: 0.252 green: 0.252 blue: 0.252 alpha: 1].CGColor,
                                    (id)gradientColor2.CGColor, nil];
    CGFloat gradientLightLocations[] = {0, 0.51, 1};
    CGGradientRef gradientLight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientLightColors, gradientLightLocations);
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(-0.5, 0.5, 768, 1024)];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(383.5, 0.5), CGPointMake(383.5, 1024.5), 0);
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    rectanglePath.lineWidth = 1;
    [rectanglePath stroke];
    
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetAlpha(context, 0.62);
        CGContextSetBlendMode(context, kCGBlendModeScreen);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle Light Drawing
        UIBezierPath* rectangleLightPath = [UIBezierPath bezierPathWithRect: CGRectMake(-0.5, -0.5, 768, 1024)];
        CGContextSaveGState(context);
        [rectangleLightPath addClip];
        CGContextDrawRadialGradient(context, gradientLight,
                                    CGPointMake(383.5, 260.07), 31.96,
                                    CGPointMake(383.5, 511.5), 637.58,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        [strokeColor setStroke];
        rectangleLightPath.lineWidth = 1;
        [rectangleLightPath stroke];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradientLight);
    CGColorSpaceRelease(colorSpace);
    
}


@end
