//
//  DeleteButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADDeleteButton.h"

@implementation ADDeleteButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    if (self.isSelected || self.isHighlighted) {
        [self drawSelected];
//        [self setTitleColor:[UIColor colorWithRed:255/255.0 green:75/255.0 blue:0/255.0 alpha:1] forState:UIControlStateSelected];
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
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.498];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1].CGColor,
                               (id)gradientColor.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.44, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
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
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08415 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13348 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77371 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82169 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.12017 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13141 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08621 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41538 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38539 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58911 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66512 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61910 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66512 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 43, CGRectGetHeight(bezierBounds) / 43);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.11 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 11.26 * bezierResizeRatio), 9.99 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.05 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -5.07 * bezierResizeRatio), 26.65 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezierBorderRect = CGRectOffset(bezierBorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
            
            UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
            [bezierNegativePath appendPath: bezierPath];
            bezierNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezierBorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezierPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                [bezierNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezierNegativePath fill];
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
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawSelected
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 0.991 blue: 0.995 alpha: 0.284];
    UIColor* iconColor = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    UIColor* iconSpecularColor = [UIColor colorWithRed: 1 green: 0.693 blue: 0.693 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.505 green: 0 blue: 0 alpha: 1];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.475 green: 0 blue: 0 alpha: 0.498];
    UIColor* iconSpecularColor2 = [UIColor colorWithRed: 1 green: 0.312 blue: 0.312 alpha: 1];
    UIColor* glowColor = [UIColor colorWithRed: 1 green: 0.535 blue: 0.535 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconColor.CGColor,
                               (id)[UIColor colorWithRed: 0.752 green: 0 blue: 0 alpha: 1].CGColor,
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
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08415 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13348 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77371 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82169 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.12017 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13141 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08621 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41538 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38539 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58911 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66512 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61910 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66512 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconShadowOffset, iconShadowBlurRadius, iconShadow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 43, CGRectGetHeight(bezierBounds) / 43);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0.11 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + 11.26 * bezierResizeRatio), 9.99 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.05 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -5.07 * bezierResizeRatio), 26.65 * bezierResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextEndTransparencyLayer(context);
            
            ////// Bezier Inner Shadow
            CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -iconHighlightBlurRadius, -iconHighlightBlurRadius);
            bezierBorderRect = CGRectOffset(bezierBorderRect, -iconHighlightOffset.width, -iconHighlightOffset.height);
            bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
            
            UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
            [bezierNegativePath appendPath: bezierPath];
            bezierNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconHighlightOffset.width + round(bezierBorderRect.size.width);
                CGFloat yOffset = iconHighlightOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconHighlightBlurRadius,
                                            iconHighlight.CGColor);
                
                [bezierPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                [bezierNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezierNegativePath fill];
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
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08415 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.93558 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.98987 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13348 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.96556 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.88230 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.77371 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.86058 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.82169 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.22876 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.88013 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.18078 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.99009 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.14189 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.94086 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.12017 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.10881 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.19583 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.13141 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.06689 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.01260 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08621 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.03691 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.41538 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.33937 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.38539 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.58911 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66512 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.61910 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.01282 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.66512 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08997 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.66460 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.08911 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.31602 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.27273 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.29211 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.54545 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.59091 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.57056 * CGRectGetHeight(iconNormal))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.52273 * CGRectGetHeight(iconNormal))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(iconNormal) + 0.68398 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal)) controlPoint1: CGPointMake(CGRectGetMinX(iconNormal) + 0.72727 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.49762 * CGRectGetHeight(iconNormal)) controlPoint2: CGPointMake(CGRectGetMinX(iconNormal) + 0.70789 * CGRectGetWidth(iconNormal), CGRectGetMinY(iconNormal) + 0.47727 * CGRectGetHeight(iconNormal))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 43, CGRectGetHeight(bezier2Bounds) / 43);
            CGContextDrawRadialGradient(context, gradient2,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.11 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + 11.26 * bezier2ResizeRatio), 9.99 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.05 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -5.07 * bezier2ResizeRatio), 26.65 * bezier2ResizeRatio,
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
