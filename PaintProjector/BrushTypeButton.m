//
//  BrushTypeButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
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
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconColor = [UIColor colorWithRed: 0.205 green: 0.589 blue: 0.189 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconColor_g = [iconColor colorWithAlphaComponent: 0.5];
    UIColor* iconColor_h = [UIColor colorWithRed: (iconColorRGBA[0] * 0.7 + 0.3) green: (iconColorRGBA[1] * 0.7 + 0.3) blue: (iconColorRGBA[2] * 0.7 + 0.3) alpha: (iconColorRGBA[3] * 0.7 + 0.3)];
    UIColor* secondColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.4) green: (iconColorRGBA[1] * 0.4) blue: (iconColorRGBA[2] * 0.4) alpha: (iconColorRGBA[3] * 0.4 + 0.6)];
    CGFloat secondColorRGBA[4];
    [secondColor getRed: &secondColorRGBA[0] green: &secondColorRGBA[1] blue: &secondColorRGBA[2] alpha: &secondColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secondColorRGBA[0] * 0.8 + 0.2) green: (secondColorRGBA[1] * 0.8 + 0.2) blue: (secondColorRGBA[2] * 0.8 + 0.2) alpha: (secondColorRGBA[3] * 0.8 + 0.2)];
    UIColor* thirdColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.2 + 0.8) green: (iconColorRGBA[1] * 0.2 + 0.8) blue: (iconColorRGBA[2] * 0.2 + 0.8) alpha: (iconColorRGBA[3] * 0.2 + 0.8)];
    CGFloat thirdColorRGBA[4];
    [thirdColor getRed: &thirdColorRGBA[0] green: &thirdColorRGBA[1] blue: &thirdColorRGBA[2] alpha: &thirdColorRGBA[3]];
    
    UIColor* thirdColor_h = [UIColor colorWithRed: (thirdColorRGBA[0] * 0.5 + 0.5) green: (thirdColorRGBA[1] * 0.5 + 0.5) blue: (thirdColorRGBA[2] * 0.5 + 0.5) alpha: (thirdColorRGBA[3] * 0.5 + 0.5)];
    UIColor* thirdColor_h2 = [UIColor colorWithRed: (thirdColorRGBA[0] * 0 + 1) green: (thirdColorRGBA[1] * 0 + 1) blue: (thirdColorRGBA[2] * 0 + 1) alpha: (thirdColorRGBA[3] * 0 + 1)];
    UIColor* iconColor_h2 = [UIColor colorWithRed: (iconColorRGBA[0] * 0.9 + 0.1) green: (iconColorRGBA[1] * 0.9 + 0.1) blue: (iconColorRGBA[2] * 0.9 + 0.1) alpha: (iconColorRGBA[3] * 0.9 + 0.1)];
    
    //// Gradient Declarations
    NSArray* thirdColor_gColors = [NSArray arrayWithObjects:
                                   (id)thirdColor_h2.CGColor,
                                   (id)thirdColor.CGColor,
                                   (id)thirdColor_h.CGColor, nil];
    CGFloat thirdColor_gLocations[] = {0, 0.51, 1};
    CGGradientRef thirdColor_g = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)thirdColor_gColors, thirdColor_gLocations);
    NSArray* secColor_gColors = [NSArray arrayWithObjects:
                                 (id)secColor_h.CGColor,
                                 (id)secondColor.CGColor,
                                 (id)secColor_h.CGColor, nil];
    CGFloat secColor_gLocations[] = {0, 0.49, 1};
    CGGradientRef secColor_g = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secColor_gColors, secColor_gLocations);
    
    //// Shadow Declarations
    UIColor* glow = iconColor_g;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Pencil
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 123.5)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 123.5)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 55.5)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.29, CGRectGetMinY(frame) + 51.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 53.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.34, CGRectGetMinY(frame) + 51.5)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29.71, CGRectGetMinY(frame) + 51.5)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 55.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.66, CGRectGetMinY(frame) + 51.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 53.29)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 123.5)];
        [roundedRectanglePath closePath];
        [iconColor setFill];
        [roundedRectanglePath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 52, 10, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [roundedRectangle2Path closePath];
        [iconColor_h2 setFill];
        [roundedRectangle2Path fill];
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 51, 10, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [roundedRectangle3Path closePath];
        [iconColor_h setFill];
        [roundedRectangle3Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 21)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 21)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 32, CGRectGetMinY(frame) + 5)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 21)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
        CGContextDrawLinearGradient(context, secColor_g,
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + -6.75 * CGRectGetWidth(bezier2Bounds) / 10, CGRectGetMidY(bezier2Bounds) + 0.37 * CGRectGetHeight(bezier2Bounds) / 16),
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + 7 * CGRectGetWidth(bezier2Bounds) / 10, CGRectGetMidY(bezier2Bounds) + 0.12 * CGRectGetHeight(bezier2Bounds) / 16),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.04, CGRectGetMinY(frame) + 21)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 21)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 54)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 43.55, CGRectGetMinY(frame) + 52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 54) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.48, CGRectGetMinY(frame) + 52)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.68, CGRectGetMinY(frame) + 52) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 54)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.82, CGRectGetMinY(frame) + 52.54)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.04, CGRectGetMinY(frame) + 51.09) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.1, CGRectGetMinY(frame) + 51.81) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.12, CGRectGetMinY(frame) + 51.09)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.96, CGRectGetMinY(frame) + 51.09)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 28.89, CGRectGetMinY(frame) + 51.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 54)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 54) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.93, CGRectGetMinY(frame) + 52)];
        [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.5, CGRectGetMinY(frame) + 54.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18.07, CGRectGetMinY(frame) + 52) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 16.5, CGRectGetMinY(frame) + 54.5)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 20.98)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.05, CGRectGetMinY(frame) + 20.91)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.04, CGRectGetMinY(frame) + 21)];
        [bezier7Path closePath];
        CGContextSaveGState(context);
        [bezier7Path addClip];
        CGRect bezier7Bounds = CGPathGetPathBoundingBox(bezier7Path.CGPath);
        CGContextDrawLinearGradient(context, thirdColor_g,
                                    CGPointMake(CGRectGetMidX(bezier7Bounds) + -15.92 * CGRectGetWidth(bezier7Bounds) / 31.5, CGRectGetMidY(bezier7Bounds) + -1.12 * CGRectGetHeight(bezier7Bounds) / 33.59),
                                    CGPointMake(CGRectGetMidX(bezier7Bounds) + 16.75 * CGRectGetWidth(bezier7Bounds) / 31.5, CGRectGetMidY(bezier7Bounds) + -1.29 * CGRectGetHeight(bezier7Bounds) / 33.59),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(thirdColor_g);
    CGGradientRelease(secColor_g);
    CGColorSpaceRelease(colorSpace);
    

}

- (void)drawPen{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.892 green: 0.773 blue: 0.363 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* secColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.5 + 0.5) green: (firColorRGBA[1] * 0.5 + 0.5) blue: (firColorRGBA[2] * 0.5 + 0.5) alpha: (firColorRGBA[3] * 0.5 + 0.5)];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.6 + 0.4) green: (secColorRGBA[1] * 0.6 + 0.4) blue: (secColorRGBA[2] * 0.6 + 0.4) alpha: (secColorRGBA[3] * 0.6 + 0.4)];
    UIColor* secColor_g = [UIColor colorWithRed: (secColorRGBA[0] * 0 + 1) green: (secColorRGBA[1] * 0 + 1) blue: (secColorRGBA[2] * 0 + 1) alpha: (secColorRGBA[3] * 0 + 1)];
    UIColor* thiColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.1) green: (firColorRGBA[1] * 0.1) blue: (firColorRGBA[2] * 0.1) alpha: (firColorRGBA[3] * 0.1 + 0.9)];
    CGFloat thiColorRGBA[4];
    [thiColor getRed: &thiColorRGBA[0] green: &thiColorRGBA[1] blue: &thiColorRGBA[2] alpha: &thiColorRGBA[3]];
    
    UIColor* tirdColor_h = [UIColor colorWithRed: (thiColorRGBA[0] * 0.6 + 0.4) green: (thiColorRGBA[1] * 0.6 + 0.4) blue: (thiColorRGBA[2] * 0.6 + 0.4) alpha: (thiColorRGBA[3] * 0.6 + 0.4)];
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.6 + 0.4) green: (firColorRGBA[1] * 0.6 + 0.4) blue: (firColorRGBA[2] * 0.6 + 0.4) alpha: (firColorRGBA[3] * 0.6 + 0.4)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    
    //// Gradient Declarations
    NSArray* firGradientColors = [NSArray arrayWithObjects:
                                  (id)firColor_h.CGColor,
                                  (id)[UIColor colorWithRed: 0.914 green: 0.818 blue: 0.491 alpha: 1].CGColor,
                                  (id)firColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.914 green: 0.818 blue: 0.491 alpha: 1].CGColor,
                                  (id)firColor_h.CGColor, nil];
    CGFloat firGradientLocations[] = {0, 0.05, 0.49, 0.96, 1};
    CGGradientRef firGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradientColors, firGradientLocations);
    NSArray* secGradientColors = [NSArray arrayWithObjects:
                                  (id)secColor_h.CGColor,
                                  (id)[UIColor colorWithRed: 0.957 green: 0.909 blue: 0.745 alpha: 1].CGColor,
                                  (id)secColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.957 green: 0.909 blue: 0.745 alpha: 1].CGColor,
                                  (id)secColor_h.CGColor, nil];
    CGFloat secGradientLocations[] = {0, 0.1, 0.49, 0.91, 1};
    CGGradientRef secGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secGradientColors, secGradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    UIColor* shadow2 = secColor_g;
    CGSize shadow2Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow2BlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 100);
    
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 4 Drawing
        UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPath];
        [roundedRectangle4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 71.5)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.62, CGRectGetMinY(frame) + 74) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 72.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.9, CGRectGetMinY(frame) + 74)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.62, CGRectGetMinY(frame) + 74)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.75, CGRectGetMinY(frame) + 71.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 74) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.75, CGRectGetMinY(frame) + 72.88)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 49.75, CGRectGetMinY(frame) + 71.5)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.62, CGRectGetMinY(frame) + 69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.75, CGRectGetMinY(frame) + 70.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 69)];
        [roundedRectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.62, CGRectGetMinY(frame) + 69)];
        [roundedRectangle4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 71.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.9, CGRectGetMinY(frame) + 69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 70.12)];
        [roundedRectangle4Path closePath];
        CGContextSaveGState(context);
        [roundedRectangle4Path addClip];
        CGRect roundedRectangle4Bounds = CGPathGetPathBoundingBox(roundedRectangle4Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangle4Bounds), CGRectGetMinY(roundedRectangle4Bounds)),
                                    CGPointMake(CGRectGetMidX(roundedRectangle4Bounds), CGRectGetMaxY(roundedRectangle4Bounds)),
                                    0);
        CGContextRestoreGState(context);
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPath];
        [roundedRectangle5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.68, CGRectGetMinY(frame) + 117.72)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.36, CGRectGetMinY(frame) + 119) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.68, CGRectGetMinY(frame) + 118.43) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 18.43, CGRectGetMinY(frame) + 119)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 49.17, CGRectGetMinY(frame) + 119)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.85, CGRectGetMinY(frame) + 117.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.1, CGRectGetMinY(frame) + 119) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.85, CGRectGetMinY(frame) + 118.43)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47.25, CGRectGetMinY(frame) + 75)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 74) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.25, CGRectGetMinY(frame) + 74.3) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.93, CGRectGetMinY(frame) + 74)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.25, CGRectGetMinY(frame) + 74)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.32, CGRectGetMinY(frame) + 74) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 74.3)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.68, CGRectGetMinY(frame) + 117.72)];
        [roundedRectangle5Path closePath];
        [thiColor setFill];
        [roundedRectangle5Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 81.72)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 81.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 82.43) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 82.43)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.25, CGRectGetMinY(frame) + 74) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.35, CGRectGetMinY(frame) + 81.72) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.18, CGRectGetMinY(frame) + 74)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 74)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 81.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.07, CGRectGetMinY(frame) + 74) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.18, CGRectGetMinY(frame) + 81.72)];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        [roundedRectanglePath addClip];
        CGRect roundedRectangleBounds = CGPathGetPathBoundingBox(roundedRectanglePath.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangleBounds) + -17.02 * CGRectGetWidth(roundedRectangleBounds) / 28.17, CGRectGetMidY(roundedRectangleBounds) + -7.27 * CGRectGetHeight(roundedRectangleBounds) / 8.25),
                                    CGPointMake(CGRectGetMidX(roundedRectangleBounds) + 17.36 * CGRectGetWidth(roundedRectangleBounds) / 28.17, CGRectGetMidY(roundedRectangleBounds) + -7.46 * CGRectGetHeight(roundedRectangleBounds) / 8.25),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 8 Drawing
        UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
        [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.8, CGRectGetMinY(frame) + 42.07)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.03, CGRectGetMinY(frame) + 43.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 32.15, CGRectGetMinY(frame) + 42.2) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.53, CGRectGetMinY(frame) + 42.52)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.03, CGRectGetMinY(frame) + 47.97) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.66, CGRectGetMinY(frame) + 44.39) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.66, CGRectGetMinY(frame) + 46.61)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.97, CGRectGetMinY(frame) + 47.97) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 32.39, CGRectGetMinY(frame) + 49.34) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.61, CGRectGetMinY(frame) + 49.34)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.97, CGRectGetMinY(frame) + 43.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.34, CGRectGetMinY(frame) + 46.61) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.34, CGRectGetMinY(frame) + 44.39)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34.2, CGRectGetMinY(frame) + 42.07) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 35.47, CGRectGetMinY(frame) + 42.52) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.85, CGRectGetMinY(frame) + 42.2)];
        [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 34.2, CGRectGetMinY(frame) + 4.6)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.88, CGRectGetMinY(frame) + 6.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.83, CGRectGetMinY(frame) + 4.92) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.43, CGRectGetMinY(frame) + 5.5)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.23, CGRectGetMinY(frame) + 23.27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.71, CGRectGetMinY(frame) + 10.98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.14, CGRectGetMinY(frame) + 18.4)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 37.55) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.83, CGRectGetMinY(frame) + 31.62) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 37.55)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.75, CGRectGetMinY(frame) + 55) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 37.55) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.69, CGRectGetMinY(frame) + 47.05)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.25, CGRectGetMinY(frame) + 69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.81, CGRectGetMinY(frame) + 62.95) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.25, CGRectGetMinY(frame) + 69)];
        [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 69)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.12, CGRectGetMinY(frame) + 54.63) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.22, CGRectGetMinY(frame) + 62.32)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 37.55) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.02, CGRectGetMinY(frame) + 46.94) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 37.55)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 23.27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 37.55) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.81, CGRectGetMinY(frame) + 32.73)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.12, CGRectGetMinY(frame) + 6.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.03, CGRectGetMinY(frame) + 17.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.77, CGRectGetMinY(frame) + 10.77)];
        [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.8, CGRectGetMinY(frame) + 4.47) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31.57, CGRectGetMinY(frame) + 5.2) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32.21, CGRectGetMinY(frame) + 4.65)];
        [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 32.8, CGRectGetMinY(frame) + 42.07)];
        [bezier8Path closePath];
        CGContextSaveGState(context);
        [bezier8Path addClip];
        CGRect bezier8Bounds = CGPathGetPathBoundingBox(bezier8Path.CGPath);
        CGContextDrawLinearGradient(context, secGradient,
                                    CGPointMake(CGRectGetMidX(bezier8Bounds) + 17.42 * CGRectGetWidth(bezier8Bounds) / 35, CGRectGetMidY(bezier8Bounds) + -0.05 * CGRectGetHeight(bezier8Bounds) / 64.53),
                                    CGPointMake(CGRectGetMidX(bezier8Bounds) + -16.25 * CGRectGetWidth(bezier8Bounds) / 35, CGRectGetMidY(bezier8Bounds) + -0.17 * CGRectGetHeight(bezier8Bounds) / 64.53),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        ////// Bezier 8 Inner Shadow
        CGRect bezier8BorderRect = CGRectInset([bezier8Path bounds], -shadow2BlurRadius, -shadow2BlurRadius);
        bezier8BorderRect = CGRectOffset(bezier8BorderRect, -shadow2Offset.width, -shadow2Offset.height);
        bezier8BorderRect = CGRectInset(CGRectUnion(bezier8BorderRect, [bezier8Path bounds]), -1, -1);
        
        UIBezierPath* bezier8NegativePath = [UIBezierPath bezierPathWithRect: bezier8BorderRect];
        [bezier8NegativePath appendPath: bezier8Path];
        bezier8NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadow2Offset.width + round(bezier8BorderRect.size.width);
            CGFloat yOffset = shadow2Offset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadow2BlurRadius,
                                        shadow2.CGColor);
            
            [bezier8Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier8BorderRect.size.width), 0);
            [bezier8NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezier8NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.88, CGRectGetMinY(frame) + 82)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.62, CGRectGetMinY(frame) + 82)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 126)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.75, CGRectGetMinY(frame) + 126)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.88, CGRectGetMinY(frame) + 82)];
        [bezierPath closePath];
        [tirdColor_h setFill];
        [bezierPath fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.12, CGRectGetMinY(frame) + 38.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20.29, CGRectGetMinY(frame) + 53.04)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.88, CGRectGetMinY(frame) + 68.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27.88, CGRectGetMinY(frame) + 68.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.75, CGRectGetMinY(frame) + 53) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.88, CGRectGetMinY(frame) + 68.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 62)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.88, CGRectGetMinY(frame) + 31.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 44) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.88, CGRectGetMinY(frame) + 31.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.12, CGRectGetMinY(frame) + 38.5)];
        [bezier3Path closePath];
        [secColor_h setFill];
        [bezier3Path fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.88, CGRectGetMinY(frame) + 39.5)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.71, CGRectGetMinY(frame) + 54.04)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 44.12, CGRectGetMinY(frame) + 68.5)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39.12, CGRectGetMinY(frame) + 68.5)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.25, CGRectGetMinY(frame) + 54) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.12, CGRectGetMinY(frame) + 68.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41, CGRectGetMinY(frame) + 63)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.12, CGRectGetMinY(frame) + 32.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.5, CGRectGetMinY(frame) + 45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.12, CGRectGetMinY(frame) + 32.5)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47.88, CGRectGetMinY(frame) + 39.5)];
        [bezier4Path closePath];
        [secColor_h setFill];
        [bezier4Path fill];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.38, CGRectGetMinY(frame) + 82)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.62, CGRectGetMinY(frame) + 82)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.25, CGRectGetMinY(frame) + 126)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48.5, CGRectGetMinY(frame) + 126)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.38, CGRectGetMinY(frame) + 82)];
        [bezier5Path closePath];
        [tirdColor_h setFill];
        [bezier5Path fill];
        
        
        //// Bezier 6 Drawing
        UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
        [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.75, CGRectGetMinY(frame) + 74)];
        [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41, CGRectGetMinY(frame) + 74)];
        [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.62, CGRectGetMinY(frame) + 82)];
        [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.38, CGRectGetMinY(frame) + 82)];
        [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 44.75, CGRectGetMinY(frame) + 74)];
        [bezier6Path closePath];
        [firColor_h setFill];
        [bezier6Path fill];
        
        
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 74)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27.25, CGRectGetMinY(frame) + 74)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.62, CGRectGetMinY(frame) + 82)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.88, CGRectGetMinY(frame) + 82)];
        [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 74)];
        [bezier7Path closePath];
        [firColor_h setFill];
        [bezier7Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(firGradient);
    CGGradientRelease(secGradient);
    CGColorSpaceRelease(colorSpace);
    

}

