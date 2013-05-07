//
//  EyeDropperButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "EyeDropperButton.h"

@implementation EyeDropperButton

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
        //    [_eyeDropperButton setImage:[UIImage imageNamed:@"eyedropper.png"] forState:   UIControlStateNormal];
        //    [_eyeDropperButton setImage:[UIImage imageNamed:@"eyedropperSelected.png"] forState:UIControlStateSelected];
        _color = [UIColor clearColor];
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
    UIColor* handleGradientColor = [UIColor colorWithRed: 0.329 green: 0.329 blue: 0.329 alpha: 1];
    UIColor* handleGradientColor2 = [UIColor colorWithRed: 0.253 green: 0.253 blue: 0.253 alpha: 1];
    UIColor* dropperStroke = [UIColor colorWithRed: 0.734 green: 0.734 blue: 0.734 alpha: 1];
    UIColor* gradient3Color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradient3Color2 = [UIColor colorWithRed: 0.752 green: 0.752 blue: 0.752 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientHandlerColors = [NSArray arrayWithObjects:
                                      (id)handleGradientColor2.CGColor,
                                      (id)handleGradientColor.CGColor, nil];
    CGFloat gradientHandlerLocations[] = {0, 1};
    CGGradientRef gradientHandler = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientHandlerColors, gradientHandlerLocations);
    NSArray* gradientDropperColors = [NSArray arrayWithObjects:
                                      (id)gradient3Color.CGColor,
                                      (id)gradient3Color2.CGColor,
                                      (id)[UIColor whiteColor].CGColor, nil];
    CGFloat gradientDropperLocations[] = {0, 0.49, 1};
    CGGradientRef gradientDropper = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientDropperColors, gradientDropperLocations);
    
    //// Shadow Declarations
    UIColor* hightlight = shadowColor2;
    CGSize hightlightOffset = CGSizeMake(0.1, 2.1);
    CGFloat hightlightBlurRadius = 2;
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, hightlightOffset, hightlightBlurRadius, hightlight.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// dropper Drawing
        UIBezierPath* dropperPath = [UIBezierPath bezierPath];
        [dropperPath moveToPoint: CGPointMake(34.09, 6)];
        [dropperPath addCurveToPoint: CGPointMake(35.18, 9.36) controlPoint1: CGPointMake(34.68, 6) controlPoint2: CGPointMake(35.18, 8.74)];
        [dropperPath addLineToPoint: CGPointMake(35.18, 14.95)];
        [dropperPath addCurveToPoint: CGPointMake(38.85, 17.75) controlPoint1: CGPointMake(35.18, 15.15) controlPoint2: CGPointMake(38.85, 17.13)];
        [dropperPath addLineToPoint: CGPointMake(38.85, 51.31)];
        [dropperPath addCurveToPoint: CGPointMake(37.74, 52.42) controlPoint1: CGPointMake(38.85, 51.92) controlPoint2: CGPointMake(38.35, 52.42)];
        [dropperPath addLineToPoint: CGPointMake(29.26, 52.42)];
        [dropperPath addCurveToPoint: CGPointMake(28.15, 51.31) controlPoint1: CGPointMake(28.65, 52.42) controlPoint2: CGPointMake(28.15, 51.92)];
        [dropperPath addLineToPoint: CGPointMake(28.15, 17.75)];
        [dropperPath addCurveToPoint: CGPointMake(31.82, 14.95) controlPoint1: CGPointMake(28.15, 17.13) controlPoint2: CGPointMake(31.82, 14.95)];
        [dropperPath addLineToPoint: CGPointMake(31.82, 9.36)];
        [dropperPath addCurveToPoint: CGPointMake(32.94, 6) controlPoint1: CGPointMake(31.82, 8.74) controlPoint2: CGPointMake(32.32, 6)];
        [dropperPath addLineToPoint: CGPointMake(34.06, 6)];
        [dropperPath addLineToPoint: CGPointMake(34.09, 6)];
        [dropperPath closePath];
        CGContextSaveGState(context);
        [dropperPath addClip];
        CGContextDrawLinearGradient(context, gradientDropper, CGPointMake(28.15, 29.21), CGPointMake(38.85, 29.21), 0);
        CGContextRestoreGState(context);
        [dropperStroke setStroke];
        dropperPath.lineWidth = 1;
        [dropperPath stroke];
        
        
        //// handler Drawing
        UIBezierPath* handlerPath = [UIBezierPath bezierPath];
        [handlerPath moveToPoint: CGPointMake(43, 52.98)];
        [handlerPath addLineToPoint: CGPointMake(41.88, 55.22)];
        [handlerPath addCurveToPoint: CGPointMake(39.17, 57.46) controlPoint1: CGPointMake(41.88, 55.84) controlPoint2: CGPointMake(39.17, 57.46)];
        [handlerPath addCurveToPoint: CGPointMake(38.53, 63.07) controlPoint1: CGPointMake(39.17, 57.46) controlPoint2: CGPointMake(38.53, 61.08)];
        [handlerPath addCurveToPoint: CGPointMake(38.64, 69.38) controlPoint1: CGPointMake(38.53, 65.35) controlPoint2: CGPointMake(40.05, 67.64)];
        [handlerPath addCurveToPoint: CGPointMake(28.36, 69.38) controlPoint1: CGPointMake(35.8, 72.87) controlPoint2: CGPointMake(31.2, 72.87)];
        [handlerPath addCurveToPoint: CGPointMake(28.47, 63.36) controlPoint1: CGPointMake(27.01, 67.71) controlPoint2: CGPointMake(28.54, 65.55)];
        [handlerPath addCurveToPoint: CGPointMake(27.83, 57.46) controlPoint1: CGPointMake(28.42, 61.28) controlPoint2: CGPointMake(27.83, 57.46)];
        [handlerPath addCurveToPoint: CGPointMake(25.12, 55.22) controlPoint1: CGPointMake(27.83, 57.46) controlPoint2: CGPointMake(25.12, 55.84)];
        [handlerPath addLineToPoint: CGPointMake(24, 52.98)];
        [handlerPath addCurveToPoint: CGPointMake(25.12, 51.86) controlPoint1: CGPointMake(24, 52.37) controlPoint2: CGPointMake(24.5, 51.86)];
        [handlerPath addLineToPoint: CGPointMake(41.88, 51.86)];
        [handlerPath addCurveToPoint: CGPointMake(43, 52.98) controlPoint1: CGPointMake(42.5, 51.86) controlPoint2: CGPointMake(43, 52.37)];
        [handlerPath closePath];
        CGContextSaveGState(context);
        [handlerPath addClip];
        CGContextDrawRadialGradient(context, gradientHandler,
                                    CGPointMake(33.78, 60.83), 2.71,
                                    CGPointMake(33.5, 72.22), 23.21,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Group 2
    {
        CGContextSaveGState(context);
        CGContextSetBlendMode(context, kCGBlendModeMultiply);
        CGContextBeginTransparencyLayer(context, NULL);
        
        //// Clip dropper 2
        UIBezierPath* dropper2Path = [UIBezierPath bezierPath];
        [dropper2Path moveToPoint: CGPointMake(34.09, 6)];
        [dropper2Path addCurveToPoint: CGPointMake(35.18, 9.36) controlPoint1: CGPointMake(34.68, 6) controlPoint2: CGPointMake(35.18, 8.74)];
        [dropper2Path addLineToPoint: CGPointMake(35.18, 14.95)];
        [dropper2Path addCurveToPoint: CGPointMake(38.86, 17.75) controlPoint1: CGPointMake(35.18, 15.15) controlPoint2: CGPointMake(38.86, 17.13)];
        [dropper2Path addLineToPoint: CGPointMake(38.86, 51.31)];
        [dropper2Path addCurveToPoint: CGPointMake(37.74, 52.42) controlPoint1: CGPointMake(38.86, 51.92) controlPoint2: CGPointMake(38.36, 52.42)];
        [dropper2Path addLineToPoint: CGPointMake(29.27, 52.42)];
        [dropper2Path addCurveToPoint: CGPointMake(28.15, 51.31) controlPoint1: CGPointMake(28.65, 52.42) controlPoint2: CGPointMake(28.15, 51.92)];
        [dropper2Path addLineToPoint: CGPointMake(28.15, 17.75)];
        [dropper2Path addCurveToPoint: CGPointMake(31.83, 14.95) controlPoint1: CGPointMake(28.15, 17.13) controlPoint2: CGPointMake(31.83, 14.95)];
        [dropper2Path addLineToPoint: CGPointMake(31.83, 9.36)];
        [dropper2Path addCurveToPoint: CGPointMake(32.94, 6) controlPoint1: CGPointMake(31.83, 8.74) controlPoint2: CGPointMake(32.33, 6)];
        [dropper2Path addLineToPoint: CGPointMake(34.06, 6)];
        [dropper2Path addLineToPoint: CGPointMake(34.09, 6)];
        [dropper2Path closePath];
        [dropper2Path addClip];
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 6, 66, 33)];
        [_color setFill];
        [rectanglePath fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientHandler);
    CGGradientRelease(gradientDropper);
    CGColorSpaceRelease(colorSpace);
    
  

}


- (UIColor *)color {
    return _color;
}

- (void)setColor:(UIColor *)newValue {
    _color = newValue;
    [self setNeedsDisplay];
}

@end
