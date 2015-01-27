//
//  ADLaunchLogoView_n_Ana.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_n_Ana.h"

@implementation ADLaunchLogoView_n_Ana

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
    self.layer.shadowColor = [UIColor colorWithRed:0.357 green:0.294 blue:0.086 alpha:1.000].CGColor;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame_n_Ana:rect];
}

- (void)drawCanvas1WithFrame_n_Ana: (CGRect)frame_n_Ana;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gold = [UIColor colorWithRed: 0.898 green: 0.737 blue: 0 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* innerEdge = [white colorWithAlphaComponent: 0.5];
    CGSize innerEdgeOffset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdgeBlurRadius = 2;
    
    //// title
    {
        //// n_Ana 2 Drawing
        UIBezierPath* n_Ana2Path = UIBezierPath.bezierPath;
        [n_Ana2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) - 0.23, CGRectGetMinY(frame_n_Ana) + 58)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) - 0.23, CGRectGetMinY(frame_n_Ana) + 1.28)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 8.45, CGRectGetMinY(frame_n_Ana) + 1.28)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 8.45, CGRectGetMinY(frame_n_Ana) + 9.35)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 26.55, CGRectGetMinY(frame_n_Ana)) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 12.63, CGRectGetMinY(frame_n_Ana) + 3.12) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 18.66, CGRectGetMinY(frame_n_Ana))];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 36.01, CGRectGetMinY(frame_n_Ana) + 1.84) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 29.98, CGRectGetMinY(frame_n_Ana)) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 33.13, CGRectGetMinY(frame_n_Ana) + 0.61)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 42.46, CGRectGetMinY(frame_n_Ana) + 6.68) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 38.88, CGRectGetMinY(frame_n_Ana) + 3.07) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 41.04, CGRectGetMinY(frame_n_Ana) + 4.68)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 45.46, CGRectGetMinY(frame_n_Ana) + 13.78) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 43.89, CGRectGetMinY(frame_n_Ana) + 8.67) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 44.89, CGRectGetMinY(frame_n_Ana) + 11.04)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 46, CGRectGetMinY(frame_n_Ana) + 23.13) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 45.82, CGRectGetMinY(frame_n_Ana) + 15.56) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 46, CGRectGetMinY(frame_n_Ana) + 18.67)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 46, CGRectGetMinY(frame_n_Ana) + 58)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 36.36, CGRectGetMinY(frame_n_Ana) + 58)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 36.36, CGRectGetMinY(frame_n_Ana) + 23.5)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 35.23, CGRectGetMinY(frame_n_Ana) + 14.71) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 36.36, CGRectGetMinY(frame_n_Ana) + 19.58) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 35.98, CGRectGetMinY(frame_n_Ana) + 16.65)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 31.24, CGRectGetMinY(frame_n_Ana) + 10.07) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 34.48, CGRectGetMinY(frame_n_Ana) + 12.77) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 33.15, CGRectGetMinY(frame_n_Ana) + 11.22)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 24.52, CGRectGetMinY(frame_n_Ana) + 8.33) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 29.33, CGRectGetMinY(frame_n_Ana) + 8.91) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 27.09, CGRectGetMinY(frame_n_Ana) + 8.33)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 13.89, CGRectGetMinY(frame_n_Ana) + 12.23) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 20.41, CGRectGetMinY(frame_n_Ana) + 8.33) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 16.87, CGRectGetMinY(frame_n_Ana) + 9.63)];
        [n_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 9.41, CGRectGetMinY(frame_n_Ana) + 27.02) controlPoint1: CGPointMake(CGRectGetMinX(frame_n_Ana) + 10.9, CGRectGetMinY(frame_n_Ana) + 14.83) controlPoint2: CGPointMake(CGRectGetMinX(frame_n_Ana) + 9.41, CGRectGetMinY(frame_n_Ana) + 19.76)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) + 9.41, CGRectGetMinY(frame_n_Ana) + 58)];
        [n_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_n_Ana) - 0.23, CGRectGetMinY(frame_n_Ana) + 58)];
        [n_Ana2Path closePath];
        [gold setFill];
        [n_Ana2Path fill];
        
        ////// n_Ana 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(n_Ana2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [n_Ana2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
}



@end
