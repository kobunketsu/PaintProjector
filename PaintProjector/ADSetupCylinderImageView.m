//
//  SetupCylinderImageView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderImageView.h"

@implementation ADSetupCylinderImageView

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
    CGRect aDSetupCylinderImageViewh = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.48810 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
    //// ADSetupCylinderImageView.h
    {
        if (isNormal)
        {
            //// Normal 27
            {
                //// Bezier 55 Drawing
                UIBezierPath* bezier55Path = UIBezierPath.bezierPath;
                [bezier55Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 36.98)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 7.02, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 38.27) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.73, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.98, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 36.98) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.27, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 38.27)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.02)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.98, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 5.73) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.27, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 7.02, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.02) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.73, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 5.73)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 36.98)];
                [bezier55Path closePath];
                [bezier55Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 38.85)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 5.15)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.15, CGRectGetMinY(aDSetupCylinderImageViewh)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 2.31) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 2.31, CGRectGetMinY(aDSetupCylinderImageViewh))];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.85, CGRectGetMinY(aDSetupCylinderImageViewh))];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 5.15) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 41.69, CGRectGetMinY(aDSetupCylinderImageViewh)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 2.31)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 38.85)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.85, CGRectGetMinY(aDSetupCylinderImageViewh) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 41.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 41.69, CGRectGetMinY(aDSetupCylinderImageViewh) + 44)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.15, CGRectGetMinY(aDSetupCylinderImageViewh) + 44)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 38.85) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 2.31, CGRectGetMinY(aDSetupCylinderImageViewh) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 41.69)];
                [bezier55Path closePath];
                [bezier55Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.09, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.57, CGRectGetMinY(aDSetupCylinderImageViewh) + 25.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 32.28, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.57, CGRectGetMinY(aDSetupCylinderImageViewh) + 25.28)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.57, CGRectGetMinY(aDSetupCylinderImageViewh) + 35.57)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 9.36, CGRectGetMinY(aDSetupCylinderImageViewh) + 35.57)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.09, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 9.36, CGRectGetMinY(aDSetupCylinderImageViewh) + 35.57) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 20.13, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53)];
                [bezier55Path closePath];
                [bezier55Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 24.79, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.06)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 34.64) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 16.71, CGRectGetMinY(aDSetupCylinderImageViewh) + 24.79) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 34.64)];
                [bezier55Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.77)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 14.04, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.85) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.77) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 9.84, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.85)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 24.79, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.06) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 16.99, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.85) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 20.96, CGRectGetMinY(aDSetupCylinderImageViewh) + 17.67)];
                [bezier55Path closePath];
                [bezier55Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.14, CGRectGetMinY(aDSetupCylinderImageViewh) + 14.54)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.14, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.92) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.97, CGRectGetMinY(aDSetupCylinderImageViewh) + 12.72) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.97, CGRectGetMinY(aDSetupCylinderImageViewh) + 9.75)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.52, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.92) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 33.31, CGRectGetMinY(aDSetupCylinderImageViewh) + 6.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 30.35, CGRectGetMinY(aDSetupCylinderImageViewh) + 6.1)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.52, CGRectGetMinY(aDSetupCylinderImageViewh) + 14.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 26.69, CGRectGetMinY(aDSetupCylinderImageViewh) + 9.75) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 26.69, CGRectGetMinY(aDSetupCylinderImageViewh) + 12.72)];
                [bezier55Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.14, CGRectGetMinY(aDSetupCylinderImageViewh) + 14.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 30.35, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.37) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 33.31, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.37)];
                [bezier55Path closePath];
                [ADSharedUIStyleKit.cDisable setFill];
                [bezier55Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 27
            {
                //// Bezier 53 Drawing
                UIBezierPath* bezier53Path = UIBezierPath.bezierPath;
                [bezier53Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 36.98)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 7.02, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 38.27) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.73, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.98, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 36.98) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.27, CGRectGetMinY(aDSetupCylinderImageViewh) + 39.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 38.27)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.02)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.98, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 39.32, CGRectGetMinY(aDSetupCylinderImageViewh) + 5.73) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.27, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 7.02, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.02) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.73, CGRectGetMinY(aDSetupCylinderImageViewh) + 4.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 5.73)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 4.68, CGRectGetMinY(aDSetupCylinderImageViewh) + 36.98)];
                [bezier53Path closePath];
                [bezier53Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 38.85)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 5.15)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.15, CGRectGetMinY(aDSetupCylinderImageViewh)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 2.31) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 2.31, CGRectGetMinY(aDSetupCylinderImageViewh))];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.85, CGRectGetMinY(aDSetupCylinderImageViewh))];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 5.15) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 41.69, CGRectGetMinY(aDSetupCylinderImageViewh)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 2.31)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 38.85)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 38.85, CGRectGetMinY(aDSetupCylinderImageViewh) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 44, CGRectGetMinY(aDSetupCylinderImageViewh) + 41.69) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 41.69, CGRectGetMinY(aDSetupCylinderImageViewh) + 44)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 5.15, CGRectGetMinY(aDSetupCylinderImageViewh) + 44)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 38.85) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 2.31, CGRectGetMinY(aDSetupCylinderImageViewh) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh), CGRectGetMinY(aDSetupCylinderImageViewh) + 41.69)];
                [bezier53Path closePath];
                [bezier53Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.09, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.57, CGRectGetMinY(aDSetupCylinderImageViewh) + 25.28) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 32.28, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.57, CGRectGetMinY(aDSetupCylinderImageViewh) + 25.28)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.57, CGRectGetMinY(aDSetupCylinderImageViewh) + 35.57)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 9.36, CGRectGetMinY(aDSetupCylinderImageViewh) + 35.57)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.09, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 9.36, CGRectGetMinY(aDSetupCylinderImageViewh) + 35.57) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 20.13, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.53)];
                [bezier53Path closePath];
                [bezier53Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 24.79, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.06)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 34.64) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 16.71, CGRectGetMinY(aDSetupCylinderImageViewh) + 24.79) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 34.64)];
                [bezier53Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.77)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 14.04, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.85) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 8.43, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.77) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 9.84, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.85)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 24.79, CGRectGetMinY(aDSetupCylinderImageViewh) + 21.06) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 16.99, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.85) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 20.96, CGRectGetMinY(aDSetupCylinderImageViewh) + 17.67)];
                [bezier53Path closePath];
                [bezier53Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.14, CGRectGetMinY(aDSetupCylinderImageViewh) + 14.54)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.14, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.92) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.97, CGRectGetMinY(aDSetupCylinderImageViewh) + 12.72) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 36.97, CGRectGetMinY(aDSetupCylinderImageViewh) + 9.75)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.52, CGRectGetMinY(aDSetupCylinderImageViewh) + 7.92) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 33.31, CGRectGetMinY(aDSetupCylinderImageViewh) + 6.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 30.35, CGRectGetMinY(aDSetupCylinderImageViewh) + 6.1)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 28.52, CGRectGetMinY(aDSetupCylinderImageViewh) + 14.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 26.69, CGRectGetMinY(aDSetupCylinderImageViewh) + 9.75) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 26.69, CGRectGetMinY(aDSetupCylinderImageViewh) + 12.72)];
                [bezier53Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 35.14, CGRectGetMinY(aDSetupCylinderImageViewh) + 14.54) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 30.35, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.37) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderImageViewh) + 33.31, CGRectGetMinY(aDSetupCylinderImageViewh) + 16.37)];
                [bezier53Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier53Path fill];
            }
        }
    }
}


@end