- (void)drawEraser{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.173 green: 0.304 blue: 0.522 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_s = [UIColor colorWithRed: (firColorRGBA[0] * 0.8) green: (firColorRGBA[1] * 0.8) blue: (firColorRGBA[2] * 0.8) alpha: (firColorRGBA[3] * 0.8 + 0.2)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    UIColor* secColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_s = [UIColor colorWithRed: (secColorRGBA[0] * 0.8) green: (secColorRGBA[1] * 0.8) blue: (secColorRGBA[2] * 0.8) alpha: (secColorRGBA[3] * 0.8 + 0.2)];
    CGFloat secColor_sRGBA[4];
    [secColor_s getRed: &secColor_sRGBA[0] green: &secColor_sRGBA[1] blue: &secColor_sRGBA[2] alpha: &secColor_sRGBA[3]];
    
    UIColor* secColor_s_o = [UIColor colorWithRed: (secColor_sRGBA[0] * 0.9) green: (secColor_sRGBA[1] * 0.9) blue: (secColor_sRGBA[2] * 0.9) alpha: (secColor_sRGBA[3] * 0.9 + 0.1)];
    UIColor* secColor_o = [UIColor colorWithRed: (secColorRGBA[0] * 0.9) green: (secColorRGBA[1] * 0.9) blue: (secColorRGBA[2] * 0.9) alpha: (secColorRGBA[3] * 0.9 + 0.1)];
    
    //// Gradient Declarations
    NSArray* secColor_gColors = [NSArray arrayWithObjects:
                                 (id)secColor.CGColor,
                                 (id)[UIColor colorWithRed: 0.95 green: 0.95 blue: 0.95 alpha: 1].CGColor,
                                 (id)secColor_o.CGColor, nil];
    CGFloat secColor_gLocations[] = {0.72, 0.86, 1};
    CGGradientRef secColor_g = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secColor_gColors, secColor_gLocations);
    NSArray* secColor_g_sColors = [NSArray arrayWithObjects:
                                   (id)secColor_s.CGColor,
                                   (id)[UIColor colorWithRed: 0.76 green: 0.76 blue: 0.76 alpha: 1].CGColor,
                                   (id)secColor_s_o.CGColor, nil];
    CGFloat secColor_g_sLocations[] = {0.75, 0.87, 1};
    CGGradientRef secColor_g_s = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secColor_g_sColors, secColor_g_sLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Eraser
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 6 Drawing
        UIBezierPath* roundedRectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 31, 34, 78) byRoundingCorners: UIRectCornerTopLeft cornerRadii: CGSizeMake(2, 2)];
        [roundedRectangle6Path closePath];
        [firColor setFill];
        [roundedRectangle6Path fill];
        
        
        //// Rounded Rectangle 7 Drawing
        UIBezierPath* roundedRectangle7Path = [UIBezierPath bezierPath];
        [roundedRectangle7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.41, CGRectGetMinY(frame) + 30.85)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 44.08, CGRectGetMinY(frame) + 30.85)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 44.08, CGRectGetMinY(frame) + 5.01)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27.21, CGRectGetMinY(frame) + 5.01)];
        [roundedRectangle7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.41, CGRectGetMinY(frame) + 17.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.59, CGRectGetMinY(frame) + 5.01) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.41, CGRectGetMinY(frame) + 10.79)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13.41, CGRectGetMinY(frame) + 30.85)];
        [roundedRectangle7Path closePath];
        CGContextSaveGState(context);
        [roundedRectangle7Path addClip];
        CGRect roundedRectangle7Bounds = CGPathGetPathBoundingBox(roundedRectangle7Path.CGPath);
        CGContextDrawLinearGradient(context, secColor_g,
                                    CGPointMake(CGRectGetMidX(roundedRectangle7Bounds) + 1.54 * CGRectGetWidth(roundedRectangle7Bounds) / 30.67, CGRectGetMidY(roundedRectangle7Bounds) + -12.79 * CGRectGetHeight(roundedRectangle7Bounds) / 25.85),
                                    CGPointMake(CGRectGetMidX(roundedRectangle7Bounds) + 1.37 * CGRectGetWidth(roundedRectangle7Bounds) / 30.67, CGRectGetMidY(roundedRectangle7Bounds) + 13.07 * CGRectGetHeight(roundedRectangle7Bounds) / 25.85),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Rounded Rectangle 8 Drawing
        UIBezierPath* roundedRectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 31, 11, 78)];
        [firColor_s setFill];
        [roundedRectangle8Path fill];
        
        
        //// Rounded Rectangle 9 Drawing
        CGRect roundedRectangle9Rect = CGRectMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 5, 11, 26);
        UIBezierPath* roundedRectangle9Path = [UIBezierPath bezierPathWithRoundedRect: roundedRectangle9Rect byRoundingCorners: UIRectCornerTopRight cornerRadii: CGSizeMake(5.5, 5.5)];
        [roundedRectangle9Path closePath];
        CGContextSaveGState(context);
        [roundedRectangle9Path addClip];
        CGContextDrawLinearGradient(context, secColor_g_s,
                                    CGPointMake(CGRectGetMidX(roundedRectangle9Rect) + 0 * CGRectGetWidth(roundedRectangle9Rect) / 11, CGRectGetMidY(roundedRectangle9Rect) + -13 * CGRectGetHeight(roundedRectangle9Rect) / 26),
                                    CGPointMake(CGRectGetMidX(roundedRectangle9Rect) + 0 * CGRectGetWidth(roundedRectangle9Rect) / 11, CGRectGetMidY(roundedRectangle9Rect) + 13 * CGRectGetHeight(roundedRectangle9Rect) / 26),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(secColor_g);
    CGGradientRelease(secColor_g_s);
    CGColorSpaceRelease(colorSpace);
    

}

