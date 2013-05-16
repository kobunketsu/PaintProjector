//
//  BrushTypeButton.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-1.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "BrushTypeButton.h"

@implementation BrushTypeButton
@synthesize brush;
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
    switch (self.brush.type) {
        case BrushType_Pencil:
            [self drawPencil];
            break;
            
        case BrushType_Eraser:
            [self drawEraser];
            break;
            
        case BrushType_Pen:
            [self drawPen];
            break;
            
        case BrushType_Marker:
            [self drawMarker];
            break;
            
        case BrushType_Finger:
            [self drawFinger];
            break;
            
        default:
            break;
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
    CGFloat shadowBlurRadius = 50;
    
    //// Pencil
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(67, 59.5, 14, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [color setFill];
        [roundedRectanglePath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(81, 59.5, 10, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [color4 setFill];
        [roundedRectangle2Path fill];
        
        
        //// Rounded Rectangle 3 Drawing
        UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(57, 59, 10, 72) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(4, 4)];
        [color4 setFill];
        [roundedRectangle3Path fill];
        
        
        //// Bezier 5 Drawing
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(89.56, 58.11)];
        [bezier5Path addCurveToPoint: CGPointMake(86.24, 56.77) controlPoint1: CGPointMake(88.7, 57.28) controlPoint2: CGPointMake(87.53, 56.77)];
        [bezier5Path addCurveToPoint: CGPointMake(82.08, 59.21) controlPoint1: CGPointMake(84.45, 56.77) controlPoint2: CGPointMake(82.89, 57.75)];
        [bezier5Path addCurveToPoint: CGPointMake(76.04, 56.09) controlPoint1: CGPointMake(80.77, 57.34) controlPoint2: CGPointMake(78.2, 56.09)];
        [bezier5Path addLineToPoint: CGPointMake(71.96, 56.09)];
        [bezier5Path addCurveToPoint: CGPointMake(66.12, 58.94) controlPoint1: CGPointMake(69.89, 56.09) controlPoint2: CGPointMake(67.45, 57.24)];
        [bezier5Path addCurveToPoint: CGPointMake(61.76, 56.09) controlPoint1: CGPointMake(65.39, 57.26) controlPoint2: CGPointMake(63.71, 56.09)];
        [bezier5Path addCurveToPoint: CGPointMake(57.11, 59.82) controlPoint1: CGPointMake(59.48, 56.09) controlPoint2: CGPointMake(57.58, 57.68)];
        [bezier5Path addLineToPoint: CGPointMake(57, 59.82)];
        [bezier5Path addLineToPoint: CGPointMake(66.52, 28.3)];
        [bezier5Path addLineToPoint: CGPointMake(79.65, 28.3)];
        [bezier5Path addLineToPoint: CGPointMake(89.56, 58.11)];
        [bezier5Path closePath];
        [color6 setFill];
        [bezier5Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(77.83, 25.59)];
        [bezier2Path addLineToPoint: CGPointMake(67.88, 25.59)];
        [bezier2Path addLineToPoint: CGPointMake(72.86, 10)];
        [bezier2Path addLineToPoint: CGPointMake(77.83, 25.59)];
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
    CGSize shadowOffset = CGSizeMake(0.1, 20.1);
    CGFloat shadowBlurRadius = 50;
    
    //// Pen
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 4 Drawing
        UIBezierPath* roundedRectangle4Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(60, 70, 26, 5) cornerRadius: 2.5];
        [color5 setFill];
        [roundedRectangle4Path fill];
        
        
        //// Rounded Rectangle 5 Drawing
        UIBezierPath* roundedRectangle5Path = [UIBezierPath bezierPath];
        [roundedRectangle5Path moveToPoint: CGPointMake(60.34, 118.72)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(61.69, 120) controlPoint1: CGPointMake(60.34, 119.43) controlPoint2: CGPointMake(60.95, 120)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(84.54, 120)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(85.88, 118.72) controlPoint1: CGPointMake(85.28, 120) controlPoint2: CGPointMake(85.88, 119.43)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(83.19, 76.64)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(81.85, 75.36) controlPoint1: CGPointMake(83.19, 75.93) controlPoint2: CGPointMake(82.59, 75.36)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(64.38, 75.36)];
        [roundedRectangle5Path addCurveToPoint: CGPointMake(63.03, 76.64) controlPoint1: CGPointMake(63.63, 75.36) controlPoint2: CGPointMake(63.03, 75.93)];
        [roundedRectangle5Path addLineToPoint: CGPointMake(60.34, 118.72)];
        [roundedRectangle5Path closePath];
        [color setFill];
        [roundedRectangle5Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(72.44, 42.31)];
        [bezier2Path addCurveToPoint: CGPointMake(70.62, 43.2) controlPoint1: CGPointMake(71.78, 42.42) controlPoint2: CGPointMake(71.14, 42.72)];
        [bezier2Path addCurveToPoint: CGPointMake(70.62, 47.72) controlPoint1: CGPointMake(69.31, 44.45) controlPoint2: CGPointMake(69.31, 46.47)];
        [bezier2Path addCurveToPoint: CGPointMake(75.38, 47.72) controlPoint1: CGPointMake(71.94, 48.97) controlPoint2: CGPointMake(74.06, 48.97)];
        [bezier2Path addCurveToPoint: CGPointMake(75.38, 43.2) controlPoint1: CGPointMake(76.69, 46.47) controlPoint2: CGPointMake(76.69, 44.45)];
        [bezier2Path addCurveToPoint: CGPointMake(73.56, 42.31) controlPoint1: CGPointMake(74.86, 42.72) controlPoint2: CGPointMake(74.22, 42.42)];
        [bezier2Path addLineToPoint: CGPointMake(73.56, 5.6)];
        [bezier2Path addCurveToPoint: CGPointMake(74.9, 7.55) controlPoint1: CGPointMake(74.06, 5.92) controlPoint2: CGPointMake(74.54, 6.48)];
        [bezier2Path addCurveToPoint: CGPointMake(79.99, 23.98) controlPoint1: CGPointMake(76.37, 11.88) controlPoint2: CGPointMake(78.31, 19.18)];
        [bezier2Path addCurveToPoint: CGPointMake(87, 38.04) controlPoint1: CGPointMake(82.86, 32.2) controlPoint2: CGPointMake(87, 38.04)];
        [bezier2Path addCurveToPoint: CGPointMake(86.44, 54.8) controlPoint1: CGPointMake(87, 38.04) controlPoint2: CGPointMake(86.73, 47.23)];
        [bezier2Path addCurveToPoint: CGPointMake(84.31, 69.41) controlPoint1: CGPointMake(86.14, 62.38) controlPoint2: CGPointMake(84.31, 69.41)];
        [bezier2Path addLineToPoint: CGPointMake(63.03, 69.41)];
        [bezier2Path addCurveToPoint: CGPointMake(60.7, 54.85) controlPoint1: CGPointMake(63.03, 69.41) controlPoint2: CGPointMake(61.57, 62.43)];
        [bezier2Path addCurveToPoint: CGPointMake(59, 38.04) controlPoint1: CGPointMake(59.82, 47.28) controlPoint2: CGPointMake(59, 38.04)];
        [bezier2Path addCurveToPoint: CGPointMake(66.01, 23.98) controlPoint1: CGPointMake(59, 38.04) controlPoint2: CGPointMake(62.85, 33.29)];
        [bezier2Path addCurveToPoint: CGPointMake(71.1, 7.55) controlPoint1: CGPointMake(67.82, 18.67) controlPoint2: CGPointMake(70.01, 11.67)];
        [bezier2Path addCurveToPoint: CGPointMake(72.44, 5.47) controlPoint1: CGPointMake(71.45, 6.19) controlPoint2: CGPointMake(71.97, 5.65)];
        [bezier2Path addLineToPoint: CGPointMake(72.44, 42.31)];
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
    CGSize shadowOffset = CGSizeMake(0.1, 50.1);
    CGFloat shadowBlurRadius = 50;
    
    //// Eraser
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rounded Rectangle 6 Drawing
        UIBezierPath* roundedRectangle6Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(51, 36, 34, 78) byRoundingCorners: UIRectCornerTopLeft cornerRadii: CGSizeMake(2, 2)];
        [color setFill];
        [roundedRectangle6Path fill];
        
        
        //// Rounded Rectangle 7 Drawing
        UIBezierPath* roundedRectangle7Path = [UIBezierPath bezierPath];
        [roundedRectangle7Path moveToPoint: CGPointMake(54.41, 33.85)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(85.08, 33.85)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(85.08, 10.01)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(68.21, 10.01)];
        [roundedRectangle7Path addCurveToPoint: CGPointMake(54.41, 21.93) controlPoint1: CGPointMake(60.59, 10.01) controlPoint2: CGPointMake(54.41, 15.35)];
        [roundedRectangle7Path addLineToPoint: CGPointMake(54.41, 33.85)];
        [roundedRectangle7Path closePath];
        [head setFill];
        [roundedRectangle7Path fill];
        
        
        //// Rounded Rectangle 8 Drawing
        UIBezierPath* roundedRectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(85, 36, 11, 78)];
        [headSide setFill];
        [roundedRectangle8Path fill];
        
        
        //// Rounded Rectangle 9 Drawing
        UIBezierPath* roundedRectangle9Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(85, 10, 11, 25) byRoundingCorners: UIRectCornerTopRight cornerRadii: CGSizeMake(5.5, 5.5)];
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
    CGFloat shadowBlurRadius = 50;
    
    //// Marker
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(81.76, 16)];
        [bezierPath addCurveToPoint: CGPointMake(84.15, 28.55) controlPoint1: CGPointMake(83.35, 19.47) controlPoint2: CGPointMake(84.15, 24.01)];
        [bezierPath addLineToPoint: CGPointMake(67.85, 28.55)];
        [bezierPath addCurveToPoint: CGPointMake(70.24, 16) controlPoint1: CGPointMake(67.85, 24.01) controlPoint2: CGPointMake(68.65, 19.47)];
        [bezierPath addCurveToPoint: CGPointMake(81.76, 16) controlPoint1: CGPointMake(73.42, 9.07) controlPoint2: CGPointMake(78.58, 9.07)];
        [bezierPath closePath];
        [color5 setFill];
        [bezierPath fill];
        
        
        //// Rounded Rectangle 2 Drawing
        UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPath];
        [roundedRectangle2Path moveToPoint: CGPointMake(62.29, 50.74)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(58.07, 70.68)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(61.33, 73.57) controlPoint1: CGPointMake(58.07, 72.28) controlPoint2: CGPointMake(59.53, 73.57)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(90.67, 73.57)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(93.93, 70.68) controlPoint1: CGPointMake(92.47, 73.57) controlPoint2: CGPointMake(93.93, 72.28)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(89.68, 50.54)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(89.04, 34.66)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(85.78, 31.78) controlPoint1: CGPointMake(89.04, 33.07) controlPoint2: CGPointMake(87.58, 31.78)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(66.22, 31.78)];
        [roundedRectangle2Path addCurveToPoint: CGPointMake(62.96, 34.66) controlPoint1: CGPointMake(64.42, 31.78) controlPoint2: CGPointMake(62.96, 33.07)];
        [roundedRectangle2Path addLineToPoint: CGPointMake(62.29, 50.74)];
        [roundedRectangle2Path closePath];
        [color4 setFill];
        [roundedRectangle2Path fill];
        
        
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPath];
        [roundedRectanglePath moveToPoint: CGPointMake(56.44, 97.96)];
        [roundedRectanglePath addLineToPoint: CGPointMake(56.44, 121.97)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(59.7, 125.19) controlPoint1: CGPointMake(56.44, 123.75) controlPoint2: CGPointMake(57.9, 125.19)];
        [roundedRectanglePath addLineToPoint: CGPointMake(92.3, 125.19)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(95.56, 121.97) controlPoint1: CGPointMake(94.1, 125.19) controlPoint2: CGPointMake(95.56, 123.75)];
        [roundedRectanglePath addLineToPoint: CGPointMake(95.56, 97.92)];
        [roundedRectanglePath addLineToPoint: CGPointMake(97.19, 76.79)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(93.93, 73.57) controlPoint1: CGPointMake(97.19, 75.01) controlPoint2: CGPointMake(95.73, 73.57)];
        [roundedRectanglePath addLineToPoint: CGPointMake(58.07, 73.57)];
        [roundedRectanglePath addCurveToPoint: CGPointMake(54.81, 76.79) controlPoint1: CGPointMake(56.27, 73.57) controlPoint2: CGPointMake(54.81, 75.01)];
        [roundedRectanglePath addLineToPoint: CGPointMake(56.44, 97.96)];
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
    CGFloat shadowBlurRadius = 50;
    
    //// Finger
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(83.77, 11.64)];
        [bezierPath addCurveToPoint: CGPointMake(89.22, 15.18) controlPoint1: CGPointMake(86.17, 12.8) controlPoint2: CGPointMake(88.13, 12.32)];
        [bezierPath addCurveToPoint: CGPointMake(90.17, 23.18) controlPoint1: CGPointMake(89.83, 16.78) controlPoint2: CGPointMake(90.17, 21.3)];
        [bezierPath addLineToPoint: CGPointMake(91.55, 40.18)];
        [bezierPath addLineToPoint: CGPointMake(86.63, 37.44)];
        [bezierPath addCurveToPoint: CGPointMake(81.21, 24.55) controlPoint1: CGPointMake(84.4, 37.44) controlPoint2: CGPointMake(81.21, 27.29)];
        [bezierPath addLineToPoint: CGPointMake(82.59, 15.12)];
        [bezierPath addCurveToPoint: CGPointMake(83.75, 11.63) controlPoint1: CGPointMake(82.59, 13.76) controlPoint2: CGPointMake(83.03, 12.53)];
        [bezierPath addLineToPoint: CGPointMake(83.77, 11.64)];
        [bezierPath closePath];
        [color6 setFill];
        [bezierPath fill];
        
        
        //// Bezier 4 Drawing
        UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
        [bezier4Path moveToPoint: CGPointMake(77.71, 10.68)];
        [bezier4Path addCurveToPoint: CGPointMake(82.8, 11.63) controlPoint1: CGPointMake(79.54, 10.69) controlPoint2: CGPointMake(81.24, 11.02)];
        [bezier4Path addCurveToPoint: CGPointMake(81.21, 15.49) controlPoint1: CGPointMake(81.81, 12.62) controlPoint2: CGPointMake(81.21, 13.98)];
        [bezier4Path addLineToPoint: CGPointMake(79.83, 25.08)];
        [bezier4Path addLineToPoint: CGPointMake(81.21, 34.69)];
        [bezier4Path addCurveToPoint: CGPointMake(83.97, 40.18) controlPoint1: CGPointMake(83.26, 38.29) controlPoint2: CGPointMake(82.24, 37.42)];
        [bezier4Path addLineToPoint: CGPointMake(91.55, 44.29)];
        [bezier4Path addLineToPoint: CGPointMake(92.93, 62.08)];
        [bezier4Path addCurveToPoint: CGPointMake(91.55, 67.63) controlPoint1: CGPointMake(92.93, 62.08) controlPoint2: CGPointMake(93.35, 59.32)];
        [bezier4Path addCurveToPoint: CGPointMake(90.92, 71.76) controlPoint1: CGPointMake(91.23, 69.13) controlPoint2: CGPointMake(91.03, 70.49)];
        [bezier4Path addCurveToPoint: CGPointMake(82.59, 68.99) controlPoint1: CGPointMake(88.71, 70.9) controlPoint2: CGPointMake(85.78, 70.95)];
        [bezier4Path addCurveToPoint: CGPointMake(72.93, 60.76) controlPoint1: CGPointMake(75.77, 64.81) controlPoint2: CGPointMake(72.93, 60.76)];
        [bezier4Path addCurveToPoint: CGPointMake(82.59, 71.73) controlPoint1: CGPointMake(72.93, 60.76) controlPoint2: CGPointMake(75.48, 66.22)];
        [bezier4Path addCurveToPoint: CGPointMake(90.95, 75.61) controlPoint1: CGPointMake(85.88, 74.28) controlPoint2: CGPointMake(88.78, 74.57)];
        [bezier4Path addCurveToPoint: CGPointMake(92.64, 88.47) controlPoint1: CGPointMake(91.28, 79.07) controlPoint2: CGPointMake(92.11, 83.78)];
        [bezier4Path addCurveToPoint: CGPointMake(92.93, 102.75) controlPoint1: CGPointMake(93.6, 96.95) controlPoint2: CGPointMake(92.17, 97.5)];
        [bezier4Path addCurveToPoint: CGPointMake(94.31, 116.31) controlPoint1: CGPointMake(93.69, 107.99) controlPoint2: CGPointMake(94.31, 116.31)];
        [bezier4Path addLineToPoint: CGPointMake(57.07, 116.31)];
        [bezier4Path addLineToPoint: CGPointMake(55.13, 108.11)];
        [bezier4Path addCurveToPoint: CGPointMake(55.69, 89.3) controlPoint1: CGPointMake(55.13, 108.11) controlPoint2: CGPointMake(54.86, 99.63)];
        [bezier4Path addCurveToPoint: CGPointMake(58.45, 66.8) controlPoint1: CGPointMake(56.52, 78.98) controlPoint2: CGPointMake(58.45, 66.8)];
        [bezier4Path addLineToPoint: CGPointMake(55.69, 61.42)];
        [bezier4Path addCurveToPoint: CGPointMake(57.07, 41.77) controlPoint1: CGPointMake(55.69, 61.42) controlPoint2: CGPointMake(55.69, 51.03)];
        [bezier4Path addCurveToPoint: CGPointMake(61.21, 24.4) controlPoint1: CGPointMake(58.45, 32.52) controlPoint2: CGPointMake(61.21, 24.4)];
        [bezier4Path addCurveToPoint: CGPointMake(69.48, 13.43) controlPoint1: CGPointMake(64.87, 16.63) controlPoint2: CGPointMake(65.34, 16.86)];
        [bezier4Path addCurveToPoint: CGPointMake(77.76, 10.69) controlPoint1: CGPointMake(73.62, 10) controlPoint2: CGPointMake(77.76, 10.69)];
        [bezier4Path addLineToPoint: CGPointMake(77.71, 10.68)];
        [bezier4Path closePath];
        [color setFill];
        [bezier4Path fill];
        
        
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(74.97, 10.82)];
        [bezier7Path addCurveToPoint: CGPointMake(77.55, 17.04) controlPoint1: CGPointMake(76.43, 12.52) controlPoint2: CGPointMake(77.57, 14.63)];
        [bezier7Path addCurveToPoint: CGPointMake(71.75, 30.98) controlPoint1: CGPointMake(77.51, 23.72) controlPoint2: CGPointMake(72.3, 20.98)];
        [bezier7Path addCurveToPoint: CGPointMake(60.84, 42.82) controlPoint1: CGPointMake(71.19, 40.98) controlPoint2: CGPointMake(65.76, 35.01)];
        [bezier7Path addCurveToPoint: CGPointMake(56.42, 47.09) controlPoint1: CGPointMake(59.59, 44.81) controlPoint2: CGPointMake(58.04, 46.17)];
        [bezier7Path addCurveToPoint: CGPointMake(57.07, 41.77) controlPoint1: CGPointMake(56.59, 45.33) controlPoint2: CGPointMake(56.81, 43.53)];
        [bezier7Path addCurveToPoint: CGPointMake(61.21, 24.4) controlPoint1: CGPointMake(58.45, 32.52) controlPoint2: CGPointMake(61.21, 24.4)];
        [bezier7Path addCurveToPoint: CGPointMake(69.48, 13.43) controlPoint1: CGPointMake(64.87, 16.63) controlPoint2: CGPointMake(65.34, 16.86)];
        [bezier7Path addCurveToPoint: CGPointMake(74.96, 10.81) controlPoint1: CGPointMake(71.46, 11.79) controlPoint2: CGPointMake(73.44, 11.09)];
        [bezier7Path addLineToPoint: CGPointMake(74.97, 10.82)];
        [bezier7Path closePath];
        [color5 setFill];
        [bezier7Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}
@end
