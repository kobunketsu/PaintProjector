//
//  BrushTypeButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "BrushTypeButton.h"
#import "Pencil.h"
#import "Eraser.h"
#import "Pen.h"
#import "Marker.h"
#import "Finger.h"
#import "ChineseBrush.h"
#import "Crayons.h"
#import "Bucket.h"
#import "InkPen.h"
#import "MarkerSquare.h"
#import "OilBrush.h"
#import "AirBrush.h"
#import "Chalk.h"

@implementation BrushTypeButton

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
    // Drawing code
    if ([self.brush isKindOfClass:[Pencil class]]) {
        [self drawPencil];
    }
    else if ([self.brush isKindOfClass:[Eraser class]]) {
        [self drawEraser];
    }
    else if ([self.brush isKindOfClass:[Pen class]]) {
        [self drawPen];
    }
    else if ([self.brush isKindOfClass:[Marker class]]) {
        [self drawMarker];
    }
    else if ([self.brush isKindOfClass:[Finger class]]) {
        [self drawFinger];
    }
    else if ([self.brush isKindOfClass:[ChineseBrush class]]) {
        [self drawChineseBrush];
    }
    else if ([self.brush isKindOfClass:[Crayons class]]) {
        [self drawCrayons];
    }
    else if ([self.brush isKindOfClass:[Bucket class]]) {
        [self drawBucket];
    }
    else if ([self.brush isKindOfClass:[InkPen class]]) {
        [self drawInkPen];
    }
    else if ([self.brush isKindOfClass:[MarkerSquare class]]) {
        [self drawMarkerSquare];
    }
    else if ([self.brush isKindOfClass:[OilBrush class]]) {
        [self drawOilBrush];
    }
    else if ([self.brush isKindOfClass:[AirBrush class]]) {
        [self drawAirBrush];
    }
    else if ([self.brush isKindOfClass:[Chalk class]]) {
        [self drawChalk];
    }
    
    if (!self.brush.available) {
        //if use pixel image, use
        //        [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        [self drawLocker];
    }
}