- (void)drawMarker{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.886 green: 0.049 blue: 0.038 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    CGFloat firColorHSBA[4];
    [firColor getHue: &firColorHSBA[0] saturation: &firColorHSBA[1] brightness: &firColorHSBA[2] alpha: &firColorHSBA[3]];
    
    UIColor* secColor = [UIColor colorWithHue: firColorHSBA[0] saturation: 0 brightness: firColorHSBA[2] alpha: firColorHSBA[3]];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.6 + 0.4) green: (secColorRGBA[1] * 0.6 + 0.4) blue: (secColorRGBA[2] * 0.6 + 0.4) alpha: (secColorRGBA[3] * 0.6 + 0.4)];
    UIColor* secColor_h2 = [UIColor colorWithRed: (secColorRGBA[0] * 0.8 + 0.2) green: (secColorRGBA[1] * 0.8 + 0.2) blue: (secColorRGBA[2] * 0.8 + 0.2) alpha: (secColorRGBA[3] * 0.8 + 0.2)];
    UIColor* thirdColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.3) green: (firColorRGBA[1] * 0.3) blue: (firColorRGBA[2] * 0.3) alpha: (firColorRGBA[3] * 0.3 + 0.7)];
    CGFloat thirdColorRGBA[4];
    [thirdColor getRed: &thirdColorRGBA[0] green: &thirdColorRGBA[1] blue: &thirdColorRGBA[2] alpha: &thirdColorRGBA[3]];
    
    UIColor* thirdColor_h = [UIColor colorWithRed: (thirdColorRGBA[0] * 0.8 + 0.2) green: (thirdColorRGBA[1] * 0.8 + 0.2) blue: (thirdColorRGBA[2] * 0.8 + 0.2) alpha: (thirdColorRGBA[3] * 0.8 + 0.2)];
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.6 + 0.4) green: (firColorRGBA[1] * 0.6 + 0.4) blue: (firColorRGBA[2] * 0.6 + 0.4) alpha: (firColorRGBA[3] * 0.6 + 0.4)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.2];
    UIColor* firColor_s = [UIColor colorWithRed: (firColorRGBA[0] * 0.9) green: (firColorRGBA[1] * 0.9) blue: (firColorRGBA[2] * 0.9) alpha: (firColorRGBA[3] * 0.9 + 0.1)];
    UIColor* firColor_h2 = [UIColor colorWithRed: (firColorRGBA[0] * 0.8 + 0.2) green: (firColorRGBA[1] * 0.8 + 0.2) blue: (firColorRGBA[2] * 0.8 + 0.2) alpha: (firColorRGBA[3] * 0.8 + 0.2)];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)firColor_s.CGColor,
                               (id)[UIColor colorWithRed: 0.842 green: 0.046 blue: 0.036 alpha: 1].CGColor,
                               (id)firColor.CGColor,
                               (id)[UIColor colorWithRed: 0.886 green: 0.049 blue: 0.038 alpha: 1].CGColor,
                               (id)firColor.CGColor,
                               (id)[UIColor colorWithRed: 0.842 green: 0.046 blue: 0.036 alpha: 1].CGColor,
                               (id)firColor_s.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.08, 0.38, 0.5, 0.64, 0.92, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Marker
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.86, CGRectGetMinY(frame) + 4.99)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 38.76, CGRectGetMinY(frame) + 11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.89, CGRectGetMinY(frame) + 4.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.6, CGRectGetMinY(frame) + 7.67)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41, CGRectGetMinY(frame) + 27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 40.88, CGRectGetMinY(frame) + 14.27) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41, CGRectGetMinY(frame) + 22.46)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 27)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.24, CGRectGetMinY(frame) + 11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 22.46) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25.15, CGRectGetMinY(frame) + 14.42)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.86, CGRectGetMinY(frame) + 4.99) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.29, CGRectGetMinY(frame) + 7.66) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30.91, CGRectGetMinY(frame) + 4.99)];
        [bezierPath closePath];
        [thirdColor setFill];
        [bezierPath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
        [roundedRectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 20, CGRectGetMinY(frame) + 46)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15, CGRectGetMinY(frame) + 68)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 68)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 46)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.04, CGRectGetMinY(frame) + 29.66)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.78, CGRectGetMinY(frame) + 26.78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.04, CGRectGetMinY(frame) + 28.07) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.58, CGRectGetMinY(frame) + 26.78)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23.22, CGRectGetMinY(frame) + 26.78)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.96, CGRectGetMinY(frame) + 29.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.42, CGRectGetMinY(frame) + 26.78) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.96, CGRectGetMinY(frame) + 28.07)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20, CGRectGetMinY(frame) + 46)];
        [roundedRectangle2Path closePath];
        CGContextSaveGState(context);
        [roundedRectangle2Path addClip];
        CGRect roundedRectangle2Bounds = CGPathGetPathBoundingBox(roundedRectangle2Path.CGPath);
        CGContextDrawLinearGradient(context, gradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangle2Bounds) + 15.57 * CGRectGetWidth(roundedRectangle2Bounds) / 36, CGRectGetMidY(roundedRectangle2Bounds) + -2.67 * CGRectGetHeight(roundedRectangle2Bounds) / 41.22),
                                    CGPointMake(CGRectGetMidX(roundedRectangle2Bounds) + -15.56 * CGRectGetWidth(roundedRectangle2Bounds) / 36, CGRectGetMidY(roundedRectangle2Bounds) + -2.77 * CGRectGetHeight(roundedRectangle2Bounds) / 41.22),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.44, CGRectGetMinY(frame) + 99.96)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 52, CGRectGetMinY(frame) + 100)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 51.93, CGRectGetMinY(frame) + 67.57)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 14, CGRectGetMinY(frame) + 68)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13.44, CGRectGetMinY(frame) + 99.96)];
        [roundedRectanglePath closePath];
        [secColor setFill];
        [roundedRectanglePath fill];
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
        [rectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 15, CGRectGetMinY(frame) + 102)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 102)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 68)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15, CGRectGetMinY(frame) + 68)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15, CGRectGetMinY(frame) + 102)];
        [rectanglePath closePath];
        [secColor_h setFill];
        [rectanglePath fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.11, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 28.05)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 48)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 68)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 68)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 48)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.11, CGRectGetMinY(frame) + 27)];
        [bezier2Path closePath];
        [firColor_h setFill];
        [bezier2Path fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.49, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 28.13)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 48)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 68)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 68)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 48)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 44.49, CGRectGetMinY(frame) + 27)];
        [bezier3Path closePath];
        [firColor_h2 setFill];
        [bezier3Path fill];
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 102)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 102)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 51, CGRectGetMinY(frame) + 68)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 68)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 102)];
        [rectangle2Path closePath];
        [secColor_h2 setFill];
        [rectangle2Path fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 32, CGRectGetMinY(frame) + 5)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 32, CGRectGetMinY(frame) + 5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32.89, CGRectGetMinY(frame) + 8.24)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.11, CGRectGetMinY(frame) + 15.76) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 18)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 10) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25.45, CGRectGetMinY(frame) + 14.04)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32, CGRectGetMinY(frame) + 5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.55, CGRectGetMinY(frame) + 5.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32, CGRectGetMinY(frame) + 5)];
        [bezier4Path closePath];
        [thirdColor_h setFill];
        [bezier4Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}

- (void)drawFinger{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.97 green: 0.752 blue: 0.542 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    CGFloat firColorHSBA[4];
    [firColor getHue: &firColorHSBA[0] saturation: &firColorHSBA[1] brightness: &firColorHSBA[2] alpha: &firColorHSBA[3]];
    
    UIColor* skinColor = [UIColor colorWithHue: 0 saturation: firColorHSBA[1] brightness: firColorHSBA[2] alpha: firColorHSBA[3]];
    CGFloat skinColorRGBA[4];
    [skinColor getRed: &skinColorRGBA[0] green: &skinColorRGBA[1] blue: &skinColorRGBA[2] alpha: &skinColorRGBA[3]];
    
    UIColor* skinColor2 = [UIColor colorWithRed: (skinColorRGBA[0] * 0.6 + 0.4) green: (skinColorRGBA[1] * 0.6 + 0.4) blue: (skinColorRGBA[2] * 0.6 + 0.4) alpha: (skinColorRGBA[3] * 0.6 + 0.4)];
    UIColor* secColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.5 + 0.5) green: (firColorRGBA[1] * 0.5 + 0.5) blue: (firColorRGBA[2] * 0.5 + 0.5) alpha: (firColorRGBA[3] * 0.5 + 0.5)];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.5 + 0.5) green: (secColorRGBA[1] * 0.5 + 0.5) blue: (secColorRGBA[2] * 0.5 + 0.5) alpha: (secColorRGBA[3] * 0.5 + 0.5)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    UIColor* skinColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.6 + 0.4) green: (firColorRGBA[1] * 0.6 + 0.4) blue: (firColorRGBA[2] * 0.6 + 0.4) alpha: (firColorRGBA[3] * 0.6 + 0.4)];
    
    //// Gradient Declarations
    NSArray* firGradientColors = [NSArray arrayWithObjects:
                                  (id)skinColor.CGColor,
                                  (id)firColor.CGColor, nil];
    CGFloat firGradientLocations[] = {0, 1};
    CGGradientRef firGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradientColors, firGradientLocations);
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)secColor_h.CGColor,
                               (id)[UIColor colorWithRed: 0.987 green: 0.831 blue: 0.805 alpha: 1].CGColor,
                               (id)skinColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.51, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    UIColor* skin = skinColor_h;
    CGSize skinOffset = CGSizeMake(-12.1, -0.1);
    CGFloat skinBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Finger
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.77, CGRectGetMinY(frame) + 6.64)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.22, CGRectGetMinY(frame) + 10.18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 40.77, CGRectGetMinY(frame) + 6.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.13, CGRectGetMinY(frame) + 7.32)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.17, CGRectGetMinY(frame) + 18.18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.83, CGRectGetMinY(frame) + 11.78) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.17, CGRectGetMinY(frame) + 16.3)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50, CGRectGetMinY(frame) + 39)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 35)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 38, CGRectGetMinY(frame) + 22) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.77, CGRectGetMinY(frame) + 35) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 38, CGRectGetMinY(frame) + 24.74)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38, CGRectGetMinY(frame) + 22) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 38.31, CGRectGetMinY(frame) + 15.59)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.77, CGRectGetMinY(frame) + 6.64) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.69, CGRectGetMinY(frame) + 8.41) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.77, CGRectGetMinY(frame) + 6.64)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        [bezierPath addClip];
        CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
        CGContextDrawLinearGradient(context, gradient,
                                    CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                    CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                    0);
        CGContextRestoreGState(context);
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.71, CGRectGetMinY(frame) + 5.68)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.8, CGRectGetMinY(frame) + 6.63) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.54, CGRectGetMinY(frame) + 5.69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39.24, CGRectGetMinY(frame) + 6.02)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.21, CGRectGetMinY(frame) + 10.49) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.81, CGRectGetMinY(frame) + 7.62) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39.95, CGRectGetMinY(frame) + 7.13)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.83, CGRectGetMinY(frame) + 20.08) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38.46, CGRectGetMinY(frame) + 13.85) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.83, CGRectGetMinY(frame) + 15.28)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.97, CGRectGetMinY(frame) + 34.18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.83, CGRectGetMinY(frame) + 24.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39.38, CGRectGetMinY(frame) + 31.78)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.55, CGRectGetMinY(frame) + 39.29) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.55, CGRectGetMinY(frame) + 36.58) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.55, CGRectGetMinY(frame) + 39.29)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.93, CGRectGetMinY(frame) + 57.08)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.55, CGRectGetMinY(frame) + 62.63) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.93, CGRectGetMinY(frame) + 57.08) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.35, CGRectGetMinY(frame) + 54.32)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.92, CGRectGetMinY(frame) + 66.76) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.23, CGRectGetMinY(frame) + 64.13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49.03, CGRectGetMinY(frame) + 65.49)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.59, CGRectGetMinY(frame) + 63.99) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.71, CGRectGetMinY(frame) + 65.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.78, CGRectGetMinY(frame) + 65.95)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.93, CGRectGetMinY(frame) + 55.76) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 33.77, CGRectGetMinY(frame) + 59.81) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30.93, CGRectGetMinY(frame) + 55.76)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.59, CGRectGetMinY(frame) + 66.73) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.93, CGRectGetMinY(frame) + 55.76) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 33.48, CGRectGetMinY(frame) + 61.22)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.95, CGRectGetMinY(frame) + 70.61) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.88, CGRectGetMinY(frame) + 69.28) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.78, CGRectGetMinY(frame) + 69.57)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.64, CGRectGetMinY(frame) + 83.47) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49.28, CGRectGetMinY(frame) + 74.07) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.11, CGRectGetMinY(frame) + 78.78)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50.93, CGRectGetMinY(frame) + 97.75) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.6, CGRectGetMinY(frame) + 91.95) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.17, CGRectGetMinY(frame) + 92.5)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.31, CGRectGetMinY(frame) + 111.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.69, CGRectGetMinY(frame) + 102.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.31, CGRectGetMinY(frame) + 111.31)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.07, CGRectGetMinY(frame) + 111.31)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13.13, CGRectGetMinY(frame) + 103.11)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.69, CGRectGetMinY(frame) + 84.3) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.13, CGRectGetMinY(frame) + 103.11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.86, CGRectGetMinY(frame) + 94.63)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.45, CGRectGetMinY(frame) + 61.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.52, CGRectGetMinY(frame) + 73.98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 16.45, CGRectGetMinY(frame) + 61.8)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13.69, CGRectGetMinY(frame) + 56.42)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.07, CGRectGetMinY(frame) + 36.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.69, CGRectGetMinY(frame) + 56.42) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.69, CGRectGetMinY(frame) + 46.03)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.21, CGRectGetMinY(frame) + 19.4) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 16.45, CGRectGetMinY(frame) + 27.52) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.21, CGRectGetMinY(frame) + 19.4)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.48, CGRectGetMinY(frame) + 8.43) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.87, CGRectGetMinY(frame) + 11.63) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.34, CGRectGetMinY(frame) + 11.86)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.76, CGRectGetMinY(frame) + 5.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31.62, CGRectGetMinY(frame) + 5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.76, CGRectGetMinY(frame) + 5.69)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 35.71, CGRectGetMinY(frame) + 5.68)];
        [bezier4Path closePath];
        CGContextSaveGState(context);
        [bezier4Path addClip];
        CGRect bezier4Bounds = CGPathGetPathBoundingBox(bezier4Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(bezier4Bounds) + -34.96 * CGRectGetWidth(bezier4Bounds) / 39.22, CGRectGetMidY(bezier4Bounds) + -8.22 * CGRectGetHeight(bezier4Bounds) / 105.68),
                                    CGPointMake(CGRectGetMidX(bezier4Bounds) + 4.99 * CGRectGetWidth(bezier4Bounds) / 39.22, CGRectGetMidY(bezier4Bounds) + -1.47 * CGRectGetHeight(bezier4Bounds) / 105.68),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        ////// Bezier 4 Inner Shadow
        CGRect bezier4BorderRect = CGRectInset([bezier4Path bounds], -skinBlurRadius, -skinBlurRadius);
        bezier4BorderRect = CGRectOffset(bezier4BorderRect, -skinOffset.width, -skinOffset.height);
        bezier4BorderRect = CGRectInset(CGRectUnion(bezier4BorderRect, [bezier4Path bounds]), -1, -1);
        
        UIBezierPath* bezier4NegativePath = [UIBezierPath bezierPathWithRect: bezier4BorderRect];
        [bezier4NegativePath appendPath: bezier4Path];
        bezier4NegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = skinOffset.width + round(bezier4BorderRect.size.width);
            CGFloat yOffset = skinOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        skinBlurRadius,
                                        skin.CGColor);
            
            [bezier4Path addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier4BorderRect.size.width), 0);
            [bezier4NegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezier4NegativePath fill];
        }
        CGContextRestoreGState(context);
        
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(firGradient);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
 
}

