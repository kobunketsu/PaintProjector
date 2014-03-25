//
//  BackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BackButton.h"

@implementation BackButton

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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.593 green: 0.593 blue: 0.593 alpha: 0.75];
    UIColor* iconColor = [UIColor colorWithRed: 0.239 green: 0.239 blue: 0.239 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: 0.325 brightness: iconColorHSBA[2] alpha: iconColorHSBA[3]];
    UIColor* glowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.5];
    UIColor* iconGlowGradientColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconGlowGradientColor3 = [UIColor colorWithRed: 0.545 green: 0.545 blue: 0.545 alpha: 0.23];
    
    //// Gradient Declarations
    NSArray* iconHighlightedGradientColors = [NSArray arrayWithObjects:
                                              (id)iconGlowGradientColor3.CGColor,
                                              (id)iconGlowGradientColor2.CGColor, nil];
    CGFloat iconHighlightedGradientLocations[] = {0.48, 1};
    CGGradientRef iconHighlightedGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconHighlightedGradientColors, iconHighlightedGradientLocations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    UIColor* glow = glowColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 12;
    
    //// Frames
    CGRect frameBound = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect icon = CGRectMake(CGRectGetMinX(frameBound) + floor((CGRectGetWidth(frameBound) - 46) * 0.47561 + 0.5), CGRectGetMinY(frameBound) + floor((CGRectGetHeight(frameBound) - 45) * 0.42857 + 0.5), 46, 45);
    
    
    //// Icon
    {
        //// frameIcon
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57808 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.96850 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.96850 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57808 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57808 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.03150 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.42192 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.42192 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.03150 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.03150 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
            [iconHighlightColor setFill];
            [bezierPath fill];
            
            ////// Bezier Inner Shadow
            CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
            bezierBorderRect = CGRectOffset(bezierBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
            bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);
            
            UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
            [bezierNegativePath appendPath: bezierPath];
            bezierNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconShadowOffset.width + round(bezierBorderRect.size.width);
                CGFloat yOffset = iconShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconShadowBlurRadius,
                                            iconShadow.CGColor);
                
                [bezierPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
                [bezierNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezierNegativePath fill];
            }
            CGContextRestoreGState(context);
            
            CGContextRestoreGState(context);
            
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
            [iconColor setStroke];
            bezierPath.lineWidth = 3;
            [bezierPath stroke];
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// frameIcon 2
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.5);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57808 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.96850 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.96850 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57808 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57808 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.03150 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.42192 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.42192 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.03150 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.01032 * CGRectGetHeight(icon))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.03150 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.56746 * CGRectGetHeight(icon))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 43.1, CGRectGetHeight(bezier3Bounds) / 25.07);
            CGContextDrawRadialGradient(context, iconHighlightedGradient,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.45 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -1.82 * bezier3ResizeRatio), 58.48 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0.81 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -11.78 * bezier3ResizeRatio), 14.5 * bezier3ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 4 Drawing
            UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
            [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53064 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68760 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53679 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69042 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.53240 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68841 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.53445 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68935 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.56923 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70493 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.54640 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69480 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.55729 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69968 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.67479 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.74899 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.60337 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71995 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.63913 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73497 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.73384 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77120 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.69513 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75698 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.71487 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76442 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.76881 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78324 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.74588 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77551 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.75755 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77953 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.92236 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81680 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.81853 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79963 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.87080 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81047 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.97194 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82141 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.94041 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81901 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.95707 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82051 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.99034 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82222 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.98081 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82195 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.98708 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82218 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.99004 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84197 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.97065 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84113 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.98646 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84192 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.97987 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84169 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.91979 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83639 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.95537 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84019 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.93828 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83866 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.76222 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.80194 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.86695 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82990 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.81336 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81880 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.72676 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78973 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.75079 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79817 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.73896 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79409 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.66710 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76729 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.70758 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78287 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.68763 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77536 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.56077 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72291 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.63116 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75316 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.59514 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73804 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53064 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70945 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.54979 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71808 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.53969 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71356 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53064 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57149 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57149 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 1.00000 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.40809 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 1.00000 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.40809 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44894 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44894 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71862 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.43923 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72291 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.44579 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72002 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.44255 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72145 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.33290 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76729 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.40486 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73804 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.36884 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75316 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.27324 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78973 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.31237 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77536 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.29242 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78287 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.23778 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.80194 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.26104 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79409 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.24921 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79817 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.08021 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83639 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.18664 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81880 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.13305 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82990 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.02935 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84113 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.06172 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83866 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.04463 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84019 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.00996 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84197 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.02013 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84169 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.01354 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84192 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.00966 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82222 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.02806 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82141 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.01292 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82218 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.01919 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82195 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.07764 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81680 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.04293 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82051 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.05959 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81901 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.23119 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78324 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.12920 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81047 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.18147 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79963 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.26616 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77120 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.24245 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77953 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.25412 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77551 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.32521 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.74899 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.28513 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76442 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.30487 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75698 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.43077 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70493 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.36087 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73497 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.39663 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71995 * CGRectGetHeight(icon))];
            [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44894 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69687 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.43714 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70213 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.44321 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69944 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44894 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.65432 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53064 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.65432 * CGRectGetHeight(icon))];
            [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53064 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68760 * CGRectGetHeight(icon))];
            [bezier4Path closePath];
            [iconColor setFill];
            [bezier4Path fill];
            
            ////// Bezier 4 Inner Shadow
            CGRect bezier4BorderRect = CGRectInset([bezier4Path bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
            bezier4BorderRect = CGRectOffset(bezier4BorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
            bezier4BorderRect = CGRectInset(CGRectUnion(bezier4BorderRect, [bezier4Path bounds]), -1, -1);
            
            UIBezierPath* bezier4NegativePath = [UIBezierPath bezierPathWithRect: bezier4BorderRect];
            [bezier4NegativePath appendPath: bezier4Path];
            bezier4NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = iconShadowOffset.width + round(bezier4BorderRect.size.width);
                CGFloat yOffset = iconShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            iconShadowBlurRadius,
                                            iconShadow.CGColor);
                
                [bezier4Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier4BorderRect.size.width), 0);
                [bezier4NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier4NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 2
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextSetAlpha(context, 0.25);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53061 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68760 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53676 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69042 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.53237 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68841 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.53442 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68935 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.56918 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70493 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.54636 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69480 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.55724 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69968 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.67464 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.74899 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.60328 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71995 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.63902 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73497 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.73365 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77120 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.69497 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75698 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.71470 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76442 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.76860 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78324 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.74568 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77551 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.75735 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77953 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.92202 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81680 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.81827 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79963 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.87050 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81047 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.97156 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82141 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.94006 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81901 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.95670 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82051 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.98994 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82222 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.98042 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82195 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.98669 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82218 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.98965 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84197 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.97027 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84113 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.98607 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84192 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.97948 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84169 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.91945 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83639 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.95500 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84019 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.93793 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83866 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.76201 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.80194 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.86665 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82990 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.81311 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81880 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.72657 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78973 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.75059 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79817 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.73876 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79409 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.66696 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76729 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.70741 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78287 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.68748 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77536 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.56072 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72291 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.63106 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75316 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.59507 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73804 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53061 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70945 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.54975 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71808 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.53965 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71356 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53061 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57143 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.57143 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 1.00000 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.40816 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 1.00000 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.40816 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44898 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.96049 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44898 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71862 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.43928 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72291 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.44583 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72002 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.44259 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.72145 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.33304 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76729 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.40493 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73804 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.36894 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75316 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.27343 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78973 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.31252 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77536 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.29259 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78287 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.23799 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.80194 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.26124 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79409 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.24941 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79817 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.08055 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83639 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.18689 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81880 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.13335 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82990 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.02973 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84113 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.06207 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.83866 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.04500 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84019 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.01035 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84197 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.02052 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84169 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.01393 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.84192 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.01006 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82222 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.02844 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82141 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.01331 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82218 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.01958 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82195 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.07798 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81680 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.04330 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.82051 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.05994 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81901 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.23140 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.78324 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.12950 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.81047 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.18173 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.79963 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.26635 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77120 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.24265 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77953 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.25432 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.77551 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.32536 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.74899 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.28530 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.76442 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.30503 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.75698 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.43082 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70493 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.36098 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.73497 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.39672 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.71995 * CGRectGetHeight(icon))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44898 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69687 * CGRectGetHeight(icon)) controlPoint1: CGPointMake(CGRectGetMinX(icon) + 0.43719 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.70213 * CGRectGetHeight(icon)) controlPoint2: CGPointMake(CGRectGetMinX(icon) + 0.44325 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.69944 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.44898 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.65432 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53061 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.65432 * CGRectGetHeight(icon))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(icon) + 0.53061 * CGRectGetWidth(icon), CGRectGetMinY(icon) + 0.68760 * CGRectGetHeight(icon))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 45.07, CGRectGetHeight(bezier2Bounds) / 15.56);
            CGContextDrawRadialGradient(context, iconHighlightedGradient,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.78 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -6.49 * bezier2ResizeRatio), 54.61 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + -0.16 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -36.97 * bezier2ResizeRatio), 29.14 * bezier2ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(iconHighlightedGradient);
    CGColorSpaceRelease(colorSpace);
    
}


@end