- (void)drawLocker{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 0.731 green: 0.731 blue: 0.731 alpha: 1];
    UIColor* highlightedColor = [UIColor colorWithRed: 0.832 green: 0.832 blue: 0.832 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)color.CGColor,
                               (id)[UIColor colorWithRed: 0.781 green: 0.781 blue: 0.781 alpha: 1].CGColor,
                               (id)highlightedColor.CGColor,
                               (id)[UIColor colorWithRed: 0.781 green: 0.781 blue: 0.781 alpha: 1].CGColor,
                               (id)color.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.14, 0.51, 0.87, 0.98};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(56.78, 3.55)];
    [bezier2Path addLineToPoint: CGPointMake(50.22, 3.55)];
    [bezier2Path addCurveToPoint: CGPointMake(49.72, 4.04) controlPoint1: CGPointMake(49.94, 3.55) controlPoint2: CGPointMake(49.72, 3.77)];
    [bezier2Path addLineToPoint: CGPointMake(49.72, 9.08)];
    [bezier2Path addLineToPoint: CGPointMake(57.28, 9.08)];
    [bezier2Path addLineToPoint: CGPointMake(57.28, 4.04)];
    [bezier2Path addCurveToPoint: CGPointMake(56.78, 3.55) controlPoint1: CGPointMake(57.28, 3.77) controlPoint2: CGPointMake(57.06, 3.55)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(59.34, 2.5)];
    [bezier2Path addLineToPoint: CGPointMake(59.34, 9.08)];
    [bezier2Path addLineToPoint: CGPointMake(64.5, 9.08)];
    [bezier2Path addLineToPoint: CGPointMake(64.5, 23.5)];
    [bezier2Path addLineToPoint: CGPointMake(42.5, 23.5)];
    [bezier2Path addLineToPoint: CGPointMake(42.5, 9.08)];
    [bezier2Path addLineToPoint: CGPointMake(47.66, 9.08)];
    [bezier2Path addLineToPoint: CGPointMake(47.66, 2.5)];
    [bezier2Path addCurveToPoint: CGPointMake(48.66, 1.5) controlPoint1: CGPointMake(47.66, 1.95) controlPoint2: CGPointMake(48.11, 1.5)];
    [bezier2Path addLineToPoint: CGPointMake(58.34, 1.5)];
    [bezier2Path addCurveToPoint: CGPointMake(59.34, 2.5) controlPoint1: CGPointMake(58.89, 1.5) controlPoint2: CGPointMake(59.34, 1.95)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    [bezier2Path addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(42.5, 12.5), CGPointMake(64.5, 12.5), 0);
    CGContextRestoreGState(context);
    [strokeColor setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}

- (void)drawPencil{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.285 green: 0.652 blue: 0.243 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color4 = [UIColor colorWithRed: (colorRGBA[0] * 0.8 + 0.2) green: (colorRGBA[1] * 0.8 + 0.2) blue: (colorRGBA[2] * 0.8 + 0.2) alpha: (colorRGBA[3] * 0.8 + 0.2)];
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.4) green: (colorRGBA[1] * 0.4) blue: (colorRGBA[2] * 0.4) alpha: (colorRGBA[3] * 0.4 + 0.6)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 25.1);
    CGFloat shadowBlurRadius = 20;
    
    //// Pencil
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(25, 54.5, 14, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [color setFill];
        [roundedRectanglePath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(39, 54.5, 10, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [color4 setFill];
        [roundedRectangle2Path fill];
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(15, 54, 10, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [color4 setFill];
        [roundedRectangle3Path fill];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(47.56, 53.11)];
        [bezier5Path addCurveToPoint: CGPointMake(44.24, 51.77) controlPoint1: CGPointMake(46.7, 52.28) controlPoint2: CGPointMake(45.53, 51.77)];
        [bezier5Path addCurveToPoint: CGPointMake(40.08, 54.21) controlPoint1: CGPointMake(42.45, 51.77) controlPoint2: CGPointMake(40.89, 52.75)];
        [bezier5Path addCurveToPoint: CGPointMake(34.04, 51.09) controlPoint1: CGPointMake(38.77, 52.34) controlPoint2: CGPointMake(36.2, 51.09)];
        [bezier5Path addLineToPoint: CGPointMake(29.96, 51.09)];
        [bezier5Path addCurveToPoint: CGPointMake(24.12, 53.94) controlPoint1: CGPointMake(27.89, 51.09) controlPoint2: CGPointMake(25.45, 52.24)];
        [bezier5Path addCurveToPoint: CGPointMake(19.76, 51.09) controlPoint1: CGPointMake(23.39, 52.26) controlPoint2: CGPointMake(21.71, 51.09)];
        [bezier5Path addCurveToPoint: CGPointMake(15.11, 54.82) controlPoint1: CGPointMake(17.48, 51.09) controlPoint2: CGPointMake(15.58, 52.68)];
        [bezier5Path addLineToPoint: CGPointMake(15, 54.82)];
        [bezier5Path addLineToPoint: CGPointMake(24.52, 23.3)];
        [bezier5Path addLineToPoint: CGPointMake(37.65, 23.3)];
        [bezier5Path addLineToPoint: CGPointMake(47.56, 53.11)];
        [bezier5Path closePath];
        [color6 setFill];
        [bezier5Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(35.83, 20.59)];
        [bezier2Path addLineToPoint: CGPointMake(25.88, 20.59)];
        [bezier2Path addLineToPoint: CGPointMake(30.86, 5)];
        [bezier2Path addLineToPoint: CGPointMake(35.83, 20.59)];
        [bezier2Path closePath];
        [color5 setFill];
        [bezier2Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
}

- (void)drawPen{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.981 green: 0.885 blue: 0.454 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.1) green: (colorRGBA[1] * 0.1) blue: (colorRGBA[2] * 0.1) alpha: (colorRGBA[3] * 0.1 + 0.9)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    CGFloat color6HSBA[4];
    [color6 getHue: &color6HSBA[0] saturation: &color6HSBA[1] brightness: &color6HSBA[2] alpha: &color6HSBA[3]];
    
    UIColor* color4 = [UIColor colorWithHue: color6HSBA[0] saturation: 0.5 brightness: color6HSBA[2] alpha: color6HSBA[3]];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 25.1);
    CGFloat shadowBlurRadius = 20;
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 4 Drawing
        UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(20, 70, 26, 5) cornerRadius: 2.5];
        [color5 setFill];
        [roundedRectangle4Path fill];
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPath];
        [roundedRectangle5Path moveToPoint: CGPointMake(20.34, 118.72)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(21.69, 120) controlPoint1: CGPointMake(20.34, 119.43) controlPoint2: CGPointMake(20.95, 120)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(44.54, 120)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(45.88, 118.72) controlPoint1: CGPointMake(45.28, 120) controlPoint2: CGPointMake(45.88, 119.43)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(43.19, 76.64)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(41.85, 75.36) controlPoint1: CGPointMake(43.19, 75.93) controlPoint2: CGPointMake(42.59, 75.36)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(24.38, 75.36)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(23.03, 76.64) controlPoint1: CGPointMake(23.63, 75.36) controlPoint2: CGPointMake(23.03, 75.93)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(20.34, 118.72)];
        [roundedRectangle5Path closePath];
        [color setFill];
        [roundedRectangle5Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(32.44, 42.31)];
        [bezier2Path addCurveToPoint: CGPointMake(30.62, 43.2) controlPoint1: CGPointMake(31.78, 42.42) controlPoint2: CGPointMake(31.14, 42.72)];
        [bezier2Path addCurveToPoint: CGPointMake(30.62, 47.72) controlPoint1: CGPointMake(29.31, 44.45) controlPoint2: CGPointMake(29.31, 46.47)];
        [bezier2Path addCurveToPoint: CGPointMake(35.38, 47.72) controlPoint1: CGPointMake(31.94, 48.97) controlPoint2: CGPointMake(34.06, 48.97)];
        [bezier2Path addCurveToPoint: CGPointMake(35.38, 43.2) controlPoint1: CGPointMake(36.69, 46.47) controlPoint2: CGPointMake(36.69, 44.45)];
        [bezier2Path addCurveToPoint: CGPointMake(33.56, 42.31) controlPoint1: CGPointMake(34.86, 42.72) controlPoint2: CGPointMake(34.22, 42.42)];
        [bezier2Path addLineToPoint: CGPointMake(33.56, 5.6)];
        [bezier2Path addCurveToPoint: CGPointMake(34.9, 7.55) controlPoint1: CGPointMake(34.06, 5.92) controlPoint2: CGPointMake(34.54, 6.48)];
        [bezier2Path addCurveToPoint: CGPointMake(39.99, 23.98) controlPoint1: CGPointMake(36.37, 11.88) controlPoint2: CGPointMake(38.31, 19.18)];
        [bezier2Path addCurveToPoint: CGPointMake(47, 38.04) controlPoint1: CGPointMake(42.86, 32.2) controlPoint2: CGPointMake(47, 38.04)];
        [bezier2Path addCurveToPoint: CGPointMake(46.44, 54.8) controlPoint1: CGPointMake(47, 38.04) controlPoint2: CGPointMake(46.73, 47.23)];
        [bezier2Path addCurveToPoint: CGPointMake(44.31, 69.41) controlPoint1: CGPointMake(46.14, 62.38) controlPoint2: CGPointMake(44.31, 69.41)];
        [bezier2Path addLineToPoint: CGPointMake(23.03, 69.41)];
        [bezier2Path addCurveToPoint: CGPointMake(20.7, 54.85) controlPoint1: CGPointMake(23.03, 69.41) controlPoint2: CGPointMake(21.57, 62.43)];
        [bezier2Path addCurveToPoint: CGPointMake(19, 38.04) controlPoint1: CGPointMake(19.82, 47.28) controlPoint2: CGPointMake(19, 38.04)];
        [bezier2Path addCurveToPoint: CGPointMake(26.01, 23.98) controlPoint1: CGPointMake(19, 38.04) controlPoint2: CGPointMake(22.85, 33.29)];
        [bezier2Path addCurveToPoint: CGPointMake(31.1, 7.55) controlPoint1: CGPointMake(27.82, 18.67) controlPoint2: CGPointMake(30.01, 11.67)];
        [bezier2Path addCurveToPoint: CGPointMake(32.44, 5.47) controlPoint1: CGPointMake(31.45, 6.19) controlPoint2: CGPointMake(31.97, 5.65)];
        [bezier2Path addLineToPoint: CGPointMake(32.44, 42.31)];
        [bezier2Path closePath];
        [color4 setFill];
        [bezier2Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    
}

- (void)drawEraser{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.262 green: 0.378 blue: 0.591 alpha: 1];
    UIColor* head = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    CGFloat headHSBA[4];
    [head getHue: &headHSBA[0] saturation: &headHSBA[1] brightness: &headHSBA[2] alpha: &headHSBA[3]];
    
    UIColor* headSide = [UIColor colorWithHue: headHSBA[0] saturation: headHSBA[1] brightness: 0.8 alpha: headHSBA[3]];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 25.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Eraser
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 6 Drawing
        UIBezierPath* roundedRectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(10, 31, 34, 78) byRoundingCorners: UIRectCornerTopLeft cornerRadii: CGSizeMake(2, 2)];
        [color setFill];
        [roundedRectangle6Path fill];
        
        
        //// Rounded Rectangle 7 Drawing
        UIBezierPath* roundedRectangle7Path = [UIBezierPath bezierPath];
        [roundedRectangle7Path moveToPoint: CGPointMake(13.41, 28.85)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(44.08, 28.85)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(44.08, 5.01)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(27.21, 5.01)];
        [roundedRectangle7Path addCurveToPoint: CGPointMake(13.41, 16.93) controlPoint1: CGPointMake(19.59, 5.01) controlPoint2: CGPointMake(13.41, 10.35)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(13.41, 28.85)];
        [roundedRectangle7Path closePath];
        [head setFill];
        [roundedRectangle7Path fill];
        
        
        //// Rounded Rectangle 8 Drawing
        UIBezierPath* roundedRectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(44, 31, 11, 78)];
        [headSide setFill];
        [roundedRectangle8Path fill];
        
        
        //// Rounded Rectangle 9 Drawing
        UIBezierPath* roundedRectangle9Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(44, 5, 11, 25) byRoundingCorners: UIRectCornerTopRight cornerRadii: CGSizeMake(5.5, 5.5)];
        [headSide setFill];
        [roundedRectangle9Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    
}