- (void)drawChineseBrush{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.96 green: 0.92 blue: 0.876 alpha: 1];
    CGFloat firColorHSBA[4];
    [firColor getHue: &firColorHSBA[0] saturation: &firColorHSBA[1] brightness: &firColorHSBA[2] alpha: &firColorHSBA[3]];
    
    UIColor* secColor = [UIColor colorWithHue: firColorHSBA[0] saturation: firColorHSBA[1] brightness: 0.7 alpha: firColorHSBA[3]];
    UIColor* fourColor = [UIColor colorWithRed: 0.045 green: 0.045 blue: 0.045 alpha: 1];
    CGFloat fourColorRGBA[4];
    [fourColor getRed: &fourColorRGBA[0] green: &fourColorRGBA[1] blue: &fourColorRGBA[2] alpha: &fourColorRGBA[3]];
    
    UIColor* thiColor = [UIColor colorWithRed: (fourColorRGBA[0] * 0.1) green: (fourColorRGBA[1] * 0.1) blue: (fourColorRGBA[2] * 0.1) alpha: (fourColorRGBA[3] * 0.1 + 0.9)];
    UIColor* fourColor_h = [UIColor colorWithRed: (fourColorRGBA[0] * 0.7 + 0.3) green: (fourColorRGBA[1] * 0.7 + 0.3) blue: (fourColorRGBA[2] * 0.7 + 0.3) alpha: (fourColorRGBA[3] * 0.7 + 0.3)];
    UIColor* fourColor_g = [fourColor colorWithAlphaComponent: 0.5];
    
    //// Gradient Declarations
    NSArray* firGradientColors = [NSArray arrayWithObjects:
                                  (id)firColor.CGColor,
                                  (id)secColor.CGColor,
                                  (id)thiColor.CGColor, nil];
    CGFloat firGradientLocations[] = {0.27, 0.63, 0.9};
    CGGradientRef firGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradientColors, firGradientLocations);
    NSArray* fourColorGradientColors = [NSArray arrayWithObjects:
                                        (id)fourColor.CGColor,
                                        (id)fourColor_h.CGColor, nil];
    CGFloat fourColorGradientLocations[] = {0, 1};
    CGGradientRef fourColorGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)fourColorGradientColors, fourColorGradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow2 = fourColor_g;
    CGSize shadow2Offset = CGSizeMake(0.1, 5.1);
    CGFloat shadow2BlurRadius = 10;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 100);
    
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 29.16, CGRectGetMinY(frame) + 66.24)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.45, CGRectGetMinY(frame) + 40.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.16, CGRectGetMinY(frame) + 66.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.89, CGRectGetMinY(frame) + 50.71)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.74, CGRectGetMinY(frame) + 18.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.01, CGRectGetMinY(frame) + 30.91) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.74, CGRectGetMinY(frame) + 28.37)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 35.74, CGRectGetMinY(frame) + 9.02) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 18.69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32.51, CGRectGetMinY(frame) + 10.61)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.87, CGRectGetMinY(frame) + 38.6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.31, CGRectGetMinY(frame) + 26.07) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.16, CGRectGetMinY(frame) + 32.79)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 66.24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.06, CGRectGetMinY(frame) + 50.76) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 66.24)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29.16, CGRectGetMinY(frame) + 66.24)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + -4.28 * CGRectGetWidth(bezier2Bounds) / 12.34, CGRectGetMidY(bezier2Bounds) + 31.56 * CGRectGetHeight(bezier2Bounds) / 64.13),
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + 2.87 * CGRectGetWidth(bezier2Bounds) / 12.34, CGRectGetMidY(bezier2Bounds) + -17.63 * CGRectGetHeight(bezier2Bounds) / 64.13),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 36.84, CGRectGetMinY(frame) + 66.24)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.87, CGRectGetMinY(frame) + 50.21) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.84, CGRectGetMinY(frame) + 66.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40, CGRectGetMinY(frame) + 62.86)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.77, CGRectGetMinY(frame) + 24.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.74, CGRectGetMinY(frame) + 37.55) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.77, CGRectGetMinY(frame) + 24.77)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 2.66)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34.65, CGRectGetMinY(frame) + 26.43) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 2.66) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.23, CGRectGetMinY(frame) + 16.93)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.26, CGRectGetMinY(frame) + 44.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 33.68, CGRectGetMinY(frame) + 32.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.54, CGRectGetMinY(frame) + 39.26)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 29.16, CGRectGetMinY(frame) + 66.24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 26.89, CGRectGetMinY(frame) + 56.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.16, CGRectGetMinY(frame) + 66.24)];
        [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 36.84, CGRectGetMinY(frame) + 66.24)];
        [bezier4Path closePath];
        CGContextSaveGState(context);
        [bezier4Path addClip];
        CGRect bezier4Bounds = CGPathGetPathBoundingBox(bezier4Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(bezier4Bounds) + 5.3 * CGRectGetWidth(bezier4Bounds) / 15.5, CGRectGetMidY(bezier4Bounds) + 36.28 * CGRectGetHeight(bezier4Bounds) / 63.58),
                                    CGPointMake(CGRectGetMidX(bezier4Bounds) + 16.27 * CGRectGetWidth(bezier4Bounds) / 15.5, CGRectGetMidY(bezier4Bounds) + -8.25 * CGRectGetHeight(bezier4Bounds) / 63.58),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.32, CGRectGetMinY(frame) + 66.24)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.9, CGRectGetMinY(frame) + 48.55) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.32, CGRectGetMinY(frame) + 66.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.53, CGRectGetMinY(frame) + 60.05)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.23, CGRectGetMinY(frame) + 23.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.28, CGRectGetMinY(frame) + 37.04) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.23, CGRectGetMinY(frame) + 23.12)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.32, CGRectGetMinY(frame) + 48.55) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.23, CGRectGetMinY(frame) + 23.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.63, CGRectGetMinY(frame) + 40.02)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.74, CGRectGetMinY(frame) + 66.24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.01, CGRectGetMinY(frame) + 57.07) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.74, CGRectGetMinY(frame) + 66.24)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.32, CGRectGetMinY(frame) + 66.24)];
        [bezier5Path closePath];
        CGContextSaveGState(context);
        [bezier5Path addClip];
        CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(bezier5Bounds) + 6.37 * CGRectGetWidth(bezier5Bounds) / 13.3, CGRectGetMidY(bezier5Bounds) + 23.67 * CGRectGetHeight(bezier5Bounds) / 43.12),
                                    CGPointMake(CGRectGetMidX(bezier5Bounds) + -2.48 * CGRectGetWidth(bezier5Bounds) / 13.3, CGRectGetMidY(bezier5Bounds) + -22.11 * CGRectGetHeight(bezier5Bounds) / 43.12),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 6 Drawing
        UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
        [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.68, CGRectGetMinY(frame) + 23.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.47, CGRectGetMinY(frame) + 14.86)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.25, CGRectGetMinY(frame) + 45.29) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.88, CGRectGetMinY(frame) + 31.37) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 16.64, CGRectGetMinY(frame) + 34.64)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 66.24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.87, CGRectGetMinY(frame) + 55.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 66.24)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 46.34) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 24.77, CGRectGetMinY(frame) + 66.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.78, CGRectGetMinY(frame) + 56.74)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 23.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.77, CGRectGetMinY(frame) + 35.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.97, CGRectGetMinY(frame) + 37.97)];
        [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.74, CGRectGetMinY(frame) + 8.26) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.35, CGRectGetMinY(frame) + 2.11)];
        [bezier6Path closePath];
        CGContextSaveGState(context);
        [bezier6Path addClip];
        CGRect bezier6Bounds = CGPathGetPathBoundingBox(bezier6Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(bezier6Bounds) + -5.07 * CGRectGetWidth(bezier6Bounds) / 16.62, CGRectGetMidY(bezier6Bounds) + 31.09 * CGRectGetHeight(bezier6Bounds) / 64.13),
                                    CGPointMake(CGRectGetMidX(bezier6Bounds) + 17.84 * CGRectGetWidth(bezier6Bounds) / 16.62, CGRectGetMidY(bezier6Bounds) + -22.18 * CGRectGetHeight(bezier6Bounds) / 64.13),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPath];
        [roundedRectangle5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.84, CGRectGetMinY(frame) + 67.84)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.3, CGRectGetMinY(frame) + 81.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.84, CGRectGetMinY(frame) + 67.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.73, CGRectGetMinY(frame) + 71.79)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.48, CGRectGetMinY(frame) + 108.4) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18.87, CGRectGetMinY(frame) + 92.07) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.48, CGRectGetMinY(frame) + 101.66)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 43.06, CGRectGetMinY(frame) + 108.49) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.48, CGRectGetMinY(frame) + 115.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.06, CGRectGetMinY(frame) + 115.02)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.61, CGRectGetMinY(frame) + 81.93) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.06, CGRectGetMinY(frame) + 101.95) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.36, CGRectGetMinY(frame) + 92.09)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.39, CGRectGetMinY(frame) + 67.84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.86, CGRectGetMinY(frame) + 71.77) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.39, CGRectGetMinY(frame) + 67.84)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.18, CGRectGetMinY(frame) + 66.52)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.37, CGRectGetMinY(frame) + 64.64) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.18, CGRectGetMinY(frame) + 65.48) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.37, CGRectGetMinY(frame) + 64.64)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20.85, CGRectGetMinY(frame) + 64.64)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.04, CGRectGetMinY(frame) + 66.52) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.85, CGRectGetMinY(frame) + 64.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.04, CGRectGetMinY(frame) + 65.48)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.84, CGRectGetMinY(frame) + 67.84)];
        [roundedRectangle5Path closePath];
        CGContextSaveGState(context);
        [roundedRectangle5Path addClip];
        CGRect roundedRectangle5Bounds = CGPathGetPathBoundingBox(roundedRectangle5Path.CGPath);
        CGContextDrawLinearGradient(context, fourColorGradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangle5Bounds) + 32.56 * CGRectGetWidth(roundedRectangle5Bounds) / 28.44, CGRectGetMidY(roundedRectangle5Bounds) + 15.46 * CGRectGetHeight(roundedRectangle5Bounds) / 48.79),
                                    CGPointMake(CGRectGetMidX(roundedRectangle5Bounds) + -19.88 * CGRectGetWidth(roundedRectangle5Bounds) / 28.44, CGRectGetMidY(roundedRectangle5Bounds) + -17.86 * CGRectGetHeight(roundedRectangle5Bounds) / 48.79),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(firGradient);
    CGGradientRelease(fourColorGradient);
    CGColorSpaceRelease(colorSpace);
    
}

- (void)drawCrayons{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.617 green: 0.219 blue: 0.486 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.7 + 0.3) green: (firColorRGBA[1] * 0.7 + 0.3) blue: (firColorRGBA[2] * 0.7 + 0.3) alpha: (firColorRGBA[3] * 0.7 + 0.3)];
    UIColor* firColor_s = [UIColor colorWithRed: (firColorRGBA[0] * 0.8) green: (firColorRGBA[1] * 0.8) blue: (firColorRGBA[2] * 0.8) alpha: (firColorRGBA[3] * 0.8 + 0.2)];
    UIColor* secColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.6 + 0.4) green: (firColorRGBA[1] * 0.6 + 0.4) blue: (firColorRGBA[2] * 0.6 + 0.4) alpha: (firColorRGBA[3] * 0.6 + 0.4)];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_s = [UIColor colorWithRed: (secColorRGBA[0] * 0.9) green: (secColorRGBA[1] * 0.9) blue: (secColorRGBA[2] * 0.9) alpha: (secColorRGBA[3] * 0.9 + 0.1)];
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.8 + 0.2) green: (secColorRGBA[1] * 0.8 + 0.2) blue: (secColorRGBA[2] * 0.8 + 0.2) alpha: (secColorRGBA[3] * 0.8 + 0.2)];
    UIColor* secColor_h2 = [UIColor colorWithRed: (secColorRGBA[0] * 0.9 + 0.1) green: (secColorRGBA[1] * 0.9 + 0.1) blue: (secColorRGBA[2] * 0.9 + 0.1) alpha: (secColorRGBA[3] * 0.9 + 0.1)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    UIColor* firColor_h2 = [UIColor colorWithRed: (firColorRGBA[0] * 0.9 + 0.1) green: (firColorRGBA[1] * 0.9 + 0.1) blue: (firColorRGBA[2] * 0.9 + 0.1) alpha: (firColorRGBA[3] * 0.9 + 0.1)];
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.778];
    
    //// Gradient Declarations
    NSArray* firGradientColors = [NSArray arrayWithObjects:
                                  (id)firColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.555 green: 0.197 blue: 0.437 alpha: 1].CGColor,
                                  (id)firColor_s.CGColor,
                                  (id)[UIColor colorWithRed: 0.555 green: 0.197 blue: 0.437 alpha: 1].CGColor,
                                  (id)firColor.CGColor, nil];
    CGFloat firGradientLocations[] = {0, 0.08, 0.51, 0.93, 1};
    CGGradientRef firGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradientColors, firGradientLocations);
    NSArray* secGradientColors = [NSArray arrayWithObjects:
                                  (id)secColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.781 green: 0.555 blue: 0.707 alpha: 1].CGColor,
                                  (id)secColor_h2.CGColor,
                                  (id)[UIColor colorWithRed: 0.743 green: 0.528 blue: 0.672 alpha: 1].CGColor,
                                  (id)secColor_s.CGColor,
                                  (id)secColor_s.CGColor,
                                  (id)secColor_h.CGColor,
                                  (id)secColor.CGColor, nil];
    CGFloat secGradientLocations[] = {0, 0.07, 0.15, 0.3, 0.47, 0.6, 0.9, 1};
    CGGradientRef secGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secGradientColors, secGradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    
    //// MarkerSquare
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            //// Rectangle 2 Drawing
            UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
            [rectangle2Path moveToPoint: CGPointMake(27.52, 6.22)];
            [rectangle2Path addLineToPoint: CGPointMake(17.99, 50)];
            [rectangle2Path addLineToPoint: CGPointMake(50, 50)];
            [rectangle2Path addLineToPoint: CGPointMake(39.53, 6.22)];
            [rectangle2Path addCurveToPoint: CGPointMake(37.1, 4) controlPoint1: CGPointMake(39.53, 6.22) controlPoint2: CGPointMake(39.49, 4.56)];
            [rectangle2Path addCurveToPoint: CGPointMake(29.94, 4) controlPoint1: CGPointMake(34.7, 3.44) controlPoint2: CGPointMake(32.34, 3.45)];
            [rectangle2Path addCurveToPoint: CGPointMake(27.52, 6.22) controlPoint1: CGPointMake(27.55, 4.55) controlPoint2: CGPointMake(27.52, 6.22)];
            [rectangle2Path closePath];
            CGContextSaveGState(context);
            [rectangle2Path addClip];
            CGContextDrawLinearGradient(context, firGradient,
                                        CGPointMake(46.63, 24.97),
                                        CGPointMake(20.83, 25.51),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// Rounded Rectangle Drawing
            UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
            [roundedRectanglePath moveToPoint: CGPointMake(15, 55)];
            [roundedRectanglePath addLineToPoint: CGPointMake(53, 55)];
            [roundedRectanglePath addLineToPoint: CGPointMake(53, 52.5)];
            [roundedRectanglePath addCurveToPoint: CGPointMake(50.5, 50) controlPoint1: CGPointMake(53, 51.12) controlPoint2: CGPointMake(51.88, 50)];
            [roundedRectanglePath addLineToPoint: CGPointMake(17.5, 50)];
            [roundedRectanglePath addCurveToPoint: CGPointMake(15, 52.5) controlPoint1: CGPointMake(16.12, 50) controlPoint2: CGPointMake(15, 51.12)];
            [roundedRectanglePath addLineToPoint: CGPointMake(15, 55)];
            [roundedRectanglePath closePath];
            CGContextSaveGState(context);
            [roundedRectanglePath addClip];
            CGContextDrawLinearGradient(context, firGradient, CGPointMake(34, 50), CGPointMake(34, 55), 0);
            CGContextRestoreGState(context);
            
            
            //// Rectangle Drawing
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(15, 55, 38, 45)];
            CGContextSaveGState(context);
            [rectanglePath addClip];
            CGContextDrawLinearGradient(context, secGradient,
                                        CGPointMake(53, 77.5),
                                        CGPointMake(15, 77.5),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// Rectangle 3 Drawing
            UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(15, 60, 38, 5)];
            [strokeColor setFill];
            [rectangle3Path fill];
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(33, 5)];
            [bezierPath addCurveToPoint: CGPointMake(28.5, 5.5) controlPoint1: CGPointMake(33, 5) controlPoint2: CGPointMake(29.12, 2.98)];
            [bezierPath addCurveToPoint: CGPointMake(19, 50) controlPoint1: CGPointMake(27.88, 8.02) controlPoint2: CGPointMake(19, 50)];
            [bezierPath addCurveToPoint: CGPointMake(21, 47) controlPoint1: CGPointMake(19, 50) controlPoint2: CGPointMake(19.32, 52.53)];
            [bezierPath addCurveToPoint: CGPointMake(30, 5) controlPoint1: CGPointMake(22.68, 41.47) controlPoint2: CGPointMake(30, 5)];
            [bezierPath addLineToPoint: CGPointMake(33, 5)];
            [bezierPath closePath];
            [firColor_h setFill];
            [bezierPath fill];
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(39, 5)];
            [bezier2Path addLineToPoint: CGPointMake(49, 50)];
            [bezier2Path addCurveToPoint: CGPointMake(47, 48) controlPoint1: CGPointMake(49, 50) controlPoint2: CGPointMake(47.56, 50.41)];
            [bezier2Path addCurveToPoint: CGPointMake(37, 4) controlPoint1: CGPointMake(46.44, 45.59) controlPoint2: CGPointMake(37, 4)];
            [bezier2Path addLineToPoint: CGPointMake(39, 5)];
            [bezier2Path closePath];
            [firColor_h2 setFill];
            [bezier2Path fill];
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(firGradient);
    CGGradientRelease(secGradient);
    CGColorSpaceRelease(colorSpace);
    

}

