//
//  RotateCanvasView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADRotateCanvasView.h"

@implementation ADRotateCanvasView

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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.57 green: 0.57 blue: 0.57 alpha: 1];
    UIColor* colorGlow = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* glow = colorGlow;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 5;
    
    //// Main
    {
        //// Rotate Drawing
        UIBezierPath* rotatePath = [UIBezierPath bezierPath];
        [rotatePath moveToPoint: CGPointMake(40.54, 7.18)];
        [rotatePath addCurveToPoint: CGPointMake(40.54, 39.29) controlPoint1: CGPointMake(49.12, 16.05) controlPoint2: CGPointMake(49.12, 30.43)];
        [rotatePath addCurveToPoint: CGPointMake(9.44, 39.29) controlPoint1: CGPointMake(31.95, 48.16) controlPoint2: CGPointMake(18.03, 48.16)];
        [rotatePath addCurveToPoint: CGPointMake(9.44, 7.18) controlPoint1: CGPointMake(0.85, 30.43) controlPoint2: CGPointMake(0.85, 16.05)];
        [rotatePath addCurveToPoint: CGPointMake(9.86, 6.76) controlPoint1: CGPointMake(9.58, 7.03) controlPoint2: CGPointMake(9.72, 6.89)];
        [rotatePath addLineToPoint: CGPointMake(8.45, 4.3)];
        [rotatePath addLineToPoint: CGPointMake(12.83, 4.31)];
        [rotatePath addLineToPoint: CGPointMake(13, 4.19)];
        [rotatePath addLineToPoint: CGPointMake(13.09, 4.31)];
        [rotatePath addLineToPoint: CGPointMake(19.21, 4.33)];
        [rotatePath addLineToPoint: CGPointMake(14.03, 14.07)];
        [rotatePath addLineToPoint: CGPointMake(11.95, 10.43)];
        [rotatePath addCurveToPoint: CGPointMake(12.27, 36.37) controlPoint1: CGPointMake(5.24, 17.71) controlPoint2: CGPointMake(5.35, 29.23)];
        [rotatePath addCurveToPoint: CGPointMake(37.71, 36.37) controlPoint1: CGPointMake(19.29, 43.63) controlPoint2: CGPointMake(30.68, 43.63)];
        [rotatePath addCurveToPoint: CGPointMake(37.71, 10.1) controlPoint1: CGPointMake(44.74, 29.12) controlPoint2: CGPointMake(44.74, 17.35)];
        [rotatePath addCurveToPoint: CGPointMake(34.29, 7.33) controlPoint1: CGPointMake(36.66, 9.01) controlPoint2: CGPointMake(35.51, 8.09)];
        [rotatePath addCurveToPoint: CGPointMake(36.69, 4) controlPoint1: CGPointMake(35.14, 6.15) controlPoint2: CGPointMake(35.96, 5.02)];
        [rotatePath addCurveToPoint: CGPointMake(40.54, 7.18) controlPoint1: CGPointMake(38.05, 4.89) controlPoint2: CGPointMake(39.35, 5.95)];
        [rotatePath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        [color setFill];
        [rotatePath fill];
        CGContextRestoreGState(context);
        
    }
    
    

}



@end
