//
//  ADHelpButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADHelpButton.h"

@implementation ADHelpButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}

- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDHelpButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 27.4) * 0.50157 + 0.04) + 0.46, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43.77) * 0.44166 + 0.27) + 0.23, 27.4, 43.77);
    
    
    //// ADHelpButton
    {
        if (isNormal)
        {
            //// Normal 5
            {
                //// Bezier 11 Drawing
                UIBezierPath* bezier11Path = UIBezierPath.bezierPath;
                [bezier11Path moveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 42.56)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 39.77)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.93, CGRectGetMinY(aDHelpButton) + 38.81) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 39.77) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.63, CGRectGetMinY(aDHelpButton) + 39.16)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.55, CGRectGetMinY(aDHelpButton) + 38.38) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.23, CGRectGetMinY(aDHelpButton) + 38.46) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.55, CGRectGetMinY(aDHelpButton) + 38.38)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.38, CGRectGetMinY(aDHelpButton) + 38.38)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.11, CGRectGetMinY(aDHelpButton) + 38.81) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.38, CGRectGetMinY(aDHelpButton) + 38.38) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.83, CGRectGetMinY(aDHelpButton) + 38.46)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 39.77) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.38, CGRectGetMinY(aDHelpButton) + 39.16) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 39.77)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 42.6)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.11, CGRectGetMinY(aDHelpButton) + 43.35) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 42.6) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.41, CGRectGetMinY(aDHelpButton) + 43.06)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.26, CGRectGetMinY(aDHelpButton) + 43.77) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.8, CGRectGetMinY(aDHelpButton) + 43.65) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.26, CGRectGetMinY(aDHelpButton) + 43.77)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.67, CGRectGetMinY(aDHelpButton) + 43.77)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.93, CGRectGetMinY(aDHelpButton) + 43.35) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.67, CGRectGetMinY(aDHelpButton) + 43.77) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.26, CGRectGetMinY(aDHelpButton) + 43.66)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 42.56) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.6, CGRectGetMinY(aDHelpButton) + 43.05) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 42.56)];
                [bezier11Path closePath];
                [bezier11Path moveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton), CGRectGetMinY(aDHelpButton) + 13.94)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 3.74, CGRectGetMinY(aDHelpButton) + 4.05) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 0.14, CGRectGetMinY(aDHelpButton) + 9.88) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 1.39, CGRectGetMinY(aDHelpButton) + 6.58)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 14.04, CGRectGetMinY(aDHelpButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 6.24, CGRectGetMinY(aDHelpButton) + 1.35) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 9.68, CGRectGetMinY(aDHelpButton))];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 23.75, CGRectGetMinY(aDHelpButton) + 3.46) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.08, CGRectGetMinY(aDHelpButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.32, CGRectGetMinY(aDHelpButton) + 1.15)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 27.4, CGRectGetMinY(aDHelpButton) + 12.3) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 26.18, CGRectGetMinY(aDHelpButton) + 5.77) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 27.4, CGRectGetMinY(aDHelpButton) + 8.72)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 26.06, CGRectGetMinY(aDHelpButton) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 27.4, CGRectGetMinY(aDHelpButton) + 14.48) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 26.95, CGRectGetMinY(aDHelpButton) + 16.24)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 20.66, CGRectGetMinY(aDHelpButton) + 23.56) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 25.17, CGRectGetMinY(aDHelpButton) + 18.95) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 23.37, CGRectGetMinY(aDHelpButton) + 20.94)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.83, CGRectGetMinY(aDHelpButton) + 28.41) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.69, CGRectGetMinY(aDHelpButton) + 25.47) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 17.41, CGRectGetMinY(aDHelpButton) + 27.09)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.96, CGRectGetMinY(aDHelpButton) + 33.4) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.31, CGRectGetMinY(aDHelpButton) + 29.58) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.02, CGRectGetMinY(aDHelpButton) + 31.24)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.05, CGRectGetMinY(aDHelpButton) + 34.27) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.96, CGRectGetMinY(aDHelpButton) + 33.68) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.05, CGRectGetMinY(aDHelpButton) + 34.27)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.3, CGRectGetMinY(aDHelpButton) + 34.27)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.49, CGRectGetMinY(aDHelpButton) + 33.31) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.3, CGRectGetMinY(aDHelpButton) + 34.27) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.48, CGRectGetMinY(aDHelpButton) + 33.62)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.52, CGRectGetMinY(aDHelpButton) + 27.18) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.56, CGRectGetMinY(aDHelpButton) + 30.82) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.9, CGRectGetMinY(aDHelpButton) + 28.77)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.11, CGRectGetMinY(aDHelpButton) + 21.01) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 12.22, CGRectGetMinY(aDHelpButton) + 25.38) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 13.75, CGRectGetMinY(aDHelpButton) + 23.33)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.57, CGRectGetMinY(aDHelpButton) + 18.58)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 20.35, CGRectGetMinY(aDHelpButton) + 16.4) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 19.31, CGRectGetMinY(aDHelpButton) + 17.88) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 19.9, CGRectGetMinY(aDHelpButton) + 17.15)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.58, CGRectGetMinY(aDHelpButton) + 12.24) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.17, CGRectGetMinY(aDHelpButton) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.58, CGRectGetMinY(aDHelpButton) + 13.68)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 19.78, CGRectGetMinY(aDHelpButton) + 7.01) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.58, CGRectGetMinY(aDHelpButton) + 10.23) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 20.98, CGRectGetMinY(aDHelpButton) + 8.49)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 13.83, CGRectGetMinY(aDHelpButton) + 4.8) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.58, CGRectGetMinY(aDHelpButton) + 5.54) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.6, CGRectGetMinY(aDHelpButton) + 4.8)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 6.72, CGRectGetMinY(aDHelpButton) + 8.61) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.4, CGRectGetMinY(aDHelpButton) + 4.8) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 8.04, CGRectGetMinY(aDHelpButton) + 6.07)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 5.51, CGRectGetMinY(aDHelpButton) + 13.85) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 6.07, CGRectGetMinY(aDHelpButton) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 5.66, CGRectGetMinY(aDHelpButton) + 11.61)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 4.59, CGRectGetMinY(aDHelpButton) + 14.73) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 5.49, CGRectGetMinY(aDHelpButton) + 14.14) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 4.59, CGRectGetMinY(aDHelpButton) + 14.73)];
                [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 0.8, CGRectGetMinY(aDHelpButton) + 14.73)];
                [bezier11Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton), CGRectGetMinY(aDHelpButton) + 13.94) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 0.8, CGRectGetMinY(aDHelpButton) + 14.73) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) - 0.01, CGRectGetMinY(aDHelpButton) + 14.2)];
                [bezier11Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier11Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 5
            {
                //// Bezier 8 Drawing
                UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 42.56)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 39.77)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.93, CGRectGetMinY(aDHelpButton) + 38.81) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 39.77) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.63, CGRectGetMinY(aDHelpButton) + 39.16)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.55, CGRectGetMinY(aDHelpButton) + 38.38) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.23, CGRectGetMinY(aDHelpButton) + 38.46) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.55, CGRectGetMinY(aDHelpButton) + 38.38)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.38, CGRectGetMinY(aDHelpButton) + 38.38)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.11, CGRectGetMinY(aDHelpButton) + 38.81) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.38, CGRectGetMinY(aDHelpButton) + 38.38) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.83, CGRectGetMinY(aDHelpButton) + 38.46)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 39.77) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.38, CGRectGetMinY(aDHelpButton) + 39.16) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 39.77)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 42.6)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.11, CGRectGetMinY(aDHelpButton) + 43.35) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.47, CGRectGetMinY(aDHelpButton) + 42.6) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.41, CGRectGetMinY(aDHelpButton) + 43.06)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.26, CGRectGetMinY(aDHelpButton) + 43.77) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.8, CGRectGetMinY(aDHelpButton) + 43.65) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.26, CGRectGetMinY(aDHelpButton) + 43.77)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.67, CGRectGetMinY(aDHelpButton) + 43.77)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.93, CGRectGetMinY(aDHelpButton) + 43.35) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.67, CGRectGetMinY(aDHelpButton) + 43.77) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.26, CGRectGetMinY(aDHelpButton) + 43.66)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 42.56) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.6, CGRectGetMinY(aDHelpButton) + 43.05) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.35, CGRectGetMinY(aDHelpButton) + 42.56)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton), CGRectGetMinY(aDHelpButton) + 13.94)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 3.74, CGRectGetMinY(aDHelpButton) + 4.05) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 0.14, CGRectGetMinY(aDHelpButton) + 9.88) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 1.39, CGRectGetMinY(aDHelpButton) + 6.58)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 14.04, CGRectGetMinY(aDHelpButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 6.24, CGRectGetMinY(aDHelpButton) + 1.35) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 9.68, CGRectGetMinY(aDHelpButton))];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 23.75, CGRectGetMinY(aDHelpButton) + 3.46) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.08, CGRectGetMinY(aDHelpButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.32, CGRectGetMinY(aDHelpButton) + 1.15)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 27.4, CGRectGetMinY(aDHelpButton) + 12.3) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 26.18, CGRectGetMinY(aDHelpButton) + 5.77) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 27.4, CGRectGetMinY(aDHelpButton) + 8.72)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 26.06, CGRectGetMinY(aDHelpButton) + 17.6) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 27.4, CGRectGetMinY(aDHelpButton) + 14.48) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 26.95, CGRectGetMinY(aDHelpButton) + 16.24)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 20.66, CGRectGetMinY(aDHelpButton) + 23.56) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 25.16, CGRectGetMinY(aDHelpButton) + 18.95) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 23.37, CGRectGetMinY(aDHelpButton) + 20.94)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.83, CGRectGetMinY(aDHelpButton) + 28.41) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.69, CGRectGetMinY(aDHelpButton) + 25.47) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 17.41, CGRectGetMinY(aDHelpButton) + 27.09)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.96, CGRectGetMinY(aDHelpButton) + 33.4) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.31, CGRectGetMinY(aDHelpButton) + 29.58) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.02, CGRectGetMinY(aDHelpButton) + 31.24)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.05, CGRectGetMinY(aDHelpButton) + 34.27) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.96, CGRectGetMinY(aDHelpButton) + 33.68) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 15.05, CGRectGetMinY(aDHelpButton) + 34.27)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.3, CGRectGetMinY(aDHelpButton) + 34.27)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.49, CGRectGetMinY(aDHelpButton) + 33.31) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.3, CGRectGetMinY(aDHelpButton) + 34.27) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.48, CGRectGetMinY(aDHelpButton) + 33.62)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 11.52, CGRectGetMinY(aDHelpButton) + 27.18) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.56, CGRectGetMinY(aDHelpButton) + 30.82) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.9, CGRectGetMinY(aDHelpButton) + 28.77)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.11, CGRectGetMinY(aDHelpButton) + 21.01) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 12.22, CGRectGetMinY(aDHelpButton) + 25.38) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 13.75, CGRectGetMinY(aDHelpButton) + 23.33)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.57, CGRectGetMinY(aDHelpButton) + 18.58)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 20.35, CGRectGetMinY(aDHelpButton) + 16.4) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 19.3, CGRectGetMinY(aDHelpButton) + 17.88) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 19.9, CGRectGetMinY(aDHelpButton) + 17.15)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.58, CGRectGetMinY(aDHelpButton) + 12.24) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.17, CGRectGetMinY(aDHelpButton) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.58, CGRectGetMinY(aDHelpButton) + 13.68)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 19.78, CGRectGetMinY(aDHelpButton) + 7.01) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 21.58, CGRectGetMinY(aDHelpButton) + 10.23) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 20.98, CGRectGetMinY(aDHelpButton) + 8.49)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 13.83, CGRectGetMinY(aDHelpButton) + 4.8) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 18.58, CGRectGetMinY(aDHelpButton) + 5.54) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 16.6, CGRectGetMinY(aDHelpButton) + 4.8)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 6.72, CGRectGetMinY(aDHelpButton) + 8.61) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 10.4, CGRectGetMinY(aDHelpButton) + 4.8) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 8.04, CGRectGetMinY(aDHelpButton) + 6.07)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 5.51, CGRectGetMinY(aDHelpButton) + 13.85) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 6.07, CGRectGetMinY(aDHelpButton) + 9.87) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 5.66, CGRectGetMinY(aDHelpButton) + 11.61)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 4.59, CGRectGetMinY(aDHelpButton) + 14.73) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 5.49, CGRectGetMinY(aDHelpButton) + 14.14) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) + 4.59, CGRectGetMinY(aDHelpButton) + 14.73)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDHelpButton) + 0.8, CGRectGetMinY(aDHelpButton) + 14.73)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDHelpButton), CGRectGetMinY(aDHelpButton) + 13.94) controlPoint1: CGPointMake(CGRectGetMinX(aDHelpButton) + 0.8, CGRectGetMinY(aDHelpButton) + 14.73) controlPoint2: CGPointMake(CGRectGetMinX(aDHelpButton) - 0.01, CGRectGetMinY(aDHelpButton) + 14.2)];
                [bezier8Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier8Path fill];
            }
        }
    }
}



@end