- (void)drawEraserSoft{
    [self drawEraser];
}

- (void)drawInkPen{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.396 green: 0.216 blue: 0.711 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.6 + 0.4) green: (firColorRGBA[1] * 0.6 + 0.4) blue: (firColorRGBA[2] * 0.6 + 0.4) alpha: (firColorRGBA[3] * 0.6 + 0.4)];
    UIColor* firColor_s = [UIColor colorWithRed: (firColorRGBA[0] * 1) green: (firColorRGBA[1] * 1) blue: (firColorRGBA[2] * 1) alpha: (firColorRGBA[3] * 1 + 0)];
    UIColor* secColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.6 + 0.4) green: (firColorRGBA[1] * 0.6 + 0.4) blue: (firColorRGBA[2] * 0.6 + 0.4) alpha: (firColorRGBA[3] * 0.6 + 0.4)];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.6 + 0.4) green: (secColorRGBA[1] * 0.6 + 0.4) blue: (secColorRGBA[2] * 0.6 + 0.4) alpha: (secColorRGBA[3] * 0.6 + 0.4)];
    UIColor* secColor_s = [UIColor colorWithRed: (secColorRGBA[0] * 0.9) green: (secColorRGBA[1] * 0.9) blue: (secColorRGBA[2] * 0.9) alpha: (secColorRGBA[3] * 0.9 + 0.1)];
    UIColor* secColor_h2 = [UIColor colorWithRed: (secColorRGBA[0] * 0.9 + 0.1) green: (secColorRGBA[1] * 0.9 + 0.1) blue: (secColorRGBA[2] * 0.9 + 0.1) alpha: (secColorRGBA[3] * 0.9 + 0.1)];
    UIColor* fistColor_h2 = [UIColor colorWithRed: (firColorRGBA[0] * 0.9 + 0.1) green: (firColorRGBA[1] * 0.9 + 0.1) blue: (firColorRGBA[2] * 0.9 + 0.1) alpha: (firColorRGBA[3] * 0.9 + 0.1)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    
    //// Gradient Declarations
    NSArray* secGradientColors = [NSArray arrayWithObjects:
                                  (id)secColor_s.CGColor,
                                  (id)[UIColor colorWithRed: 0.606 green: 0.503 blue: 0.785 alpha: 1].CGColor,
                                  (id)secColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.606 green: 0.503 blue: 0.785 alpha: 1].CGColor,
                                  (id)secColor_s.CGColor, nil];
    CGFloat secGradientLocations[] = {0, 0.06, 0.48, 0.94, 1};
    CGGradientRef secGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secGradientColors, secGradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 10.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Airbrush
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.84, CGRectGetMinY(frame) + 36.06)];
        [rectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.58, CGRectGetMinY(frame) + 65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.85, CGRectGetMinY(frame) + 49.81) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 18.58, CGRectGetMinY(frame) + 65)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 65)];
        [rectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.97, CGRectGetMinY(frame) + 36.31) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.59, CGRectGetMinY(frame) + 50.06)];
        [rectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34.53, CGRectGetMinY(frame) + 10) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.36, CGRectGetMinY(frame) + 22.56) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.53, CGRectGetMinY(frame) + 10)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29.52, CGRectGetMinY(frame) + 10)];
        [rectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.84, CGRectGetMinY(frame) + 36.06) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.52, CGRectGetMinY(frame) + 10) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.83, CGRectGetMinY(frame) + 22.31)];
        [rectangle2Path closePath];
        [firColor_s setFill];
        [rectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 65, 32, 35);
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(3, 3)];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        [roundedRectanglePath addClip];
        CGContextDrawLinearGradient(context, secGradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangleRect) + -16 * CGRectGetWidth(roundedRectangleRect) / 32, CGRectGetMidY(roundedRectangleRect) + 0 * CGRectGetHeight(roundedRectangleRect) / 35),
                                    CGPointMake(CGRectGetMidX(roundedRectangleRect) + 16 * CGRectGetWidth(roundedRectangleRect) / 32, CGRectGetMidY(roundedRectangleRect) + 0 * CGRectGetHeight(roundedRectangleRect) / 35),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPath];
        [rectangle4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 10)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 10)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33.18, CGRectGetMinY(frame) + 4)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 4)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 10)];
        [rectangle4Path closePath];
        CGContextSaveGState(context);
        [rectangle4Path addClip];
        CGRect rectangle4Bounds = CGPathGetPathBoundingBox(rectangle4Path.CGPath);
        CGContextDrawLinearGradient(context, secGradient,
                                    CGPointMake(CGRectGetMidX(rectangle4Bounds), CGRectGetMinY(rectangle4Bounds)),
                                    CGPointMake(CGRectGetMidX(rectangle4Bounds), CGRectGetMaxY(rectangle4Bounds)),
                                    0);
        CGContextRestoreGState(context);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 10)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 10)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 37) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 10) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.79, CGRectGetMinY(frame) + 26.13)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20, CGRectGetMinY(frame) + 65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.21, CGRectGetMinY(frame) + 47.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20, CGRectGetMinY(frame) + 65)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 24, CGRectGetMinY(frame) + 65)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 37) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 24, CGRectGetMinY(frame) + 65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 24.35, CGRectGetMinY(frame) + 46.84)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 10) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.32, CGRectGetMinY(frame) + 29.08) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 10)];
        [bezierPath closePath];
        [firColor_h setFill];
        [bezierPath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
        [roundedRectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 100)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 100)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 66)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24, CGRectGetMinY(frame) + 65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 65.45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 24.55, CGRectGetMinY(frame) + 65)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20, CGRectGetMinY(frame) + 65)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.45, CGRectGetMinY(frame) + 65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 65.45)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 100)];
        [roundedRectangle2Path closePath];
        [secColor_h setFill];
        [roundedRectangle2Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 10)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 10)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 43.5, CGRectGetMinY(frame) + 37) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 10) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.71, CGRectGetMinY(frame) + 26.13)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.29, CGRectGetMinY(frame) + 47.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 65)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 65)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.5, CGRectGetMinY(frame) + 37) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.15, CGRectGetMinY(frame) + 46.84)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 10) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38.18, CGRectGetMinY(frame) + 29.09) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 10)];
        [bezier2Path closePath];
        [fistColor_h2 setFill];
        [bezier2Path fill];
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPath];
        [roundedRectangle3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.25, CGRectGetMinY(frame) + 100)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.25, CGRectGetMinY(frame) + 100)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.25, CGRectGetMinY(frame) + 66)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.25, CGRectGetMinY(frame) + 65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.25, CGRectGetMinY(frame) + 65.45) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.69, CGRectGetMinY(frame) + 65)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.25, CGRectGetMinY(frame) + 65)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.25, CGRectGetMinY(frame) + 66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.8, CGRectGetMinY(frame) + 65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.25, CGRectGetMinY(frame) + 65.45)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.25, CGRectGetMinY(frame) + 100)];
        [roundedRectangle3Path closePath];
        [secColor_h2 setFill];
        [roundedRectangle3Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(secGradient);
    CGColorSpaceRelease(colorSpace);
    
}

