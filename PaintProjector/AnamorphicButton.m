//
//  AnamorphicButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicButton.h"

@implementation AnamorphicButton

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
        self.layer.delegate = self;
    }
    return self;
}

- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = ctx;
    
    //// Color Declarations
//    UIColor* iconColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* cylinderProjectGradientColor2 = [UIColor colorWithRed: (iconColorRGBA[0] * 0.8 + 0.2) green: (iconColorRGBA[1] * 0.8 + 0.2) blue: (iconColorRGBA[2] * 0.8 + 0.2) alpha: (iconColorRGBA[3] * 0.8 + 0.2)];
    UIColor* iconShadowColor = [iconColor colorWithAlphaComponent: 0.4];
    UIColor* gradientColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.3 + 0.7) green: (iconColorRGBA[1] * 0.3 + 0.7) blue: (iconColorRGBA[2] * 0.3 + 0.7) alpha: (iconColorRGBA[3] * 0.3 + 0.7)];
    UIColor* strokeColor = [iconColor colorWithAlphaComponent: 0.2];
    UIColor* gradientCylinderProjectColor = [UIColor colorWithRed: (iconColorRGBA[0] * 1 + 0) green: (iconColorRGBA[1] * 1 + 0) blue: (iconColorRGBA[2] * 1 + 0) alpha: (iconColorRGBA[3] * 1 + 0)];
    
    //// Gradient Declarations
    NSArray* gradientCylinderProjectColors = [NSArray arrayWithObjects:
                                              (id)gradientCylinderProjectColor.CGColor,
                                              (id)cylinderProjectGradientColor2.CGColor, nil];
    CGFloat gradientCylinderProjectLocations[] = {0, 1};
    CGGradientRef gradientCylinderProject = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientCylinderProjectColors, gradientCylinderProjectLocations);
    
    //// Shadow Declarations
    UIColor* shadow = iconShadowColor;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 4;
    UIColor* cylinderProjectInnerShadow = gradientColor;
    CGSize cylinderProjectInnerShadowOffset = CGSizeMake(0.1, -1.1);
    CGFloat cylinderProjectInnerShadowBlurRadius = 1;
    UIColor* glow = strokeColor;
    CGSize glowOffset = CGSizeMake(0.1, -0.1);
    CGFloat glowBlurRadius = 15;
    
    //// Frames
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect group4 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 51) * 0.50649 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 51, 44);
    
    
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
            CGFloat bezier3ResizeRatio = MIN(CGRectGetWidth(bezier3Bounds) / 50.59, CGRectGetHeight(bezier3Bounds) / 43.61);
            CGContextDrawRadialGradient(context, gradientCylinderProject,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + 0.19 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + 4.6 * bezier3ResizeRatio), 17.87 * bezier3ResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezier3Bounds) + -0.01 * bezier3ResizeRatio, CGRectGetMidY(bezier3Bounds) + -1.39 * bezier3ResizeRatio), 47.85 * bezier3ResizeRatio,
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
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
    
    
    //// Cleanup
    CGGradientRelease(gradientCylinderProject);
    CGColorSpaceRelease(colorSpace);
    
}
@end
