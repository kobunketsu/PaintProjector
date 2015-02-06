//
//  SetupUnitZoomView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupUnitZoomView.h"

@implementation ADSetupUnitZoomView

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
    [self drawCanvas1WithFrame:rect isSelected:false];
}

- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDSetupUnitZoomView = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.48810 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45.23) * 0.44249 + 0.11) + 0.39, 44, 45.23);
    
    
    //// ADSetupUnitZoomView
    {
        if (isNormal)
        {
            //// Normal 29
            {
                //// Bezier 59 Drawing
                UIBezierPath* bezier59Path = UIBezierPath.bezierPath;
                [bezier59Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 44.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 44.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 44.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 44.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 3, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 1.12, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 3, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 5, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 5, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 10, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 6.44, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 8.14, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 10, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 17, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 13.59, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 15.27, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 17, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 19, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 19, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 24, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 20.66, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 22.34, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 24, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 31, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 27.71, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.4, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 31, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 33, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 33, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 38, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.83, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 36.52, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 38, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40, CGRectGetMinY(aDSetupUnitZoomView) + 37.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 42.48, CGRectGetMinY(aDSetupUnitZoomView) + 34.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 34.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 44.61)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 44.61)];
                [bezier59Path closePath];
                [bezier59Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 13.5)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 22) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 18.19) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 16.8, CGRectGetMinY(aDSetupUnitZoomView) + 22)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.99, CGRectGetMinY(aDSetupUnitZoomView) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26.18, CGRectGetMinY(aDSetupUnitZoomView) + 22) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.99, CGRectGetMinY(aDSetupUnitZoomView) + 18.19)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.99, CGRectGetMinY(aDSetupUnitZoomView) + 8.81) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26.18, CGRectGetMinY(aDSetupUnitZoomView) + 5)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 16.8, CGRectGetMinY(aDSetupUnitZoomView) + 5) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 8.81)];
                [bezier59Path closePath];
                [bezier59Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView))];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.99, CGRectGetMinY(aDSetupUnitZoomView) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 28.95, CGRectGetMinY(aDSetupUnitZoomView)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.99, CGRectGetMinY(aDSetupUnitZoomView) + 6.04)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 32.64, CGRectGetMinY(aDSetupUnitZoomView) + 21.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.99, CGRectGetMinY(aDSetupUnitZoomView) + 16.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.12, CGRectGetMinY(aDSetupUnitZoomView) + 18.95)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40.81, CGRectGetMinY(aDSetupUnitZoomView) + 29.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 35.94, CGRectGetMinY(aDSetupUnitZoomView) + 24.42) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40.81, CGRectGetMinY(aDSetupUnitZoomView) + 29.28)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40.58, CGRectGetMinY(aDSetupUnitZoomView) + 31.88) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 41.46, CGRectGetMinY(aDSetupUnitZoomView) + 29.94) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 41.36, CGRectGetMinY(aDSetupUnitZoomView) + 31.1)];
                [bezier59Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 39.87, CGRectGetMinY(aDSetupUnitZoomView) + 32.59)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 37.27, CGRectGetMinY(aDSetupUnitZoomView) + 32.82) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 39.09, CGRectGetMinY(aDSetupUnitZoomView) + 33.37) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 37.93, CGRectGetMinY(aDSetupUnitZoomView) + 33.47)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.1, CGRectGetMinY(aDSetupUnitZoomView) + 24.65) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 37.27, CGRectGetMinY(aDSetupUnitZoomView) + 32.82) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 32.41, CGRectGetMinY(aDSetupUnitZoomView) + 27.95)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 27) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26.94, CGRectGetMinY(aDSetupUnitZoomView) + 26.13) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 24.31, CGRectGetMinY(aDSetupUnitZoomView) + 27)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 7.99, CGRectGetMinY(aDSetupUnitZoomView) + 13.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 14.03, CGRectGetMinY(aDSetupUnitZoomView) + 27) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 7.99, CGRectGetMinY(aDSetupUnitZoomView) + 20.96)];
                [bezier59Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 7.99, CGRectGetMinY(aDSetupUnitZoomView) + 6.04) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 14.03, CGRectGetMinY(aDSetupUnitZoomView))];
                [bezier59Path closePath];
                [ADSharedUIStyleKit.cDisable setFill];
                [bezier59Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 29
            {
                //// Bezier 56 Drawing
                UIBezierPath* bezier56Path = UIBezierPath.bezierPath;
                [bezier56Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 45.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 45.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 45.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 45.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 3, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView), CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 1.12, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 3, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 5, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 5, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 10, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 6.44, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 8.14, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 10, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 17, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 13.59, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 15.27, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 17, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 19, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 19, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 24, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 20.66, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 22.34, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 24, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 31, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 27.71, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.4, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 31, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 33, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 33, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 38, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.83, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 36.52, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 38, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40, CGRectGetMinY(aDSetupUnitZoomView) + 38.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 42.48, CGRectGetMinY(aDSetupUnitZoomView) + 35.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 35.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 45.23)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 44, CGRectGetMinY(aDSetupUnitZoomView) + 45.23)];
                [bezier56Path closePath];
                [bezier56Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 14.11)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 22.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 18.81) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 16.8, CGRectGetMinY(aDSetupUnitZoomView) + 22.61)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.99, CGRectGetMinY(aDSetupUnitZoomView) + 14.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26.18, CGRectGetMinY(aDSetupUnitZoomView) + 22.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.99, CGRectGetMinY(aDSetupUnitZoomView) + 18.81)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 5.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.99, CGRectGetMinY(aDSetupUnitZoomView) + 9.42) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26.18, CGRectGetMinY(aDSetupUnitZoomView) + 5.61)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 14.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 16.8, CGRectGetMinY(aDSetupUnitZoomView) + 5.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 12.99, CGRectGetMinY(aDSetupUnitZoomView) + 9.42)];
                [bezier56Path closePath];
                [bezier56Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 0.61)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.99, CGRectGetMinY(aDSetupUnitZoomView) + 14.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 28.95, CGRectGetMinY(aDSetupUnitZoomView) + 0.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.99, CGRectGetMinY(aDSetupUnitZoomView) + 6.66)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 32.64, CGRectGetMinY(aDSetupUnitZoomView) + 21.73) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.99, CGRectGetMinY(aDSetupUnitZoomView) + 16.94) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 34.12, CGRectGetMinY(aDSetupUnitZoomView) + 19.56)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40.81, CGRectGetMinY(aDSetupUnitZoomView) + 29.9) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 35.94, CGRectGetMinY(aDSetupUnitZoomView) + 25.03) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40.81, CGRectGetMinY(aDSetupUnitZoomView) + 29.9)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 40.58, CGRectGetMinY(aDSetupUnitZoomView) + 32.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 41.46, CGRectGetMinY(aDSetupUnitZoomView) + 30.55) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 41.36, CGRectGetMinY(aDSetupUnitZoomView) + 31.72)];
                [bezier56Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 39.87, CGRectGetMinY(aDSetupUnitZoomView) + 33.2)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 37.27, CGRectGetMinY(aDSetupUnitZoomView) + 33.43) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 39.09, CGRectGetMinY(aDSetupUnitZoomView) + 33.99) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 37.93, CGRectGetMinY(aDSetupUnitZoomView) + 34.09)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 29.1, CGRectGetMinY(aDSetupUnitZoomView) + 25.26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 37.27, CGRectGetMinY(aDSetupUnitZoomView) + 33.43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 32.41, CGRectGetMinY(aDSetupUnitZoomView) + 28.56)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 27.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 26.94, CGRectGetMinY(aDSetupUnitZoomView) + 26.75) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 24.31, CGRectGetMinY(aDSetupUnitZoomView) + 27.61)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 7.99, CGRectGetMinY(aDSetupUnitZoomView) + 14.11) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 14.03, CGRectGetMinY(aDSetupUnitZoomView) + 27.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 7.99, CGRectGetMinY(aDSetupUnitZoomView) + 21.57)];
                [bezier56Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 21.49, CGRectGetMinY(aDSetupUnitZoomView) + 0.61) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 7.99, CGRectGetMinY(aDSetupUnitZoomView) + 6.66) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupUnitZoomView) + 14.03, CGRectGetMinY(aDSetupUnitZoomView) + 0.61)];
                [bezier56Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier56Path fill];
            }
        }
    }
}


@end
