//
//  ADSetupCylinderRefNormalButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefNormalButton.h"

@implementation ADSetupCylinderRefNormalButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDSetupCylinderRefNormalButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 31) * 0.50515 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 - 0.5) + 1, 31, 44);
    
    
    //// ADSetupCylinderRefNormalButton
    {
        if (isNormal)
        {
            //// Normal 20
            {
                //// Bezier 41 Drawing
                UIBezierPath* bezier41Path = UIBezierPath.bezierPath;
                [bezier41Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 8.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.78)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 8.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.82, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.38) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.82, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 8.97)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 22.38, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 12.42, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 12.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 18.58, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 12.17)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 22.38, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.18, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 8.97) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.18, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.38)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 8.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 18.58, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.18) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 12.42, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.18)];
                [bezier41Path closePath];
                [bezier41Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.46, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 2.1)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.96, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.65) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 29.2, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.37) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.71, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.99)];
                [bezier41Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 16.88)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 36.84) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 25.06) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 36.84)];
                [bezier41Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86)];
                [bezier41Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.84, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.46, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.38, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 39.34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 28.92, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 40.76)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 20.41, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 44.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 10.59, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 44.7)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.16, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 2.08, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 40.76) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 39.34)];
                [bezier41Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 16.88) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 25.37)];
                [bezier41Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.04, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.65)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.29, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.99) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 1.8, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.37)];
                [bezier41Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.46, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 10.59, CGRectGetMinY(aDSetupCylinderRefNormalButton) - 0.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 20.41, CGRectGetMinY(aDSetupCylinderRefNormalButton) - 0.7)];
                [bezier41Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier41Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 20
            {
                //// Bezier 38 Drawing
                UIBezierPath* bezier38Path = UIBezierPath.bezierPath;
                [bezier38Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 8.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.78)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 8.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.82, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.38) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.82, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 8.97)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 22.38, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 10.57) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 12.42, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 12.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 18.58, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 12.17)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 22.38, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.18, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 8.97) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.18, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.38)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 8.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 18.58, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.18) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 12.42, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.18)];
                [bezier38Path closePath];
                [bezier38Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.46, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 2.1)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.96, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.65) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 29.2, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.37) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.71, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.99)];
                [bezier38Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 16.88)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 36.84) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 25.06) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 36.84)];
                [bezier38Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 31, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86)];
                [bezier38Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.84, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.46, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 30.38, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 39.34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 28.92, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 40.76)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 41.9) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 20.41, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 44.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 10.59, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 44.7)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.16, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 2.08, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 40.76) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.62, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 39.34)];
                [bezier38Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 16.88) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 37.86) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton), CGRectGetMinY(aDSetupCylinderRefNormalButton) + 25.37)];
                [bezier38Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.04, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 6.65)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 0.29, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 4.99) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 1.8, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 3.37)];
                [bezier38Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 26.46, CGRectGetMinY(aDSetupCylinderRefNormalButton) + 2.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 10.59, CGRectGetMinY(aDSetupCylinderRefNormalButton) - 0.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefNormalButton) + 20.41, CGRectGetMinY(aDSetupCylinderRefNormalButton) - 0.7)];
                [bezier38Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier38Path fill];
            }
        }
    }
}


@end