- (void)drawMarker{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.97 green: 0.199 blue: 0.211 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color4 = [UIColor colorWithRed: (colorRGBA[0] * 0.8 + 0.2) green: (colorRGBA[1] * 0.8 + 0.2) blue: (colorRGBA[2] * 0.8 + 0.2) alpha: (colorRGBA[3] * 0.8 + 0.2)];
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.3) green: (colorRGBA[1] * 0.3) blue: (colorRGBA[2] * 0.3) alpha: (colorRGBA[3] * 0.3 + 0.7)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 30.1);
    CGFloat shadowBlurRadius = 20;
    
    //// Marker
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(38.76, 11)];
        [bezierPath addCurveToPoint: CGPointMake(41.15, 23.55) controlPoint1: CGPointMake(40.35, 14.47) controlPoint2: CGPointMake(41.15, 19.01)];
        [bezierPath addLineToPoint: CGPointMake(24.85, 23.55)];
        [bezierPath addCurveToPoint: CGPointMake(27.24, 11) controlPoint1: CGPointMake(24.85, 19.01) controlPoint2: CGPointMake(25.65, 14.47)];
        [bezierPath addCurveToPoint: CGPointMake(38.76, 11) controlPoint1: CGPointMake(30.42, 4.07) controlPoint2: CGPointMake(35.58, 4.07)];
        [bezierPath closePath];
        [color5 setFill];
        [bezierPath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
        [roundedRectangle2Path moveToPoint: CGPointMake(19.29, 45.74)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(15.07, 65.68)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(18.33, 68.57) controlPoint1: CGPointMake(15.07, 67.28) controlPoint2: CGPointMake(16.53, 68.57)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(47.67, 68.57)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(50.93, 65.68) controlPoint1: CGPointMake(49.47, 68.57) controlPoint2: CGPointMake(50.93, 67.28)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(46.68, 45.54)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(46.04, 29.66)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(42.78, 26.78) controlPoint1: CGPointMake(46.04, 28.07) controlPoint2: CGPointMake(44.58, 26.78)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(23.22, 26.78)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(19.96, 29.66) controlPoint1: CGPointMake(21.42, 26.78) controlPoint2: CGPointMake(19.96, 28.07)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(19.29, 45.74)];
        [roundedRectangle2Path closePath];
        [color4 setFill];
        [roundedRectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(13.44, 92.96)];
        [roundedRectanglePath addLineToPoint: CGPointMake(13.44, 116.97)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(16.7, 120.19) controlPoint1: CGPointMake(13.44, 118.75) controlPoint2: CGPointMake(14.9, 120.19)];
        [roundedRectanglePath addLineToPoint: CGPointMake(49.3, 120.19)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(52.56, 116.97) controlPoint1: CGPointMake(51.1, 120.19) controlPoint2: CGPointMake(52.56, 118.75)];
        [roundedRectanglePath addLineToPoint: CGPointMake(52.56, 92.92)];
        [roundedRectanglePath addLineToPoint: CGPointMake(54.19, 71.79)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(50.93, 68.57) controlPoint1: CGPointMake(54.19, 70.01) controlPoint2: CGPointMake(52.73, 68.57)];
        [roundedRectanglePath addLineToPoint: CGPointMake(15.07, 68.57)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(11.81, 71.79) controlPoint1: CGPointMake(13.27, 68.57) controlPoint2: CGPointMake(11.81, 70.01)];
        [roundedRectanglePath addLineToPoint: CGPointMake(13.44, 92.96)];
        [roundedRectanglePath closePath];
        [color setFill];
        [roundedRectanglePath fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    
}

- (void)drawFinger{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.923 green: 0.629 blue: 0.281 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.4) green: (colorRGBA[1] * 0.4) blue: (colorRGBA[2] * 0.4) alpha: (colorRGBA[3] * 0.4 + 0.6)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 30.1);
    CGFloat shadowBlurRadius = 25;
    
    //// Finger
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(41.77, 6.64)];
        [bezierPath addCurveToPoint: CGPointMake(47.22, 10.18) controlPoint1: CGPointMake(44.17, 7.8) controlPoint2: CGPointMake(46.13, 7.32)];
        [bezierPath addCurveToPoint: CGPointMake(48.17, 18.18) controlPoint1: CGPointMake(47.83, 11.78) controlPoint2: CGPointMake(48.17, 16.3)];
        [bezierPath addLineToPoint: CGPointMake(49.55, 35.18)];
        [bezierPath addLineToPoint: CGPointMake(44.63, 32.44)];
        [bezierPath addCurveToPoint: CGPointMake(39.21, 19.55) controlPoint1: CGPointMake(42.4, 32.44) controlPoint2: CGPointMake(39.21, 22.29)];
        [bezierPath addLineToPoint: CGPointMake(40.59, 10.12)];
        [bezierPath addCurveToPoint: CGPointMake(41.75, 6.63) controlPoint1: CGPointMake(40.59, 8.76) controlPoint2: CGPointMake(41.03, 7.53)];
        [bezierPath addLineToPoint: CGPointMake(41.77, 6.64)];
        [bezierPath closePath];
        [color6 setFill];
        [bezierPath fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(35.71, 5.68)];
        [bezier4Path addCurveToPoint: CGPointMake(40.8, 6.63) controlPoint1: CGPointMake(37.54, 5.69) controlPoint2: CGPointMake(39.24, 6.02)];
        [bezier4Path addCurveToPoint: CGPointMake(39.21, 10.49) controlPoint1: CGPointMake(39.81, 7.62) controlPoint2: CGPointMake(39.21, 8.98)];
        [bezier4Path addLineToPoint: CGPointMake(37.83, 20.08)];
        [bezier4Path addLineToPoint: CGPointMake(39.21, 29.69)];
        [bezier4Path addCurveToPoint: CGPointMake(41.97, 35.18) controlPoint1: CGPointMake(41.26, 33.29) controlPoint2: CGPointMake(40.24, 32.42)];
        [bezier4Path addLineToPoint: CGPointMake(49.55, 39.29)];
        [bezier4Path addLineToPoint: CGPointMake(50.93, 57.08)];
        [bezier4Path addCurveToPoint: CGPointMake(49.55, 62.63) controlPoint1: CGPointMake(50.93, 57.08) controlPoint2: CGPointMake(51.35, 54.32)];
        [bezier4Path addCurveToPoint: CGPointMake(48.92, 66.76) controlPoint1: CGPointMake(49.23, 64.13) controlPoint2: CGPointMake(49.03, 65.49)];
        [bezier4Path addCurveToPoint: CGPointMake(40.59, 63.99) controlPoint1: CGPointMake(46.71, 65.9) controlPoint2: CGPointMake(43.78, 65.95)];
        [bezier4Path addCurveToPoint: CGPointMake(30.93, 55.76) controlPoint1: CGPointMake(33.77, 59.81) controlPoint2: CGPointMake(30.93, 55.76)];
        [bezier4Path addCurveToPoint: CGPointMake(40.59, 66.73) controlPoint1: CGPointMake(30.93, 55.76) controlPoint2: CGPointMake(33.48, 61.22)];
        [bezier4Path addCurveToPoint: CGPointMake(48.95, 70.61) controlPoint1: CGPointMake(43.88, 69.28) controlPoint2: CGPointMake(46.78, 69.57)];
        [bezier4Path addCurveToPoint: CGPointMake(50.64, 83.47) controlPoint1: CGPointMake(49.28, 74.07) controlPoint2: CGPointMake(50.11, 78.78)];
        [bezier4Path addCurveToPoint: CGPointMake(50.93, 97.75) controlPoint1: CGPointMake(51.6, 91.95) controlPoint2: CGPointMake(50.17, 92.5)];
        [bezier4Path addCurveToPoint: CGPointMake(52.31, 111.31) controlPoint1: CGPointMake(51.69, 102.99) controlPoint2: CGPointMake(52.31, 111.31)];
        [bezier4Path addLineToPoint: CGPointMake(15.07, 111.31)];
        [bezier4Path addLineToPoint: CGPointMake(13.13, 103.11)];
        [bezier4Path addCurveToPoint: CGPointMake(13.69, 84.3) controlPoint1: CGPointMake(13.13, 103.11) controlPoint2: CGPointMake(12.86, 94.63)];
        [bezier4Path addCurveToPoint: CGPointMake(16.45, 61.8) controlPoint1: CGPointMake(14.52, 73.98) controlPoint2: CGPointMake(16.45, 61.8)];
        [bezier4Path addLineToPoint: CGPointMake(13.69, 56.42)];
        [bezier4Path addCurveToPoint: CGPointMake(15.07, 36.77) controlPoint1: CGPointMake(13.69, 56.42) controlPoint2: CGPointMake(13.69, 46.03)];
        [bezier4Path addCurveToPoint: CGPointMake(19.21, 19.4) controlPoint1: CGPointMake(16.45, 27.52) controlPoint2: CGPointMake(19.21, 19.4)];
        [bezier4Path addCurveToPoint: CGPointMake(27.48, 8.43) controlPoint1: CGPointMake(22.87, 11.63) controlPoint2: CGPointMake(23.34, 11.86)];
        [bezier4Path addCurveToPoint: CGPointMake(35.76, 5.69) controlPoint1: CGPointMake(31.62, 5) controlPoint2: CGPointMake(35.76, 5.69)];
        [bezier4Path addLineToPoint: CGPointMake(35.71, 5.68)];
        [bezier4Path closePath];
        [color setFill];
        [bezier4Path fill];
        
        
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(32.97, 5.82)];
        [bezier7Path addCurveToPoint: CGPointMake(35.55, 12.04) controlPoint1: CGPointMake(34.43, 7.52) controlPoint2: CGPointMake(35.57, 9.63)];
        [bezier7Path addCurveToPoint: CGPointMake(29.75, 25.98) controlPoint1: CGPointMake(35.51, 18.72) controlPoint2: CGPointMake(30.3, 15.98)];
        [bezier7Path addCurveToPoint: CGPointMake(18.84, 37.82) controlPoint1: CGPointMake(29.19, 35.98) controlPoint2: CGPointMake(23.76, 30.01)];
        [bezier7Path addCurveToPoint: CGPointMake(14.42, 42.09) controlPoint1: CGPointMake(17.59, 39.81) controlPoint2: CGPointMake(16.04, 41.17)];
        [bezier7Path addCurveToPoint: CGPointMake(15.07, 36.77) controlPoint1: CGPointMake(14.59, 40.33) controlPoint2: CGPointMake(14.81, 38.53)];
        [bezier7Path addCurveToPoint: CGPointMake(19.21, 19.4) controlPoint1: CGPointMake(16.45, 27.52) controlPoint2: CGPointMake(19.21, 19.4)];
        [bezier7Path addCurveToPoint: CGPointMake(27.48, 8.43) controlPoint1: CGPointMake(22.87, 11.63) controlPoint2: CGPointMake(23.34, 11.86)];
        [bezier7Path addCurveToPoint: CGPointMake(32.96, 5.81) controlPoint1: CGPointMake(29.46, 6.79) controlPoint2: CGPointMake(31.44, 6.09)];
        [bezier7Path addLineToPoint: CGPointMake(32.97, 5.82)];
        [bezier7Path closePath];
        [color5 setFill];
        [bezier7Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
}

