//
//  ADLaunchLogoView_r_Draw.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_r_Draw.h"

@implementation ADLaunchLogoView_r_Draw

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
    [self drawCanvas1WithFrame_r_Draw:rect];
}


- (void)drawCanvas1WithFrame_r_Draw: (CGRect)frame_r_Draw;
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
        //// r_Draw 2 Drawing
        UIBezierPath* r_Draw2Path = UIBezierPath.bezierPath;
        [r_Draw2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw), CGRectGetMinY(frame_r_Draw) + 58)];
        [r_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw), CGRectGetMinY(frame_r_Draw) + 1.28)];
        [r_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 8.7, CGRectGetMinY(frame_r_Draw) + 1.28)];
        [r_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 8.7, CGRectGetMinY(frame_r_Draw) + 9.88)];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 14.86, CGRectGetMinY(frame_r_Draw) + 1.92) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 10.92, CGRectGetMinY(frame_r_Draw) + 5.86) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 12.97, CGRectGetMinY(frame_r_Draw) + 3.2)];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 21.06, CGRectGetMinY(frame_r_Draw)) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 16.74, CGRectGetMinY(frame_r_Draw) + 0.64) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 18.8, CGRectGetMinY(frame_r_Draw))];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 31, CGRectGetMinY(frame_r_Draw) + 3.1) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 24.32, CGRectGetMinY(frame_r_Draw)) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 27.63, CGRectGetMinY(frame_r_Draw) + 1.03)];
        [r_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 27.67, CGRectGetMinY(frame_r_Draw) + 12.02)];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 20.58, CGRectGetMinY(frame_r_Draw) + 9.93) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 25.31, CGRectGetMinY(frame_r_Draw) + 10.63) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 22.94, CGRectGetMinY(frame_r_Draw) + 9.93)];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 14.88, CGRectGetMinY(frame_r_Draw) + 11.83) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 18.46, CGRectGetMinY(frame_r_Draw) + 9.93) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 16.57, CGRectGetMinY(frame_r_Draw) + 10.57)];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 11.28, CGRectGetMinY(frame_r_Draw) + 17.09) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 13.2, CGRectGetMinY(frame_r_Draw) + 13.09) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 12, CGRectGetMinY(frame_r_Draw) + 14.85)];
        [r_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 9.67, CGRectGetMinY(frame_r_Draw) + 28.31) controlPoint1: CGPointMake(CGRectGetMinX(frame_r_Draw) + 10.21, CGRectGetMinY(frame_r_Draw) + 20.51) controlPoint2: CGPointMake(CGRectGetMinX(frame_r_Draw) + 9.67, CGRectGetMinY(frame_r_Draw) + 24.25)];
        [r_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw) + 9.67, CGRectGetMinY(frame_r_Draw) + 58)];
        [r_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_r_Draw), CGRectGetMinY(frame_r_Draw) + 58)];
        [r_Draw2Path closePath];
        [gold setFill];
        [r_Draw2Path fill];
        
        ////// r_Draw 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(r_Draw2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [r_Draw2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
}


@end
