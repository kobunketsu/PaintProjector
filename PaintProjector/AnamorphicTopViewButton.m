//
//  AnamorphicTopViewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicTopViewButton.h"

@implementation AnamorphicTopViewButton

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
    
    UIColor* cylinderProjectGradientColor1 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.5 + 0.5) green: (mainColorRGBA[1] * 0.5 + 0.5) blue: (mainColorRGBA[2] * 0.5 + 0.5) alpha: (mainColorRGBA[3] * 0.5 + 0.5)];
    UIColor* cylinderProjectGradientColor2 = [UIColor colorWithRed: (mainColorRGBA[0] * 0.8 + 0.2) green: (mainColorRGBA[1] * 0.8 + 0.2) blue: (mainColorRGBA[2] * 0.8 + 0.2) alpha: (mainColorRGBA[3] * 0.8 + 0.2)];
    UIColor* iconShadowColor = [UIColor colorWithRed: 0.451 green: 0.569 blue: 0.58 alpha: 0.498];
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.725 green: 0.863 blue: 0.859 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.494 green: 0.824 blue: 0.655 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientCylinderProjectColors = [NSArray arrayWithObjects:
                                              (id)cylinderProjectGradientColor1.CGColor,
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
    CGRect group3 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 62) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 62, 44);
    
    
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
            
            
            //// CylinderCap Drawing
            CGRect cylinderCapRect = CGRectMake(CGRectGetMinX(group3) + floor(CGRectGetWidth(group3) * 0.38710 + 0.5), CGRectGetMinY(group3) + floor(CGRectGetHeight(group3) * 0.06818 + 0.5), floor(CGRectGetWidth(group3) * 0.61290 + 0.5) - floor(CGRectGetWidth(group3) * 0.38710 + 0.5), floor(CGRectGetHeight(group3) * 0.40909 + 0.5) - floor(CGRectGetHeight(group3) * 0.06818 + 0.5));
            UIBezierPath* cylinderCapPath = [UIBezierPath bezierPathWithOvalInRect: cylinderCapRect];
            CGContextSaveGState(context);
            [cylinderCapPath addClip];
            CGFloat cylinderCapResizeRatio = MIN(CGRectGetWidth(cylinderCapRect) / 14, CGRectGetHeight(cylinderCapRect) / 15);
            CGContextDrawRadialGradient(context, gradientCylinderProject,
                                        CGPointMake(CGRectGetMidX(cylinderCapRect) + 0 * cylinderCapResizeRatio, CGRectGetMidY(cylinderCapRect) + -5.81 * cylinderCapResizeRatio), 6.43 * cylinderCapResizeRatio,
                                        CGPointMake(CGRectGetMidX(cylinderCapRect) + 0 * cylinderCapResizeRatio, CGRectGetMidY(cylinderCapRect) + 5.81 * cylinderCapResizeRatio), 19.3 * cylinderCapResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            
            //// CylinderProject Drawing
            UIBezierPath* cylinderProjectPath = [UIBezierPath bezierPath];
            [cylinderProjectPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11613 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01183 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.23580 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06023 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.14380 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02012 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.19808 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.03795 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.36577 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.30201 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.28866 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09146 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34138 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25959 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50400 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44924 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.39016 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34442 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.42540 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44924 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.64223 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.30201 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.58260 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44924 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.61377 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35787 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.81298 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06023 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.67069 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.24614 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.76149 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.08494 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.89649 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01823 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.84397 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04537 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.87594 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02895 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.85234 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82109 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.04792 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25772 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.03320 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60194 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15579 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82109 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65547 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.05964 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.35266 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.05964 * CGRectGetHeight(group3))];
            [cylinderProjectPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11581 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01174 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.02671 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59996 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.04004 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25147 * CGRectGetHeight(group3))];
            [cylinderProjectPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11613 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01183 * CGRectGetHeight(group3))];
            [cylinderProjectPath closePath];
            CGContextSaveGState(context);
            [cylinderProjectPath addClip];
            CGRect cylinderProjectBounds = CGPathGetPathBoundingBox(cylinderProjectPath.CGPath);
            CGFloat cylinderProjectResizeRatio = MIN(CGRectGetWidth(cylinderProjectBounds) / 61.5, CGRectGetHeight(cylinderProjectBounds) / 43.48);
            CGContextDrawRadialGradient(context, gradientCylinderProject,
                                        CGPointMake(CGRectGetMidX(cylinderProjectBounds) + 0.37 * cylinderProjectResizeRatio, CGRectGetMidY(cylinderProjectBounds) + -0.11 * cylinderProjectResizeRatio), 13.03 * cylinderProjectResizeRatio,
                                        CGPointMake(CGRectGetMidX(cylinderProjectBounds) + 0.25 * cylinderProjectResizeRatio, CGRectGetMidY(cylinderProjectBounds) + -5.56 * cylinderProjectResizeRatio), 48.13 * cylinderProjectResizeRatio,
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
            
            ////// CylinderProject Inner Shadow
            CGRect cylinderProjectBorderRect = CGRectInset([cylinderProjectPath bounds], -cylinderProjectInnerShadowBlurRadius, -cylinderProjectInnerShadowBlurRadius);
            cylinderProjectBorderRect = CGRectOffset(cylinderProjectBorderRect, -cylinderProjectInnerShadowOffset.width, -cylinderProjectInnerShadowOffset.height);
            cylinderProjectBorderRect = CGRectInset(CGRectUnion(cylinderProjectBorderRect, [cylinderProjectPath bounds]), -1, -1);
            
            UIBezierPath* cylinderProjectNegativePath = [UIBezierPath bezierPathWithRect: cylinderProjectBorderRect];
            [cylinderProjectNegativePath appendPath: cylinderProjectPath];
            cylinderProjectNegativePath.usesEvenOddFillRule = YES;
            
            CGContextSaveGState(context);
            {
                CGFloat xOffset = cylinderProjectInnerShadowOffset.width + round(cylinderProjectBorderRect.size.width);
                CGFloat yOffset = cylinderProjectInnerShadowOffset.height;
                CGContextSetShadowWithColor(context,
                                            CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                            cylinderProjectInnerShadowBlurRadius,
                                            cylinderProjectInnerShadow.CGColor);
                
                [cylinderProjectPath addClip];
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(cylinderProjectBorderRect.size.width), 0);
                [cylinderProjectNegativePath applyTransform: transform];
                [[UIColor grayColor] setFill];
                [cylinderProjectNegativePath fill];
            }
            CGContextRestoreGState(context);
            
            
            
            CGContextEndTransparencyLayer(context);
            CGContextRestoreGState(context);
        }
        
        
        //// Group 2
        {
            CGContextSaveGState(context);
            CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
            CGContextSetAlpha(context, 0.38);
            CGContextSetBlendMode(context, kCGBlendModeOverlay);
            CGContextBeginTransparencyLayer(context, NULL);
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.58374 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35859 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.58374 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.12289 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.62998 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29350 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.62998 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18798 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.41626 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.12289 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.53749 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05780 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.46251 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.05780 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.41626 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35859 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.37002 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.18798 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.37002 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.29350 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.58374 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35859 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.46251 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42368 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.53749 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.42368 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11613 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01183 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.23580 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06023 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.14380 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02012 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.19808 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.03795 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.36577 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.30201 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.28866 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.09146 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.34138 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25959 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.50400 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44924 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.39016 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.34442 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.42540 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44924 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.64223 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.30201 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.58260 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.44924 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.61377 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.35787 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.81298 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.06023 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.67069 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.24614 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.76149 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.08494 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.89649 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01823 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.84397 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.04537 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.87594 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.02895 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.85234 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82109 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 1.04792 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25772 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 1.03320 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.60194 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.15579 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.82109 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + 0.65547 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.05964 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + 0.35266 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 1.05964 * CGRectGetHeight(group3))];
            [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11581 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01174 * CGRectGetHeight(group3)) controlPoint1: CGPointMake(CGRectGetMinX(group3) + -0.02671 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.59996 * CGRectGetHeight(group3)) controlPoint2: CGPointMake(CGRectGetMinX(group3) + -0.04004 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.25147 * CGRectGetHeight(group3))];
            [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group3) + 0.11613 * CGRectGetWidth(group3), CGRectGetMinY(group3) + 0.01183 * CGRectGetHeight(group3))];
            [bezierPath closePath];
            CGContextSaveGState(context);
            [bezierPath addClip];
            CGRect bezierBounds = CGPathGetPathBoundingBox(bezierPath.CGPath);
            CGFloat bezierResizeRatio = MIN(CGRectGetWidth(bezierBounds) / 61.5, CGRectGetHeight(bezierBounds) / 43.48);
            CGContextDrawRadialGradient(context, gradient,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + 0 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -5.88 * bezierResizeRatio), 52.99 * bezierResizeRatio,
                                        CGPointMake(CGRectGetMidX(bezierBounds) + -0.25 * bezierResizeRatio, CGRectGetMidY(bezierBounds) + -20.65 * bezierResizeRatio), 30.61 * bezierResizeRatio,
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