- (void)drawChineseBrush{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color7 = [UIColor colorWithRed: 0.551 green: 0.497 blue: 0.608 alpha: 1];
    CGFloat color7RGBA[4];
    [color7 getRed: &color7RGBA[0] green: &color7RGBA[1] blue: &color7RGBA[2] alpha: &color7RGBA[3]];
    
    UIColor* color8 = [UIColor colorWithRed: (color7RGBA[0] * 0.1) green: (color7RGBA[1] * 0.1) blue: (color7RGBA[2] * 0.1) alpha: (color7RGBA[3] * 0.1 + 0.9)];
    
    //// Shadow Declarations
    UIColor* shadow2 = color7;
    CGSize shadow2Offset = CGSizeMake(0.1, 25.1);
    CGFloat shadow2BlurRadius = 20;
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(24.5, 60.5)];
        [bezierPath addCurveToPoint: CGPointMake(17.5, 40.54) controlPoint1: CGPointMake(24.5, 60.5) controlPoint2: CGPointMake(17.5, 50.31)];
        [bezierPath addCurveToPoint: CGPointMake(26.5, 15.38) controlPoint1: CGPointMake(17.5, 30.78) controlPoint2: CGPointMake(23.3, 23.94)];
        [bezierPath addCurveToPoint: CGPointMake(31.5, 1.5) controlPoint1: CGPointMake(29.7, 6.82) controlPoint2: CGPointMake(31.5, 1.5)];
        [bezierPath addCurveToPoint: CGPointMake(37.5, 15.38) controlPoint1: CGPointMake(31.5, 1.5) controlPoint2: CGPointMake(34.79, 7.74)];
        [bezierPath addCurveToPoint: CGPointMake(46.5, 40.54) controlPoint1: CGPointMake(40.21, 23.03) controlPoint2: CGPointMake(46.5, 29.35)];
        [bezierPath addCurveToPoint: CGPointMake(40.5, 60.5) controlPoint1: CGPointMake(46.5, 51.74) controlPoint2: CGPointMake(40.5, 60.5)];
        [bezierPath addLineToPoint: CGPointMake(24.5, 60.5)];
        [bezierPath closePath];
        [color8 setFill];
        [bezierPath fill];
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPath];
        [roundedRectangle5Path moveToPoint: CGPointMake(19.34, 118.3)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(20.69, 120) controlPoint1: CGPointMake(19.34, 119.24) controlPoint2: CGPointMake(19.95, 120)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(43.54, 120)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(44.88, 118.3) controlPoint1: CGPointMake(44.28, 120) controlPoint2: CGPointMake(44.88, 119.24)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(42.19, 62.06)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(40.85, 60.36) controlPoint1: CGPointMake(42.19, 61.12) controlPoint2: CGPointMake(41.59, 60.36)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(23.38, 60.36)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(22.03, 62.06) controlPoint1: CGPointMake(22.63, 60.36) controlPoint2: CGPointMake(22.03, 61.12)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(19.34, 118.3)];
        [roundedRectangle5Path closePath];
        [color7 setFill];
        [roundedRectangle5Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}

