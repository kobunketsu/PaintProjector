//
//  CopyButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CopyButton.h"

@implementation CopyButton

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
- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
        [self drawSelected];
//        [self setTitleColor:[UIColor colorWithRed:247/255.0 green:167/255.0 blue:211/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        [self drawNormal];
//        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

- (void)drawNormal
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.227 green: 0.227 blue: 0.227 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -4.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 46) * 0.48780 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 46, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12381 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93657 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06343 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 46, CGRectGetHeight(bezier5Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.48 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + 10.2 * bezier5ResizeRatio), 11.2 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.5 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -7 * bezier5ResizeRatio), 30 * bezier5ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 5 Inner Shadow
            CGRect bezier5BorderRect = CGRectInset([bezier5Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier5BorderRect = CGRectOffset(bezier5BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier5BorderRect = CGRectInset(CGRectUnion(bezier5BorderRect, [bezier5Path bounds]), -1, -1);
            
            UIBezierPath* bezier5NegativePath = [UIBezierPath bezierPathWithRect: bezier5BorderRect];
            [bezier5NegativePath appendPath: bezier5Path];
            bezier5NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier5BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier5Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier5BorderRect.size.width), 0);
                [bezier5NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier5NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12381 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93657 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06343 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 46, CGRectGetHeight(bezierBounds) / 44);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.48 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 2 * bezierResizeRatio), 52.78 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.28 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -21.6 * bezierResizeRatio), 24.6 * bezierResizeRatio,
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
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    

}
- (void)drawSelected
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 0.586 green: 0.781 blue: 0 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 0.943 green: 1 blue: 0.656 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.739 green: 0.84 blue: 0.438 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.278 green: 0.327 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 0.919 green: 1 blue: 0.511 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 0.94 green: 1 blue: 0.484 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.663 green: 0.81 blue: 0.219 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)iconSpecularColor2.CGColor,
                                (id)iconSpecularColor.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, -4.1);
    CGFloat iconHighlightBlurRadius = 3;
    UIColor* iconShadow = iconShadowColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat iconShadowBlurRadius = 4;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 46) * 0.48780 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 46, 44);
    
    
    //// IconNormal
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 5 Drawing
            UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12381 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86364 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93657 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06343 * CGRectGetHeight(iconNormal))];
            [bezier5Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier5Path addClip];
            CGRect bezier5Bounds = CGPathGetPathBoundingBox(bezier5Path.CGPath);
            CGFloat bezier5ResizeRatio = MIN(CGRectGetWidth(bezier5Bounds) / 46, CGRectGetHeight(bezier5Bounds) / 44);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.48 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + 10.2 * bezier5ResizeRatio), 10.51 * bezier5ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier5Bounds) + 0.5 * bezier5ResizeRatio, CGRectGetMidY(bezier5Bounds) + -0.48 * bezier5ResizeRatio), 30.63 * bezier5ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 5 Inner Shadow
            CGRect bezier5BorderRect = CGRectInset([bezier5Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier5BorderRect = CGRectOffset(bezier5BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier5BorderRect = CGRectInset(CGRectUnion(bezier5BorderRect, [bezier5Path bounds]), -1, -1);
            
            UIBezierPath* bezier5NegativePath = [UIBezierPath bezierPathWithRect: bezier5BorderRect];
            [bezier5NegativePath appendPath: bezier5Path];
            bezier5NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier5BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier5Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier5BorderRect.size.width), 0);
                [bezier5NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier5NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.47826 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.45652 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.46625 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.63043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.60870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.61843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.68182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.70455 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.69437 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.53528 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.45455 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84783 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86957 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.44199 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.85983 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.43182 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.29545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.69565 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.71739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.28290 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70766 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.27273 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.32609 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.36502 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.91304 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96107 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.12381 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.86364 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.13043 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.10870 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.87619 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.11843 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88636 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.93657 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.90909 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.95930 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.09091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.08696 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.00000 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.04070 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03893 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.30435 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.11364 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.25632 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.00000 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.21739 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.06343 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 46, CGRectGetHeight(bezierBounds) / 44);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.48 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 2 * bezierResizeRatio), 52.78 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.28 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -21.6 * bezierResizeRatio), 24.6 * bezierResizeRatio,
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
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    

}


@end
