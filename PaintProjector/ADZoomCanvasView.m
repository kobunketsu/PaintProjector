//
//  ZoomCanvasView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADZoomCanvasView.h"

@implementation ADZoomCanvasView

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
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(11.49, 11.47)];
    [bezier4Path addCurveToPoint: CGPointMake(11.49, 26.27) controlPoint1: CGPointMake(7.39, 15.56) controlPoint2: CGPointMake(7.39, 22.19)];
    [bezier4Path addCurveToPoint: CGPointMake(25.82, 26.75) controlPoint1: CGPointMake(15.42, 30.19) controlPoint2: CGPointMake(21.69, 30.35)];
    [bezier4Path addLineToPoint: CGPointMake(26.92, 25.63)];
    [bezier4Path addCurveToPoint: CGPointMake(26.33, 11.47) controlPoint1: CGPointMake(30.41, 21.52) controlPoint2: CGPointMake(30.22, 15.35)];
    [bezier4Path addCurveToPoint: CGPointMake(11.49, 11.47) controlPoint1: CGPointMake(22.23, 7.38) controlPoint2: CGPointMake(15.59, 7.38)];
    [bezier4Path closePath];
    [bezier4Path moveToPoint: CGPointMake(29.45, 8.36)];
    [bezier4Path addCurveToPoint: CGPointMake(30.63, 28.06) controlPoint1: CGPointMake(34.85, 13.74) controlPoint2: CGPointMake(35.24, 22.23)];
    [bezier4Path addLineToPoint: CGPointMake(46.35, 44.2)];
    [bezier4Path addLineToPoint: CGPointMake(43.24, 47.35)];
    [bezier4Path addLineToPoint: CGPointMake(27.4, 31.1)];
    [bezier4Path addCurveToPoint: CGPointMake(8.37, 29.39) controlPoint1: CGPointMake(21.59, 35.13) controlPoint2: CGPointMake(13.55, 34.56)];
    [bezier4Path addCurveToPoint: CGPointMake(8.37, 8.36) controlPoint1: CGPointMake(2.54, 23.58) controlPoint2: CGPointMake(2.54, 14.16)];
    [bezier4Path addCurveToPoint: CGPointMake(29.45, 8.36) controlPoint1: CGPointMake(14.19, 2.55) controlPoint2: CGPointMake(23.63, 2.55)];
    [bezier4Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
    [color setFill];
    [bezier4Path fill];
    CGContextRestoreGState(context);
    
    
    

}


@end