- (void)drawMarkerSquare{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.849 green: 1 blue: 0.219 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.3 + 0.7) green: (firColorRGBA[1] * 0.3 + 0.7) blue: (firColorRGBA[2] * 0.3 + 0.7) alpha: (firColorRGBA[3] * 0.3 + 0.7)];
    UIColor* secColor = [UIColor colorWithRed: (firColorRGBA[0] * 0.2) green: (firColorRGBA[1] * 0.2) blue: (firColorRGBA[2] * 0.2) alpha: (firColorRGBA[3] * 0.2 + 0.8)];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.5 + 0.5) green: (secColorRGBA[1] * 0.5 + 0.5) blue: (secColorRGBA[2] * 0.5 + 0.5) alpha: (secColorRGBA[3] * 0.5 + 0.5)];
    UIColor* secColor_h2 = [UIColor colorWithRed: (secColorRGBA[0] * 0.8 + 0.2) green: (secColorRGBA[1] * 0.8 + 0.2) blue: (secColorRGBA[2] * 0.8 + 0.2) alpha: (secColorRGBA[3] * 0.8 + 0.2)];
    UIColor* firColor_h2 = [UIColor colorWithRed: (firColorRGBA[0] * 0.8 + 0.2) green: (firColorRGBA[1] * 0.8 + 0.2) blue: (firColorRGBA[2] * 0.8 + 0.2) alpha: (firColorRGBA[3] * 0.8 + 0.2)];
    UIColor* firColor_h3 = [UIColor colorWithRed: (firColorRGBA[0] * 0 + 1) green: (firColorRGBA[1] * 0 + 1) blue: (firColorRGBA[2] * 0 + 1) alpha: (firColorRGBA[3] * 0 + 1)];
    UIColor* firColor_s = [UIColor colorWithRed: (firColorRGBA[0] * 0.9) green: (firColorRGBA[1] * 0.9) blue: (firColorRGBA[2] * 0.9) alpha: (firColorRGBA[3] * 0.9 + 0.1)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    
    //// Gradient Declarations
    NSArray* firGradientColors = [NSArray arrayWithObjects:
                                  (id)firColor_s.CGColor,
                                  (id)[UIColor colorWithRed: 0.807 green: 0.95 blue: 0.208 alpha: 1].CGColor,
                                  (id)firColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.807 green: 0.95 blue: 0.208 alpha: 1].CGColor,
                                  (id)firColor_s.CGColor, nil];
    CGFloat firGradientLocations[] = {0, 0.02, 0.5, 0.97, 1};
    CGGradientRef firGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradientColors, firGradientLocations);
    
    //// Shadow Declarations
    UIColor* glow = firColor_g;
    CGSize glowOffset = CGSizeMake(0.1, 5.1);
    CGFloat glowBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
        [roundedRectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.54, CGRectGetMinY(frame) + 37.66)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 50.88) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.57, CGRectGetMinY(frame) + 45.86) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.48, CGRectGetMinY(frame) + 47.9)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 10.63, CGRectGetMinY(frame) + 54.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.52, CGRectGetMinY(frame) + 53.85) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.18, CGRectGetMinY(frame) + 54.16)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.68, CGRectGetMinY(frame) + 54.16)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.82, CGRectGetMinY(frame) + 50.88) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.14, CGRectGetMinY(frame) + 54.16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.51, CGRectGetMinY(frame) + 53.97)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.76, CGRectGetMinY(frame) + 37.47) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.12, CGRectGetMinY(frame) + 47.78) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.73, CGRectGetMinY(frame) + 45.67)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.24, CGRectGetMinY(frame) + 20.4) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 39.78, CGRectGetMinY(frame) + 29.27) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.24, CGRectGetMinY(frame) + 20.4)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 38.61, CGRectGetMinY(frame) + 17.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.24, CGRectGetMinY(frame) + 18.95) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.06, CGRectGetMinY(frame) + 17.77)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28.71, CGRectGetMinY(frame) + 17.77)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.08, CGRectGetMinY(frame) + 20.4) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.26, CGRectGetMinY(frame) + 17.77) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26.08, CGRectGetMinY(frame) + 18.95)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.54, CGRectGetMinY(frame) + 37.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 26.08, CGRectGetMinY(frame) + 20.4) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.51, CGRectGetMinY(frame) + 29.46)];
        [roundedRectangle2Path closePath];
        [secColor setFill];
        [roundedRectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.29, CGRectGetMinY(frame) + 79.58)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12.61, CGRectGetMinY(frame) + 104.34)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 54.71, CGRectGetMinY(frame) + 104.34)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.03, CGRectGetMinY(frame) + 79.55)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 57.34, CGRectGetMinY(frame) + 62.37)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 9.97, CGRectGetMinY(frame) + 62.37) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.34, CGRectGetMinY(frame) + 60.92) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.97, CGRectGetMinY(frame) + 60.92)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.29, CGRectGetMinY(frame) + 79.58)];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        [roundedRectanglePath addClip];
        CGRect roundedRectangleBounds = CGPathGetPathBoundingBox(roundedRectanglePath.CGPath);
        CGContextDrawLinearGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangleBounds) + 23.51 * CGRectGetWidth(roundedRectangleBounds) / 47.37, CGRectGetMidY(roundedRectangleBounds) + -0.78 * CGRectGetHeight(roundedRectangleBounds) / 43.06),
                                    CGPointMake(CGRectGetMidX(roundedRectangleBounds) + -23.21 * CGRectGetWidth(roundedRectangleBounds) / 47.37, CGRectGetMidY(roundedRectangleBounds) + -0.51 * CGRectGetHeight(roundedRectangleBounds) / 43.06),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
        [rectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 28.39, CGRectGetMinY(frame) + 17.77)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39.92, CGRectGetMinY(frame) + 17.77)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39.92, CGRectGetMinY(frame) + 4.66)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28.39, CGRectGetMinY(frame) + 11.21)];
        [rectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28.39, CGRectGetMinY(frame) + 17.77)];
        [rectanglePath closePath];
        [firColor setFill];
        [rectanglePath fill];
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPath];
        [roundedRectangle3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 60.71)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 9.52, CGRectGetMinY(frame) + 62.03) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 61.44) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 8.68, CGRectGetMinY(frame) + 62.03)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.48, CGRectGetMinY(frame) + 62.03)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 60.71) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.32, CGRectGetMinY(frame) + 62.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 61.44)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 55.47)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.48, CGRectGetMinY(frame) + 54.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 54.74) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 57.32, CGRectGetMinY(frame) + 54.16)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 9.52, CGRectGetMinY(frame) + 54.16)];
        [roundedRectangle3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 55.47) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 8.68, CGRectGetMinY(frame) + 54.16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 54.74)];
        [roundedRectangle3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 8, CGRectGetMinY(frame) + 60.71)];
        [roundedRectangle3Path closePath];
        [secColor setFill];
        [roundedRectangle3Path fill];
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.26, CGRectGetMinY(frame) + 102.69)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 18.53, CGRectGetMinY(frame) + 102.69)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.21, CGRectGetMinY(frame) + 62.03)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.95, CGRectGetMinY(frame) + 62.03)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13.26, CGRectGetMinY(frame) + 102.69)];
        [rectangle2Path closePath];
        [firColor_h setFill];
        [rectangle2Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.77, CGRectGetMinY(frame) + 18.43)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25.42, CGRectGetMinY(frame) + 19.77)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.42, CGRectGetMinY(frame) + 36.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.42, CGRectGetMinY(frame) + 23.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25.42, CGRectGetMinY(frame) + 32.57)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.16, CGRectGetMinY(frame) + 50.22) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.42, CGRectGetMinY(frame) + 42.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.54, CGRectGetMinY(frame) + 46.63)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.95, CGRectGetMinY(frame) + 54.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.77, CGRectGetMinY(frame) + 53.81) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.95, CGRectGetMinY(frame) + 54.16)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.21, CGRectGetMinY(frame) + 54.16)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.88, CGRectGetMinY(frame) + 50.22) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.21, CGRectGetMinY(frame) + 54.16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.09, CGRectGetMinY(frame) + 53.92)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 28.05, CGRectGetMinY(frame) + 36.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 24.67, CGRectGetMinY(frame) + 46.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.05, CGRectGetMinY(frame) + 41.87)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 28.05, CGRectGetMinY(frame) + 18.43) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 28.05, CGRectGetMinY(frame) + 31.71) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.05, CGRectGetMinY(frame) + 18.43)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.77, CGRectGetMinY(frame) + 18.43)];
        [bezierPath closePath];
        [secColor_h setFill];
        [bezierPath fill];
        
        
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPath];
        [rectangle4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 54.05, CGRectGetMinY(frame) + 102.69)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48.79, CGRectGetMinY(frame) + 102.69)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.11, CGRectGetMinY(frame) + 62.03)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 55.37, CGRectGetMinY(frame) + 62.03)];
        [rectangle4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 54.05, CGRectGetMinY(frame) + 102.69)];
        [rectangle4Path closePath];
        [firColor_h2 setFill];
        [rectangle4Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.55, CGRectGetMinY(frame) + 18.43)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.89, CGRectGetMinY(frame) + 19.77)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.89, CGRectGetMinY(frame) + 36.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.89, CGRectGetMinY(frame) + 23.24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42.89, CGRectGetMinY(frame) + 32.57)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48.16, CGRectGetMinY(frame) + 50.22) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.89, CGRectGetMinY(frame) + 42.03) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.77, CGRectGetMinY(frame) + 46.63)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 57.37, CGRectGetMinY(frame) + 54.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.54, CGRectGetMinY(frame) + 53.81) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 57.37, CGRectGetMinY(frame) + 54.16)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 52.11, CGRectGetMinY(frame) + 54.16)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.44, CGRectGetMinY(frame) + 50.22) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.11, CGRectGetMinY(frame) + 54.16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.22, CGRectGetMinY(frame) + 53.92)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.26, CGRectGetMinY(frame) + 36.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.65, CGRectGetMinY(frame) + 46.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.26, CGRectGetMinY(frame) + 41.87)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.26, CGRectGetMinY(frame) + 18.43) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 40.26, CGRectGetMinY(frame) + 31.71) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.26, CGRectGetMinY(frame) + 18.43)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.55, CGRectGetMinY(frame) + 18.43)];
        [bezier2Path closePath];
        [secColor_h2 setFill];
        [bezier2Path fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.92, CGRectGetMinY(frame) + 4.66)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28.39, CGRectGetMinY(frame) + 11.21)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28.39, CGRectGetMinY(frame) + 13.84)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39.92, CGRectGetMinY(frame) + 7.28)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39.92, CGRectGetMinY(frame) + 4.66)];
        [bezier3Path closePath];
        [firColor_h3 setFill];
        [bezier3Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(firGradient);
    CGColorSpaceRelease(colorSpace);
    

}

