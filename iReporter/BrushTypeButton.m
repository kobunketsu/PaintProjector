//
//  BrushTypeButton.m
//  iReporter
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
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color7 = [UIColor colorWithRed: 0.818 green: 0.643 blue: 0.48 alpha: 1];
    CGFloat color7HSBA[4];
    [color7 getHue: &color7HSBA[0] saturation: &color7HSBA[1] brightness: &color7HSBA[2] alpha: &color7HSBA[3]];
    
    UIColor* color6 = [UIColor colorWithHue: color7HSBA[0] saturation: color7HSBA[1] brightness: 0.6 alpha: color7HSBA[3]];
    UIColor* color8 = [UIColor colorWithHue: color7HSBA[0] saturation: color7HSBA[1] brightness: 1 alpha: color7HSBA[3]];
    
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
        [bezierPath moveToPoint: CGPointMake(54, 40)];
        [bezierPath addCurveToPoint: CGPointMake(47.5, 57.5) controlPoint1: CGPointMake(49.62, 48.62) controlPoint2: CGPointMake(47.5, 57.5)];
        [bezierPath addLineToPoint: CGPointMake(17.5, 57.5)];
        [bezierPath addCurveToPoint: CGPointMake(12.32, 40.37) controlPoint1: CGPointMake(17.5, 57.5) controlPoint2: CGPointMake(16.19, 48.99)];
        [bezierPath addCurveToPoint: CGPointMake(2, 23) controlPoint1: CGPointMake(8.44, 31.74) controlPoint2: CGPointMake(2.09, 23.13)];
        [bezierPath addCurveToPoint: CGPointMake(16.95, 8.5) controlPoint1: CGPointMake(1.96, 14.56) controlPoint2: CGPointMake(16.95, 8.5)];
        [bezierPath addLineToPoint: CGPointMake(21.08, 21)];
        [bezierPath addLineToPoint: CGPointMake(21.08, 20.94)];
        [bezierPath addLineToPoint: CGPointMake(20.95, 6.5)];
        [bezierPath addLineToPoint: CGPointMake(24, 5.5)];
        [bezierPath addLineToPoint: CGPointMake(30, 25)];
        [bezierPath addLineToPoint: CGPointMake(30, 25)];
        [bezierPath addLineToPoint: CGPointMake(26, 5.5)];
        [bezierPath addLineToPoint: CGPointMake(38, 5.5)];
        [bezierPath addLineToPoint: CGPointMake(36, 23)];
        [bezierPath addLineToPoint: CGPointMake(36, 23)];
        [bezierPath addLineToPoint: CGPointMake(38, 5.5)];
        [bezierPath addLineToPoint: CGPointMake(44.97, 6.5)];
        [bezierPath addLineToPoint: CGPointMake(43, 22)];
        [bezierPath addLineToPoint: CGPointMake(43, 22)];
        [bezierPath addLineToPoint: CGPointMake(47.97, 7.5)];
        [bezierPath addCurveToPoint: CGPointMake(65, 23) controlPoint1: CGPointMake(47.97, 7.5) controlPoint2: CGPointMake(63.74, 13.12)];
        [bezierPath addCurveToPoint: CGPointMake(54, 40) controlPoint1: CGPointMake(64.91, 23.97) controlPoint2: CGPointMake(58.38, 31.38)];
        [bezierPath closePath];
        [color6 setFill];
        [bezierPath fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(22.34, 115.8)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(23.69, 117.5) controlPoint1: CGPointMake(22.34, 116.74) controlPoint2: CGPointMake(22.95, 117.5)];
        [roundedRectanglePath addLineToPoint: CGPointMake(42.54, 117.5)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(43.88, 115.8) controlPoint1: CGPointMake(43.28, 117.5) controlPoint2: CGPointMake(43.88, 116.74)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(47, 80) controlPoint1: CGPointMake(43.88, 115.8) controlPoint2: CGPointMake(46.76, 94.48)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(46.85, 57.86) controlPoint1: CGPointMake(47.24, 65.52) controlPoint2: CGPointMake(46.85, 57.86)];
        [roundedRectanglePath addLineToPoint: CGPointMake(18.38, 57.86)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(18.44, 79.86) controlPoint1: CGPointMake(18.38, 57.86) controlPoint2: CGPointMake(17.95, 65.38)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(22.34, 115.8) controlPoint1: CGPointMake(18.93, 94.35) controlPoint2: CGPointMake(22.34, 115.8)];
        [roundedRectanglePath closePath];
        [color8 setFill];
        [roundedRectanglePath fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    

}

