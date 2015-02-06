//
//  AnamorphicViewModeButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAnamorphicSideViewButton.h"

@implementation ADAnamorphicSideViewButton

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
    CGRect aDAnamorphicSideViewButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 49.57) * 0.50274 + 0.07) + 0.43, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44.53) * 0.45114 + 0.03) + 0.47, 49.57, 44.53);
    
    
    //// ADAnamorphicSideViewButton
    {
        if (isNormal)
        {
            //// Normal 3
            {
                //// Bezier 7 Drawing
                UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.47, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.53)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.47, CGRectGetMinY(aDAnamorphicSideViewButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.94, CGRectGetMinY(aDAnamorphicSideViewButton) + 5.81) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.94, CGRectGetMinY(aDAnamorphicSideViewButton) + 3.02)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.49, CGRectGetMinY(aDAnamorphicSideViewButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.99, CGRectGetMinY(aDAnamorphicSideViewButton) - 0.43) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 22.97, CGRectGetMinY(aDAnamorphicSideViewButton) - 0.43)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.49, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.53) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.01, CGRectGetMinY(aDAnamorphicSideViewButton) + 3.02) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.01, CGRectGetMinY(aDAnamorphicSideViewButton) + 5.81)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.47, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.53) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 22.97, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.26) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.99, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.26)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.68)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.75, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.68) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.71, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.28) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.48)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.28, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.28, CGRectGetMinY(aDAnamorphicSideViewButton) + 20.86)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.44, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.21, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.98) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 30.6, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.08)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.54, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.98, CGRectGetMinY(aDAnamorphicSideViewButton) + 25.73) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 23, CGRectGetMinY(aDAnamorphicSideViewButton) + 25.73)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.7, CGRectGetMinY(aDAnamorphicSideViewButton) + 20.86) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 19.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.08) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.77, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.98)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 20.66)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.68)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.54, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.11) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.86) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 19.31, CGRectGetMinY(aDAnamorphicSideViewButton) + 8.21)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.44, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.11) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 23, CGRectGetMinY(aDAnamorphicSideViewButton) + 10.91) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.98, CGRectGetMinY(aDAnamorphicSideViewButton) + 10.91)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.23, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 30.88, CGRectGetMinY(aDAnamorphicSideViewButton) + 8.06) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.48, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.45)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.28, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 5.4, CGRectGetMinY(aDAnamorphicSideViewButton) + 15)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 11.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 16.45) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 6.78, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.25) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 9.49, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.78)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 17.87, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.9) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 14.02, CGRectGetMinY(aDAnamorphicSideViewButton) + 17.38) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 16.66, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.63)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 24.78, CGRectGetMinY(aDAnamorphicSideViewButton) + 26.91) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 19.09, CGRectGetMinY(aDAnamorphicSideViewButton) + 24.17) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.85, CGRectGetMinY(aDAnamorphicSideViewButton) + 26.91)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.9) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 28.71, CGRectGetMinY(aDAnamorphicSideViewButton) + 26.91) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 30.27, CGRectGetMinY(aDAnamorphicSideViewButton) + 24.57)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 40.22, CGRectGetMinY(aDAnamorphicSideViewButton) + 16.45) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 33.11, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.23) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 37.65, CGRectGetMinY(aDAnamorphicSideViewButton) + 17.19)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 44.4, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.19) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 41.77, CGRectGetMinY(aDAnamorphicSideViewButton) + 16.01) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 43.37, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.51)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 42.19, CGRectGetMinY(aDAnamorphicSideViewButton) + 39.19) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 51.96, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.35) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 51.23, CGRectGetMinY(aDAnamorphicSideViewButton) + 32.64)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 7.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 39.19) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 32.35, CGRectGetMinY(aDAnamorphicSideViewButton) + 46.32) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 17.22, CGRectGetMinY(aDAnamorphicSideViewButton) + 46.32)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 5.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 15) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) - 1.74, CGRectGetMinY(aDAnamorphicSideViewButton) + 32.58) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) - 2.41, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.16)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 5.4, CGRectGetMinY(aDAnamorphicSideViewButton) + 15)];
                [bezier7Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier7Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 3
            {
                //// Bezier 4 Drawing
                UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.46, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.53)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.46, CGRectGetMinY(aDAnamorphicSideViewButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.94, CGRectGetMinY(aDAnamorphicSideViewButton) + 5.81) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.94, CGRectGetMinY(aDAnamorphicSideViewButton) + 3.02)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.49, CGRectGetMinY(aDAnamorphicSideViewButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.99, CGRectGetMinY(aDAnamorphicSideViewButton) - 0.43) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 22.97, CGRectGetMinY(aDAnamorphicSideViewButton) - 0.43)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.49, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.53) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.01, CGRectGetMinY(aDAnamorphicSideViewButton) + 3.02) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.01, CGRectGetMinY(aDAnamorphicSideViewButton) + 5.81)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.46, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.53) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 22.97, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.26) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.99, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.26)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.68)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.75, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.68) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.71, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.28) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.48)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.28, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.28, CGRectGetMinY(aDAnamorphicSideViewButton) + 20.86)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.44, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.21, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.98) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 30.6, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.08)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.54, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.92) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.98, CGRectGetMinY(aDAnamorphicSideViewButton) + 25.73) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 22.99, CGRectGetMinY(aDAnamorphicSideViewButton) + 25.73)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.7, CGRectGetMinY(aDAnamorphicSideViewButton) + 20.86) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 19.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 23.08) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.76, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.98)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 20.66)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.68)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.54, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.11) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 18.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.86) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 19.31, CGRectGetMinY(aDAnamorphicSideViewButton) + 8.21)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 29.44, CGRectGetMinY(aDAnamorphicSideViewButton) + 9.11) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 22.99, CGRectGetMinY(aDAnamorphicSideViewButton) + 10.91) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 26.98, CGRectGetMinY(aDAnamorphicSideViewButton) + 10.91)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.23, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 30.88, CGRectGetMinY(aDAnamorphicSideViewButton) + 8.06) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.47, CGRectGetMinY(aDAnamorphicSideViewButton) + 7.45)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.28, CGRectGetMinY(aDAnamorphicSideViewButton) + 6.08)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 5.4, CGRectGetMinY(aDAnamorphicSideViewButton) + 15)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 11.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 16.45) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 6.78, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.25) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 9.49, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.78)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 17.87, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.9) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 14.02, CGRectGetMinY(aDAnamorphicSideViewButton) + 17.38) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 16.65, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.63)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 24.78, CGRectGetMinY(aDAnamorphicSideViewButton) + 26.91) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 19.09, CGRectGetMinY(aDAnamorphicSideViewButton) + 24.17) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 20.85, CGRectGetMinY(aDAnamorphicSideViewButton) + 26.91)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 31.69, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.9) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 28.71, CGRectGetMinY(aDAnamorphicSideViewButton) + 26.91) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 30.27, CGRectGetMinY(aDAnamorphicSideViewButton) + 24.57)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 40.22, CGRectGetMinY(aDAnamorphicSideViewButton) + 16.45) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 33.11, CGRectGetMinY(aDAnamorphicSideViewButton) + 21.23) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 37.65, CGRectGetMinY(aDAnamorphicSideViewButton) + 17.19)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 44.4, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.19) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 41.77, CGRectGetMinY(aDAnamorphicSideViewButton) + 16.01) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 43.37, CGRectGetMinY(aDAnamorphicSideViewButton) + 15.51)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 42.19, CGRectGetMinY(aDAnamorphicSideViewButton) + 39.19) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 51.96, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.35) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 51.23, CGRectGetMinY(aDAnamorphicSideViewButton) + 32.64)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 7.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 39.19) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 32.35, CGRectGetMinY(aDAnamorphicSideViewButton) + 46.32) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 17.22, CGRectGetMinY(aDAnamorphicSideViewButton) + 46.32)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 5.38, CGRectGetMinY(aDAnamorphicSideViewButton) + 15) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) - 1.74, CGRectGetMinY(aDAnamorphicSideViewButton) + 32.58) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) - 2.41, CGRectGetMinY(aDAnamorphicSideViewButton) + 22.16)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicSideViewButton) + 5.4, CGRectGetMinY(aDAnamorphicSideViewButton) + 15)];
                [bezier4Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier4Path fill];
            }
        }
    }
}



@end
