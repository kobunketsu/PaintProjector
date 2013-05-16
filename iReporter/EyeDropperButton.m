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
    
    //// EyeDropper
    {
        //// Main
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, hightlightOffset, hightlightBlurRadius, hightlight.CGColor);
            
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// dropper Drawing
            UIBezierPath* dropperPath = [UIBezierPath bezierPath];
            [dropperPath moveToPoint: CGPointMake(33.34, 5)];
            [dropperPath addCurveToPoint: CGPointMake(34.88, 9.78) controlPoint1: CGPointMake(34.17, 5) controlPoint2: CGPointMake(34.88, 8.9)];
            [dropperPath addLineToPoint: CGPointMake(34.88, 17.75)];
            [dropperPath addCurveToPoint: CGPointMake(40.11, 21.73) controlPoint1: CGPointMake(34.88, 18.04) controlPoint2: CGPointMake(40.11, 20.85)];
            [dropperPath addLineToPoint: CGPointMake(40.11, 69.53)];
            [dropperPath addCurveToPoint: CGPointMake(38.52, 71.12) controlPoint1: CGPointMake(40.11, 70.41) controlPoint2: CGPointMake(39.4, 71.12)];
            [dropperPath addLineToPoint: CGPointMake(26.48, 71.12)];
            [dropperPath addCurveToPoint: CGPointMake(24.89, 69.53) controlPoint1: CGPointMake(25.6, 71.12) controlPoint2: CGPointMake(24.89, 70.41)];
            [dropperPath addLineToPoint: CGPointMake(24.89, 21.73)];
            [dropperPath addCurveToPoint: CGPointMake(30.12, 17.75) controlPoint1: CGPointMake(24.89, 20.85) controlPoint2: CGPointMake(30.12, 17.75)];
            [dropperPath addLineToPoint: CGPointMake(30.12, 9.78)];
            [dropperPath addCurveToPoint: CGPointMake(31.71, 5) controlPoint1: CGPointMake(30.12, 8.9) controlPoint2: CGPointMake(30.83, 5)];
            [dropperPath addLineToPoint: CGPointMake(33.29, 5)];
            [dropperPath addLineToPoint: CGPointMake(33.34, 5)];
            [dropperPath closePath];
            CGContextSaveGState(context);
            [dropperPath addClip];
            CGContextDrawLinearGradient(context, gradientDropper, CGPointMake(24.89, 38.06), CGPointMake(40.11, 38.06), 0);
            CGContextRestoreGState(context);
            [dropperStroke setStroke];
            dropperPath.lineWidth = 1;
            [dropperPath stroke];
            
            
            //// handler Drawing
            UIBezierPath* handlerPath = [UIBezierPath bezierPath];
            [handlerPath moveToPoint: CGPointMake(46, 61.92)];
            [handlerPath addLineToPoint: CGPointMake(44.41, 65.1)];
            [handlerPath addCurveToPoint: CGPointMake(40.56, 68.29) controlPoint1: CGPointMake(44.41, 65.98) controlPoint2: CGPointMake(40.56, 68.29)];
            [handlerPath addCurveToPoint: CGPointMake(39.65, 76.28) controlPoint1: CGPointMake(40.56, 68.29) controlPoint2: CGPointMake(39.65, 73.45)];
            [handlerPath addCurveToPoint: CGPointMake(39.8, 85.27) controlPoint1: CGPointMake(39.64, 79.54) controlPoint2: CGPointMake(41.81, 82.79)];
            [handlerPath addCurveToPoint: CGPointMake(25.2, 85.27) controlPoint1: CGPointMake(35.77, 90.24) controlPoint2: CGPointMake(29.23, 90.24)];
            [handlerPath addCurveToPoint: CGPointMake(25.36, 76.69) controlPoint1: CGPointMake(23.28, 82.89) controlPoint2: CGPointMake(25.45, 79.81)];
            [handlerPath addCurveToPoint: CGPointMake(24.44, 68.29) controlPoint1: CGPointMake(25.28, 73.73) controlPoint2: CGPointMake(24.44, 68.29)];
            [handlerPath addCurveToPoint: CGPointMake(20.59, 65.1) controlPoint1: CGPointMake(24.44, 68.29) controlPoint2: CGPointMake(20.59, 65.98)];
            [handlerPath addLineToPoint: CGPointMake(19, 61.92)];
            [handlerPath addCurveToPoint: CGPointMake(20.59, 60.32) controlPoint1: CGPointMake(19, 61.04) controlPoint2: CGPointMake(19.71, 60.32)];
            [handlerPath addLineToPoint: CGPointMake(44.41, 60.32)];
            [handlerPath addCurveToPoint: CGPointMake(46, 61.92) controlPoint1: CGPointMake(45.29, 60.32) controlPoint2: CGPointMake(46, 61.04)];
            [handlerPath closePath];
            CGContextSaveGState(context);
            [handlerPath addClip];
            CGContextDrawRadialGradient(context, gradientHandler,
                                        CGPointMake(32.89, 73.11), 3.84,
                                        CGPointMake(32.5, 89.23), 32.87,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Clip
        {
            CGContextSaveGState(context);
            CGContextSetBlendMode(context, kCGBlendModeMultiply);
            CGContextBeginTransparencyLayer(context, NULL);
            
            //// Clip dropper 2
            UIBezierPath* dropper2Path = [UIBezierPath bezierPath];
            [dropper2Path moveToPoint: CGPointMake(33.41, 5)];
            [dropper2Path addCurveToPoint: CGPointMake(35.1, 9.78) controlPoint1: CGPointMake(34.32, 5) controlPoint2: CGPointMake(35.1, 8.9)];
            [dropper2Path addLineToPoint: CGPointMake(35.1, 17.76)];
            [dropper2Path addCurveToPoint: CGPointMake(40.78, 21.74) controlPoint1: CGPointMake(35.1, 18.05) controlPoint2: CGPointMake(40.78, 20.86)];
            [dropper2Path addLineToPoint: CGPointMake(40.78, 69.58)];
            [dropper2Path addCurveToPoint: CGPointMake(39.05, 71.18) controlPoint1: CGPointMake(40.78, 70.46) controlPoint2: CGPointMake(40, 71.18)];
            [dropper2Path addLineToPoint: CGPointMake(25.96, 71.18)];
            [dropper2Path addCurveToPoint: CGPointMake(24.23, 69.58) controlPoint1: CGPointMake(25.01, 71.18) controlPoint2: CGPointMake(24.23, 70.46)];
            [dropper2Path addLineToPoint: CGPointMake(24.23, 21.74)];
            [dropper2Path addCurveToPoint: CGPointMake(29.91, 17.76) controlPoint1: CGPointMake(24.23, 20.86) controlPoint2: CGPointMake(29.91, 17.76)];
            [dropper2Path addLineToPoint: CGPointMake(29.91, 9.78)];
            [dropper2Path addCurveToPoint: CGPointMake(31.64, 5) controlPoint1: CGPointMake(29.91, 8.9) controlPoint2: CGPointMake(30.69, 5)];
            [dropper2Path addLineToPoint: CGPointMake(33.37, 5)];
            [dropper2Path addLineToPoint: CGPointMake(33.41, 5)];
            [dropper2Path closePath];
            [dropper2Path addClip];
            
            
            //// Rectangle Drawing
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(-20, 5, 102, 47)];
            [_color setFill];
            [rectanglePath fill];
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
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
