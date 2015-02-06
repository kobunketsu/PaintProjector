//
//  ADSetupCylinderRefCan.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefCanButton.h"

@implementation ADSetupCylinderRefCanButton

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
    CGRect aDSetupCylinderRefCanButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 24) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 24, 44);
    
    
    //// ADSetupCylinderRefCanButton
    {
        if (isNormal)
        {
            //// Normal 18
            {
                //// Bezier 37 Drawing
                UIBezierPath* bezier37Path = UIBezierPath.bezierPath;
                [bezier37Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.77, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.42)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.77, CGRectGetMinY(aDSetupCylinderRefCanButton) + 9.62) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.78, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.78, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.63)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.23, CGRectGetMinY(aDSetupCylinderRefCanButton) + 9.62) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.76, CGRectGetMinY(aDSetupCylinderRefCanButton) + 11.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 15.24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 11.61)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.23, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.42) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.22, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.63) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.22, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.41)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.77, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.42) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 15.24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 0.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.76, CGRectGetMinY(aDSetupCylinderRefCanButton) + 0.43)];
                [bezier37Path closePath];
                [bezier37Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.6, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.03)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.95) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 21.94, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.17)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 10.19)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 36.13)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.6, CGRectGetMinY(aDSetupCylinderRefCanButton) + 42.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 21.5, CGRectGetMinY(aDSetupCylinderRefCanButton) + 41.07)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.4, CGRectGetMinY(aDSetupCylinderRefCanButton) + 42.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 14.91, CGRectGetMinY(aDSetupCylinderRefCanButton) + 44.63) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 9.09, CGRectGetMinY(aDSetupCylinderRefCanButton) + 44.63)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 2.5, CGRectGetMinY(aDSetupCylinderRefCanButton) + 41.07) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton), CGRectGetMinY(aDSetupCylinderRefCanButton) + 36.13)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton), CGRectGetMinY(aDSetupCylinderRefCanButton) + 10.19)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.95)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.4, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 2.06, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.39)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.6, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 9.09, CGRectGetMinY(aDSetupCylinderRefCanButton) - 0.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 14.91, CGRectGetMinY(aDSetupCylinderRefCanButton) - 0.68)];
                [bezier37Path closePath];
                [bezier37Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier37Path closePath];
                [bezier37Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.97, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.93)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.97, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.53) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.51)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 7.48, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.66, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.72) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 6.79, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.72)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 7.48, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.17, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.17, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.53)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.97, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 6.79, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.33) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.66, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.33)];
                [bezier37Path closePath];
                [bezier37Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.48) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.48)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 12.54, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.48) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.4)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.65) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 12.54, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.56)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 8.34)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.35, CGRectGetMinY(aDSetupCylinderRefCanButton) + 8.34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.65)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier37Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.4) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.35, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71)];
                [bezier37Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71)];
                [bezier37Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier37Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 18
            {
                //// Bezier 34 Drawing
                UIBezierPath* bezier34Path = UIBezierPath.bezierPath;
                [bezier34Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.77, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.42)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.77, CGRectGetMinY(aDSetupCylinderRefCanButton) + 9.62) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.78, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.78, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.63)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.23, CGRectGetMinY(aDSetupCylinderRefCanButton) + 9.62) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.76, CGRectGetMinY(aDSetupCylinderRefCanButton) + 11.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 15.24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 11.61)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.23, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.42) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.22, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.63) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.22, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.41)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.77, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.42) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 15.24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 0.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.76, CGRectGetMinY(aDSetupCylinderRefCanButton) + 0.43)];
                [bezier34Path closePath];
                [bezier34Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.6, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.03)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.95) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 21.94, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.17)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 10.19)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 24, CGRectGetMinY(aDSetupCylinderRefCanButton) + 36.13)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.6, CGRectGetMinY(aDSetupCylinderRefCanButton) + 42.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 23.11, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 21.5, CGRectGetMinY(aDSetupCylinderRefCanButton) + 41.07)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.4, CGRectGetMinY(aDSetupCylinderRefCanButton) + 42.1) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 14.91, CGRectGetMinY(aDSetupCylinderRefCanButton) + 44.63) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 9.09, CGRectGetMinY(aDSetupCylinderRefCanButton) + 44.63)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 2.5, CGRectGetMinY(aDSetupCylinderRefCanButton) + 41.07) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 38.44)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton), CGRectGetMinY(aDSetupCylinderRefCanButton) + 36.13)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton), CGRectGetMinY(aDSetupCylinderRefCanButton) + 10.19)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.95)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.4, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 0.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 2.06, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.39)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 19.6, CGRectGetMinY(aDSetupCylinderRefCanButton) + 2.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 9.09, CGRectGetMinY(aDSetupCylinderRefCanButton) - 0.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 14.91, CGRectGetMinY(aDSetupCylinderRefCanButton) - 0.68)];
                [bezier34Path closePath];
                [bezier34Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.89, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier34Path closePath];
                [bezier34Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.97, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.93)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.97, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.53) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.51)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 7.48, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.66, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.72) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 6.79, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.72)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 7.48, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.17, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 8.17, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.53)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.97, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 6.79, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.33) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.66, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.33)];
                [bezier34Path closePath];
                [bezier34Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.48) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.48)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 12.54, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.48) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.4)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 11.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 13.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.65) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 12.54, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.56)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 8.34)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 6.79) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.35, CGRectGetMinY(aDSetupCylinderRefCanButton) + 8.34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 7.65)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 5.25)];
                [bezier34Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefCanButton) + 4.4) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 4.35, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71)];
                [bezier34Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefCanButton) + 5.33, CGRectGetMinY(aDSetupCylinderRefCanButton) + 3.71)];
                [bezier34Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier34Path fill];
            }
        }
    }
}


@end
