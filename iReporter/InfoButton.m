//
//  InfoButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "InfoButton.h"

@implementation InfoButton

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
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 0.333 blue: 0 alpha: 0.529];
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 1 green: 0.328 blue: 0 alpha: 0.52];
    UIColor* shadowColor3 = [UIColor colorWithRed: 0.959 green: 0.66 blue: 0.496 alpha: 1];
    UIColor* shadowColor4 = [UIColor colorWithRed: 0.5 green: 0.205 blue: 0.057 alpha: 0.498];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)color2.CGColor,
                               (id)fillColor.CGColor, nil];
    CGFloat gradientLocations[] = {0.49, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* glow = strokeColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 13;
    UIColor* shadow = shadowColor4;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* innerShadow = shadowColor3;
    CGSize innerShadowOffset = CGSizeMake(0.1, -2.1);
    CGFloat innerShadowBlurRadius = 2;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * 0.50667 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 53) * 0.48148 + 0.5), 53, 53);
    
    
    //// Group 3
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.20648 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20648 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.20648 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.79352 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.04438 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36859 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.04438 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63141 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.79352 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.79352 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.36859 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95562 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.63141 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95562 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.79352 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20648 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.95562 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63141 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.95562 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36859 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.20648 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20648 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.63141 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04438 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.36859 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04438 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84688 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15312 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84688 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.84688 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34470 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65530 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15312 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.84688 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65530 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.03846 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34470 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.03846 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15312 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15312 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65530 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34470 * CGRectGetHeight(group3))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84688 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15312 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.34470 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.03846 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.65530 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.03846 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32916 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23334 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23334 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32916 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32916 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77358 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38222 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38222 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77358 * CGRectGetHeight(group3))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77358 * CGRectGetHeight(group3))];
            [bezier2Path closePath];
            [color2 setFill];
            [bezier2Path fill];
            
            ////// Bezier 2 Inner Shadow
            CGRect bezier2BorderRect = CGRectInset([bezier2Path bounds], -innerShadowBlurRadius, -innerShadowBlurRadius);
            bezier2BorderRect = CGRectOffset(bezier2BorderRect, -innerShadowOffset.width, -innerShadowOffset.height);
            bezier2BorderRect = CGRectInset(CGRectUnion(bezier2BorderRect, [bezier2Path bounds]), -1, -1);
            
            UIBezierPath* bezier2NegativePath = [UIBezierPath bezierPathWithRect: bezier2BorderRect];
            [bezier2NegativePath appendPath: bezier2Path];
            bezier2NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = innerShadowOffset.width + round(bezier2BorderRect.size.width);
                CGFloat yOffset = innerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            innerShadowBlurRadius,
                                            innerShadow.CGColor);
                
                [bezier2Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier2BorderRect.size.width), 0);
                [bezier2NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier2NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 2
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.25);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.20648 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20648 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.20648 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.79352 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.04438 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36859 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.04438 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63141 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.79352 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.79352 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.36859 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95562 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.63141 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.95562 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.79352 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20648 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.95562 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.63141 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.95562 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.36859 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.20648 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.20648 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.63141 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04438 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.36859 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04438 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84688 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15312 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84688 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.84688 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34470 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65530 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15312 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.84688 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65530 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.03846 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34470 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.03846 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15312 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15312 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.65530 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.03846 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34470 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.84688 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.15312 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.34470 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.03846 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.65530 * CGRectGetWidth(group3), CGRectGetMinY(group3) + -0.03846 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32916 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23334 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.23334 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32916 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.32916 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77358 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38222 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.38222 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.56232 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77358 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.45876 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.77358 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 52, CGRectGetHeight(bezierBounds) / 52);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.73 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 0.78 * bezierResizeRatio), 62.42 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.73 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -25.97 * bezierResizeRatio), 31.63 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    

}


@end