- (void)drawCrayons{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.686 green: 0.311 blue: 0.559 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color4 = [UIColor colorWithRed: (colorRGBA[0] * 0.6 + 0.4) green: (colorRGBA[1] * 0.6 + 0.4) blue: (colorRGBA[2] * 0.6 + 0.4) alpha: (colorRGBA[3] * 0.6 + 0.4)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 30.1);
    CGFloat shadowBlurRadius = 20;
    
    //// MarkerSquare
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(17.99, 50)];
        [rectangle2Path addLineToPoint: CGPointMake(50, 50)];
        [rectangle2Path addLineToPoint: CGPointMake(39, 4)];
        [rectangle2Path addLineToPoint: CGPointMake(28, 4)];
        [rectangle2Path addLineToPoint: CGPointMake(17.99, 50)];
        [rectangle2Path closePath];
        [color setFill];
        [rectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(15, 50, 38, 50) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(3, 3)];
        [color4 setFill];
        [roundedRectanglePath fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    

}

- (void)drawEraserSoft{
    [self drawEraser];
}

- (void)drawInkPen{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.349 green: 0.313 blue: 0.763 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* colorHighlight = [UIColor colorWithRed: (colorRGBA[0] * 0.6 + 0.4) green: (colorRGBA[1] * 0.6 + 0.4) blue: (colorRGBA[2] * 0.6 + 0.4) alpha: (colorRGBA[3] * 0.6 + 0.4)];
    UIColor* colorShadow = [UIColor colorWithRed: (colorRGBA[0] * 0.3) green: (colorRGBA[1] * 0.3) blue: (colorRGBA[2] * 0.3) alpha: (colorRGBA[3] * 0.3 + 0.7)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 10.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Airbrush
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(20.84, 36.06)];
        [rectangle2Path addCurveToPoint: CGPointMake(18.58, 65) controlPoint1: CGPointMake(17.85, 49.81) controlPoint2: CGPointMake(18.58, 65)];
        [rectangle2Path addLineToPoint: CGPointMake(48, 65)];
        [rectangle2Path addCurveToPoint: CGPointMake(43.97, 36.31) controlPoint1: CGPointMake(48, 65) controlPoint2: CGPointMake(47.59, 50.06)];
        [rectangle2Path addCurveToPoint: CGPointMake(34.53, 10) controlPoint1: CGPointMake(40.36, 22.56) controlPoint2: CGPointMake(34.53, 10)];
        [rectangle2Path addLineToPoint: CGPointMake(29.52, 10)];
        [rectangle2Path addCurveToPoint: CGPointMake(20.84, 36.06) controlPoint1: CGPointMake(29.52, 10) controlPoint2: CGPointMake(23.83, 22.31)];
        [rectangle2Path closePath];
        [colorShadow setFill];
        [rectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(17, 65, 32, 35) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(3, 3)];
        [colorHighlight setFill];
        [roundedRectanglePath fill];
        
        
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPath];
        [rectangle4Path moveToPoint: CGPointMake(30, 10)];
        [rectangle4Path addLineToPoint: CGPointMake(33, 10)];
        [rectangle4Path addLineToPoint: CGPointMake(32.18, 4)];
        [rectangle4Path addLineToPoint: CGPointMake(31, 4)];
        [rectangle4Path addLineToPoint: CGPointMake(30, 10)];
        [rectangle4Path closePath];
        [colorHighlight setFill];
        [rectangle4Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
}

- (void)drawMarkerSquare{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.875 green: 0.984 blue: 0.277 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.3) green: (colorRGBA[1] * 0.3) blue: (colorRGBA[2] * 0.3) alpha: (colorRGBA[3] * 0.3 + 0.7)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 30.1);
    CGFloat shadowBlurRadius = 20;
    
    //// MarkerSquare
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPath];
        [roundedRectangle3Path moveToPoint: CGPointMake(20.29, 42.3)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(16.07, 64.26)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(19.33, 67.43) controlPoint1: CGPointMake(16.07, 66.01) controlPoint2: CGPointMake(17.53, 67.43)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(48.67, 67.43)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(51.93, 64.26) controlPoint1: CGPointMake(50.47, 67.43) controlPoint2: CGPointMake(51.93, 66.01)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(47.68, 42.07)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(47.04, 24.59)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(43.78, 21.42) controlPoint1: CGPointMake(47.04, 22.84) controlPoint2: CGPointMake(45.58, 21.42)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(24.22, 21.42)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(20.96, 24.59) controlPoint1: CGPointMake(22.42, 21.42) controlPoint2: CGPointMake(20.96, 22.84)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(20.29, 42.3)];
        [roundedRectangle3Path closePath];
        [color5 setFill];
        [roundedRectangle3Path fill];
        
        
        //// Rounded Rectangle 4 Drawing
        UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPath];
        [roundedRectangle4Path moveToPoint: CGPointMake(14.44, 91.42)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(14.44, 115.03)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(17.7, 118.21) controlPoint1: CGPointMake(14.44, 116.79) controlPoint2: CGPointMake(15.9, 118.21)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(50.3, 118.21)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(53.56, 115.03) controlPoint1: CGPointMake(52.1, 118.21) controlPoint2: CGPointMake(53.56, 116.79)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(53.56, 91.38)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(55.19, 70.61)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(51.93, 67.43) controlPoint1: CGPointMake(55.19, 68.85) controlPoint2: CGPointMake(53.73, 67.43)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(16.07, 67.43)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(12.81, 70.61) controlPoint1: CGPointMake(14.27, 67.43) controlPoint2: CGPointMake(12.81, 68.85)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(14.44, 91.42)];
        [roundedRectangle4Path closePath];
        [color setFill];
        [roundedRectangle4Path fill];
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
        [rectanglePath moveToPoint: CGPointMake(25.85, 18.25)];
        [rectanglePath addLineToPoint: CGPointMake(42.15, 18.25)];
        [rectanglePath addLineToPoint: CGPointMake(42.15, 0.79)];
        [rectanglePath addLineToPoint: CGPointMake(25.85, 8.73)];
        [rectanglePath addLineToPoint: CGPointMake(25.85, 18.25)];
        [rectanglePath closePath];
        [color setFill];
        [rectanglePath fill];
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(12, 64, 43, 4) cornerRadius: 1];
        [color6 setFill];
        [roundedRectangle5Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    

}

