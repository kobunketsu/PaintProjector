//
//  FileButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADFileButton.h"

@implementation ADFileButton

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
    CGRect aDFileButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 42.43) * 0.50253 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 42.43, 44);
    
    
    //// ADFileButton
    {
        if (isSelected)
        {
            //// Normal 10
            {
                //// Bezier 18 Drawing
                UIBezierPath* bezier18Path = UIBezierPath.bezierPath;
                [bezier18Path moveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 2)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 3.97)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 34.4, CGRectGetMinY(aDFileButton) + 8.13) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 29.94, CGRectGetMinY(aDFileButton) + 4.81) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 32.33, CGRectGetMinY(aDFileButton) + 6.19)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 35.85, CGRectGetMinY(aDFileButton) + 7.27)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 38.59, CGRectGetMinY(aDFileButton) + 7.97) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 36.8, CGRectGetMinY(aDFileButton) + 6.7) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 38.03, CGRectGetMinY(aDFileButton) + 7.02)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 42.15, CGRectGetMinY(aDFileButton) + 13.99)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 41.45, CGRectGetMinY(aDFileButton) + 16.73) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 42.72, CGRectGetMinY(aDFileButton) + 14.95) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 42.4, CGRectGetMinY(aDFileButton) + 16.17)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 39.91, CGRectGetMinY(aDFileButton) + 17.65)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 39.99, CGRectGetMinY(aDFileButton) + 26) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 40.55, CGRectGetMinY(aDFileButton) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 40.58, CGRectGetMinY(aDFileButton) + 23.24)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 41.32, CGRectGetMinY(aDFileButton) + 26.78)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 42.02, CGRectGetMinY(aDFileButton) + 29.52) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 42.27, CGRectGetMinY(aDFileButton) + 27.34) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 42.58, CGRectGetMinY(aDFileButton) + 28.57)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 38.46, CGRectGetMinY(aDFileButton) + 35.55)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 35.72, CGRectGetMinY(aDFileButton) + 36.25) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 37.9, CGRectGetMinY(aDFileButton) + 36.5) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 36.67, CGRectGetMinY(aDFileButton) + 36.81)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 34.66, CGRectGetMinY(aDFileButton) + 35.62)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 40.03) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 32.54, CGRectGetMinY(aDFileButton) + 37.69) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 30.05, CGRectGetMinY(aDFileButton) + 39.16)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 42)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 25.41, CGRectGetMinY(aDFileButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 43.1) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 26.52, CGRectGetMinY(aDFileButton) + 44)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 18.41, CGRectGetMinY(aDFileButton) + 44)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 42) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 17.31, CGRectGetMinY(aDFileButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 43.1)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 40.33)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 7.98, CGRectGetMinY(aDFileButton) + 35.44) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 13.32, CGRectGetMinY(aDFileButton) + 39.49) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 10.4, CGRectGetMinY(aDFileButton) + 37.86)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 6.58, CGRectGetMinY(aDFileButton) + 36.25)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 3.84, CGRectGetMinY(aDFileButton) + 35.55) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 5.63, CGRectGetMinY(aDFileButton) + 36.81) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 4.4, CGRectGetMinY(aDFileButton) + 36.5)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 0.28, CGRectGetMinY(aDFileButton) + 29.52)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 0.98, CGRectGetMinY(aDFileButton) + 26.78) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) - 0.28, CGRectGetMinY(aDFileButton) + 28.57) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 0.03, CGRectGetMinY(aDFileButton) + 27.34)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.71, CGRectGetMinY(aDFileButton) + 25.76)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.83, CGRectGetMinY(aDFileButton) + 25.98)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.93, CGRectGetMinY(aDFileButton) + 17.59)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.83, CGRectGetMinY(aDFileButton) + 17.75)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 1.11, CGRectGetMinY(aDFileButton) + 16.73)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 0.41, CGRectGetMinY(aDFileButton) + 13.99) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 0.16, CGRectGetMinY(aDFileButton) + 16.17) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) - 0.15, CGRectGetMinY(aDFileButton) + 14.95)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 3.97, CGRectGetMinY(aDFileButton) + 7.97)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 6.71, CGRectGetMinY(aDFileButton) + 7.27) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 4.53, CGRectGetMinY(aDFileButton) + 7.02) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 5.76, CGRectGetMinY(aDFileButton) + 6.7)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 8.33, CGRectGetMinY(aDFileButton) + 8.22)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 3.67) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 10.68, CGRectGetMinY(aDFileButton) + 5.98) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 13.47, CGRectGetMinY(aDFileButton) + 4.47)];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 2)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 18.41, CGRectGetMinY(aDFileButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 17.31, CGRectGetMinY(aDFileButton))];
                [bezier18Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 25.41, CGRectGetMinY(aDFileButton))];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 2) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 26.52, CGRectGetMinY(aDFileButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 0.9)];
                [bezier18Path closePath];
                [bezier18Path moveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 12.93, CGRectGetMinY(aDFileButton) + 13.51)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 12.93, CGRectGetMinY(aDFileButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 8.24, CGRectGetMinY(aDFileButton) + 18.2) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 8.24, CGRectGetMinY(aDFileButton) + 25.8)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 29.9, CGRectGetMinY(aDFileButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 17.61, CGRectGetMinY(aDFileButton) + 35.17) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 25.21, CGRectGetMinY(aDFileButton) + 35.17)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 29.9, CGRectGetMinY(aDFileButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 34.58, CGRectGetMinY(aDFileButton) + 25.8) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 34.58, CGRectGetMinY(aDFileButton) + 18.2)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 12.93, CGRectGetMinY(aDFileButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 25.21, CGRectGetMinY(aDFileButton) + 8.83) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 17.61, CGRectGetMinY(aDFileButton) + 8.83)];
                [bezier18Path closePath];
                [bezier18Path moveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 24.95, CGRectGetMinY(aDFileButton) + 25.54)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 24.95, CGRectGetMinY(aDFileButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 26.9, CGRectGetMinY(aDFileButton) + 23.58) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 26.9, CGRectGetMinY(aDFileButton) + 20.42)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 17.88, CGRectGetMinY(aDFileButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 23, CGRectGetMinY(aDFileButton) + 16.51) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 19.83, CGRectGetMinY(aDFileButton) + 16.51)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 17.88, CGRectGetMinY(aDFileButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 15.92, CGRectGetMinY(aDFileButton) + 20.42) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 15.92, CGRectGetMinY(aDFileButton) + 23.58)];
                [bezier18Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 24.95, CGRectGetMinY(aDFileButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 19.83, CGRectGetMinY(aDFileButton) + 27.49) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 23, CGRectGetMinY(aDFileButton) + 27.49)];
                [bezier18Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier18Path fill];
            }
        }
        
        
        if (isNormal)
        {
            //// Selected 10
            {
                //// Bezier 20 Drawing
                UIBezierPath* bezier20Path = UIBezierPath.bezierPath;
                [bezier20Path moveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 2)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 3.97)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 34.4, CGRectGetMinY(aDFileButton) + 8.13) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 29.94, CGRectGetMinY(aDFileButton) + 4.81) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 32.33, CGRectGetMinY(aDFileButton) + 6.19)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 35.85, CGRectGetMinY(aDFileButton) + 7.27)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 38.59, CGRectGetMinY(aDFileButton) + 7.97) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 36.8, CGRectGetMinY(aDFileButton) + 6.7) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 38.03, CGRectGetMinY(aDFileButton) + 7.02)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 42.15, CGRectGetMinY(aDFileButton) + 13.99)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 41.45, CGRectGetMinY(aDFileButton) + 16.73) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 42.72, CGRectGetMinY(aDFileButton) + 14.95) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 42.4, CGRectGetMinY(aDFileButton) + 16.17)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 39.91, CGRectGetMinY(aDFileButton) + 17.65)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 39.99, CGRectGetMinY(aDFileButton) + 26) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 40.55, CGRectGetMinY(aDFileButton) + 20.39) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 40.58, CGRectGetMinY(aDFileButton) + 23.24)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 41.32, CGRectGetMinY(aDFileButton) + 26.78)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 42.02, CGRectGetMinY(aDFileButton) + 29.52) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 42.27, CGRectGetMinY(aDFileButton) + 27.34) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 42.58, CGRectGetMinY(aDFileButton) + 28.57)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 38.46, CGRectGetMinY(aDFileButton) + 35.55)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 35.72, CGRectGetMinY(aDFileButton) + 36.25) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 37.9, CGRectGetMinY(aDFileButton) + 36.5) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 36.67, CGRectGetMinY(aDFileButton) + 36.81)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 34.66, CGRectGetMinY(aDFileButton) + 35.62)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 40.03) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 32.54, CGRectGetMinY(aDFileButton) + 37.69) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 30.05, CGRectGetMinY(aDFileButton) + 39.16)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 42)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 25.41, CGRectGetMinY(aDFileButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 43.1) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 26.52, CGRectGetMinY(aDFileButton) + 44)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 18.41, CGRectGetMinY(aDFileButton) + 44)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 42) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 17.31, CGRectGetMinY(aDFileButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 43.1)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 40.33)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 7.98, CGRectGetMinY(aDFileButton) + 35.44) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 13.32, CGRectGetMinY(aDFileButton) + 39.49) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 10.4, CGRectGetMinY(aDFileButton) + 37.86)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 6.58, CGRectGetMinY(aDFileButton) + 36.25)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 3.84, CGRectGetMinY(aDFileButton) + 35.55) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 5.63, CGRectGetMinY(aDFileButton) + 36.81) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 4.4, CGRectGetMinY(aDFileButton) + 36.5)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 0.28, CGRectGetMinY(aDFileButton) + 29.52)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 0.98, CGRectGetMinY(aDFileButton) + 26.78) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) - 0.28, CGRectGetMinY(aDFileButton) + 28.57) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 0.03, CGRectGetMinY(aDFileButton) + 27.34)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.71, CGRectGetMinY(aDFileButton) + 25.76)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.83, CGRectGetMinY(aDFileButton) + 25.98)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.93, CGRectGetMinY(aDFileButton) + 17.59)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 2.83, CGRectGetMinY(aDFileButton) + 17.75)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 1.11, CGRectGetMinY(aDFileButton) + 16.73)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 0.41, CGRectGetMinY(aDFileButton) + 13.99) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 0.16, CGRectGetMinY(aDFileButton) + 16.17) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) - 0.15, CGRectGetMinY(aDFileButton) + 14.95)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 3.97, CGRectGetMinY(aDFileButton) + 7.97)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 6.71, CGRectGetMinY(aDFileButton) + 7.27) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 4.53, CGRectGetMinY(aDFileButton) + 7.02) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 5.76, CGRectGetMinY(aDFileButton) + 6.7)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 8.33, CGRectGetMinY(aDFileButton) + 8.22)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 3.67) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 10.68, CGRectGetMinY(aDFileButton) + 5.98) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 13.47, CGRectGetMinY(aDFileButton) + 4.47)];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 2)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 18.41, CGRectGetMinY(aDFileButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 16.41, CGRectGetMinY(aDFileButton) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 17.31, CGRectGetMinY(aDFileButton))];
                [bezier20Path addLineToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 25.41, CGRectGetMinY(aDFileButton))];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 2) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 26.52, CGRectGetMinY(aDFileButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 27.41, CGRectGetMinY(aDFileButton) + 0.9)];
                [bezier20Path closePath];
                [bezier20Path moveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 12.93, CGRectGetMinY(aDFileButton) + 13.51)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 12.93, CGRectGetMinY(aDFileButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 8.24, CGRectGetMinY(aDFileButton) + 18.2) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 8.24, CGRectGetMinY(aDFileButton) + 25.8)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 29.9, CGRectGetMinY(aDFileButton) + 30.49) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 17.61, CGRectGetMinY(aDFileButton) + 35.17) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 25.21, CGRectGetMinY(aDFileButton) + 35.17)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 29.9, CGRectGetMinY(aDFileButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 34.58, CGRectGetMinY(aDFileButton) + 25.8) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 34.58, CGRectGetMinY(aDFileButton) + 18.2)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 12.93, CGRectGetMinY(aDFileButton) + 13.51) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 25.21, CGRectGetMinY(aDFileButton) + 8.83) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 17.61, CGRectGetMinY(aDFileButton) + 8.83)];
                [bezier20Path closePath];
                [bezier20Path moveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 24.95, CGRectGetMinY(aDFileButton) + 25.54)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 24.95, CGRectGetMinY(aDFileButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 26.9, CGRectGetMinY(aDFileButton) + 23.58) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 26.9, CGRectGetMinY(aDFileButton) + 20.42)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 17.88, CGRectGetMinY(aDFileButton) + 18.46) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 23, CGRectGetMinY(aDFileButton) + 16.51) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 19.83, CGRectGetMinY(aDFileButton) + 16.51)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 17.88, CGRectGetMinY(aDFileButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 15.92, CGRectGetMinY(aDFileButton) + 20.42) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 15.92, CGRectGetMinY(aDFileButton) + 23.58)];
                [bezier20Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDFileButton) + 24.95, CGRectGetMinY(aDFileButton) + 25.54) controlPoint1: CGPointMake(CGRectGetMinX(aDFileButton) + 19.83, CGRectGetMinY(aDFileButton) + 27.49) controlPoint2: CGPointMake(CGRectGetMinX(aDFileButton) + 23, CGRectGetMinY(aDFileButton) + 27.49)];
                [bezier20Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier20Path fill];
            }
        }
    }
}

@end