- (void)drawOilBrush{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 1 green: 0.81 blue: 0.339 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_s = [UIColor colorWithRed: (firColorRGBA[0] * 0.8) green: (firColorRGBA[1] * 0.8) blue: (firColorRGBA[2] * 0.8) alpha: (firColorRGBA[3] * 0.8 + 0.2)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.6];
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.5 + 0.5) green: (firColorRGBA[1] * 0.5 + 0.5) blue: (firColorRGBA[2] * 0.5 + 0.5) alpha: (firColorRGBA[3] * 0.5 + 0.5)];
    UIColor* firColor_s2 = [UIColor colorWithRed: (firColorRGBA[0] * 0.8) green: (firColorRGBA[1] * 0.8) blue: (firColorRGBA[2] * 0.8) alpha: (firColorRGBA[3] * 0.8 + 0.2)];
    UIColor* secColor = [UIColor colorWithRed: 0.465 green: 0.465 blue: 0.465 alpha: 1];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_h = [UIColor colorWithRed: (secColorRGBA[0] * 0.2 + 0.8) green: (secColorRGBA[1] * 0.2 + 0.8) blue: (secColorRGBA[2] * 0.2 + 0.8) alpha: (secColorRGBA[3] * 0.2 + 0.8)];
    UIColor* secColor_h2 = [UIColor colorWithRed: (secColorRGBA[0] * 0 + 1) green: (secColorRGBA[1] * 0 + 1) blue: (secColorRGBA[2] * 0 + 1) alpha: (secColorRGBA[3] * 0 + 1)];
    
    //// Gradient Declarations
    NSArray* secGradientColors = [NSArray arrayWithObjects:
                                  (id)secColor_h.CGColor,
                                  (id)secColor_h2.CGColor, nil];
    CGFloat secGradientLocations[] = {0, 1};
    CGGradientRef secGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secGradientColors, secGradientLocations);
    NSArray* firGradient_sColors = [NSArray arrayWithObjects:
                                    (id)firColor.CGColor,
                                    (id)firColor_s2.CGColor, nil];
    CGFloat firGradient_sLocations[] = {0, 1};
    CGGradientRef firGradient_s = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradient_sColors, firGradient_sLocations);
    NSArray* firGradient_hColors = [NSArray arrayWithObjects:
                                    (id)firColor.CGColor,
                                    (id)firColor_h.CGColor, nil];
    CGFloat firGradient_hLocations[] = {0, 1};
    CGGradientRef firGradient_h = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradient_hColors, firGradient_hLocations);
    
    //// Shadow Declarations
    UIColor* glow = firColor_g;
    CGSize glowOffset = CGSizeMake(0.1, 5.1);
    CGFloat glowBlurRadius = 10;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.34, CGRectGetMinY(frame) + 115.8)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.69, CGRectGetMinY(frame) + 117.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.34, CGRectGetMinY(frame) + 116.74) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.95, CGRectGetMinY(frame) + 117.5)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.54, CGRectGetMinY(frame) + 117.5)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 43.88, CGRectGetMinY(frame) + 115.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.28, CGRectGetMinY(frame) + 117.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.88, CGRectGetMinY(frame) + 116.74)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45, CGRectGetMinY(frame) + 87) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 43.88, CGRectGetMinY(frame) + 115.8) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.76, CGRectGetMinY(frame) + 101.48)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 70) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.06, CGRectGetMinY(frame) + 83.34) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 70)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 56)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 56)];
        [roundedRectanglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 70)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 87) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 70) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.87, CGRectGetMinY(frame) + 83.24)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.34, CGRectGetMinY(frame) + 115.8) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.49, CGRectGetMinY(frame) + 101.48) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.34, CGRectGetMinY(frame) + 115.8)];
        [roundedRectanglePath closePath];
        CGContextSaveGState(context);
        [roundedRectanglePath addClip];
        CGRect roundedRectangleBounds = CGPathGetPathBoundingBox(roundedRectanglePath.CGPath);
        CGContextDrawLinearGradient(context, secGradient,
                                    CGPointMake(CGRectGetMidX(roundedRectangleBounds) + 13.5 * CGRectGetWidth(roundedRectangleBounds) / 30, CGRectGetMidY(roundedRectangleBounds) + -4.77 * CGRectGetHeight(roundedRectangleBounds) / 61.5),
                                    CGPointMake(CGRectGetMidX(roundedRectangleBounds) + -11.61 * CGRectGetWidth(roundedRectangleBounds) / 30, CGRectGetMidY(roundedRectangleBounds) + -5.33 * CGRectGetHeight(roundedRectangleBounds) / 61.5),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 55)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 30) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 55) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.03, CGRectGetMinY(frame) + 40.81)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 9.89, CGRectGetMinY(frame) + 6.78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 9.97, CGRectGetMinY(frame) + 19.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.89, CGRectGetMinY(frame) + 6.78)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 9.89, CGRectGetMinY(frame) + 6.78) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.75, CGRectGetMinY(frame) + 1)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 30) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 57.01, CGRectGetMinY(frame) + 9.6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.96, CGRectGetMinY(frame) + 9.27)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 55) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.04, CGRectGetMinY(frame) + 50.73) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 55)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 55)];
        [bezier2Path closePath];
        [firColor setFill];
        [bezier2Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 78)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.43, CGRectGetMinY(frame) + 75.27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.05, CGRectGetMinY(frame) + 78) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 38.45, CGRectGetMinY(frame) + 76.88)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 70.56) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.4, CGRectGetMinY(frame) + 73.66) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.93, CGRectGetMinY(frame) + 71.18)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.02, CGRectGetMinY(frame) + 70.63) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.07, CGRectGetMinY(frame) + 69.9) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.84, CGRectGetMinY(frame) + 69.95)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.57, CGRectGetMinY(frame) + 75.27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.17, CGRectGetMinY(frame) + 71.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.6, CGRectGetMinY(frame) + 73.68)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 78) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.55, CGRectGetMinY(frame) + 76.86) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.95, CGRectGetMinY(frame) + 78)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 72.5)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 87.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 72.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.25, CGRectGetMinY(frame) + 77)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.5, CGRectGetMinY(frame) + 100.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.75, CGRectGetMinY(frame) + 98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26.5, CGRectGetMinY(frame) + 100.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 100.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 87.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 72.5)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 47.5, CGRectGetMinY(frame) + 72.5)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42.5, CGRectGetMinY(frame) + 87.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47.5, CGRectGetMinY(frame) + 72.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.75, CGRectGetMinY(frame) + 77)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.5, CGRectGetMinY(frame) + 100.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 40.25, CGRectGetMinY(frame) + 98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 39.5, CGRectGetMinY(frame) + 100.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 100.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 87.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47.5, CGRectGetMinY(frame) + 72.5)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 70.06)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.12, CGRectGetMinY(frame) + 64.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 70.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.33, CGRectGetMinY(frame) + 71.32)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 56.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.9, CGRectGetMinY(frame) + 58.08) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 56.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47.73, CGRectGetMinY(frame) + 56.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47.73, CGRectGetMinY(frame) + 64.7)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 48, CGRectGetMinY(frame) + 70.06)];
        [bezierPath closePath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.5, CGRectGetMinY(frame) + 70.06)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.38, CGRectGetMinY(frame) + 64.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.5, CGRectGetMinY(frame) + 70.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 18.17, CGRectGetMinY(frame) + 71.32)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 56.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.6, CGRectGetMinY(frame) + 58.08) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21, CGRectGetMinY(frame) + 56.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.77, CGRectGetMinY(frame) + 56.5)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.77, CGRectGetMinY(frame) + 64.7)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.5, CGRectGetMinY(frame) + 70.06)];
        [bezierPath closePath];
        [secColor setFill];
        [bezierPath fill];
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.5, CGRectGetMinY(frame) + 54.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 14.5, CGRectGetMinY(frame) + 28.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.5, CGRectGetMinY(frame) + 54.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.35, CGRectGetMinY(frame) + 34.17)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.5, CGRectGetMinY(frame) + 9.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.65, CGRectGetMinY(frame) + 22.83) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.5, CGRectGetMinY(frame) + 9.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 16.5, CGRectGetMinY(frame) + 28.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.5, CGRectGetMinY(frame) + 9.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.78, CGRectGetMinY(frame) + 23.36)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.5, CGRectGetMinY(frame) + 52.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.22, CGRectGetMinY(frame) + 33.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.5, CGRectGetMinY(frame) + 52.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.5, CGRectGetMinY(frame) + 28.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.5, CGRectGetMinY(frame) + 16.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.5, CGRectGetMinY(frame) + 28.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 24.5, CGRectGetMinY(frame) + 52.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMinY(frame) + 30.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 24.5, CGRectGetMinY(frame) + 50.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 30.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 24.5, CGRectGetMinY(frame) + 50.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.16, CGRectGetMinY(frame) + 37.94)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 16.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.84, CGRectGetMinY(frame) + 23.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 16.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 29.5, CGRectGetMinY(frame) + 30.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 16.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.1, CGRectGetMinY(frame) + 25.02)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 29.5, CGRectGetMinY(frame) + 50.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.9, CGRectGetMinY(frame) + 35.98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 29.5, CGRectGetMinY(frame) + 50.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.5, CGRectGetMinY(frame) + 38.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 29.5, CGRectGetMinY(frame) + 50.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.43, CGRectGetMinY(frame) + 46.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.5, CGRectGetMinY(frame) + 21.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 33.57, CGRectGetMinY(frame) + 30.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32.5, CGRectGetMinY(frame) + 21.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34.5, CGRectGetMinY(frame) + 38.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 32.5, CGRectGetMinY(frame) + 21.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.25, CGRectGetMinY(frame) + 31.29)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34.5, CGRectGetMinY(frame) + 50.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.75, CGRectGetMinY(frame) + 45.71) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.5, CGRectGetMinY(frame) + 50.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.5, CGRectGetMinY(frame) + 38.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.5, CGRectGetMinY(frame) + 50.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 36.62, CGRectGetMinY(frame) + 46.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 38.5, CGRectGetMinY(frame) + 16.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38.38, CGRectGetMinY(frame) + 30.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 38.5, CGRectGetMinY(frame) + 16.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40.5, CGRectGetMinY(frame) + 33.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38.5, CGRectGetMinY(frame) + 16.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.24, CGRectGetMinY(frame) + 28.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 38.5, CGRectGetMinY(frame) + 50.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 40.76, CGRectGetMinY(frame) + 38.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 38.5, CGRectGetMinY(frame) + 50.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 33.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38.5, CGRectGetMinY(frame) + 50.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.21, CGRectGetMinY(frame) + 45.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.5, CGRectGetMinY(frame) + 16.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.79, CGRectGetMinY(frame) + 21.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.5, CGRectGetMinY(frame) + 16.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 46.5, CGRectGetMinY(frame) + 33.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.5, CGRectGetMinY(frame) + 16.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 46.5, CGRectGetMinY(frame) + 28.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 47.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 46.5, CGRectGetMinY(frame) + 38.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 47.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49.5, CGRectGetMinY(frame) + 30.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 47.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.78, CGRectGetMinY(frame) + 39.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.5, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 50.22, CGRectGetMinY(frame) + 21.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.5, CGRectGetMinY(frame) + 12.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52.5, CGRectGetMinY(frame) + 30.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.5, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 52.5, CGRectGetMinY(frame) + 22.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 54.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.5, CGRectGetMinY(frame) + 38.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 54.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33.5, CGRectGetMinY(frame) + 55.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 54.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40, CGRectGetMinY(frame) + 55.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.5, CGRectGetMinY(frame) + 54.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 55.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.5, CGRectGetMinY(frame) + 54.5)];
        [bezier3Path closePath];
        CGContextSaveGState(context);
        [bezier3Path addClip];
        CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient_s,
                                    CGPointMake(CGRectGetMidX(bezier3Bounds) + 0.1 * CGRectGetWidth(bezier3Bounds) / 39, CGRectGetMidY(bezier3Bounds) + 22.29 * CGRectGetHeight(bezier3Bounds) / 46),
                                    CGPointMake(CGRectGetMidX(bezier3Bounds) + 0 * CGRectGetWidth(bezier3Bounds) / 39, CGRectGetMidY(bezier3Bounds) + -1.15 * CGRectGetHeight(bezier3Bounds) / 46),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 40, CGRectGetMinY(frame) + 6)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.71, CGRectGetMinY(frame) + 7.33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.52, CGRectGetMinY(frame) + 6.05) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.52, CGRectGetMinY(frame) + 6.7)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.42, CGRectGetMinY(frame) + 8.59) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.75, CGRectGetMinY(frame) + 7.98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.99, CGRectGetMinY(frame) + 8.62)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMinY(frame) + 6.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.01, CGRectGetMinY(frame) + 8.53) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMinY(frame) + 6.5)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.5, CGRectGetMinY(frame) + 3.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMinY(frame) + 6.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.33, CGRectGetMinY(frame) + 3.07)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55, CGRectGetMinY(frame) + 10) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 51.67, CGRectGetMinY(frame) + 3.93) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 54.88, CGRectGetMinY(frame) + 7.57)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 39.5, CGRectGetMinY(frame) + 8.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 55.12, CGRectGetMinY(frame) + 12.43) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.12, CGRectGetMinY(frame) + 9.12)];
        [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 40, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 38.47, CGRectGetMinY(frame) + 8.44) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 43.71, CGRectGetMinY(frame) + 5.93)];
        [bezier4Path closePath];
        [firColor_s setFill];
        [bezier4Path fill];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.5, CGRectGetMinY(frame) + 9.5)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16.5, CGRectGetMinY(frame) + 20.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.5, CGRectGetMinY(frame) + 14.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 16.5, CGRectGetMinY(frame) + 20.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.32, CGRectGetMinY(frame) + 16.29)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.68, CGRectGetMinY(frame) + 12.71) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 12.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.17, CGRectGetMinY(frame) + 24.6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.17, CGRectGetMinY(frame) + 20.97)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 38.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.17, CGRectGetMinY(frame) + 28.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 38.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25.5, CGRectGetMinY(frame) + 24.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 38.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 25.34, CGRectGetMinY(frame) + 34.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.5, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.66, CGRectGetMinY(frame) + 14.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26.5, CGRectGetMinY(frame) + 12.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 29.5, CGRectGetMinY(frame) + 18.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 26.5, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.76, CGRectGetMinY(frame) + 16.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.5, CGRectGetMinY(frame) + 24.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.24, CGRectGetMinY(frame) + 20.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30.5, CGRectGetMinY(frame) + 24.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.5, CGRectGetMinY(frame) + 18.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.5, CGRectGetMinY(frame) + 24.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30.99, CGRectGetMinY(frame) + 22.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30.5, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34.01, CGRectGetMinY(frame) + 14.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30.5, CGRectGetMinY(frame) + 12.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.5, CGRectGetMinY(frame) + 18.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.5, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34.73, CGRectGetMinY(frame) + 12.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 35.5, CGRectGetMinY(frame) + 24.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.27, CGRectGetMinY(frame) + 24.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.5, CGRectGetMinY(frame) + 24.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.5, CGRectGetMinY(frame) + 18.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 35.5, CGRectGetMinY(frame) + 24.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.29, CGRectGetMinY(frame) + 22.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.5, CGRectGetMinY(frame) + 12.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.71, CGRectGetMinY(frame) + 14.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 37.5, CGRectGetMinY(frame) + 12.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 18.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.5, CGRectGetMinY(frame) + 12.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.15, CGRectGetMinY(frame) + 12.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 30.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.85, CGRectGetMinY(frame) + 24.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 30.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.5, CGRectGetMinY(frame) + 18.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.5, CGRectGetMinY(frame) + 30.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.74, CGRectGetMinY(frame) + 22.5)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 13) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.26, CGRectGetMinY(frame) + 14.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 13)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45.62, CGRectGetMinY(frame) + 13.12)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 49, CGRectGetMinY(frame) + 22) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 48.38, CGRectGetMinY(frame) + 16.88) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 49, CGRectGetMinY(frame) + 22)];
        [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 49, CGRectGetMinY(frame) + 16)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45.5, CGRectGetMinY(frame) + 10.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 49, CGRectGetMinY(frame) + 16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 48.4, CGRectGetMinY(frame) + 11.96)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.41, CGRectGetMinY(frame) + 9.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42.6, CGRectGetMinY(frame) + 9.04) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 38.99, CGRectGetMinY(frame) + 9.96)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 36, CGRectGetMinY(frame) + 7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 36.13, CGRectGetMinY(frame) + 8.51) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 40.03, CGRectGetMinY(frame) + 7)];
        [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.5, CGRectGetMinY(frame) + 9.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 7) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 15.5, CGRectGetMinY(frame) + 9.5)];
        [bezier5Path closePath];
        CGContextSaveGState(context);
        [bezier5Path addClip];
        CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
        CGContextDrawLinearGradient(context, firGradient_h,
                                    CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.67 * CGRectGetWidth(bezier5Bounds) / 33.5, CGRectGetMidY(bezier5Bounds) + -20.77 * CGRectGetHeight(bezier5Bounds) / 31.5),
                                    CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.75 * CGRectGetWidth(bezier5Bounds) / 33.5, CGRectGetMidY(bezier5Bounds) + -0.56 * CGRectGetHeight(bezier5Bounds) / 31.5),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(secGradient);
    CGGradientRelease(firGradient_s);
    CGGradientRelease(firGradient_h);
    CGColorSpaceRelease(colorSpace);
    
}

- (void)drawAirBrush{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_h1 = [UIColor colorWithRed: (firColorRGBA[0] * 0.7 + 0.3) green: (firColorRGBA[1] * 0.7 + 0.3) blue: (firColorRGBA[2] * 0.7 + 0.3) alpha: (firColorRGBA[3] * 0.7 + 0.3)];
    UIColor* firColor_h2 = [UIColor colorWithRed: (firColorRGBA[0] * 1 + 0) green: (firColorRGBA[1] * 1 + 0) blue: (firColorRGBA[2] * 1 + 0) alpha: (firColorRGBA[3] * 1 + 0)];
    UIColor* firColor_g = [firColor colorWithAlphaComponent: 0.5];
    UIColor* firColor_screen_g1 = [UIColor colorWithRed: 0.964 green: 0.964 blue: 0.964 alpha: 1];
    UIColor* firColor_screem_g4 = [UIColor colorWithRed: 0.427 green: 0.427 blue: 0.427 alpha: 1];
    UIColor* firColor_screen_g3 = [UIColor colorWithRed: 0.585 green: 0.563 blue: 0.563 alpha: 1];
    
    //// Gradient Declarations
    NSArray* screenGradientColors = [NSArray arrayWithObjects:
                                     (id)firColor_screen_g3.CGColor,
                                     (id)[UIColor colorWithRed: 0.775 green: 0.764 blue: 0.764 alpha: 1].CGColor,
                                     (id)firColor_screen_g1.CGColor, nil];
    CGFloat screenGradientLocations[] = {0.25, 0.43, 0.69};
    CGGradientRef screenGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)screenGradientColors, screenGradientLocations);
    NSArray* screenGradient2Colors = [NSArray arrayWithObjects:
                                      (id)firColor_screen_g1.CGColor,
                                      (id)[UIColor colorWithRed: 0.775 green: 0.764 blue: 0.764 alpha: 1].CGColor,
                                      (id)firColor_screen_g3.CGColor,
                                      (id)firColor_screem_g4.CGColor, nil];
    CGFloat screenGradient2Locations[] = {0, 0.41, 0.74, 1};
    CGGradientRef screenGradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)screenGradient2Colors, screenGradient2Locations);
    NSArray* screenGradient3Colors = [NSArray arrayWithObjects:
                                      (id)firColor_screen_g3.CGColor,
                                      (id)firColor_screen_g1.CGColor,
                                      (id)firColor_screen_g3.CGColor,
                                      (id)firColor_screem_g4.CGColor, nil];
    CGFloat screenGradient3Locations[] = {0, 0.35, 0.86, 1};
    CGGradientRef screenGradient3 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)screenGradient3Colors, screenGradient3Locations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor_g;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 66, 100);
    
    
    //// Group
    {
        //// Airbrush
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 24.19, CGRectGetMinY(frame) + 14)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.1, CGRectGetMinY(frame) + 14)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.1, CGRectGetMinY(frame) + 12)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 24.19, CGRectGetMinY(frame) + 12)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 24.19, CGRectGetMinY(frame) + 14)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.13, CGRectGetMinY(frame) + 30)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.52, CGRectGetMinY(frame) + 30)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46.52, CGRectGetMinY(frame) + 28)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.13, CGRectGetMinY(frame) + 28)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.13, CGRectGetMinY(frame) + 30)];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 58)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 58)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 56)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 56)];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 58)];
            [bezierPath closePath];
            [firColor_h1 setFill];
            [bezierPath fill];
            
            
            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.13, CGRectGetMinY(frame) + 28)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 28)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 42.81, CGRectGetMinY(frame) + 14)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 14)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20.13, CGRectGetMinY(frame) + 28)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 104)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 104)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 58)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 58)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 104)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 56)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 56)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 30)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 30)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 56)];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 12)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.1, CGRectGetMinY(frame) + 12)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 39.74, CGRectGetMinY(frame) + 5)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 5)];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 12)];
            [bezier4Path closePath];
            [firColor_h2 setFill];
            [bezier4Path fill];
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// screen
        {
            CGContextSaveGState(context);
            CGContextSetBlendMode(context, kCGBlendModeScreen);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 7 Drawing
            UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
            [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 100)];
            [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 100)];
            [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 56)];
            [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 56)];
            [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 100)];
            [bezier7Path closePath];
            CGContextSaveGState(context);
            [bezier7Path addClip];
            CGRect bezier7Bounds = CGPathGetPathBoundingBox(bezier7Path.CGPath);
            CGContextDrawLinearGradient(context, screenGradient3,
                                        CGPointMake(CGRectGetMidX(bezier7Bounds) + 10.1 * CGRectGetWidth(bezier7Bounds) / 20, CGRectGetMidY(bezier7Bounds) + -0.47 * CGRectGetHeight(bezier7Bounds) / 44),
                                        CGPointMake(CGRectGetMidX(bezier7Bounds) + -10 * CGRectGetWidth(bezier7Bounds) / 20, CGRectGetMidY(bezier7Bounds) + -0.57 * CGRectGetHeight(bezier7Bounds) / 44),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// Bezier 6 Drawing
            UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
            [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 43, CGRectGetMinY(frame) + 56)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 36, CGRectGetMinY(frame) + 5)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 40, CGRectGetMinY(frame) + 5)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 41.69, CGRectGetMinY(frame) + 12.06)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 43, CGRectGetMinY(frame) + 14)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 46, CGRectGetMinY(frame) + 28)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 30)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 53, CGRectGetMinY(frame) + 56)];
            [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 43, CGRectGetMinY(frame) + 56)];
            [bezier6Path closePath];
            CGContextSaveGState(context);
            [bezier6Path addClip];
            CGRect bezier6Bounds = CGPathGetPathBoundingBox(bezier6Path.CGPath);
            CGContextDrawLinearGradient(context, screenGradient,
                                        CGPointMake(CGRectGetMidX(bezier6Bounds) + 7.72 * CGRectGetWidth(bezier6Bounds) / 17, CGRectGetMidY(bezier6Bounds) + 22.67 * CGRectGetHeight(bezier6Bounds) / 51),
                                        CGPointMake(CGRectGetMidX(bezier6Bounds) + -1.5 * CGRectGetWidth(bezier6Bounds) / 17, CGRectGetMidY(bezier6Bounds) + 24.29 * CGRectGetHeight(bezier6Bounds) / 51),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 5)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 56)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 56)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 5)];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 5)];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGContextDrawLinearGradient(context, screenGradient2,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 4.93 * CGRectGetWidth(bezier5Bounds) / 11, CGRectGetMidY(bezier5Bounds) + 24.77 * CGRectGetHeight(bezier5Bounds) / 51),
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + -5.5 * CGRectGetWidth(bezier5Bounds) / 11, CGRectGetMidY(bezier5Bounds) + 25.08 * CGRectGetHeight(bezier5Bounds) / 51),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// screen 2
        {
            CGContextSaveGState(context);
            CGContextSetBlendMode(context, kCGBlendModeScreen);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 100)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 100)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 56)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 56)];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 100)];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGContextDrawLinearGradient(context, screenGradient3,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -9.88 * CGRectGetWidth(bezier3Bounds) / 20, CGRectGetMidY(bezier3Bounds) + -0.13 * CGRectGetHeight(bezier3Bounds) / 44),
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 10 * CGRectGetWidth(bezier3Bounds) / 20, CGRectGetMidY(bezier3Bounds) + -0.13 * CGRectGetHeight(bezier3Bounds) / 44),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// Bezier 8 Drawing
            UIBezierPath* bezier8Path = [UIBezierPath bezierPath];
            [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 56)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 5)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 5)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 24.31, CGRectGetMinY(frame) + 12.06)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 14)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20, CGRectGetMinY(frame) + 28)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 30)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 56)];
            [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23, CGRectGetMinY(frame) + 56)];
            [bezier8Path closePath];
            CGContextSaveGState(context);
            [bezier8Path addClip];
            CGRect bezier8Bounds = CGPathGetPathBoundingBox(bezier8Path.CGPath);
            CGContextDrawLinearGradient(context, screenGradient,
                                        CGPointMake(CGRectGetMidX(bezier8Bounds) + -7.64 * CGRectGetWidth(bezier8Bounds) / 17, CGRectGetMidY(bezier8Bounds) + 22.49 * CGRectGetHeight(bezier8Bounds) / 51),
                                        CGPointMake(CGRectGetMidX(bezier8Bounds) + 1.5 * CGRectGetWidth(bezier8Bounds) / 17, CGRectGetMidY(bezier8Bounds) + 24.2 * CGRectGetHeight(bezier8Bounds) / 51),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// Bezier 9 Drawing
            UIBezierPath* bezier9Path = [UIBezierPath bezierPath];
            [bezier9Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 29, CGRectGetMinY(frame) + 5)];
            [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 56)];
            [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 56)];
            [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 5)];
            [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29, CGRectGetMinY(frame) + 5)];
            [bezier9Path closePath];
            CGContextSaveGState(context);
            [bezier9Path addClip];
            CGRect bezier9Bounds = CGPathGetPathBoundingBox(bezier9Path.CGPath);
            CGContextDrawLinearGradient(context, screenGradient2,
                                        CGPointMake(CGRectGetMidX(bezier9Bounds) + -4.35 * CGRectGetWidth(bezier9Bounds) / 11, CGRectGetMidY(bezier9Bounds) + 24.06 * CGRectGetHeight(bezier9Bounds) / 51),
                                        CGPointMake(CGRectGetMidX(bezier9Bounds) + 5.5 * CGRectGetWidth(bezier9Bounds) / 11, CGRectGetMidY(bezier9Bounds) + 24.5 * CGRectGetHeight(bezier9Bounds) / 51),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(screenGradient);
    CGGradientRelease(screenGradient2);
    CGGradientRelease(screenGradient3);
    CGColorSpaceRelease(colorSpace);
    
}

