//
//  EyeDropperIndicatorView.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-13.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADEyeDropperIndicatorView.h"
@interface ADEyeDropperIndicatorView()

@end

@implementation ADEyeDropperIndicatorView
@synthesize color = _color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCustom];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCustom];
    } 
    return self;
}

- (void)initCustom{
    _color = [UIColor blackColor];
    _srcColor = [UIColor blackColor];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithFrame:rect srcColor:self.srcColor targetColor:self.color];
}

- (void)drawCanvas1WithFrame: (CGRect)frame srcColor:(UIColor*)sourceColor targetColor:(UIColor*)targetColor
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.5];
//    UIColor* targetColor = [UIColor colorWithRed: 0.87 green: 0.224 blue: 0.224 alpha: 1];
//    UIColor* sourceColor = [UIColor colorWithRed: 0.405 green: 0.827 blue: 0.136 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0.34, 0.67};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)targetColor.CGColor, (id)sourceColor.CGColor], gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 10;
    
    //// ColorBlend Drawing
    UIBezierPath* colorBlendPath = UIBezierPath.bezierPath;
    [colorBlendPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 45.8)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 105.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.4, CGRectGetMinY(frame) + 62.2) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.4, CGRectGetMinY(frame) + 88.8)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 105.2, CGRectGetMinY(frame) + 105.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.2, CGRectGetMinY(frame) + 121.6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 88.8, CGRectGetMinY(frame) + 121.6)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 105.2, CGRectGetMinY(frame) + 45.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 121.6, CGRectGetMinY(frame) + 88.8) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 121.6, CGRectGetMinY(frame) + 62.2)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 45.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 88.8, CGRectGetMinY(frame) + 29.4) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 62.2, CGRectGetMinY(frame) + 29.4)];
    [colorBlendPath closePath];
    [colorBlendPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 120.75, CGRectGetMinY(frame) + 30.25)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 120.75, CGRectGetMinY(frame) + 120.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 145.75, CGRectGetMinY(frame) + 55.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 145.75, CGRectGetMinY(frame) + 95.76)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.25, CGRectGetMinY(frame) + 120.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 95.76, CGRectGetMinY(frame) + 145.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.24, CGRectGetMinY(frame) + 145.75)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.25, CGRectGetMinY(frame) + 30.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 5.25, CGRectGetMinY(frame) + 95.76) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 5.25, CGRectGetMinY(frame) + 55.24)];
    [colorBlendPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 120.75, CGRectGetMinY(frame) + 30.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.24, CGRectGetMinY(frame) + 5.25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 95.76, CGRectGetMinY(frame) + 5.25)];
    [colorBlendPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    CGContextBeginTransparencyLayer(context, NULL);
    [colorBlendPath addClip];
    CGRect colorBlendBounds = CGPathGetPathBoundingBox(colorBlendPath.CGPath);
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(colorBlendBounds), CGRectGetMinY(colorBlendBounds)),
                                CGPointMake(CGRectGetMidX(colorBlendBounds), CGRectGetMaxY(colorBlendBounds)),
                                0);
    CGContextEndTransparencyLayer(context);
    CGContextRestoreGState(context);
    
    [UIColor.whiteColor setStroke];
    colorBlendPath.lineWidth = 2;
    [colorBlendPath stroke];
    
    
    //// ColorFrame Drawing
    UIBezierPath* colorFramePath = UIBezierPath.bezierPath;
    [colorFramePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 45.8)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 105.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.4, CGRectGetMinY(frame) + 62.2) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.4, CGRectGetMinY(frame) + 88.8)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 105.2, CGRectGetMinY(frame) + 105.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 62.2, CGRectGetMinY(frame) + 121.6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 88.8, CGRectGetMinY(frame) + 121.6)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 105.2, CGRectGetMinY(frame) + 45.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 121.6, CGRectGetMinY(frame) + 88.8) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 121.6, CGRectGetMinY(frame) + 62.2)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 45.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 88.8, CGRectGetMinY(frame) + 29.4) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 62.2, CGRectGetMinY(frame) + 29.4)];
    [colorFramePath closePath];
    [colorFramePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 120.75, CGRectGetMinY(frame) + 30.25)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 120.75, CGRectGetMinY(frame) + 120.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 145.75, CGRectGetMinY(frame) + 55.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 145.75, CGRectGetMinY(frame) + 95.76)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.25, CGRectGetMinY(frame) + 120.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 95.76, CGRectGetMinY(frame) + 145.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55.24, CGRectGetMinY(frame) + 145.75)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.25, CGRectGetMinY(frame) + 30.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 5.25, CGRectGetMinY(frame) + 95.76) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 5.25, CGRectGetMinY(frame) + 55.24)];
    [colorFramePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 120.75, CGRectGetMinY(frame) + 30.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.24, CGRectGetMinY(frame) + 5.25) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 95.76, CGRectGetMinY(frame) + 5.25)];
    [colorFramePath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    CGContextRestoreGState(context);
    
    [UIColor.whiteColor setStroke];
    colorFramePath.lineWidth = 2;
    [colorFramePath stroke];
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + 55.25, CGRectGetMinY(frame) + 75, 40.5, 1)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [UIColor.whiteColor setFill];
    [rectanglePath fill];
    CGContextRestoreGState(context);
    
    
    
    //// Rectangle 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 75.5, CGRectGetMinY(frame) + 75.25);
    CGContextRotateCTM(context, -90 * M_PI / 180);
    
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(-20.25, -0.5, 40.5, 1)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [UIColor.whiteColor setFill];
    [rectangle2Path fill];
    CGContextRestoreGState(context);
    
    
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (void)setColor:(UIColor *)color {
    _color = color;
    [self setNeedsDisplay];
}

@end
