//
//  ADLaunchLogoView_a2_Ana.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_a2_Ana.h"

@implementation ADLaunchLogoView_a2_Ana

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
//    self.layer.shadowColor = [UIColor colorWithWhite:0.365 alpha:1.000].CGColor;
    self.layer.shadowColor = [UIColor colorWithRed:0.200 green:0.200 blue:0.200 alpha:1.000].CGColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame_a2_Ana:rect];
}

- (void)drawCanvas1WithFrame_a2_Ana: (CGRect)frame_a2_Ana;
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
        //// a2_Ana 2 Drawing
        UIBezierPath* a2_Ana2Path = UIBezierPath.bezierPath;
        [a2_Ana2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 58, CGRectGetMinY(frame_a2_Ana) + 58.19)];
        [a2_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 48.86, CGRectGetMinY(frame_a2_Ana) + 58.19)];
        [a2_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 48.86, CGRectGetMinY(frame_a2_Ana) + 48.15)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 28.25, CGRectGetMinY(frame_a2_Ana) + 58) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 42.89, CGRectGetMinY(frame_a2_Ana) + 54.72) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 36.02, CGRectGetMinY(frame_a2_Ana) + 58)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 8.29, CGRectGetMinY(frame_a2_Ana) + 49.41) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 20.47, CGRectGetMinY(frame_a2_Ana) + 58) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 13.82, CGRectGetMinY(frame_a2_Ana) + 55.14)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana), CGRectGetMinY(frame_a2_Ana) + 28.9) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 2.76, CGRectGetMinY(frame_a2_Ana) + 43.68) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana), CGRectGetMinY(frame_a2_Ana) + 36.84)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 8.34, CGRectGetMinY(frame_a2_Ana) + 8.49) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana), CGRectGetMinY(frame_a2_Ana) + 20.96) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 2.78, CGRectGetMinY(frame_a2_Ana) + 14.16)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 28.7, CGRectGetMinY(frame_a2_Ana)) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 13.91, CGRectGetMinY(frame_a2_Ana) + 2.83) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 20.69, CGRectGetMinY(frame_a2_Ana))];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 48.86, CGRectGetMinY(frame_a2_Ana) + 9.75) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 36.71, CGRectGetMinY(frame_a2_Ana)) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 43.43, CGRectGetMinY(frame_a2_Ana) + 3.25)];
        [a2_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 48.86, CGRectGetMinY(frame_a2_Ana) + 0.41)];
        [a2_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 58, CGRectGetMinY(frame_a2_Ana) + 0.41)];
        [a2_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 58, CGRectGetMinY(frame_a2_Ana) + 58.19)];
        [a2_Ana2Path closePath];
        [a2_Ana2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 28.85, CGRectGetMinY(frame_a2_Ana) + 50.26)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 43.23, CGRectGetMinY(frame_a2_Ana) + 44.23) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 34.41, CGRectGetMinY(frame_a2_Ana) + 50.26) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 39.21, CGRectGetMinY(frame_a2_Ana) + 48.25)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 49.26, CGRectGetMinY(frame_a2_Ana) + 29.2) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 47.25, CGRectGetMinY(frame_a2_Ana) + 40.21) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 49.26, CGRectGetMinY(frame_a2_Ana) + 35.2)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 43.33, CGRectGetMinY(frame_a2_Ana) + 14.12) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 49.26, CGRectGetMinY(frame_a2_Ana) + 23.2) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 47.28, CGRectGetMinY(frame_a2_Ana) + 18.18)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 28.8, CGRectGetMinY(frame_a2_Ana) + 8.04) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 39.37, CGRectGetMinY(frame_a2_Ana) + 10.07) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 34.53, CGRectGetMinY(frame_a2_Ana) + 8.04)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 14.28, CGRectGetMinY(frame_a2_Ana) + 14.32) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 23.07, CGRectGetMinY(frame_a2_Ana) + 8.04) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 18.23, CGRectGetMinY(frame_a2_Ana) + 10.14)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 8.34, CGRectGetMinY(frame_a2_Ana) + 29.15) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 10.32, CGRectGetMinY(frame_a2_Ana) + 18.51) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 8.34, CGRectGetMinY(frame_a2_Ana) + 23.45)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 14.38, CGRectGetMinY(frame_a2_Ana) + 43.98) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 8.34, CGRectGetMinY(frame_a2_Ana) + 34.85) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 10.35, CGRectGetMinY(frame_a2_Ana) + 39.79)];
        [a2_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 28.85, CGRectGetMinY(frame_a2_Ana) + 50.26) controlPoint1: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 18.4, CGRectGetMinY(frame_a2_Ana) + 48.17) controlPoint2: CGPointMake(CGRectGetMinX(frame_a2_Ana) + 23.22, CGRectGetMinY(frame_a2_Ana) + 50.26)];
        [a2_Ana2Path closePath];
        [gray setFill];
        [a2_Ana2Path fill];
        
        ////// a2_Ana 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(a2_Ana2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [a2_Ana2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
}


@end
