//
//  GalleryButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADGalleryButton.h"

@implementation ADGalleryButton

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
    CGRect aDGalleryButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
    //// ADGalleryButton
    {
        if (isNormal)
        {
            //// Normal 2
            {
                //// Bezier 5 Drawing
                UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 7) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 6) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 6.45)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 16)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 16.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 16) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 17) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 16.55)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 7)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 6.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 7) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 6) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 6.45)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 16)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 16.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 16) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 17) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 16.55)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 7)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 6.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 7) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 6) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 6.45)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 16)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 16.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 16) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 17) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 16.55)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 7)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 6.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 22.45)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 32)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 33) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 32.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 32) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 33) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 32.55)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 23)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 22.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 22.45)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 32)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 33) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 32.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 32) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 33) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 32.55)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 23)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 22.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 22.45)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 32)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 33) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 32.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 32) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 33) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 32.55)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 23)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 22.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26.73, CGRectGetMinY(aDGalleryButton) + 36.73)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26.73, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.76, CGRectGetMinY(aDGalleryButton) + 37.71) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.76, CGRectGetMinY(aDGalleryButton) + 39.29)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 30.27, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 27.71, CGRectGetMinY(aDGalleryButton) + 41.24) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 29.29, CGRectGetMinY(aDGalleryButton) + 41.24)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 30.27, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.24, CGRectGetMinY(aDGalleryButton) + 39.29) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.24, CGRectGetMinY(aDGalleryButton) + 37.71)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26.73, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 29.29, CGRectGetMinY(aDGalleryButton) + 35.76) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 27.71, CGRectGetMinY(aDGalleryButton) + 35.76)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 20.23, CGRectGetMinY(aDGalleryButton) + 36.73)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 20.23, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19.26, CGRectGetMinY(aDGalleryButton) + 37.71) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19.26, CGRectGetMinY(aDGalleryButton) + 39.29)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 23.77, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 21.21, CGRectGetMinY(aDGalleryButton) + 41.24) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 22.79, CGRectGetMinY(aDGalleryButton) + 41.24)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 23.77, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 24.74, CGRectGetMinY(aDGalleryButton) + 39.29) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 24.74, CGRectGetMinY(aDGalleryButton) + 37.71)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 20.23, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 22.79, CGRectGetMinY(aDGalleryButton) + 35.76) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 21.21, CGRectGetMinY(aDGalleryButton) + 35.76)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13.73, CGRectGetMinY(aDGalleryButton) + 36.73)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13.73, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.76, CGRectGetMinY(aDGalleryButton) + 37.71) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.76, CGRectGetMinY(aDGalleryButton) + 39.29)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 17.27, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 14.71, CGRectGetMinY(aDGalleryButton) + 41.24) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 16.29, CGRectGetMinY(aDGalleryButton) + 41.24)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 17.27, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.24, CGRectGetMinY(aDGalleryButton) + 39.29) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.24, CGRectGetMinY(aDGalleryButton) + 37.71)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13.73, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 16.29, CGRectGetMinY(aDGalleryButton) + 35.76) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 14.71, CGRectGetMinY(aDGalleryButton) + 35.76)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 4)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 40)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 40, CGRectGetMinY(aDGalleryButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 42.21) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 42.21, CGRectGetMinY(aDGalleryButton) + 44)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 4, CGRectGetMinY(aDGalleryButton) + 44)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 40) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 1.79, CGRectGetMinY(aDGalleryButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 42.21)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 4)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 4, CGRectGetMinY(aDGalleryButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 1.79) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 1.79, CGRectGetMinY(aDGalleryButton))];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 40, CGRectGetMinY(aDGalleryButton))];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 4) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 42.21, CGRectGetMinY(aDGalleryButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 1.79)];
                [bezier5Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier5Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 2
            {
                //// Bezier 3 Drawing
                UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 7) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 6) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 6.45)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 16)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 16.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 16) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 17) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 16.55)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 7)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 6.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 7) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 6) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 6.45)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 16)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 16.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 16) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 17) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 16.55)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 7)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 6.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 7) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 6) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 6.45)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 16)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 16.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 17)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 16) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 17) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 16.55)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 7)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 6.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 6)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 22.45)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 32)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 32, CGRectGetMinY(aDGalleryButton) + 33) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31, CGRectGetMinY(aDGalleryButton) + 32.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.45, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 32) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 33) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 32.55)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 23)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38, CGRectGetMinY(aDGalleryButton) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 39, CGRectGetMinY(aDGalleryButton) + 22.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 38.55, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 22.45)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 32)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19, CGRectGetMinY(aDGalleryButton) + 33) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18, CGRectGetMinY(aDGalleryButton) + 32.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.45, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 32) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 33) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 32.55)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 23)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25, CGRectGetMinY(aDGalleryButton) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26, CGRectGetMinY(aDGalleryButton) + 22.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.55, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 22.45)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 32)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 6, CGRectGetMinY(aDGalleryButton) + 33) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5, CGRectGetMinY(aDGalleryButton) + 32.55) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 5.45, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 33)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 32) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 33) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 32.55)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 23)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12, CGRectGetMinY(aDGalleryButton) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13, CGRectGetMinY(aDGalleryButton) + 22.45) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.55, CGRectGetMinY(aDGalleryButton) + 22)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26.73, CGRectGetMinY(aDGalleryButton) + 36.73)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26.73, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.76, CGRectGetMinY(aDGalleryButton) + 37.71) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 25.76, CGRectGetMinY(aDGalleryButton) + 39.29)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 30.27, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 27.71, CGRectGetMinY(aDGalleryButton) + 41.24) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 29.29, CGRectGetMinY(aDGalleryButton) + 41.24)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 30.27, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.24, CGRectGetMinY(aDGalleryButton) + 39.29) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 31.24, CGRectGetMinY(aDGalleryButton) + 37.71)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 26.73, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 29.29, CGRectGetMinY(aDGalleryButton) + 35.76) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 27.71, CGRectGetMinY(aDGalleryButton) + 35.76)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 20.23, CGRectGetMinY(aDGalleryButton) + 36.73)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 20.23, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19.26, CGRectGetMinY(aDGalleryButton) + 37.71) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 19.26, CGRectGetMinY(aDGalleryButton) + 39.29)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 23.77, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 21.21, CGRectGetMinY(aDGalleryButton) + 41.24) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 22.79, CGRectGetMinY(aDGalleryButton) + 41.24)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 23.77, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 24.74, CGRectGetMinY(aDGalleryButton) + 39.29) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 24.74, CGRectGetMinY(aDGalleryButton) + 37.71)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 20.23, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 22.79, CGRectGetMinY(aDGalleryButton) + 35.76) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 21.21, CGRectGetMinY(aDGalleryButton) + 35.76)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13.73, CGRectGetMinY(aDGalleryButton) + 36.73)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13.73, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.76, CGRectGetMinY(aDGalleryButton) + 37.71) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 12.76, CGRectGetMinY(aDGalleryButton) + 39.29)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 17.27, CGRectGetMinY(aDGalleryButton) + 40.27) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 14.71, CGRectGetMinY(aDGalleryButton) + 41.24) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 16.29, CGRectGetMinY(aDGalleryButton) + 41.24)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 17.27, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.24, CGRectGetMinY(aDGalleryButton) + 39.29) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 18.24, CGRectGetMinY(aDGalleryButton) + 37.71)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 13.73, CGRectGetMinY(aDGalleryButton) + 36.73) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 16.29, CGRectGetMinY(aDGalleryButton) + 35.76) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 14.71, CGRectGetMinY(aDGalleryButton) + 35.76)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 4)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 40)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 40, CGRectGetMinY(aDGalleryButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 42.21) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 42.21, CGRectGetMinY(aDGalleryButton) + 44)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 4, CGRectGetMinY(aDGalleryButton) + 44)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 40) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 1.79, CGRectGetMinY(aDGalleryButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 42.21)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 4)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 4, CGRectGetMinY(aDGalleryButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton), CGRectGetMinY(aDGalleryButton) + 1.79) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 1.79, CGRectGetMinY(aDGalleryButton))];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 40, CGRectGetMinY(aDGalleryButton))];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 4) controlPoint1: CGPointMake(CGRectGetMinX(aDGalleryButton) + 42.21, CGRectGetMinY(aDGalleryButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDGalleryButton) + 44, CGRectGetMinY(aDGalleryButton) + 1.79)];
                [bezier3Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier3Path fill];
            }
        }
    }
}



@end
