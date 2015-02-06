//
//  SetupButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupButton.h"

@implementation ADSetupButton

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
    CGRect aDSetupButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 42.43) * 0.49771 - 0.09) + 0.59, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 42.43, 44);
    
    
    //// ADSetupButton
    {
        if (isSelected)
        {
            //// Normal
            {
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 2)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 3.97)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.4, CGRectGetMinY(aDSetupButton) + 8.13) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 29.94, CGRectGetMinY(aDSetupButton) + 4.81) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 32.33, CGRectGetMinY(aDSetupButton) + 6.19)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 35.85, CGRectGetMinY(aDSetupButton) + 7.27)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 38.59, CGRectGetMinY(aDSetupButton) + 7.97) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 36.8, CGRectGetMinY(aDSetupButton) + 6.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 38.03, CGRectGetMinY(aDSetupButton) + 7.02)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.15, CGRectGetMinY(aDSetupButton) + 13.99)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 41.45, CGRectGetMinY(aDSetupButton) + 16.73) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.72, CGRectGetMinY(aDSetupButton) + 14.95) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.4, CGRectGetMinY(aDSetupButton) + 16.17)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 39.91, CGRectGetMinY(aDSetupButton) + 17.65)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 39.99, CGRectGetMinY(aDSetupButton) + 26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 40.55, CGRectGetMinY(aDSetupButton) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 40.58, CGRectGetMinY(aDSetupButton) + 23.24)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 41.32, CGRectGetMinY(aDSetupButton) + 26.78)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.02, CGRectGetMinY(aDSetupButton) + 29.52) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.27, CGRectGetMinY(aDSetupButton) + 27.34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.58, CGRectGetMinY(aDSetupButton) + 28.57)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 38.46, CGRectGetMinY(aDSetupButton) + 35.55)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 35.72, CGRectGetMinY(aDSetupButton) + 36.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 37.9, CGRectGetMinY(aDSetupButton) + 36.5) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 36.67, CGRectGetMinY(aDSetupButton) + 36.81)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.66, CGRectGetMinY(aDSetupButton) + 35.62)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 40.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 32.54, CGRectGetMinY(aDSetupButton) + 37.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 30.05, CGRectGetMinY(aDSetupButton) + 39.16)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 42)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.41, CGRectGetMinY(aDSetupButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 43.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.52, CGRectGetMinY(aDSetupButton) + 44)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 18.41, CGRectGetMinY(aDSetupButton) + 44)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 42) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.31, CGRectGetMinY(aDSetupButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 43.1)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 40.33)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 7.98, CGRectGetMinY(aDSetupButton) + 35.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 13.32, CGRectGetMinY(aDSetupButton) + 39.49) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 10.4, CGRectGetMinY(aDSetupButton) + 37.86)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 6.58, CGRectGetMinY(aDSetupButton) + 36.25)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 3.84, CGRectGetMinY(aDSetupButton) + 35.55) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 5.63, CGRectGetMinY(aDSetupButton) + 36.81) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 4.4, CGRectGetMinY(aDSetupButton) + 36.5)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.28, CGRectGetMinY(aDSetupButton) + 29.52)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.98, CGRectGetMinY(aDSetupButton) + 26.78) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) - 0.28, CGRectGetMinY(aDSetupButton) + 28.57) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.03, CGRectGetMinY(aDSetupButton) + 27.34)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.71, CGRectGetMinY(aDSetupButton) + 25.76)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.83, CGRectGetMinY(aDSetupButton) + 25.98)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.93, CGRectGetMinY(aDSetupButton) + 17.59)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.83, CGRectGetMinY(aDSetupButton) + 17.75)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 1.11, CGRectGetMinY(aDSetupButton) + 16.73)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.41, CGRectGetMinY(aDSetupButton) + 13.99) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.16, CGRectGetMinY(aDSetupButton) + 16.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) - 0.15, CGRectGetMinY(aDSetupButton) + 14.95)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 3.97, CGRectGetMinY(aDSetupButton) + 7.97)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 6.71, CGRectGetMinY(aDSetupButton) + 7.27) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 4.53, CGRectGetMinY(aDSetupButton) + 7.02) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 5.76, CGRectGetMinY(aDSetupButton) + 6.7)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 8.33, CGRectGetMinY(aDSetupButton) + 8.22)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 3.67) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 10.68, CGRectGetMinY(aDSetupButton) + 5.98) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 13.47, CGRectGetMinY(aDSetupButton) + 4.47)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 2)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 18.41, CGRectGetMinY(aDSetupButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.31, CGRectGetMinY(aDSetupButton))];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.41, CGRectGetMinY(aDSetupButton))];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 2) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.52, CGRectGetMinY(aDSetupButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 0.9)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 12.93, CGRectGetMinY(aDSetupButton) + 13.51)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 12.93, CGRectGetMinY(aDSetupButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 8.24, CGRectGetMinY(aDSetupButton) + 18.2) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 8.24, CGRectGetMinY(aDSetupButton) + 25.8)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 29.9, CGRectGetMinY(aDSetupButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.61, CGRectGetMinY(aDSetupButton) + 35.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.21, CGRectGetMinY(aDSetupButton) + 35.17)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 29.9, CGRectGetMinY(aDSetupButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.58, CGRectGetMinY(aDSetupButton) + 25.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.58, CGRectGetMinY(aDSetupButton) + 18.2)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 12.93, CGRectGetMinY(aDSetupButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.21, CGRectGetMinY(aDSetupButton) + 8.83) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.61, CGRectGetMinY(aDSetupButton) + 8.83)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 24.95, CGRectGetMinY(aDSetupButton) + 25.54)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 24.95, CGRectGetMinY(aDSetupButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.9, CGRectGetMinY(aDSetupButton) + 23.58) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.9, CGRectGetMinY(aDSetupButton) + 20.42)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.88, CGRectGetMinY(aDSetupButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 23, CGRectGetMinY(aDSetupButton) + 16.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 19.83, CGRectGetMinY(aDSetupButton) + 16.51)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.88, CGRectGetMinY(aDSetupButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 15.92, CGRectGetMinY(aDSetupButton) + 20.42) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 15.92, CGRectGetMinY(aDSetupButton) + 23.58)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 24.95, CGRectGetMinY(aDSetupButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 19.83, CGRectGetMinY(aDSetupButton) + 27.49) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 23, CGRectGetMinY(aDSetupButton) + 27.49)];
                [bezierPath closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezierPath fill];
            }
        }
        
        
        if (isNormal)
        {
            //// Selected
            {
                //// Bezier 2 Drawing
                UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 2)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 3.97)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.4, CGRectGetMinY(aDSetupButton) + 8.13) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 29.94, CGRectGetMinY(aDSetupButton) + 4.81) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 32.33, CGRectGetMinY(aDSetupButton) + 6.19)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 35.85, CGRectGetMinY(aDSetupButton) + 7.27)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 38.59, CGRectGetMinY(aDSetupButton) + 7.97) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 36.8, CGRectGetMinY(aDSetupButton) + 6.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 38.03, CGRectGetMinY(aDSetupButton) + 7.02)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.15, CGRectGetMinY(aDSetupButton) + 13.99)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 41.45, CGRectGetMinY(aDSetupButton) + 16.73) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.72, CGRectGetMinY(aDSetupButton) + 14.95) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.4, CGRectGetMinY(aDSetupButton) + 16.17)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 39.91, CGRectGetMinY(aDSetupButton) + 17.65)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 39.99, CGRectGetMinY(aDSetupButton) + 26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 40.55, CGRectGetMinY(aDSetupButton) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 40.58, CGRectGetMinY(aDSetupButton) + 23.24)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 41.32, CGRectGetMinY(aDSetupButton) + 26.78)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.02, CGRectGetMinY(aDSetupButton) + 29.52) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.27, CGRectGetMinY(aDSetupButton) + 27.34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 42.58, CGRectGetMinY(aDSetupButton) + 28.57)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 38.46, CGRectGetMinY(aDSetupButton) + 35.55)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 35.72, CGRectGetMinY(aDSetupButton) + 36.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 37.9, CGRectGetMinY(aDSetupButton) + 36.5) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 36.67, CGRectGetMinY(aDSetupButton) + 36.81)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.66, CGRectGetMinY(aDSetupButton) + 35.62)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 40.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 32.54, CGRectGetMinY(aDSetupButton) + 37.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 30.05, CGRectGetMinY(aDSetupButton) + 39.16)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 42)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.41, CGRectGetMinY(aDSetupButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 43.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.52, CGRectGetMinY(aDSetupButton) + 44)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 18.41, CGRectGetMinY(aDSetupButton) + 44)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 42) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.31, CGRectGetMinY(aDSetupButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 43.1)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 40.33)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 7.98, CGRectGetMinY(aDSetupButton) + 35.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 13.32, CGRectGetMinY(aDSetupButton) + 39.49) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 10.4, CGRectGetMinY(aDSetupButton) + 37.86)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 6.58, CGRectGetMinY(aDSetupButton) + 36.25)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 3.84, CGRectGetMinY(aDSetupButton) + 35.55) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 5.63, CGRectGetMinY(aDSetupButton) + 36.81) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 4.4, CGRectGetMinY(aDSetupButton) + 36.5)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.28, CGRectGetMinY(aDSetupButton) + 29.52)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.98, CGRectGetMinY(aDSetupButton) + 26.78) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) - 0.28, CGRectGetMinY(aDSetupButton) + 28.57) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.03, CGRectGetMinY(aDSetupButton) + 27.34)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.71, CGRectGetMinY(aDSetupButton) + 25.76)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.83, CGRectGetMinY(aDSetupButton) + 25.98)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.93, CGRectGetMinY(aDSetupButton) + 17.59)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 2.83, CGRectGetMinY(aDSetupButton) + 17.75)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 1.11, CGRectGetMinY(aDSetupButton) + 16.73)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.41, CGRectGetMinY(aDSetupButton) + 13.99) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 0.16, CGRectGetMinY(aDSetupButton) + 16.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) - 0.15, CGRectGetMinY(aDSetupButton) + 14.95)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 3.97, CGRectGetMinY(aDSetupButton) + 7.97)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 6.71, CGRectGetMinY(aDSetupButton) + 7.27) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 4.53, CGRectGetMinY(aDSetupButton) + 7.02) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 5.76, CGRectGetMinY(aDSetupButton) + 6.7)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 8.33, CGRectGetMinY(aDSetupButton) + 8.22)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 3.67) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 10.68, CGRectGetMinY(aDSetupButton) + 5.98) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 13.47, CGRectGetMinY(aDSetupButton) + 4.47)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 2)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 18.41, CGRectGetMinY(aDSetupButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 16.41, CGRectGetMinY(aDSetupButton) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.31, CGRectGetMinY(aDSetupButton))];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.41, CGRectGetMinY(aDSetupButton))];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 2) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.52, CGRectGetMinY(aDSetupButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 27.41, CGRectGetMinY(aDSetupButton) + 0.9)];
                [bezier2Path closePath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 12.93, CGRectGetMinY(aDSetupButton) + 13.51)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 12.93, CGRectGetMinY(aDSetupButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 8.24, CGRectGetMinY(aDSetupButton) + 18.2) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 8.24, CGRectGetMinY(aDSetupButton) + 25.8)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 29.9, CGRectGetMinY(aDSetupButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.61, CGRectGetMinY(aDSetupButton) + 35.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.21, CGRectGetMinY(aDSetupButton) + 35.17)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 29.9, CGRectGetMinY(aDSetupButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.58, CGRectGetMinY(aDSetupButton) + 25.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 34.58, CGRectGetMinY(aDSetupButton) + 18.2)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 12.93, CGRectGetMinY(aDSetupButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 25.21, CGRectGetMinY(aDSetupButton) + 8.83) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.61, CGRectGetMinY(aDSetupButton) + 8.83)];
                [bezier2Path closePath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 24.95, CGRectGetMinY(aDSetupButton) + 25.54)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 24.95, CGRectGetMinY(aDSetupButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.9, CGRectGetMinY(aDSetupButton) + 23.58) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 26.9, CGRectGetMinY(aDSetupButton) + 20.42)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.88, CGRectGetMinY(aDSetupButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 23, CGRectGetMinY(aDSetupButton) + 16.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 19.83, CGRectGetMinY(aDSetupButton) + 16.51)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 17.88, CGRectGetMinY(aDSetupButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 15.92, CGRectGetMinY(aDSetupButton) + 20.42) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 15.92, CGRectGetMinY(aDSetupButton) + 23.58)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupButton) + 24.95, CGRectGetMinY(aDSetupButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupButton) + 19.83, CGRectGetMinY(aDSetupButton) + 27.49) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupButton) + 23, CGRectGetMinY(aDSetupButton) + 27.49)];
                [bezier2Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier2Path fill];
            }
        }
    }
}


@end
