//
//  ADLaunchLogoView_a_Draw.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_a_Draw.h"

@implementation ADLaunchLogoView_a_Draw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)initCustom{
    [super initCustom];
    self.layer.shadowColor = [UIColor colorWithWhite:0.365 alpha:1.000].CGColor;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame_a_Draw:rect];
}


- (void)drawCanvas1WithFrame_a_Draw: (CGRect)frame_a_Draw;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gray = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* innerEdge = [white colorWithAlphaComponent: 0.5];
    CGSize innerEdgeOffset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdgeBlurRadius = 2;
    
    //// title
    {
        //// a_Draw 2 Drawing
        UIBezierPath* a_Draw2Path = UIBezierPath.bezierPath;
        [a_Draw2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 58, CGRectGetMinY(frame_a_Draw) + 58)];
        [a_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 48.86, CGRectGetMinY(frame_a_Draw) + 58)];
        [a_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 48.86, CGRectGetMinY(frame_a_Draw) + 47.99)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 28.25, CGRectGetMinY(frame_a_Draw) + 57.81) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 42.89, CGRectGetMinY(frame_a_Draw) + 54.54) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 36.02, CGRectGetMinY(frame_a_Draw) + 57.81)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 8.29, CGRectGetMinY(frame_a_Draw) + 49.24) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 20.47, CGRectGetMinY(frame_a_Draw) + 57.81) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 13.82, CGRectGetMinY(frame_a_Draw) + 54.95)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw), CGRectGetMinY(frame_a_Draw) + 28.8) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 2.76, CGRectGetMinY(frame_a_Draw) + 43.53) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw), CGRectGetMinY(frame_a_Draw) + 36.72)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 8.34, CGRectGetMinY(frame_a_Draw) + 8.47) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw), CGRectGetMinY(frame_a_Draw) + 20.89) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 2.78, CGRectGetMinY(frame_a_Draw) + 14.11)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 28.7, CGRectGetMinY(frame_a_Draw)) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 13.91, CGRectGetMinY(frame_a_Draw) + 2.82) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 20.69, CGRectGetMinY(frame_a_Draw))];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 48.86, CGRectGetMinY(frame_a_Draw) + 9.72) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 36.71, CGRectGetMinY(frame_a_Draw)) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 43.43, CGRectGetMinY(frame_a_Draw) + 3.24)];
        [a_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 48.86, CGRectGetMinY(frame_a_Draw) + 0.41)];
        [a_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 58, CGRectGetMinY(frame_a_Draw) + 0.41)];
        [a_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 58, CGRectGetMinY(frame_a_Draw) + 58)];
        [a_Draw2Path closePath];
        [a_Draw2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 28.85, CGRectGetMinY(frame_a_Draw) + 50.1)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 43.23, CGRectGetMinY(frame_a_Draw) + 44.08) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 34.41, CGRectGetMinY(frame_a_Draw) + 50.1) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 39.21, CGRectGetMinY(frame_a_Draw) + 48.09)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 49.26, CGRectGetMinY(frame_a_Draw) + 29.11) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 47.25, CGRectGetMinY(frame_a_Draw) + 40.08) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 49.26, CGRectGetMinY(frame_a_Draw) + 35.08)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 43.33, CGRectGetMinY(frame_a_Draw) + 14.08) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 49.26, CGRectGetMinY(frame_a_Draw) + 23.13) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 47.28, CGRectGetMinY(frame_a_Draw) + 18.12)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 28.8, CGRectGetMinY(frame_a_Draw) + 8.02) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 39.37, CGRectGetMinY(frame_a_Draw) + 10.04) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 34.53, CGRectGetMinY(frame_a_Draw) + 8.02)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 14.28, CGRectGetMinY(frame_a_Draw) + 14.28) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 23.07, CGRectGetMinY(frame_a_Draw) + 8.02) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 18.23, CGRectGetMinY(frame_a_Draw) + 10.1)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 8.34, CGRectGetMinY(frame_a_Draw) + 29.06) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 10.32, CGRectGetMinY(frame_a_Draw) + 18.45) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 8.34, CGRectGetMinY(frame_a_Draw) + 23.38)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 14.38, CGRectGetMinY(frame_a_Draw) + 43.83) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 8.34, CGRectGetMinY(frame_a_Draw) + 34.73) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 10.35, CGRectGetMinY(frame_a_Draw) + 39.66)];
        [a_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a_Draw) + 28.85, CGRectGetMinY(frame_a_Draw) + 50.1) controlPoint1: CGPointMake(CGRectGetMinX(frame_a_Draw) + 18.4, CGRectGetMinY(frame_a_Draw) + 48.01) controlPoint2: CGPointMake(CGRectGetMinX(frame_a_Draw) + 23.22, CGRectGetMinY(frame_a_Draw) + 50.1)];
        [a_Draw2Path closePath];
        [gray setFill];
        [a_Draw2Path fill];
        
        ////// a_Draw 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(a_Draw2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [a_Draw2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
}



@end
