//
//  ADSetupCylinderRefTeaCupButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefTeaCupButton.h"

@implementation ADSetupCylinderRefTeaCupButton

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
    CGRect aDSetupCylinderRefTeaCupButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
    //// ADSetupCylinderRefTeaCupButton
    {
        if (isNormal)
        {
            //// Normal 22
            {
                //// Bezier 45 Drawing
                UIBezierPath* bezier45Path = UIBezierPath.bezierPath;
                [bezier45Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 6.2, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 3.56)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 6.2, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.84, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 5.97) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.84, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.87)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 27.64, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 10.57, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 23.28, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.68)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 27.64, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 5.97)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 6.2, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 23.28, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 1.16) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 10.57, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 1.16)];
                [bezier45Path closePath];
                [bezier45Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.61, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.55) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.76, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.26) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.68, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.42)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.96, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.06) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.41, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 19.12) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.15, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 25.49)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.51) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.16, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.33) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.51)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 37.23, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 26.99) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 34.97, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 29.33)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.74, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 18.77) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 39.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 24.64) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.75, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 22.05)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 39.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 12.91) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.74, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 15.6) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.46, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 37.51, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 34.97, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 11.73)];
                [bezier45Path closePath];
                [bezier45Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 29.39, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 2.58)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.36, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 4.3) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 6.55)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.77, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 10.6) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.82, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.47)];
                [bezier45Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 10.56)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 40.62, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 10.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 36.1, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 38.36, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.39)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 42.87, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 38.36, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 29.33) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 21.12) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 40.9, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 26.4)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.79, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 34.02) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 36.02, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 32.04) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.37, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 33.92)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.72, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 35.79) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.75, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 35.13) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.72, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 35.79)];
                [bezier45Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.72, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96)];
                [bezier45Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.56, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 28.26, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.11, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 38.66) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 30.68, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 40.29)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 5.59, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 22.31, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 44.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 11.54, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 44.8)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.28, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 3.17, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 40.29) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.73, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 38.66)];
                [bezier45Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.13, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96)];
                [bezier45Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton), CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 8.8)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 4.46, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton), CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 6.55) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 4.3)];
                [bezier45Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 29.39, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 10.41, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) - 0.86) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 23.44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) - 0.86)];
                [bezier45Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier45Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 22
            {
                //// Bezier 42 Drawing
                UIBezierPath* bezier42Path = UIBezierPath.bezierPath;
                [bezier42Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 6.2, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 3.56)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 6.2, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.84, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 5.97) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.84, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.87)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 27.64, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 12.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 10.57, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 23.28, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.68)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 27.64, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 5.97)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 6.2, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 3.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 23.28, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 1.16) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 10.57, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 1.16)];
                [bezier42Path closePath];
                [bezier42Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.61, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.55) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.76, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.26) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.68, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.42)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.96, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.06) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.41, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 19.12) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.15, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 25.49)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.51) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.16, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.33) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.51)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 37.23, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 26.99) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 30.51) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 34.97, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 29.33)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.74, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 18.77) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 39.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 24.64) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.75, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 22.05)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 39.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 12.91) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.74, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 15.6) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 41.46, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 37.51, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 34.97, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 11.73)];
                [bezier42Path closePath];
                [bezier42Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 29.39, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 2.58)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 8.8) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.36, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 4.3) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 6.55)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.77, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 10.6) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 8.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.82, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.47)];
                [bezier42Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.85, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 10.56)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 40.62, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 10.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 36.1, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.39) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 38.36, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 9.39)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 42.87, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 11.73) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 14.08)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 38.36, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 29.33) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 21.12) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 40.9, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 26.4)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.79, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 34.02) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 36.02, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 32.04) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 33.37, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 33.92)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.72, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 35.79) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.75, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 35.13) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.72, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 35.79)];
                [bezier42Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.72, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96)];
                [bezier42Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.56, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 28.26, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 32.11, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 38.66) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 30.68, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 40.29)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 5.59, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 41.59) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 22.31, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 44.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 11.54, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 44.8)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.28, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 3.17, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 40.29) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.73, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 38.66)];
                [bezier42Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.13, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 36.96)];
                [bezier42Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton), CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 8.8)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 4.46, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton), CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 6.55) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 1.49, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 4.3)];
                [bezier42Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 29.39, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) + 2.58) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 10.41, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) - 0.86) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefTeaCupButton) + 23.44, CGRectGetMinY(aDSetupCylinderRefTeaCupButton) - 0.86)];
                [bezier42Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier42Path fill];
            }
        }
    }
}


@end
