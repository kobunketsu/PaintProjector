//
//  ADCylinderSetupMacProButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefMacProButton.h"

@implementation ADSetupCylinderRefMacProButton

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
    CGRect aDSetupCylinderRefMacProButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 28) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 28, 44);
    
    
    //// ADSetupCylinderRefMacProButton
    {
        if (isNormal)
        {
            //// Normal 19
            {
                //// Bezier 40 Drawing
                UIBezierPath* bezier40Path = UIBezierPath.bezierPath;
                [bezier40Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.74, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.07)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.74, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 2.73, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 2.73, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 8.51)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.77, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.4) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.36, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.04, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.18)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.77, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.42, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.29) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.08, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.16)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.77, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.66) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.32, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 9.55) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.32, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.14)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 9.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.07) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.32, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.92, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.23)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 20.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.66) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.94, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 4.22) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.34, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 4.42)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 20.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.68, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.14) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.68, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 9.55)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.4) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.92, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.16) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.58, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.29)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 21.26, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.96, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.18) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 20.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.9)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 21.26, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.07) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 25.27, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 8.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 25.27, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.15)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.74, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.07) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.25, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.75, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 1)];
                [bezier40Path closePath];
                [bezier40Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.67)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.82) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.03, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.27) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.03, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.23)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.84, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.82) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.25, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 23.41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 23.41)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.84, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.67) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.45, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.45, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.27)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.67) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.08) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.25, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.08)];
                [bezier40Path closePath];
                [bezier40Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.97) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.13, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.87, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.97)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.87, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.13, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.69)];
                [bezier40Path closePath];
                [bezier40Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.3, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.14)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.53) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.3, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.7, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.53)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.14) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.7, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23)];
                [bezier40Path closePath];
                [bezier40Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.9, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.22)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.59) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 26.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.64)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.92)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 27.86, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.9, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 41.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 27.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 39.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 26.12, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 40.8)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.1, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 41.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 18.43, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 44.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 9.57, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 44.69)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 0.14, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 1.88, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 40.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 0.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 39.39)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton), CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton), CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.59)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.1, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.22) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton), CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.64) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 1.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.7)];
                [bezier40Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.21, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.16)];
                [bezier40Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.9, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.22) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 9.69, CGRectGetMinY(aDSetupCylinderRefMacProButton) - 0.74) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 18.47, CGRectGetMinY(aDSetupCylinderRefMacProButton) - 0.72)];
                [bezier40Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier40Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 19
            {
                //// Bezier 36 Drawing
                UIBezierPath* bezier36Path = UIBezierPath.bezierPath;
                [bezier36Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.74, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.07)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.74, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 2.73, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 2.73, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 8.51)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.77, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.4) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.36, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.04, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.18)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.77, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.42, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.29) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.08, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.16)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.77, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.66) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.32, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 9.55) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.32, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.14)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 9.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.07) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.32, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.92, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.23)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 20.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.66) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.94, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 4.22) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.34, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 4.42)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 20.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.03) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.68, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.14) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.68, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 9.55)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.4) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.92, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.16) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.58, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.29)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 21.26, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 19.96, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 11.18) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 20.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 10.9)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 21.26, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.07) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 25.27, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 8.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 25.27, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.15)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.74, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.07) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.25, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.75, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 1)];
                [bezier36Path closePath];
                [bezier36Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.67)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.82) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.03, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.27) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.03, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.23)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.84, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.82) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.25, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 23.41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 23.41)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.84, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.67) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.45, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 8.45, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.27)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 5.64, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.67) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 7.23, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.08) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 6.25, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.08)];
                [bezier36Path closePath];
                [bezier36Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.97) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.13, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.87, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.97)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.41, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.87, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.13, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.24) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.59, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.69)];
                [bezier36Path closePath];
                [bezier36Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.3, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.14)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 12.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 10.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.53) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 11.3, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.7, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 38.44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.53)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 22.25)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 15.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 17.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 21.14) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 16.7, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 20.23)];
                [bezier36Path closePath];
                [bezier36Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.9, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.22)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.59) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 26.63, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.7) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.64)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 36.92)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 28, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 27.86, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.9, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 41.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 27.44, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 39.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 26.12, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 40.8)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.1, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 41.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 18.43, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 44.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 9.57, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 44.69)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 0.14, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 1.88, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 40.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 0.56, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 39.39)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton), CGRectGetMinY(aDSetupCylinderRefMacProButton) + 37.93)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton), CGRectGetMinY(aDSetupCylinderRefMacProButton) + 7.59)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.1, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.22) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton), CGRectGetMinY(aDSetupCylinderRefMacProButton) + 5.64) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 1.37, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 3.7)];
                [bezier36Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 4.21, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.16)];
                [bezier36Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 23.9, CGRectGetMinY(aDSetupCylinderRefMacProButton) + 2.22) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 9.69, CGRectGetMinY(aDSetupCylinderRefMacProButton) - 0.74) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefMacProButton) + 18.47, CGRectGetMinY(aDSetupCylinderRefMacProButton) - 0.72)];
                [bezier36Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier36Path fill];
            }
        }
    }
}


@end