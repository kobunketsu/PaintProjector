
//
//  PlayButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-8.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADPlayButton.h"

@implementation ADPlayButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setIsPlaying:(BOOL)isPlaying{
    _isPlaying = isPlaying;
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawPlay{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientInner = [UIColor colorWithRed: 0.986 green: 1 blue: 1 alpha: 1];
    CGFloat gradientInnerRGBA[4];
    [gradientInner getRed: &gradientInnerRGBA[0] green: &gradientInnerRGBA[1] blue: &gradientInnerRGBA[2] alpha: &gradientInnerRGBA[3]];
    
    UIColor* gradientOut = [UIColor colorWithRed: (gradientInnerRGBA[0] * 0 + 1) green: (gradientInnerRGBA[1] * 0 + 1) blue: (gradientInnerRGBA[2] * 0 + 1) alpha: (gradientInnerRGBA[3] * 0 + 1)];
    UIColor* stroke = [UIColor colorWithRed: 0.503 green: 0.499 blue: 0.489 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientInner.CGColor,
                               (id)[UIColor colorWithRed: 0.993 green: 1 blue: 1 alpha: 1].CGColor,
                               (id)gradientOut.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.6, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 5;
    
    //// Play Drawing
    UIBezierPath* playPath = [UIBezierPath bezierPath];
    [playPath moveToPoint: CGPointMake(51.71, 23.92)];
    [playPath addCurveToPoint: CGPointMake(51.69, 54.54) controlPoint1: CGPointMake(51.22, 24.24) controlPoint2: CGPointMake(51.69, 54.54)];
    [playPath addLineToPoint: CGPointMake(77.71, 39.24)];
    [playPath addLineToPoint: CGPointMake(51.69, 23.93)];
    [playPath addLineToPoint: CGPointMake(51.71, 23.92)];
    [playPath closePath];
    [playPath moveToPoint: CGPointMake(48.83, 16.49)];
    [playPath addLineToPoint: CGPointMake(84.89, 37.67)];
    [playPath addCurveToPoint: CGPointMake(86.25, 39.24) controlPoint1: CGPointMake(84.89, 37.67) controlPoint2: CGPointMake(86.2, 38.48)];
    [playPath addCurveToPoint: CGPointMake(85.09, 40.69) controlPoint1: CGPointMake(86.3, 39.99) controlPoint2: CGPointMake(85.09, 40.69)];
    [playPath addLineToPoint: CGPointMake(48.74, 62.69)];
    [playPath addCurveToPoint: CGPointMake(46.66, 62.99) controlPoint1: CGPointMake(48.74, 62.69) controlPoint2: CGPointMake(47.34, 63.39)];
    [playPath addCurveToPoint: CGPointMake(46, 61.06) controlPoint1: CGPointMake(45.97, 62.58) controlPoint2: CGPointMake(46, 61.06)];
    [playPath addLineToPoint: CGPointMake(46, 18.38)];
    [playPath addCurveToPoint: CGPointMake(46.66, 16.14) controlPoint1: CGPointMake(46, 18.38) controlPoint2: CGPointMake(45.95, 16.61)];
    [playPath addCurveToPoint: CGPointMake(48.85, 16.51) controlPoint1: CGPointMake(47.37, 15.68) controlPoint2: CGPointMake(48.85, 16.51)];
    [playPath addLineToPoint: CGPointMake(48.83, 16.49)];
    [playPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [playPath addClip];
    CGContextDrawRadialGradient(context, gradient,
                                CGPointMake(59.7, 39.65), 3.09,
                                CGPointMake(59.53, 39.76), 48.74,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [stroke setStroke];
    playPath.lineWidth = 1;
    [playPath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
 
}

- (void)drawPause{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientInner = [UIColor colorWithRed: 0.986 green: 1 blue: 1 alpha: 1];
    CGFloat gradientInnerRGBA[4];
    [gradientInner getRed: &gradientInnerRGBA[0] green: &gradientInnerRGBA[1] blue: &gradientInnerRGBA[2] alpha: &gradientInnerRGBA[3]];
    
    UIColor* gradientOut = [UIColor colorWithRed: (gradientInnerRGBA[0] * 0 + 1) green: (gradientInnerRGBA[1] * 0 + 1) blue: (gradientInnerRGBA[2] * 0 + 1) alpha: (gradientInnerRGBA[3] * 0 + 1)];
    UIColor* stroke = [UIColor colorWithRed: 0.503 green: 0.499 blue: 0.489 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientInner.CGColor,
                               (id)[UIColor colorWithRed: 0.993 green: 1 blue: 1 alpha: 1].CGColor,
                               (id)gradientOut.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.6, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 5;
    
    //// Pause Drawing
    UIBezierPath* pausePath = [UIBezierPath bezierPath];
    [pausePath moveToPoint: CGPointMake(46.5, 61.17)];
    [pausePath addCurveToPoint: CGPointMake(48.8, 63.5) controlPoint1: CGPointMake(46.5, 62.46) controlPoint2: CGPointMake(47.53, 63.5)];
    [pausePath addCurveToPoint: CGPointMake(51.11, 61.17) controlPoint1: CGPointMake(50.08, 63.5) controlPoint2: CGPointMake(51.11, 62.46)];
    [pausePath addLineToPoint: CGPointMake(51.11, 17.83)];
    [pausePath addCurveToPoint: CGPointMake(48.8, 15.5) controlPoint1: CGPointMake(51.11, 16.54) controlPoint2: CGPointMake(50.08, 15.5)];
    [pausePath addCurveToPoint: CGPointMake(46.5, 17.83) controlPoint1: CGPointMake(47.53, 15.5) controlPoint2: CGPointMake(46.5, 16.54)];
    [pausePath addLineToPoint: CGPointMake(46.5, 61.17)];
    [pausePath closePath];
    [pausePath moveToPoint: CGPointMake(68.89, 61.17)];
    [pausePath addCurveToPoint: CGPointMake(71.2, 63.5) controlPoint1: CGPointMake(68.89, 62.46) controlPoint2: CGPointMake(69.92, 63.5)];
    [pausePath addCurveToPoint: CGPointMake(73.5, 61.17) controlPoint1: CGPointMake(72.47, 63.5) controlPoint2: CGPointMake(73.5, 62.46)];
    [pausePath addLineToPoint: CGPointMake(73.5, 17.83)];
    [pausePath addCurveToPoint: CGPointMake(71.2, 15.5) controlPoint1: CGPointMake(73.5, 16.54) controlPoint2: CGPointMake(72.47, 15.5)];
    [pausePath addCurveToPoint: CGPointMake(68.89, 17.83) controlPoint1: CGPointMake(69.92, 15.5) controlPoint2: CGPointMake(68.89, 16.54)];
    [pausePath addLineToPoint: CGPointMake(68.89, 61.17)];
    [pausePath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [pausePath addClip];
    CGContextDrawRadialGradient(context, gradient,
                                CGPointMake(53.52, 39.59), 3.11,
                                CGPointMake(53.35, 39.7), 49.12,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [stroke setStroke];
    pausePath.lineWidth = 1;
    [pausePath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
 
}

- (void)drawRect:(CGRect)rect
{
    if (self.isPlaying) {
        [self drawPause];
    }
    else{
        [self drawPlay];

    }

}


@end
