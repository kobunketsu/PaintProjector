//
//  PinView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPinView.h"

@implementation ADPinView

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
    [self drawCanvas1WithFrame:rect];
}
- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* colorG1 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* colorG2 = [UIColor colorWithRed: 0 green: 0.25 blue: 1 alpha: 1];
    UIColor* colorEdge = [UIColor colorWithRed: 0.678 green: 0.699 blue: 0.762 alpha: 1];
    UIColor* colorS2 = [UIColor colorWithRed: 0.199 green: 0.199 blue: 0.199 alpha: 1];
    UIColor* colorSG1 = [UIColor colorWithRed: 0 green: 0.054 blue: 0.218 alpha: 0.445];
    UIColor* colorSG2 = [UIColor colorWithRed: 0 green: 0.079 blue: 0.317 alpha: 0];
    UIColor* shadowColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* colorG3 = [UIColor colorWithRed: 0.528 green: 0.774 blue: 0.951 alpha: 1];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.17, 0.46, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)colorG1.CGColor, (id)[UIColor colorWithRed: 0.764 green: 0.887 blue: 0.975 alpha: 1].CGColor, (id)colorG3.CGColor, (id)colorG2.CGColor], gradientLocations);
    CGFloat gradientSLocations[] = {0, 0.37, 1};
    CGGradientRef gradientS = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)colorSG2.CGColor, (id)[UIColor colorWithRed: 0 green: 0.067 blue: 0.267 alpha: 0.222].CGColor, (id)colorSG1.CGColor], gradientSLocations);
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)colorEdge.CGColor, (id)colorG1.CGColor], gradient2Locations);
    CGFloat gradientStickLocations[] = {0, 1};
    CGGradientRef gradientStick = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)colorS2.CGColor, (id)UIColor.whiteColor.CGColor], gradientStickLocations);
    
    //// Shadow Declarations
    UIColor* shadow = [shadowColor2 colorWithAlphaComponent: 0.5];
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 1;
    
    //// Oval 4 Drawing
    CGRect oval4Rect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 8, 21.5, 21.5);
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: oval4Rect];
    CGContextSaveGState(context);
    [oval4Path addClip];
    CGFloat oval4ResizeRatio = MIN(CGRectGetWidth(oval4Rect) / 21.5, CGRectGetHeight(oval4Rect) / 21.5);
    CGContextDrawRadialGradient(context, gradientS,
                                CGPointMake(CGRectGetMidX(oval4Rect) + 0 * oval4ResizeRatio, CGRectGetMidY(oval4Rect) + 0 * oval4ResizeRatio), 11.18 * oval4ResizeRatio,
                                CGPointMake(CGRectGetMidX(oval4Rect) + 0 * oval4ResizeRatio, CGRectGetMidY(oval4Rect) + 0 * oval4ResizeRatio), 2.89 * oval4ResizeRatio,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 6, CGRectGetMinY(frame) + 20.5, 5, 4)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [colorS2 setFill];
    [oval3Path fill];
    CGContextRestoreGState(context);
    
    
    
    //// Rectangle Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 11.5, CGRectGetMinY(frame) + 19.06);
    CGContextRotateCTM(context, 41.9 * M_PI / 180);
    
    UIBezierPath* rectanglePath = UIBezierPath.bezierPath;
    [rectanglePath moveToPoint: CGPointMake(-1.31, 5.47)];
    [rectanglePath addCurveToPoint: CGPointMake(0.19, 6.18) controlPoint1: CGPointMake(-1.31, 5.47) controlPoint2: CGPointMake(-0.9, 6.12)];
    [rectanglePath addCurveToPoint: CGPointMake(1.42, 5.08) controlPoint1: CGPointMake(1.27, 6.24) controlPoint2: CGPointMake(1.42, 5.08)];
    [rectanglePath addLineToPoint: CGPointMake(1.61, -8.43)];
    [rectanglePath addLineToPoint: CGPointMake(-1.63, -8.6)];
    [rectanglePath addLineToPoint: CGPointMake(-1.31, 5.47)];
    [rectanglePath closePath];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGRect rectangleBounds = CGPathGetPathBoundingBox(rectanglePath.CGPath);
    CGContextDrawLinearGradient(context, gradientStick,
                                CGPointMake(CGRectGetMidX(rectangleBounds), CGRectGetMinY(rectangleBounds)),
                                CGPointMake(CGRectGetMidX(rectangleBounds), CGRectGetMaxY(rectangleBounds)),
                                0);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    //// Oval 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 16.16, CGRectGetMinY(frame) + 13.25);
    CGContextRotateCTM(context, 41.77 * M_PI / 180);
    
    UIBezierPath* oval2Path = UIBezierPath.bezierPath;
    [oval2Path moveToPoint: CGPointMake(8.19, 5.9)];
    [oval2Path addCurveToPoint: CGPointMake(8.19, -6.83) controlPoint1: CGPointMake(12.74, 2.38) controlPoint2: CGPointMake(12.74, -3.31)];
    [oval2Path addCurveToPoint: CGPointMake(-8.28, -6.83) controlPoint1: CGPointMake(3.64, -10.34) controlPoint2: CGPointMake(-3.73, -10.34)];
    [oval2Path addCurveToPoint: CGPointMake(-8.28, 5.9) controlPoint1: CGPointMake(-12.83, -3.31) controlPoint2: CGPointMake(-12.83, 2.38)];
    [oval2Path addCurveToPoint: CGPointMake(8.19, 5.9) controlPoint1: CGPointMake(-3.73, 9.41) controlPoint2: CGPointMake(3.64, 9.41)];
    [oval2Path closePath];
    CGContextSaveGState(context);
    [oval2Path addClip];
    CGRect oval2Bounds = CGPathGetPathBoundingBox(oval2Path.CGPath);
    CGContextDrawLinearGradient(context, gradient2,
                                CGPointMake(CGRectGetMidX(oval2Bounds) + 4.66 * CGRectGetWidth(oval2Bounds) / 23.3, CGRectGetMidY(oval2Bounds) + 5.14 * CGRectGetHeight(oval2Bounds) / 18),
                                CGPointMake(CGRectGetMidX(oval2Bounds) + -14.49 * CGRectGetWidth(oval2Bounds) / 23.3, CGRectGetMidY(oval2Bounds) + 4.79 * CGRectGetHeight(oval2Bounds) / 18),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    //// Oval Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 17.35, CGRectGetMinY(frame) + 12.06);
    CGContextRotateCTM(context, 38.56 * M_PI / 180);
    
    UIBezierPath* ovalPath = UIBezierPath.bezierPath;
    [ovalPath moveToPoint: CGPointMake(8.19, 5.44)];
    [ovalPath addCurveToPoint: CGPointMake(8.19, -6.91) controlPoint1: CGPointMake(12.74, 2.03) controlPoint2: CGPointMake(12.74, -3.5)];
    [ovalPath addCurveToPoint: CGPointMake(-8.28, -6.91) controlPoint1: CGPointMake(3.64, -10.32) controlPoint2: CGPointMake(-3.73, -10.32)];
    [ovalPath addCurveToPoint: CGPointMake(-8.28, 5.44) controlPoint1: CGPointMake(-12.83, -3.5) controlPoint2: CGPointMake(-12.83, 2.03)];
    [ovalPath addCurveToPoint: CGPointMake(8.19, 5.44) controlPoint1: CGPointMake(-3.73, 8.85) controlPoint2: CGPointMake(3.64, 8.85)];
    [ovalPath closePath];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGRect ovalBounds = CGPathGetPathBoundingBox(ovalPath.CGPath);
    CGFloat ovalResizeRatio = MIN(CGRectGetWidth(ovalBounds) / 23.3, CGRectGetHeight(ovalBounds) / 17.46);
    CGContextDrawRadialGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(ovalBounds) + -3.58 * ovalResizeRatio, CGRectGetMidY(ovalBounds) + 6.06 * ovalResizeRatio), 5.71 * ovalResizeRatio,
                                CGPointMake(CGRectGetMidX(ovalBounds) + 0 * ovalResizeRatio, CGRectGetMidY(ovalBounds) + -0 * ovalResizeRatio), 13.14 * ovalResizeRatio,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradientS);
    CGGradientRelease(gradient2);
    CGGradientRelease(gradientStick);
    CGColorSpaceRelease(colorSpace);
}




//- (void)setHidden:(BOOL)hidden{
//    DebugLogWarn(@"setHidden %i", hidden);
//    super.hidden = hidden;
//}
@end
