//
//  AnamorphicViewModeButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicSideViewButton.h"

@implementation AnamorphicSideViewButton

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
    UIColor* mainColor = [UIColor colorWithRed: 0.02 green: 0.624 blue: 0.249 alpha: 1];
    CGFloat mainColorRGBA[4];
    [mainColor getRed: &mainColorRGBA[0] green: &mainColorRGBA[1] blue: &mainColorRGBA[2] alpha: &mainColorRGBA[3]];
    
    UIColor* cylinderProjectGradientColor2 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.8 + 0.2) green: (mainColorRGBA[1] * 0.8 + 0.2) blue: (mainColorRGBA[2] * 0.8 + 0.2) alpha: (mainColorRGBA[3] * 0.8 + 0.2)];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.451 green: 0.569 blue: 0.58 alpha: 0.498];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.725 green: 0.863 blue: 0.859 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.494 green: 0.824 blue: 0.655 alpha: 0.502];
    UIColor* gradientCylinderProjectColor = [UIColor colorWithRed: 0.51 green: 0.812 blue: 0.624 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientCylinderProjectColors = [NSArray arrayWithObjects:
                                              (id)gradientCylinderProjectColor.CGColor,
                                              (id)cylinderProjectGradientColor2.CGColor, nil];
    CGFloat gradientCylinderProjectLocations[] = {0, 1};
    CGGradientRef gradientCylinderProject = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientCylinderProjectColors, gradientCylinderProjectLocations);
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)iconShadowColor.CGColor,
                               (id)white.CGColor, nil];
    CGFloat gradientLocations[] = {0.59, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = iconShadowColor;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* cylinderProjectInnerShadow = gradientColor;
    CGSize cylinderProjectInnerShadowOffset = CGSizeMake(0.1, -1.1);
    CGFloat cylinderProjectInnerShadowBlurRadius = 4;
    UIColor* glow = strokeColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 128, 80);
    
    //// Subframes
    CGRect group4 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.42857 + 0.5), 51, 45);
    
    
    //// Group 4
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Group 5
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, glowOffset, glowBlurRadius, glow.CGColor);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 3 Drawing
            UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59773 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17659 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59773 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.03769 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.64732 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.13824 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.64732 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.07605 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41815 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.03769 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.54814 * CGRectGetWidth(group4), CGRectGetMinY(group4) + -0.00066 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.46774 * CGRectGetWidth(group4), CGRectGetMinY(group4) + -0.00066 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41815 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17659 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.36855 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.07605 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.36855 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.13824 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59773 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17659 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.46774 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21495 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.54814 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21495 * CGRectGetHeight(group4))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15757 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38323 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15757 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.38252 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14862 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15310 * CGRectGetHeight(group4))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63410 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63410 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.47321 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59720 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.54135 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.63267 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.49798 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.62041 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.52244 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41906 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.54135 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.54801 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.58145 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.46825 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.58145 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38228 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.47321 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.39586 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.52244 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.38360 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.49798 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.46875 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15757 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41906 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21166 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.18385 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.39446 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.19161 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59720 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21166 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.46825 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.25176 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.54801 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.25176 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63303 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.62599 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.18820 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.63793 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17472 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63410 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier3Path closePath];
            [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.11613 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34281 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.23580 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.37500 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.14380 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34832 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.19808 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.36018 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.36577 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.51852 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.28866 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.39577 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.34138 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.49031 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.50400 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.60780 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.39016 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.54673 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.42540 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.60780 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.64223 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.51852 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.58260 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.60780 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.61377 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.55567 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.81298 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.37500 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.67069 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.48136 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.76149 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.39143 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.89649 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34706 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.84397 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.36511 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.87594 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.35419 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.85234 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.88101 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 1.04792 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.50634 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 1.03320 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.73527 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.15579 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.88101 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.65547 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 1.03966 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.35266 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 1.03966 * CGRectGetHeight(group4))];
            [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.11581 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34275 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + -0.02671 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.73395 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + -0.04004 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.50218 * CGRectGetHeight(group4))];
            [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.11613 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34281 * CGRectGetHeight(group4))];
            [bezier3Path closePath];
            CGContextSaveGState(context);
            [bezier3Path addClip];
            CGRect bezier3Bounds = CGPathGetPathBoundingBox(bezier3Path.CGPath);
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 50.59, CGRectGetHeight(bezier3Bounds) / 44.6);
            CGContextDrawRadialGradient(context, gradientCylinderProject,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0.19 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + 4.65 * bezier3ResizeRatio), 18.05 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.01 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -1.4 * bezier3ResizeRatio), 48.32 * bezier3ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            ////// Bezier 3 Inner Shadow
            CGRect bezier3BorderRect = CGRectInset([bezier3Path bounds], -cylinderProjectInnerShadowBlurRadius, -cylinderProjectInnerShadowBlurRadius);
            bezier3BorderRect = CGRectOffset(bezier3BorderRect, -cylinderProjectInnerShadowOffset.width, -cylinderProjectInnerShadowOffset.height);
            bezier3BorderRect = CGRectInset(CGRectUnion(bezier3BorderRect, [bezier3Path bounds]), -1, -1);
            
            UIBezierPath* bezier3NegativePath = [UIBezierPath bezierPathWithRect: bezier3BorderRect];
            [bezier3NegativePath appendPath: bezier3Path];
            bezier3NegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = cylinderProjectInnerShadowOffset.width + round(bezier3BorderRect.size.width);
                CGFloat yOffset = cylinderProjectInnerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            cylinderProjectInnerShadowBlurRadius,
                                            cylinderProjectInnerShadow.CGColor);
                
                [bezier3Path addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezier3BorderRect.size.width), 0);
                [bezier3NegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [bezier3NegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 6
        {
            CGContextSaveGState(context);
            CGContextSetAlpha(context, 0.5);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59773 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17659 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59773 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.03769 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.64732 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.13824 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.64732 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.07605 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41815 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.03769 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.54814 * CGRectGetWidth(group4), CGRectGetMinY(group4) + -0.00066 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.46774 * CGRectGetWidth(group4), CGRectGetMinY(group4) + -0.00066 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41815 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17659 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.36855 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.07605 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.36855 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.13824 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59773 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17659 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.46774 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21495 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.54814 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21495 * CGRectGetHeight(group4))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15757 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38323 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15757 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.38252 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14862 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15310 * CGRectGetHeight(group4))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63410 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63410 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.47321 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59720 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.54135 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.63267 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.49798 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.62041 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.52244 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41906 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.54135 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.54801 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.58145 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.46825 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.58145 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38228 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.47321 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.39586 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.52244 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.38360 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.49798 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.46875 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.15757 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.41906 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21166 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.38216 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.18385 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.39446 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.19161 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.59720 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.21166 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.46825 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.25176 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.54801 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.25176 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63303 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.62599 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.18820 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.63793 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.17472 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.63410 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.14418 * CGRectGetHeight(group4))];
            [bezier2Path closePath];
            [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.11613 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34281 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.23580 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.37500 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.14380 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34832 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.19808 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.36018 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.36577 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.51852 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.28866 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.39577 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.34138 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.49031 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.50400 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.60780 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.39016 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.54673 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.42540 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.60780 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.64223 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.51852 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.58260 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.60780 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.61377 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.55567 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.81298 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.37500 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.67069 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.48136 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.76149 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.39143 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.89649 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34706 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.84397 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.36511 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.87594 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.35419 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.85234 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.88101 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 1.04792 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.50634 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 1.03320 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.73527 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.15579 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.88101 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + 0.65547 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 1.03966 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + 0.35266 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 1.03966 * CGRectGetHeight(group4))];
            [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group4) + 0.11581 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34275 * CGRectGetHeight(group4)) controlPoint1: CGPointMake(CGRectGetMinX(group4) + -0.02671 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.73395 * CGRectGetHeight(group4)) controlPoint2: CGPointMake(CGRectGetMinX(group4) + -0.04004 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.50218 * CGRectGetHeight(group4))];
            [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group4) + 0.11613 * CGRectGetWidth(group4), CGRectGetMinY(group4) + 0.34281 * CGRectGetHeight(group4))];
            [bezier2Path closePath];
            CGContextSaveGState(context);
            [bezier2Path addClip];
            CGRect bezier2Bounds = CGPathGetPathBoundingBox(bezier2Path.CGPath);
            CGFloat bezier2ResizeRatio = MIN(CGRectGetWidth(bezier2Bounds) / 50.59, CGRectGetHeight(bezier2Bounds) / 44.6);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.6 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -1.2 * bezier2ResizeRatio), 51.54 * bezier2ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier2Bounds) + 0.4 * bezier2ResizeRatio, CGRectGetMidY(bezier2Bounds) + -22.78 * bezier2ResizeRatio), 25.39 * bezier2ResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientCylinderProject);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}


@end
