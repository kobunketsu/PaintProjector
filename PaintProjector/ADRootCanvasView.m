//
//  RootCanvasView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADRootCanvasView.h"

@implementation ADRootCanvasView

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
        // Initialization code
        [self initCustom];
    }
    return self;
}

- (void)initCustom{
    
}

//- (void)layoutSubviews{
//    DebugLogSystem(@"layoutSubviews");
//    [super layoutSubviews];
//    for (UIView *view in self.subviews) {
//        DebugLog(@"subview %@", view);
//    }
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    //// General Declarations
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    //// Color Declarations
//    UIColor* gradientColor1 = [UIColor colorWithRed: 0.89 green: 0.851 blue: 0.847 alpha: 1];
//    UIColor* gradientColor2 = [UIColor colorWithRed: 0.545 green: 0.655 blue: 0.694 alpha: 1];
//    UIColor* gradientColor3 = [UIColor colorWithRed: 0.51 green: 0.373 blue: 0.373 alpha: 1];
//    UIColor* fillColor = [UIColor colorWithRed: 0.168 green: 0.168 blue: 0.168 alpha: 1];
//    UIColor* black = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
//    UIColor* bottomLightCenter = [UIColor colorWithRed: 0.336 green: 0.336 blue: 0.336 alpha: 1];
//    UIColor* gradientColor = [UIColor colorWithRed: 0.505 green: 0.505 blue: 0.505 alpha: 1];
//    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    
//    //// Gradient Declarations
//    CGFloat gradientLocations[] = {0, 0.51, 1};
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor1.CGColor, (id)gradientColor2.CGColor, (id)gradientColor3.CGColor], gradientLocations);
//    CGFloat bottomLightLocations[] = {0.09, 0.57, 1};
//    CGGradientRef bottomLight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)black.CGColor, (id)bottomLightCenter.CGColor, (id)white.CGColor], bottomLightLocations);
//    CGFloat centerLightLocations[] = {0, 0.51, 1};
//    CGGradientRef centerLight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)[UIColor colorWithRed: 0.252 green: 0.252 blue: 0.252 alpha: 1].CGColor, (id)black.CGColor], centerLightLocations);
//    
//    //// Rectangle Drawing
//    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 768, 1024)];
//    CGContextSaveGState(context);
//    [rectanglePath addClip];
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(384, -0), CGPointMake(384, 1024), 0);
//    CGContextRestoreGState(context);
//    
//    
//    //// Group
//    {
//        CGContextSaveGState(context);
//        CGContextSetBlendMode(context, kCGBlendModeScreen);
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Bezier Drawing
//        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
//        [bezierPath moveToPoint: CGPointMake(768, 568.25)];
//        [bezierPath addLineToPoint: CGPointMake(768, 1023)];
//        [bezierPath addCurveToPoint: CGPointMake(0, 1023) controlPoint1: CGPointMake(762.61, 1024.79) controlPoint2: CGPointMake(0, 1023)];
//        [bezierPath addLineToPoint: CGPointMake(0, 567.26)];
//        [bezierPath addCurveToPoint: CGPointMake(768, 568.25) controlPoint1: CGPointMake(227.21, 492.58) controlPoint2: CGPointMake(541.56, 492.91)];
//        [bezierPath closePath];
//        CGContextSaveGState(context);
//        [bezierPath addClip];
//        CGContextDrawLinearGradient(context, bottomLight, CGPointMake(384, 511.5), CGPointMake(384, 1023.8), 0);
//        CGContextRestoreGState(context);
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    //// Group 2
//    {
//        CGContextSaveGState(context);
//        CGContextSetAlpha(context, 0.88);
//        CGContextSetBlendMode(context, kCGBlendModeMultiply);
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Rectangle 2 Drawing
//        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 768, 1024)];
//        [fillColor setFill];
//        [rectangle2Path fill];
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    //// Group 3
//    {
//        CGContextSaveGState(context);
//        CGContextSetAlpha(context, 0.62);
//        CGContextSetBlendMode(context, kCGBlendModeScreen);
//        CGContextBeginTransparencyLayer(context, NULL);
//        
//        
//        //// Rectangle Light Drawing
//        UIBezierPath* rectangleLightPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 768, 1024)];
//        CGContextSaveGState(context);
//        [rectangleLightPath addClip];
//        CGContextDrawRadialGradient(context, centerLight,
//                                    CGPointMake(384, 260.57), 31.96,
//                                    CGPointMake(384, 512), 637.58,
//                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
//        CGContextRestoreGState(context);
//        
//        
//        CGContextEndTransparencyLayer(context);
//        CGContextRestoreGState(context);
//    }
//    
//    
//    //// Cleanup
//    CGGradientRelease(gradient);
//    CGGradientRelease(bottomLight);
//    CGGradientRelease(centerLight);
//    CGColorSpaceRelease(colorSpace);
//
//}
@end
