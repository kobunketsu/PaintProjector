//
//  InfoButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADInfoButton.h"

@implementation ADInfoButton

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
//        [self setTitleColor:[UIColor colorWithRed:244/255.0 green:141/255.0 blue:87/255.0 alpha:1] forState:UIControlStateSelected];
    }
    else{
        [self drawNormal];
//        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

- (void)drawSelected
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0.41 blue: 0 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 0.881 blue: 0.706 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 1 green: 0.631 blue: 0.222 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.506 green: 0.172 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 1 green: 0.688 blue: 0.479 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 0.908 blue: 0.595 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 1 green: 0.52 blue: 0.111 alpha: 1].CGColor,
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
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
            
            
            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier4Path addClip];
            CGRect bezier4Bounds = CGPathGetPathBoundingBox(bezier4Path.CGPath);
            CGFloat bezier4ResizeRatio = MIN(CGRectGetWidth(bezier4Bounds) / 43.17, CGRectGetHeight(bezier4Bounds) / 43.17);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier4Bounds) + 0.2 * bezier4ResizeRatio, CGRectGetMidY(bezier4Bounds) + 11.4 * bezier4ResizeRatio), 9.19 * bezier4ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier4Bounds) + 0.6 * bezier4ResizeRatio, CGRectGetMidY(bezier4Bounds) + -4.2 * bezier4ResizeRatio), 26.05 * bezier4ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 4 Inner Shadow
            CGRect bezier4BorderRect = CGRectInset([bezier4Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier4BorderRect = CGRectOffset(bezier4BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier4BorderRect = CGRectInset(CGRectUnion(bezier4BorderRect, [bezier4Path bounds]), -1, -1);
            
            UIBezierPath* bezier4NegativePath = [UIBezierPath bezierPathWithRect: bezier4BorderRect];
            [bezier4NegativePath appendPath: bezier4Path];
            bezier4NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier4BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier4Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier4BorderRect.size.width), 0);
                [bezier4NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier4NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 4
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.88);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 43.17, CGRectGetHeight(bezier2Bounds) / 43.17);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.67 * bezier2ResizeRatio), 64 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.25 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.72 * bezier2ResizeRatio), 22.3 * bezier2ResizeRatio,
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

-(void)drawNormal{
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
    CGRect iconNormal = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 44, 44);
    
    
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
            
            
            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal))];
            [bezier4Path closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezier4Path addClip];
            CGRect bezier4Bounds = CGPathGetPathBoundingBox(bezier4Path.CGPath);
            CGFloat bezier4ResizeRatio = MIN(CGRectGetWidth(bezier4Bounds) / 43.17, CGRectGetHeight(bezier4Bounds) / 43.17);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier4Bounds) + 0.2 * bezier4ResizeRatio, CGRectGetMidY(bezier4Bounds) + 11.4 * bezier4ResizeRatio), 9.19 * bezier4ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier4Bounds) + 0.6 * bezier4ResizeRatio, CGRectGetMidY(bezier4Bounds) + -4.2 * bezier4ResizeRatio), 26.05 * bezier4ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier 4 Inner Shadow
            CGRect bezier4BorderRect = CGRectInset([bezier4Path bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezier4BorderRect = CGRectOffset(bezier4BorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezier4BorderRect = CGRectInset(CGRectUnion(bezier4BorderRect, [bezier4Path bounds]), -1, -1);
            
            UIBezierPath* bezier4NegativePath = [UIBezierPath bezierPathWithRect: bezier4BorderRect];
            [bezier4NegativePath appendPath: bezier4Path];
            bezier4NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezier4BorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezier4Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier4BorderRect.size.width), 0);
                [bezier4NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier4NegativePath fill];
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
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.32916 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.23334 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.45876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.77358 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.56232 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.38222 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 1.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.84688 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 1.03846 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.15312 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.65530 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + -0.03846 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.34470 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.84688 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.15312 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.34470 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.65530 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + -0.03846 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 43.17, CGRectGetHeight(bezier2Bounds) / 43.17);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.67 * bezier2ResizeRatio), 64 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.25 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.72 * bezier2ResizeRatio), 22.3 * bezier2ResizeRatio,
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
