//
//  ADLaunchLogoView_w_Draw.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_w_Draw.h"

@implementation ADLaunchLogoView_w_Draw

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
    [self drawCanvas1WithFrame_w_Draw:rect];
}


- (void)drawCanvas1WithFrame_w_Draw: (CGRect)frame_w_Draw;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* yellow = [UIColor colorWithRed: 1 green: 0.957 blue: 0.847 alpha: 1];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* innerEdge = [white colorWithAlphaComponent: 0.5];
    CGSize innerEdgeOffset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdgeBlurRadius = 2;
    
    //// title
    {
        //// w_Draw 2 Drawing
        UIBezierPath* w_Draw2Path = UIBezierPath.bezierPath;
        [w_Draw2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 17.84, CGRectGetMinY(frame_w_Draw) + 58)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw), CGRectGetMinY(frame_w_Draw))];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 10.21, CGRectGetMinY(frame_w_Draw))];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 19.49, CGRectGetMinY(frame_w_Draw) + 33.48)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 22.95, CGRectGetMinY(frame_w_Draw) + 45.93)];
        [w_Draw2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 25.97, CGRectGetMinY(frame_w_Draw) + 33.97) controlPoint1: CGPointMake(CGRectGetMinX(frame_w_Draw) + 23.1, CGRectGetMinY(frame_w_Draw) + 45.31) controlPoint2: CGPointMake(CGRectGetMinX(frame_w_Draw) + 24.1, CGRectGetMinY(frame_w_Draw) + 41.32)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 35.25, CGRectGetMinY(frame_w_Draw))];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 45.41, CGRectGetMinY(frame_w_Draw))];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 54.14, CGRectGetMinY(frame_w_Draw) + 33.64)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 57.05, CGRectGetMinY(frame_w_Draw) + 44.73)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 60.4, CGRectGetMinY(frame_w_Draw) + 33.53)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 70.39, CGRectGetMinY(frame_w_Draw))];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 80, CGRectGetMinY(frame_w_Draw))];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 61.77, CGRectGetMinY(frame_w_Draw) + 58)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 51.5, CGRectGetMinY(frame_w_Draw) + 58)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 42.22, CGRectGetMinY(frame_w_Draw) + 23.27)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 39.97, CGRectGetMinY(frame_w_Draw) + 13.38)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 28.17, CGRectGetMinY(frame_w_Draw) + 58)];
        [w_Draw2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_w_Draw) + 17.84, CGRectGetMinY(frame_w_Draw) + 58)];
        [w_Draw2Path closePath];
        [yellow setFill];
        [w_Draw2Path fill];
        
        ////// w_Draw 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(w_Draw2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdgeOffset, innerEdgeBlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [w_Draw2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
}


@end