- (void)drawAirBrush{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.161 green: 0.161 blue: 0.161 alpha: 1];
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
        
        
        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPath];
        [rectangle3Path moveToPoint: CGPointMake(12.5, 58.5)];
        [rectangle3Path addLineToPoint: CGPointMake(51.5, 60.5)];
        [rectangle3Path addLineToPoint: CGPointMake(51.5, 52.5)];
        [rectangle3Path addLineToPoint: CGPointMake(12.5, 54.5)];
        [rectangle3Path addLineToPoint: CGPointMake(12.5, 58.5)];
        [rectangle3Path closePath];
        [colorShadow setFill];
        [rectangle3Path fill];
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
        [rectanglePath moveToPoint: CGPointMake(52, 67)];
        [rectanglePath addLineToPoint: CGPointMake(54.5, 67)];
        [rectanglePath addCurveToPoint: CGPointMake(57, 63.5) controlPoint1: CGPointMake(56.43, 67) controlPoint2: CGPointMake(57, 65.43)];
        [rectanglePath addLineToPoint: CGPointMake(57, 49.5)];
        [rectanglePath addCurveToPoint: CGPointMake(54.5, 46) controlPoint1: CGPointMake(57, 47.57) controlPoint2: CGPointMake(56.43, 46)];
        [rectanglePath addLineToPoint: CGPointMake(52, 46)];
        [rectanglePath addLineToPoint: CGPointMake(52, 67)];
        [rectanglePath closePath];
        [colorShadow setFill];
        [rectanglePath fill];
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(16.58, 48)];
        [rectangle2Path addLineToPoint: CGPointMake(46, 48)];
        [rectangle2Path addLineToPoint: CGPointMake(38, 10)];
        [rectangle2Path addLineToPoint: CGPointMake(23, 10)];
        [rectangle2Path addLineToPoint: CGPointMake(16.58, 48)];
        [rectangle2Path closePath];
        [colorShadow setFill];
        [rectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(15, 50, 32, 50) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(3, 3)];
        [colorHighlight setFill];
        [roundedRectanglePath fill];
        
        
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPath];
        [rectangle4Path moveToPoint: CGPointMake(25, 10)];
        [rectangle4Path addLineToPoint: CGPointMake(36, 10)];
        [rectangle4Path addLineToPoint: CGPointMake(35, 2)];
        [rectangle4Path addLineToPoint: CGPointMake(26, 2)];
        [rectangle4Path addLineToPoint: CGPointMake(25, 10)];
        [rectangle4Path closePath];
        [colorHighlight setFill];
        [rectangle4Path fill];
        
        
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
    UIColor* color = [UIColor colorWithRed: 0.295 green: 0.539 blue: 0.671 alpha: 1];
    CGFloat colorRGBA[4];
    [color getRed: &colorRGBA[0] green: &colorRGBA[1] blue: &colorRGBA[2] alpha: &colorRGBA[3]];
    
    UIColor* color5 = [UIColor colorWithRed: (colorRGBA[0] * 0.3) green: (colorRGBA[1] * 0.3) blue: (colorRGBA[2] * 0.3) alpha: (colorRGBA[3] * 0.3 + 0.7)];
    UIColor* color6 = [UIColor colorWithRed: (colorRGBA[0] * 0.2 + 0.8) green: (colorRGBA[1] * 0.2 + 0.8) blue: (colorRGBA[2] * 0.2 + 0.8) alpha: (colorRGBA[3] * 0.2 + 0.8)];
    
    //// Shadow Declarations
    UIColor* shadow = color;
    CGSize shadowOffset = CGSizeMake(0.1, -0.1);
    CGFloat shadowBlurRadius = 10;
    
    //// Bucket
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPath];
        [rectangle2Path moveToPoint: CGPointMake(18, 68.51)];
        [rectangle2Path addCurveToPoint: CGPointMake(23, 73) controlPoint1: CGPointMake(18, 70.99) controlPoint2: CGPointMake(20.24, 73)];
        [rectangle2Path addLineToPoint: CGPointMake(46, 73)];
        [rectangle2Path addCurveToPoint: CGPointMake(51, 68.51) controlPoint1: CGPointMake(48.76, 73) controlPoint2: CGPointMake(51, 70.99)];
        [rectangle2Path addLineToPoint: CGPointMake(56, 27)];
        [rectangle2Path addLineToPoint: CGPointMake(12, 27)];
        [rectangle2Path addLineToPoint: CGPointMake(18, 68.51)];
        [rectangle2Path closePath];
        [color6 setFill];
        [rectangle2Path fill];
        
        
        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(9, 29, 25, 2)];
        [color5 setFill];
        [rectangle3Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(5, 27, 7, 7) cornerRadius: 3.5];
        [color5 setFill];
        [roundedRectanglePath fill];
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(35.5, 26.5)];
        [bezierPath addCurveToPoint: CGPointMake(56, 23) controlPoint1: CGPointMake(35.5, 26.5) controlPoint2: CGPointMake(39.43, 22.82)];
        [bezierPath addCurveToPoint: CGPointMake(62, 36) controlPoint1: CGPointMake(65.68, 23.1) controlPoint2: CGPointMake(62, 32.63)];
        [bezierPath addCurveToPoint: CGPointMake(61.5, 43.5) controlPoint1: CGPointMake(62, 39.37) controlPoint2: CGPointMake(61.5, 39.77)];
        [bezierPath addCurveToPoint: CGPointMake(54.5, 50.5) controlPoint1: CGPointMake(61.5, 47.23) controlPoint2: CGPointMake(59.28, 50.5)];
        [bezierPath addCurveToPoint: CGPointMake(55.5, 26.5) controlPoint1: CGPointMake(52.82, 50.69) controlPoint2: CGPointMake(55.5, 26.5)];
        [bezierPath addLineToPoint: CGPointMake(35.5, 26.5)];
        [bezierPath closePath];
        [color setFill];
        [bezierPath fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
 
}
@end
