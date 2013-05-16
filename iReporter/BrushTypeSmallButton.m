//
//  BrushTypeButtonSmall.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BrushTypeSmallButton.h"

@implementation BrushTypeSmallButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
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
@end
