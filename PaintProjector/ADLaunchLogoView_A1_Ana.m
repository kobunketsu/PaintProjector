//
//  ADLaunchLogoView_A1_Ana.m
//  PaintProjector
//
//  Created by kobunketsu on 9/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLaunchLogoView_A1_Ana.h"

@implementation ADLaunchLogoView_A1_Ana

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
//    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.000].CGColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawCanvas1WithFrame_A1_Ana:rect];
}


- (void)drawCanvas1WithFrame_A1_Ana: (CGRect)frame_A1_Ana;
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* black = [UIColor colorWithRed: 0.11 green: 0.11 blue: 0.11 alpha: 1];
    UIColor* darkGray = [UIColor colorWithRed: 0.307 green: 0.307 blue: 0.307 alpha: 1];
    
    //// Shadow Declarations
    UIColor* innerEdge2 = [darkGray colorWithAlphaComponent: 0.5];
    CGSize innerEdge2Offset = CGSizeMake(0.1, -0.1);
    CGFloat innerEdge2BlurRadius = 2;
    
    //// title
    {
        //// A1_Ana 2 Drawing
        UIBezierPath* a1_Ana2Path = UIBezierPath.bezierPath;
        [a1_Ana2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana), CGRectGetMinY(frame_A1_Ana) + 78)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 29.96, CGRectGetMinY(frame_A1_Ana))];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 41.08, CGRectGetMinY(frame_A1_Ana))];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 73, CGRectGetMinY(frame_A1_Ana) + 78)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 61.24, CGRectGetMinY(frame_A1_Ana) + 78)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 52.14, CGRectGetMinY(frame_A1_Ana) + 54.38)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 19.53, CGRectGetMinY(frame_A1_Ana) + 54.38)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 10.96, CGRectGetMinY(frame_A1_Ana) + 78)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana), CGRectGetMinY(frame_A1_Ana) + 78)];
        [a1_Ana2Path closePath];
        [a1_Ana2Path moveToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 22.51, CGRectGetMinY(frame_A1_Ana) + 45.97)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 48.95, CGRectGetMinY(frame_A1_Ana) + 45.97)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 40.81, CGRectGetMinY(frame_A1_Ana) + 24.37)];
        [a1_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 35.28, CGRectGetMinY(frame_A1_Ana) + 8.19) controlPoint1: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 38.33, CGRectGetMinY(frame_A1_Ana) + 17.81) controlPoint2: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 36.48, CGRectGetMinY(frame_A1_Ana) + 12.41)];
        [a1_Ana2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 31.07, CGRectGetMinY(frame_A1_Ana) + 23.09) controlPoint1: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 34.28, CGRectGetMinY(frame_A1_Ana) + 13.2) controlPoint2: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 32.88, CGRectGetMinY(frame_A1_Ana) + 18.16)];
        [a1_Ana2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame_A1_Ana) + 22.51, CGRectGetMinY(frame_A1_Ana) + 45.97)];
        [a1_Ana2Path closePath];
        [black setFill];
        [a1_Ana2Path fill];
        
        ////// A1_Ana 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(a1_Ana2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([innerEdge2 CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [innerEdge2 colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, innerEdge2Offset, innerEdge2BlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [a1_Ana2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
    }
}


@end
