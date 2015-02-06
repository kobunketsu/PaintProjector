//
//  AnamorphicTopViewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADAnamorphicTopViewButton.h"

@implementation ADAnamorphicTopViewButton

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
    CGRect aDAnamorphicTopViewButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 63.5) * 0.50388) + 0.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43.48) * 0.43816 - 0.02) + 0.52, 63.5, 43.48);
    
    
    //// ADAnamorphicTopViewButton
    {
        if (isNormal)
        {
            //// Normal 4
            {
                //// Bezier 9 Drawing
                UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
                [bezier9Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.29)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 39.43, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 39.43, CGRectGetMinY(aDAnamorphicTopViewButton) + 7.61)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 26.38, CGRectGetMinY(aDAnamorphicTopViewButton) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 33.78, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 29.2, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.75)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 26.38, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 23.56, CGRectGetMinY(aDAnamorphicTopViewButton) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 23.56, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.36)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 29.2, CGRectGetMinY(aDAnamorphicTopViewButton) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 33.78, CGRectGetMinY(aDAnamorphicTopViewButton) + 18.22)];
                [bezier9Path closePath];
                [bezier9Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 6.92, CGRectGetMinY(aDAnamorphicTopViewButton) + 0)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 14.58, CGRectGetMinY(aDAnamorphicTopViewButton) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 8.69, CGRectGetMinY(aDAnamorphicTopViewButton) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 12.16, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.15)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 22.9, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 17.96, CGRectGetMinY(aDAnamorphicTopViewButton) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 21.34, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.91)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 31.75, CGRectGetMinY(aDAnamorphicTopViewButton) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 24.46, CGRectGetMinY(aDAnamorphicTopViewButton) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 26.72, CGRectGetMinY(aDAnamorphicTopViewButton) + 19.25)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 40.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.78, CGRectGetMinY(aDAnamorphicTopViewButton) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 38.77, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.23)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 51.53, CGRectGetMinY(aDAnamorphicTopViewButton) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 42.42, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 48.23, CGRectGetMinY(aDAnamorphicTopViewButton) + 3.22)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 56.87, CGRectGetMinY(aDAnamorphicTopViewButton) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 53.51, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 55.56, CGRectGetMinY(aDAnamorphicTopViewButton) + 0.76)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 54.05, CGRectGetMinY(aDAnamorphicTopViewButton) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 66.57, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 65.63, CGRectGetMinY(aDAnamorphicTopViewButton) + 25.97)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 9.46, CGRectGetMinY(aDAnamorphicTopViewButton) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 41.44, CGRectGetMinY(aDAnamorphicTopViewButton) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 22.06, CGRectGetMinY(aDAnamorphicTopViewButton) + 46.11)];
                [bezier9Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 6.9, CGRectGetMinY(aDAnamorphicTopViewButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) - 2.23, CGRectGetMinY(aDAnamorphicTopViewButton) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) - 3.08, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.55)];
                [bezier9Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 6.92, CGRectGetMinY(aDAnamorphicTopViewButton) + 0)];
                [bezier9Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier9Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 4
            {
                //// Bezier 6 Drawing
                UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
                [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.29)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 39.42, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.36) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 39.42, CGRectGetMinY(aDAnamorphicTopViewButton) + 7.61)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 26.38, CGRectGetMinY(aDAnamorphicTopViewButton) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 33.78, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.75) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 29.2, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.75)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 26.38, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 23.55, CGRectGetMinY(aDAnamorphicTopViewButton) + 7.61) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 23.55, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.36)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.6, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 29.2, CGRectGetMinY(aDAnamorphicTopViewButton) + 18.22) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 33.78, CGRectGetMinY(aDAnamorphicTopViewButton) + 18.22)];
                [bezier6Path closePath];
                [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 6.91, CGRectGetMinY(aDAnamorphicTopViewButton) + 0)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 14.57, CGRectGetMinY(aDAnamorphicTopViewButton) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 8.69, CGRectGetMinY(aDAnamorphicTopViewButton) + 0.37) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 12.16, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.15)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 22.89, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 17.96, CGRectGetMinY(aDAnamorphicTopViewButton) + 3.51) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 21.33, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.91)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 31.74, CGRectGetMinY(aDAnamorphicTopViewButton) + 19.25) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 24.46, CGRectGetMinY(aDAnamorphicTopViewButton) + 14.64) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 26.71, CGRectGetMinY(aDAnamorphicTopViewButton) + 19.25)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 40.59, CGRectGetMinY(aDAnamorphicTopViewButton) + 12.77) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 36.78, CGRectGetMinY(aDAnamorphicTopViewButton) + 19.25) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 38.77, CGRectGetMinY(aDAnamorphicTopViewButton) + 15.23)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 51.52, CGRectGetMinY(aDAnamorphicTopViewButton) + 2.13) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 42.41, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.31) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 48.23, CGRectGetMinY(aDAnamorphicTopViewButton) + 3.22)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 56.87, CGRectGetMinY(aDAnamorphicTopViewButton) + 0.29) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 53.51, CGRectGetMinY(aDAnamorphicTopViewButton) + 1.48) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 55.55, CGRectGetMinY(aDAnamorphicTopViewButton) + 0.76)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 54.04, CGRectGetMinY(aDAnamorphicTopViewButton) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 66.56, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.82) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 65.62, CGRectGetMinY(aDAnamorphicTopViewButton) + 25.97)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 9.45, CGRectGetMinY(aDAnamorphicTopViewButton) + 35.61) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 41.44, CGRectGetMinY(aDAnamorphicTopViewButton) + 46.11) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 22.06, CGRectGetMinY(aDAnamorphicTopViewButton) + 46.11)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 6.89, CGRectGetMinY(aDAnamorphicTopViewButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) - 2.23, CGRectGetMinY(aDAnamorphicTopViewButton) + 25.88) controlPoint2: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) - 3.08, CGRectGetMinY(aDAnamorphicTopViewButton) + 10.55)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(aDAnamorphicTopViewButton) + 6.91, CGRectGetMinY(aDAnamorphicTopViewButton) + 0)];
                [bezier6Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier6Path fill];
            }
        }
    }
}


@end
