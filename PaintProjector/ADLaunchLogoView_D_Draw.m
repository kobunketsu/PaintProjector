//
//  ADLaunchLogoView_D_Draw.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_D_Draw.h"

@implementation ADLaunchLogoView_D_Draw

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
    self.layer.shadowColor = [UIColor colorWithRed:0.643 green:0.000 blue:0.165 alpha:1.000].CGColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame_D_Draw:rect];
}


- (void)drawCanvas1WithFrame_D_Draw: (CGRect)frame_D_Draw;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* pink = [UIColor colorWithRed: 1 green: 0.376 blue: 0.541 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* pinkGradient = [UIColor colorWithRed: 1 green: 0.176 blue: 0.394 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradient_D_DrawLocations[] = {0, 1};
    CGGradientRef gradient_D_Draw = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)pink.CGColor, (id)pinkGradient.CGColor], gradient_D_DrawLocations);
    
    //// Shadow Declarations
    UIColor* innerEdge = [white colorWithAlphaComponent: 0.5];
    CGSize innerEdgeOffset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdgeBlurRadius = 2;
    
    //// title
    {
        //// D_Draw 2 Drawing
        UIBezierPath* d_Draw2Path = UIBezierPath.bezierPath;
        [d_Draw2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw), CGRectGetMinY(frame_D_Draw) + 80)];
        [d_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw), CGRectGetMinY(frame_D_Draw))];
        [d_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 26.82, CGRectGetMinY(frame_D_Draw))];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 40.67, CGRectGetMinY(frame_D_Draw) + 1.15) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 32.87, CGRectGetMinY(frame_D_Draw)) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 37.49, CGRectGetMinY(frame_D_Draw) + 0.38)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 52.09, CGRectGetMinY(frame_D_Draw) + 6.88) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 45.14, CGRectGetMinY(frame_D_Draw) + 2.2) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 48.94, CGRectGetMinY(frame_D_Draw) + 4.11)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 61.3, CGRectGetMinY(frame_D_Draw) + 20.55) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 56.2, CGRectGetMinY(frame_D_Draw) + 10.44) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 59.27, CGRectGetMinY(frame_D_Draw) + 15)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 64.36, CGRectGetMinY(frame_D_Draw) + 39.56) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 63.34, CGRectGetMinY(frame_D_Draw) + 26.09) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 64.36, CGRectGetMinY(frame_D_Draw) + 32.43)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 62.29, CGRectGetMinY(frame_D_Draw) + 55.72) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 64.36, CGRectGetMinY(frame_D_Draw) + 45.64) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 63.67, CGRectGetMinY(frame_D_Draw) + 51.02)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 56.98, CGRectGetMinY(frame_D_Draw) + 67.37) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 60.91, CGRectGetMinY(frame_D_Draw) + 60.41) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 59.14, CGRectGetMinY(frame_D_Draw) + 64.29)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 49.89, CGRectGetMinY(frame_D_Draw) + 74.62) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 54.82, CGRectGetMinY(frame_D_Draw) + 70.44) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 52.45, CGRectGetMinY(frame_D_Draw) + 72.86)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 40.6, CGRectGetMinY(frame_D_Draw) + 78.64) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 47.32, CGRectGetMinY(frame_D_Draw) + 76.39) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 44.22, CGRectGetMinY(frame_D_Draw) + 77.73)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 28.09, CGRectGetMinY(frame_D_Draw) + 80) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 36.97, CGRectGetMinY(frame_D_Draw) + 79.55) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 32.8, CGRectGetMinY(frame_D_Draw) + 80)];
        [d_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw), CGRectGetMinY(frame_D_Draw) + 80)];
        [d_Draw2Path closePath];
        [d_Draw2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 10.3, CGRectGetMinY(frame_D_Draw) + 70.56)];
        [d_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 26.92, CGRectGetMinY(frame_D_Draw) + 70.56)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 39, CGRectGetMinY(frame_D_Draw) + 69.09) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 32.05, CGRectGetMinY(frame_D_Draw) + 70.56) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 36.08, CGRectGetMinY(frame_D_Draw) + 70.07)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 45.98, CGRectGetMinY(frame_D_Draw) + 64.94) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 41.92, CGRectGetMinY(frame_D_Draw) + 68.1) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 44.25, CGRectGetMinY(frame_D_Draw) + 66.72)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 51.69, CGRectGetMinY(frame_D_Draw) + 54.82) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 48.43, CGRectGetMinY(frame_D_Draw) + 62.43) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 50.33, CGRectGetMinY(frame_D_Draw) + 59.05)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 53.74, CGRectGetMinY(frame_D_Draw) + 39.4) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 53.06, CGRectGetMinY(frame_D_Draw) + 50.58) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 53.74, CGRectGetMinY(frame_D_Draw) + 45.44)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 49.73, CGRectGetMinY(frame_D_Draw) + 20.11) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 53.74, CGRectGetMinY(frame_D_Draw) + 31.03) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 52.4, CGRectGetMinY(frame_D_Draw) + 24.6)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 39.98, CGRectGetMinY(frame_D_Draw) + 11.08) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 47.06, CGRectGetMinY(frame_D_Draw) + 15.62) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 43.81, CGRectGetMinY(frame_D_Draw) + 12.61)];
        [d_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 26.66, CGRectGetMinY(frame_D_Draw) + 9.44) controlPoint1: CGPointMake(CGRectGetMinX(frame_D_Draw) + 37.22, CGRectGetMinY(frame_D_Draw) + 9.99) controlPoint2: CGPointMake(CGRectGetMinX(frame_D_Draw) + 32.78, CGRectGetMinY(frame_D_Draw) + 9.44)];
        [d_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 10.3, CGRectGetMinY(frame_D_Draw) + 9.44)];
        [d_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_D_Draw) + 10.3, CGRectGetMinY(frame_D_Draw) + 70.56)];
        [d_Draw2Path closePath];
        CGContextSaveGState(context);
        [d_Draw2Path addClip];
        CGRect d_Draw2Bounds = CGPathGetPathBoundingBox(d_Draw2Path.CGPath);
        CGContextDrawLinearGradient(context, gradient_D_Draw,
                                    CGPointMake(CGRectGetMidX(d_Draw2Bounds), CGRectGetMinY(d_Draw2Bounds)),
                                    CGPointMake(CGRectGetMidX(d_Draw2Bounds), CGRectGetMaxY(d_Draw2Bounds)),
                                    0);
        CGContextRestoreGState(context);
        
        ////// D_Draw 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(d_Draw2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [d_Draw2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient_D_Draw);
    CGColorSpaceRelease(colorSpace);
}


@end
