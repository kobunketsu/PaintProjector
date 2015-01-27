//
//  AnchorView.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAnchorView.h"

@implementation ADAnchorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
//        CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI * 0.25);
//        self.transform = trans;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.57 green: 0.046 blue: 0.077 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.5];
    UIColor* color2 = [UIColor colorWithRed: 0.697 green: 0.008 blue: 0.057 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)[UIColor redColor].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 8;
    UIColor* shadow3 = [UIColor blackColor];
    CGSize shadow3Offset = CGSizeMake(0.1, -1.1);
    CGFloat shadow3BlurRadius = 2;
    
    //// Main
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath moveToPoint: CGPointMake(28.05, 60.05)];
        [ovalPath addCurveToPoint: CGPointMake(28.05, 40.95) controlPoint1: CGPointMake(33.32, 54.77) controlPoint2: CGPointMake(33.32, 46.23)];
        [ovalPath addCurveToPoint: CGPointMake(8.95, 40.95) controlPoint1: CGPointMake(22.77, 35.68) controlPoint2: CGPointMake(14.23, 35.68)];
        [ovalPath addCurveToPoint: CGPointMake(8.95, 60.05) controlPoint1: CGPointMake(3.68, 46.23) controlPoint2: CGPointMake(3.68, 54.77)];
        [ovalPath addCurveToPoint: CGPointMake(28.05, 60.05) controlPoint1: CGPointMake(14.23, 65.32) controlPoint2: CGPointMake(22.77, 65.32)];
        [ovalPath closePath];
        [[UIColor darkGrayColor] setFill];
        [ovalPath fill];
        
        ////// Oval Inner Shadow
        CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadow3BlurRadius, -shadow3BlurRadius);
        ovalBorderRect = CGRectOffset(ovalBorderRect, -shadow3Offset.width, -shadow3Offset.height);
        ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
        
        UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
        [ovalNegativePath appendPath: ovalPath];
        ovalNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadow3Offset.width + round(ovalBorderRect.size.width);
            CGFloat yOffset = shadow3Offset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadow3BlurRadius,
                                        shadow3.CGColor);
            
            [ovalPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
            [ovalNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [ovalNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        
        
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(61.59, 15.19)];
        [bezierPath addCurveToPoint: CGPointMake(55.31, 21.46) controlPoint1: CGPointMake(62.35, 19.41) controlPoint2: CGPointMake(59.54, 22.22)];
        [bezierPath addLineToPoint: CGPointMake(55.16, 21.43)];
        [bezierPath addLineToPoint: CGPointMake(45.04, 31.55)];
        [bezierPath addLineToPoint: CGPointMake(36.2, 22.71)];
        [bezierPath addLineToPoint: CGPointMake(46.32, 12.59)];
        [bezierPath addLineToPoint: CGPointMake(46.29, 12.44)];
        [bezierPath addCurveToPoint: CGPointMake(52.56, 6.16) controlPoint1: CGPointMake(45.53, 8.21) controlPoint2: CGPointMake(48.34, 5.4)];
        [bezierPath addCurveToPoint: CGPointMake(61.59, 15.19) controlPoint1: CGPointMake(56.79, 6.92) controlPoint2: CGPointMake(60.83, 10.96)];
        [bezierPath closePath];
        CGContextSaveGState(context);
        [bezierPath addClip];
        CGContextDrawLinearGradient(context, gradient,
                                    CGPointMake(49.32, 7.54),
                                    CGPointMake(48.96, 28.11),
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        [color2 setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];
        
        
        //// Oval 2 Drawing
        UIBezierPath* oval2Path = [UIBezierPath bezierPath];
        [oval2Path moveToPoint: CGPointMake(40.5, 38.5)];
        [oval2Path addCurveToPoint: CGPointMake(48.5, 30.5) controlPoint1: CGPointMake(46.02, 39.6) controlPoint2: CGPointMake(49.6, 36.02)];
        [oval2Path addCurveToPoint: CGPointMake(36.5, 18.5) controlPoint1: CGPointMake(47.4, 24.98) controlPoint2: CGPointMake(42.02, 19.6)];
        [oval2Path addCurveToPoint: CGPointMake(28.5, 26.5) controlPoint1: CGPointMake(30.98, 17.4) controlPoint2: CGPointMake(27.4, 20.98)];
        [oval2Path addCurveToPoint: CGPointMake(40.5, 38.5) controlPoint1: CGPointMake(29.6, 32.02) controlPoint2: CGPointMake(34.98, 37.4)];
        [oval2Path closePath];
        CGContextSaveGState(context);
        [oval2Path addClip];
        CGContextDrawRadialGradient(context, gradient,
                                    CGPointMake(38.5, 28.5), 0,
                                    CGPointMake(38.5, 28.5), 17.67,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        [color2 setStroke];
        oval2Path.lineWidth = 2;
        [oval2Path stroke];
        
        
        //// Polygon Drawing
        UIBezierPath* polygonPath = [UIBezierPath bezierPath];
        [polygonPath moveToPoint: CGPointMake(18.88, 48.32)];
        [polygonPath addCurveToPoint: CGPointMake(32.95, 30) controlPoint1: CGPointMake(18.88, 48.32) controlPoint2: CGPointMake(28.37, 33.52)];
        [polygonPath addCurveToPoint: CGPointMake(37.21, 34.25) controlPoint1: CGPointMake(37.53, 26.48) controlPoint2: CGPointMake(40.72, 29.67)];
        [polygonPath addCurveToPoint: CGPointMake(18.88, 48.32) controlPoint1: CGPointMake(33.69, 38.83) controlPoint2: CGPointMake(18.88, 48.32)];
        [polygonPath closePath];
        [[UIColor whiteColor] setFill];
        [polygonPath fill];
        [[UIColor lightGrayColor] setStroke];
        polygonPath.lineWidth = 2;
        [polygonPath stroke];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