- (void)drawOilBrush{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* brushColorBase = [UIColor colorWithRed: 1 green: 0.81 blue: 0.339 alpha: 1];
    CGFloat brushColorBaseRGBA[4];
    [brushColorBase getRed: &brushColorBaseRGBA[0] green: &brushColorBaseRGBA[1] blue: &brushColorBaseRGBA[2] alpha: &brushColorBaseRGBA[3]];
    
    UIColor* colorShadow = [UIColor colorWithRed: (brushColorBaseRGBA[0] * 0.95) green: (brushColorBaseRGBA[1] * 0.95) blue: (brushColorBaseRGBA[2] * 0.95) alpha: (brushColorBaseRGBA[3] * 0.95 + 0.05)];
    UIColor* glowColor = [brushColorBase colorWithAlphaComponent: 0.6];
    UIColor* stickColorShaow = [UIColor colorWithRed: 0.465 green: 0.465 blue: 0.465 alpha: 1];
    UIColor* stickColor = [UIColor colorWithRed: 0.901 green: 0.901 blue: 0.901 alpha: 1];
    
    //// Gradient Declarations
    NSArray* brushGradientColors = [NSArray arrayWithObjects:
                                    (id)brushColorBase.CGColor,
                                    (id)colorShadow.CGColor, nil];
    CGFloat brushGradientLocations[] = {0, 0.19};
    CGGradientRef brushGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)brushGradientColors, brushGradientLocations);
    
    //// Shadow Declarations
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, 15.1);
    CGFloat glowBlurRadius = 10;
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(22.34, 115.8)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(23.69, 117.5) controlPoint1: CGPointMake(22.34, 116.74) controlPoint2: CGPointMake(22.95, 117.5)];
        [roundedRectanglePath addLineToPoint: CGPointMake(42.54, 117.5)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(43.88, 115.8) controlPoint1: CGPointMake(43.28, 117.5) controlPoint2: CGPointMake(43.88, 116.74)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(45, 87) controlPoint1: CGPointMake(43.88, 115.8) controlPoint2: CGPointMake(44.76, 101.48)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(48, 70) controlPoint1: CGPointMake(45.06, 83.34) controlPoint2: CGPointMake(48, 70)];
        [roundedRectanglePath addLineToPoint: CGPointMake(48, 56)];
        [roundedRectanglePath addLineToPoint: CGPointMake(18, 56)];
        [roundedRectanglePath addLineToPoint: CGPointMake(18, 70)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(21, 87) controlPoint1: CGPointMake(18, 70) controlPoint2: CGPointMake(20.87, 83.24)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(22.34, 115.8) controlPoint1: CGPointMake(21.49, 101.48) controlPoint2: CGPointMake(22.34, 115.8)];
        [roundedRectanglePath closePath];
        [stickColor setFill];
        [roundedRectanglePath fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(18, 55)];
        [bezier2Path addCurveToPoint: CGPointMake(14, 30) controlPoint1: CGPointMake(18, 55) controlPoint2: CGPointMake(14, 44.01)];
        [bezier2Path addCurveToPoint: CGPointMake(9.89, 11.78) controlPoint1: CGPointMake(14, 20.66) controlPoint2: CGPointMake(9.89, 11.78)];
        [bezier2Path addCurveToPoint: CGPointMake(14, 6) controlPoint1: CGPointMake(9.89, 11.78) controlPoint2: CGPointMake(10.92, 8)];
        [bezier2Path addCurveToPoint: CGPointMake(51, 6) controlPoint1: CGPointMake(23.25, 0) controlPoint2: CGPointMake(41.75, 0)];
        [bezier2Path addCurveToPoint: CGPointMake(54.86, 12.06) controlPoint1: CGPointMake(55.01, 8.6) controlPoint2: CGPointMake(54.86, 12.06)];
        [bezier2Path addCurveToPoint: CGPointMake(51, 30) controlPoint1: CGPointMake(54.86, 12.06) controlPoint2: CGPointMake(51, 19.24)];
        [bezier2Path addCurveToPoint: CGPointMake(47, 55) controlPoint1: CGPointMake(51, 48.99) controlPoint2: CGPointMake(47, 55)];
        [bezier2Path addLineToPoint: CGPointMake(18, 55)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGContextDrawRadialGradient(context, brushGradient,
                                    CGPointMake(32.67, 37.67), 15.32,
                                    CGPointMake(33, 29.33), 68.67,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(33, 78)];
        [bezierPath addCurveToPoint: CGPointMake(41.43, 75.27) controlPoint1: CGPointMake(36.05, 78) controlPoint2: CGPointMake(38.45, 76.88)];
        [bezierPath addCurveToPoint: CGPointMake(46, 70.56) controlPoint1: CGPointMake(44.4, 73.66) controlPoint2: CGPointMake(45.93, 71.18)];
        [bezierPath addCurveToPoint: CGPointMake(20.02, 70.63) controlPoint1: CGPointMake(46.07, 69.9) controlPoint2: CGPointMake(19.84, 69.95)];
        [bezierPath addCurveToPoint: CGPointMake(24.57, 75.27) controlPoint1: CGPointMake(20.17, 71.23) controlPoint2: CGPointMake(21.6, 73.68)];
        [bezierPath addCurveToPoint: CGPointMake(33, 78) controlPoint1: CGPointMake(27.55, 76.86) controlPoint2: CGPointMake(29.95, 78)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(18.5, 72.5)];
        [bezierPath addCurveToPoint: CGPointMake(23.5, 87.5) controlPoint1: CGPointMake(18.5, 72.5) controlPoint2: CGPointMake(21.25, 77)];
        [bezierPath addCurveToPoint: CGPointMake(26.5, 100.5) controlPoint1: CGPointMake(25.75, 98) controlPoint2: CGPointMake(26.5, 100.5)];
        [bezierPath addLineToPoint: CGPointMake(20.5, 100.5)];
        [bezierPath addLineToPoint: CGPointMake(20.5, 87.5)];
        [bezierPath addLineToPoint: CGPointMake(18.5, 72.5)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(47.5, 72.5)];
        [bezierPath addCurveToPoint: CGPointMake(42.5, 87.5) controlPoint1: CGPointMake(47.5, 72.5) controlPoint2: CGPointMake(44.75, 77)];
        [bezierPath addCurveToPoint: CGPointMake(39.5, 100.5) controlPoint1: CGPointMake(40.25, 98) controlPoint2: CGPointMake(39.5, 100.5)];
        [bezierPath addLineToPoint: CGPointMake(45.5, 100.5)];
        [bezierPath addLineToPoint: CGPointMake(45.5, 87.5)];
        [bezierPath addLineToPoint: CGPointMake(47.5, 72.5)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(48, 70.06)];
        [bezierPath addCurveToPoint: CGPointMake(46.12, 64.7) controlPoint1: CGPointMake(48, 70.06) controlPoint2: CGPointMake(47.33, 71.32)];
        [bezierPath addCurveToPoint: CGPointMake(44.5, 56.5) controlPoint1: CGPointMake(44.9, 58.08) controlPoint2: CGPointMake(44.5, 56.5)];
        [bezierPath addLineToPoint: CGPointMake(47.73, 56.5)];
        [bezierPath addLineToPoint: CGPointMake(47.73, 64.7)];
        [bezierPath addLineToPoint: CGPointMake(48, 70.06)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(17.5, 70.06)];
        [bezierPath addCurveToPoint: CGPointMake(19.38, 64.7) controlPoint1: CGPointMake(17.5, 70.06) controlPoint2: CGPointMake(18.17, 71.32)];
        [bezierPath addCurveToPoint: CGPointMake(21, 56.5) controlPoint1: CGPointMake(20.6, 58.08) controlPoint2: CGPointMake(21, 56.5)];
        [bezierPath addLineToPoint: CGPointMake(17.77, 56.5)];
        [bezierPath addLineToPoint: CGPointMake(17.77, 64.7)];
        [bezierPath addLineToPoint: CGPointMake(17.5, 70.06)];
        [bezierPath closePath];
        [stickColorShaow setFill];
        [bezierPath fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(brushGradient);
    CGColorSpaceRelease(colorSpace);
    
   
}

- (void)drawAirBrush{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.613 green: 0.613 blue: 0.613 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* colorHighlight = [UIColor colorWithRed: (colorRGBA[0] * 0.7 + 0.3) green: (colorRGBA[1] * 0.7 + 0.3) blue: (colorRGBA[2] * 0.7 + 0.3) alpha: (colorRGBA[3] * 0.7 + 0.3)];
    UIColor* colorShadow = [UIColor colorWithRed: (colorRGBA[0] * 0.3 + 0.7) green: (colorRGBA[1] * 0.3 + 0.7) blue: (colorRGBA[2] * 0.3 + 0.7) alpha: (colorRGBA[3] * 0.3 + 0.7)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, 10.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Airbrush
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(24.19, 15)];
        [bezierPath addLineToPoint: CGPointMake(40.1, 15)];
        [bezierPath addLineToPoint: CGPointMake(40.1, 13)];
        [bezierPath addLineToPoint: CGPointMake(24.19, 13)];
        [bezierPath addLineToPoint: CGPointMake(24.19, 15)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(20.13, 31)];
        [bezierPath addLineToPoint: CGPointMake(45.52, 31)];
        [bezierPath addLineToPoint: CGPointMake(45.52, 29)];
        [bezierPath addLineToPoint: CGPointMake(20.13, 29)];
        [bezierPath addLineToPoint: CGPointMake(20.13, 31)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(13, 59)];
        [bezierPath addLineToPoint: CGPointMake(53, 59)];
        [bezierPath addLineToPoint: CGPointMake(53, 57)];
        [bezierPath addLineToPoint: CGPointMake(13, 57)];
        [bezierPath addLineToPoint: CGPointMake(13, 59)];
        [bezierPath closePath];
        [colorHighlight setFill];
        [bezierPath fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(20.13, 29)];
        [bezier4Path addLineToPoint: CGPointMake(45.52, 29)];
        [bezier4Path addLineToPoint: CGPointMake(42.81, 15)];
        [bezier4Path addLineToPoint: CGPointMake(22.84, 15)];
        [bezier4Path addLineToPoint: CGPointMake(20.13, 29)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(13, 105)];
        [bezier4Path addLineToPoint: CGPointMake(53, 105)];
        [bezier4Path addLineToPoint: CGPointMake(53, 59)];
        [bezier4Path addLineToPoint: CGPointMake(13, 59)];
        [bezier4Path addLineToPoint: CGPointMake(13, 105)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(13, 57)];
        [bezier4Path addLineToPoint: CGPointMake(53, 57)];
        [bezier4Path addLineToPoint: CGPointMake(47.23, 31)];
        [bezier4Path addLineToPoint: CGPointMake(18.77, 31)];
        [bezier4Path addLineToPoint: CGPointMake(13, 57)];
        [bezier4Path closePath];
        [bezier4Path moveToPoint: CGPointMake(24.19, 13)];
        [bezier4Path addLineToPoint: CGPointMake(41.1, 13)];
        [bezier4Path addLineToPoint: CGPointMake(39.74, 6)];
        [bezier4Path addLineToPoint: CGPointMake(25.55, 6)];
        [bezier4Path addLineToPoint: CGPointMake(24.19, 13)];
        [bezier4Path closePath];
        [colorShadow setFill];
        [bezier4Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
}

- (void)drawChalk{
}

-(void)drawBucket{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.237 green: 0.463 blue: 0.607 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.297 green: 0.297 blue: 0.297 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.95 green: 0.95 blue: 0.95 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Bucket
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(14, 81.83)];
        [rectangle2Path addCurveToPoint: CGPointMake(17, 85) controlPoint1: CGPointMake(14, 84.68) controlPoint2: CGPointMake(14.24, 85)];
        [rectangle2Path addLineToPoint: CGPointMake(52, 85)];
        [rectangle2Path addCurveToPoint: CGPointMake(55, 81.83) controlPoint1: CGPointMake(54.76, 85) controlPoint2: CGPointMake(55, 84.68)];
        [rectangle2Path addLineToPoint: CGPointMake(56, 31)];
        [rectangle2Path addLineToPoint: CGPointMake(12, 31)];
        [rectangle2Path addLineToPoint: CGPointMake(14, 81.83)];
        [rectangle2Path closePath];
        [color6 setFill];
        [rectangle2Path fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(44.75, 17.02)];
        [bezier3Path addCurveToPoint: CGPointMake(58, 30) controlPoint1: CGPointMake(53.1, 21.4) controlPoint2: CGPointMake(58, 30)];
        [bezier3Path addLineToPoint: CGPointMake(58, 32.09)];
        [bezier3Path addCurveToPoint: CGPointMake(59, 33.5) controlPoint1: CGPointMake(58.58, 32.29) controlPoint2: CGPointMake(59, 32.85)];
        [bezier3Path addLineToPoint: CGPointMake(59, 38.5)];
        [bezier3Path addCurveToPoint: CGPointMake(58, 39.91) controlPoint1: CGPointMake(59, 39.15) controlPoint2: CGPointMake(58.58, 39.71)];
        [bezier3Path addLineToPoint: CGPointMake(58, 40)];
        [bezier3Path addLineToPoint: CGPointMake(56, 40)];
        [bezier3Path addLineToPoint: CGPointMake(56, 38.5)];
        [bezier3Path addLineToPoint: CGPointMake(56, 33.5)];
        [bezier3Path addLineToPoint: CGPointMake(56, 30)];
        [bezier3Path addCurveToPoint: CGPointMake(44.22, 18.6) controlPoint1: CGPointMake(56, 30) controlPoint2: CGPointMake(51.99, 22.4)];
        [bezier3Path addCurveToPoint: CGPointMake(33, 17) controlPoint1: CGPointMake(44.1, 18.85) controlPoint2: CGPointMake(35.45, 17)];
        [bezier3Path addCurveToPoint: CGPointMake(22.87, 18.77) controlPoint1: CGPointMake(30.55, 17) controlPoint2: CGPointMake(22.87, 18.77)];
        [bezier3Path addCurveToPoint: CGPointMake(12, 30) controlPoint1: CGPointMake(15.9, 22.59) controlPoint2: CGPointMake(12, 30)];
        [bezier3Path addLineToPoint: CGPointMake(12, 40)];
        [bezier3Path addLineToPoint: CGPointMake(10, 40)];
        [bezier3Path addLineToPoint: CGPointMake(10, 39.91)];
        [bezier3Path addCurveToPoint: CGPointMake(9, 38.5) controlPoint1: CGPointMake(9.42, 39.71) controlPoint2: CGPointMake(9, 39.15)];
        [bezier3Path addLineToPoint: CGPointMake(9, 33.5)];
        [bezier3Path addCurveToPoint: CGPointMake(10, 32.09) controlPoint1: CGPointMake(9, 32.85) controlPoint2: CGPointMake(9.42, 32.29)];
        [bezier3Path addLineToPoint: CGPointMake(10, 30)];
        [bezier3Path addCurveToPoint: CGPointMake(21.29, 17.23) controlPoint1: CGPointMake(10, 30) controlPoint2: CGPointMake(13.77, 21.64)];
        [bezier3Path addCurveToPoint: CGPointMake(33, 15) controlPoint1: CGPointMake(26.75, 15.13) controlPoint2: CGPointMake(28.34, 15)];
        [bezier3Path addCurveToPoint: CGPointMake(44.75, 17.02) controlPoint1: CGPointMake(37.66, 15) controlPoint2: CGPointMake(44.85, 16.29)];
        [bezier3Path closePath];
        [color4 setFill];
        [bezier3Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(12, 34)];
        [bezierPath addCurveToPoint: CGPointMake(17, 37) controlPoint1: CGPointMake(12, 34) controlPoint2: CGPointMake(16.18, 33.86)];
        [bezierPath addCurveToPoint: CGPointMake(19, 41) controlPoint1: CGPointMake(17.82, 40.14) controlPoint2: CGPointMake(17.5, 41)];
        [bezierPath addCurveToPoint: CGPointMake(22, 37) controlPoint1: CGPointMake(20.5, 41) controlPoint2: CGPointMake(19.85, 37)];
        [bezierPath addCurveToPoint: CGPointMake(25, 47) controlPoint1: CGPointMake(24.15, 37) controlPoint2: CGPointMake(24.85, 44.36)];
        [bezierPath addCurveToPoint: CGPointMake(27.65, 57.97) controlPoint1: CGPointMake(25.15, 49.64) controlPoint2: CGPointMake(23.5, 57.97)];
        [bezierPath addCurveToPoint: CGPointMake(28, 47) controlPoint1: CGPointMake(31.8, 57.97) controlPoint2: CGPointMake(28, 53)];
        [bezierPath addCurveToPoint: CGPointMake(30, 41) controlPoint1: CGPointMake(28, 41) controlPoint2: CGPointMake(30, 41)];
        [bezierPath addCurveToPoint: CGPointMake(33, 50) controlPoint1: CGPointMake(30, 41) controlPoint2: CGPointMake(30.18, 50)];
        [bezierPath addCurveToPoint: CGPointMake(37, 37) controlPoint1: CGPointMake(35.82, 50) controlPoint2: CGPointMake(32.67, 37)];
        [bezierPath addCurveToPoint: CGPointMake(42, 50) controlPoint1: CGPointMake(41.33, 37) controlPoint2: CGPointMake(42, 45.53)];
        [bezierPath addCurveToPoint: CGPointMake(42, 64) controlPoint1: CGPointMake(42, 54.47) controlPoint2: CGPointMake(42, 59.86)];
        [bezierPath addCurveToPoint: CGPointMake(44, 70) controlPoint1: CGPointMake(42, 68.14) controlPoint2: CGPointMake(42.67, 70)];
        [bezierPath addCurveToPoint: CGPointMake(47, 64) controlPoint1: CGPointMake(45.33, 70) controlPoint2: CGPointMake(47, 68.25)];
        [bezierPath addCurveToPoint: CGPointMake(45, 50) controlPoint1: CGPointMake(47, 59.75) controlPoint2: CGPointMake(45, 59)];
        [bezierPath addCurveToPoint: CGPointMake(50, 34) controlPoint1: CGPointMake(45, 41) controlPoint2: CGPointMake(47.84, 34)];
        [bezierPath addCurveToPoint: CGPointMake(52, 37) controlPoint1: CGPointMake(52.16, 34) controlPoint2: CGPointMake(50.5, 37)];
        [bezierPath addCurveToPoint: CGPointMake(56, 34) controlPoint1: CGPointMake(53.5, 37) controlPoint2: CGPointMake(56, 34)];
        [bezierPath addLineToPoint: CGPointMake(56, 30)];
        [bezierPath addLineToPoint: CGPointMake(12, 30)];
        [bezierPath addLineToPoint: CGPointMake(12, 34)];
        [bezierPath closePath];
        [color setFill];
        [bezierPath fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(44, 15)];
        [bezier2Path addCurveToPoint: CGPointMake(44, 19) controlPoint1: CGPointMake(44.72, 15.52) controlPoint2: CGPointMake(44, 19)];
        [bezier2Path addCurveToPoint: CGPointMake(33, 18) controlPoint1: CGPointMake(44, 19) controlPoint2: CGPointMake(35.45, 18)];
        [bezier2Path addCurveToPoint: CGPointMake(22, 19) controlPoint1: CGPointMake(30.55, 18) controlPoint2: CGPointMake(22, 19)];
        [bezier2Path addCurveToPoint: CGPointMake(22, 15) controlPoint1: CGPointMake(22, 19) controlPoint2: CGPointMake(21.21, 15.57)];
        [bezier2Path addCurveToPoint: CGPointMake(33, 13) controlPoint1: CGPointMake(23.75, 13.75) controlPoint2: CGPointMake(28.34, 13)];
        [bezier2Path addCurveToPoint: CGPointMake(44, 15) controlPoint1: CGPointMake(37.66, 13) controlPoint2: CGPointMake(42.25, 13.75)];
        [bezier2Path closePath];
        [color6 setFill];
        [bezier2Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    

}
@end