- (void)drawChalk{
}

-(void)drawBucket{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* firColor = [UIColor colorWithRed: 0.505 green: 0.505 blue: 0.505 alpha: 1];
    CGFloat firColorRGBA[4];
    [firColor getRed: &firColorRGBA[0] green: &firColorRGBA[1] blue: &firColorRGBA[2] alpha: &firColorRGBA[3]];
    
    UIColor* firColor_h = [UIColor colorWithRed: (firColorRGBA[0] * 0.4 + 0.6) green: (firColorRGBA[1] * 0.4 + 0.6) blue: (firColorRGBA[2] * 0.4 + 0.6) alpha: (firColorRGBA[3] * 0.4 + 0.6)];
    UIColor* color4 = [UIColor colorWithRed: 0.297 green: 0.297 blue: 0.297 alpha: 1];
    UIColor* secColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    CGFloat secColorRGBA[4];
    [secColor getRed: &secColorRGBA[0] green: &secColorRGBA[1] blue: &secColorRGBA[2] alpha: &secColorRGBA[3]];
    
    UIColor* secColor_s = [UIColor colorWithRed: (secColorRGBA[0] * 0.9) green: (secColorRGBA[1] * 0.9) blue: (secColorRGBA[2] * 0.9) alpha: (secColorRGBA[3] * 0.9 + 0.1)];
    
    //// Gradient Declarations
    NSArray* secGradientColors = [NSArray arrayWithObjects:
                                  (id)secColor.CGColor,
                                  (id)[UIColor colorWithRed: 0.95 green: 0.95 blue: 0.95 alpha: 1].CGColor,
                                  (id)secColor_s.CGColor,
                                  (id)[UIColor colorWithRed: 0.95 green: 0.95 blue: 0.95 alpha: 1].CGColor,
                                  (id)secColor.CGColor, nil];
    CGFloat secGradientLocations[] = {0, 0.07, 0.5, 0.9, 1};
    CGGradientRef secGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)secGradientColors, secGradientLocations);
    NSArray* firGradientColors = [NSArray arrayWithObjects:
                                  (id)firColor.CGColor,
                                  (id)firColor_h.CGColor, nil];
    CGFloat firGradientLocations[] = {0, 1};
    CGGradientRef firGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)firGradientColors, firGradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = firColor;
    CGSize shadowOffset = CGSizeMake(0.1, 5.1);
    CGFloat shadowBlurRadius = 10;
    UIColor* glow = firColor_h;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 1, 66, 99);
    
    
    //// Bucket
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 14, CGRectGetMinY(frame) + 80.83)];
        [rectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 84) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14, CGRectGetMinY(frame) + 83.68) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.24, CGRectGetMinY(frame) + 84)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 52, CGRectGetMinY(frame) + 84)];
        [rectangle2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 55, CGRectGetMinY(frame) + 80.83) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 54.76, CGRectGetMinY(frame) + 84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 55, CGRectGetMinY(frame) + 83.68)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 30)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 30)];
        [rectangle2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 14, CGRectGetMinY(frame) + 80.83)];
        [rectangle2Path closePath];
        CGContextSaveGState(context);
        [rectangle2Path addClip];
        CGRect rectangle2Bounds = CGPathGetPathBoundingBox(rectangle2Path.CGPath);
        CGContextDrawLinearGradient(context, secGradient,
                                    CGPointMake(CGRectGetMidX(rectangle2Bounds) + -24.25 * CGRectGetWidth(rectangle2Bounds) / 44, CGRectGetMidY(rectangle2Bounds) + -1.75 * CGRectGetHeight(rectangle2Bounds) / 54),
                                    CGPointMake(CGRectGetMidX(rectangle2Bounds) + 22 * CGRectGetWidth(rectangle2Bounds) / 44, CGRectGetMidY(rectangle2Bounds) + -1.5 * CGRectGetHeight(rectangle2Bounds) / 54),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.75, CGRectGetMinY(frame) + 16.02)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 29) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 53.1, CGRectGetMinY(frame) + 20.4) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 29)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 31.09)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 59, CGRectGetMinY(frame) + 32.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 58.58, CGRectGetMinY(frame) + 31.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 59, CGRectGetMinY(frame) + 31.85)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 59, CGRectGetMinY(frame) + 37.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 38.91) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 59, CGRectGetMinY(frame) + 38.15) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 58.58, CGRectGetMinY(frame) + 38.71)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 58, CGRectGetMinY(frame) + 39)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 39)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 37.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 32.5)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 29)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.22, CGRectGetMinY(frame) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 51.99, CGRectGetMinY(frame) + 21.4)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.1, CGRectGetMinY(frame) + 17.85) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.45, CGRectGetMinY(frame) + 16)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.87, CGRectGetMinY(frame) + 17.77) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.55, CGRectGetMinY(frame) + 16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.87, CGRectGetMinY(frame) + 17.77)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 29) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 15.9, CGRectGetMinY(frame) + 21.59) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 29)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 39)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 39)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 38.91)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 9, CGRectGetMinY(frame) + 37.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 9.42, CGRectGetMinY(frame) + 38.71) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9, CGRectGetMinY(frame) + 38.15)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 9, CGRectGetMinY(frame) + 32.5)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 31.09) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 9, CGRectGetMinY(frame) + 31.85) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.42, CGRectGetMinY(frame) + 31.29)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 29)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.29, CGRectGetMinY(frame) + 16.23) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10, CGRectGetMinY(frame) + 29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 13.77, CGRectGetMinY(frame) + 20.64)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 26.75, CGRectGetMinY(frame) + 14.13) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.34, CGRectGetMinY(frame) + 14)];
        [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44.75, CGRectGetMinY(frame) + 16.02) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.66, CGRectGetMinY(frame) + 14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44.85, CGRectGetMinY(frame) + 15.29)];
        [bezier3Path closePath];
        [color4 setFill];
        [bezier3Path fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 33)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 36) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 16.18, CGRectGetMinY(frame) + 32.86)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19, CGRectGetMinY(frame) + 40) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.82, CGRectGetMinY(frame) + 39.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.5, CGRectGetMinY(frame) + 40)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 36) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 40) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.85, CGRectGetMinY(frame) + 36)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 46) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 24.15, CGRectGetMinY(frame) + 36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 24.85, CGRectGetMinY(frame) + 43.36)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.65, CGRectGetMinY(frame) + 56.97) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 25.15, CGRectGetMinY(frame) + 48.64) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.5, CGRectGetMinY(frame) + 56.97)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 46) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31.8, CGRectGetMinY(frame) + 56.97) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 52)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 40) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 40) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 40)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 49) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30, CGRectGetMinY(frame) + 40) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 30.18, CGRectGetMinY(frame) + 49)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 36) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 35.82, CGRectGetMinY(frame) + 49) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32.67, CGRectGetMinY(frame) + 36)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 49) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 41.33, CGRectGetMinY(frame) + 36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 44.53)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 63) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 53.47) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 58.86)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 69) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 42, CGRectGetMinY(frame) + 67.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42.67, CGRectGetMinY(frame) + 69)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 63) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45.33, CGRectGetMinY(frame) + 69) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 67.25)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 45, CGRectGetMinY(frame) + 49) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 47, CGRectGetMinY(frame) + 58.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 45, CGRectGetMinY(frame) + 58)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 50, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 45, CGRectGetMinY(frame) + 40) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 47.84, CGRectGetMinY(frame) + 33)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 52, CGRectGetMinY(frame) + 36) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 52.16, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 50.5, CGRectGetMinY(frame) + 36)];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 53.5, CGRectGetMinY(frame) + 36) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 33)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 29)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 29)];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 33)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        [bezierPath addClip];
        CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
        CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 44, CGRectGetHeight(bezierBounds) / 40);
        CGContextDrawRadialGradient(context, firGradient,
                                    CGPointMake(CGRectGetMidX(bezierBounds) + 6.35 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 26.36 * bezierResizeRatio), 28.07 * bezierResizeRatio,
                                    CGPointMake(CGRectGetMidX(bezierBounds) + 0 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 15.69 * bezierResizeRatio), 70.01 * bezierResizeRatio,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        ////// Bezier Inner Shadow
        CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -glowBlurRadius, -glowBlurRadius);
        bezierBorderRect = CGRectOffset(bezierBorderRect, -glowOffset.width, -glowOffset.height);
        bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
        
        UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
        [bezierNegativePath appendPath: bezierPath];
        bezierNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = glowOffset.width + round(bezierBorderRect.size.width);
            CGFloat yOffset = glowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        glowBlurRadius,
                                        glow.CGColor);
            
            [bezierPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
            [bezierNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [bezierNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 14)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44.72, CGRectGetMinY(frame) + 14.52) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 18)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 17) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 35.45, CGRectGetMinY(frame) + 17)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 18) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 30.55, CGRectGetMinY(frame) + 17) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 18)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22, CGRectGetMinY(frame) + 18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.21, CGRectGetMinY(frame) + 14.57)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 33, CGRectGetMinY(frame) + 12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.75, CGRectGetMinY(frame) + 12.75) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.34, CGRectGetMinY(frame) + 12)];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 44, CGRectGetMinY(frame) + 14) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 37.66, CGRectGetMinY(frame) + 12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 42.25, CGRectGetMinY(frame) + 12.75)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        [bezier2Path addClip];
        CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
        CGContextDrawLinearGradient(context, secGradient,
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.85 * CGRectGetWidth(bezier2Bounds) / 22.67, CGRectGetMidY(bezier2Bounds) + -12.33 * CGRectGetHeight(bezier2Bounds) / 6),
                                    CGPointMake(CGRectGetMidX(bezier2Bounds) + 1.02 * CGRectGetWidth(bezier2Bounds) / 22.67, CGRectGetMidY(bezier2Bounds) + 11.33 * CGRectGetHeight(bezier2Bounds) / 6),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(secGradient);
    CGGradientRelease(firGradient);
    CGColorSpaceRelease(colorSpace);
    
 
}
@end
