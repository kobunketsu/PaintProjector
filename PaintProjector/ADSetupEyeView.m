//
//  SetupEyeView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupEyeView.h"

@implementation ADSetupEyeView

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
    CGRect aDSetupEyeView = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 54) * 0.48646 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 34) * 0.45648 + 0.5) + 0, 54, 34);
    
    
    //// ADSetupEyeView
    {
        if (isNormal)
        {
            //// Normal 28
            {
                //// Bezier 57 Drawing
                UIBezierPath* bezier57Path = UIBezierPath.bezierPath;
                [bezier57Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.95, CGRectGetMinY(aDSetupEyeView) + 6.95)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.95, CGRectGetMinY(aDSetupEyeView) + 26.05) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 12.68, CGRectGetMinY(aDSetupEyeView) + 12.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 12.68, CGRectGetMinY(aDSetupEyeView) + 20.77)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 37.04, CGRectGetMinY(aDSetupEyeView) + 26.05) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.22, CGRectGetMinY(aDSetupEyeView) + 31.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 31.77, CGRectGetMinY(aDSetupEyeView) + 31.32)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 37.04, CGRectGetMinY(aDSetupEyeView) + 6.95) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 42.31, CGRectGetMinY(aDSetupEyeView) + 20.77) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 42.31, CGRectGetMinY(aDSetupEyeView) + 12.23)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.95, CGRectGetMinY(aDSetupEyeView) + 6.95) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 31.77, CGRectGetMinY(aDSetupEyeView) + 1.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.22, CGRectGetMinY(aDSetupEyeView) + 1.68)];
                [bezier57Path closePath];
                [bezier57Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView))];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 43.26, CGRectGetMinY(aDSetupEyeView) + 4.74) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 36.56, CGRectGetMinY(aDSetupEyeView) + 0.04)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 54, CGRectGetMinY(aDSetupEyeView) + 16.8) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 49.96, CGRectGetMinY(aDSetupEyeView) + 9.44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 54, CGRectGetMinY(aDSetupEyeView) + 16.8)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 43.26, CGRectGetMinY(aDSetupEyeView) + 29.26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 54, CGRectGetMinY(aDSetupEyeView) + 16.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 49.91, CGRectGetMinY(aDSetupEyeView) + 24.46)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.4, CGRectGetMinY(aDSetupEyeView) + 34) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 36.61, CGRectGetMinY(aDSetupEyeView) + 34.06) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.4, CGRectGetMinY(aDSetupEyeView) + 34)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 10.73, CGRectGetMinY(aDSetupEyeView) + 29.26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.4, CGRectGetMinY(aDSetupEyeView) + 34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.58, CGRectGetMinY(aDSetupEyeView) + 33.91)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView), CGRectGetMinY(aDSetupEyeView) + 17.4) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 3.88, CGRectGetMinY(aDSetupEyeView) + 24.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView), CGRectGetMinY(aDSetupEyeView) + 17.4)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 10.73, CGRectGetMinY(aDSetupEyeView) + 4.74) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView), CGRectGetMinY(aDSetupEyeView) + 17.4) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 3.93, CGRectGetMinY(aDSetupEyeView) + 9.59)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.53, CGRectGetMinY(aDSetupEyeView) - 0.11) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView))];
                [bezier57Path closePath];
                [bezier57Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 32.24, CGRectGetMinY(aDSetupEyeView) + 20.24)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 32.24, CGRectGetMinY(aDSetupEyeView) + 11.76) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 34.58, CGRectGetMinY(aDSetupEyeView) + 17.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 34.58, CGRectGetMinY(aDSetupEyeView) + 14.1)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.75, CGRectGetMinY(aDSetupEyeView) + 11.76) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 29.9, CGRectGetMinY(aDSetupEyeView) + 9.41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 26.1, CGRectGetMinY(aDSetupEyeView) + 9.41)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.75, CGRectGetMinY(aDSetupEyeView) + 20.24) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 21.41, CGRectGetMinY(aDSetupEyeView) + 14.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 21.41, CGRectGetMinY(aDSetupEyeView) + 17.9)];
                [bezier57Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 32.24, CGRectGetMinY(aDSetupEyeView) + 20.24) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 26.1, CGRectGetMinY(aDSetupEyeView) + 22.59) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 29.9, CGRectGetMinY(aDSetupEyeView) + 22.59)];
                [bezier57Path closePath];
                [ADSharedUIStyleKit.cDisable setFill];
                [bezier57Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 28
            {
                //// Bezier 54 Drawing
                UIBezierPath* bezier54Path = UIBezierPath.bezierPath;
                [bezier54Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.95, CGRectGetMinY(aDSetupEyeView) + 6.95)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.95, CGRectGetMinY(aDSetupEyeView) + 26.05) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 12.68, CGRectGetMinY(aDSetupEyeView) + 12.23) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 12.68, CGRectGetMinY(aDSetupEyeView) + 20.77)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 37.04, CGRectGetMinY(aDSetupEyeView) + 26.05) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.22, CGRectGetMinY(aDSetupEyeView) + 31.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 31.77, CGRectGetMinY(aDSetupEyeView) + 31.32)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 37.04, CGRectGetMinY(aDSetupEyeView) + 6.95) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 42.31, CGRectGetMinY(aDSetupEyeView) + 20.77) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 42.31, CGRectGetMinY(aDSetupEyeView) + 12.23)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.95, CGRectGetMinY(aDSetupEyeView) + 6.95) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 31.77, CGRectGetMinY(aDSetupEyeView) + 1.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.22, CGRectGetMinY(aDSetupEyeView) + 1.68)];
                [bezier54Path closePath];
                [bezier54Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView))];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 43.26, CGRectGetMinY(aDSetupEyeView) + 4.74) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView)) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 36.56, CGRectGetMinY(aDSetupEyeView) + 0.04)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 54, CGRectGetMinY(aDSetupEyeView) + 16.8) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 49.96, CGRectGetMinY(aDSetupEyeView) + 9.44) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 54, CGRectGetMinY(aDSetupEyeView) + 16.8)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 43.26, CGRectGetMinY(aDSetupEyeView) + 29.26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 54, CGRectGetMinY(aDSetupEyeView) + 16.8) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 49.91, CGRectGetMinY(aDSetupEyeView) + 24.46)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.4, CGRectGetMinY(aDSetupEyeView) + 34) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 36.61, CGRectGetMinY(aDSetupEyeView) + 34.06) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.4, CGRectGetMinY(aDSetupEyeView) + 34)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 10.73, CGRectGetMinY(aDSetupEyeView) + 29.26) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.4, CGRectGetMinY(aDSetupEyeView) + 34) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.58, CGRectGetMinY(aDSetupEyeView) + 33.91)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView), CGRectGetMinY(aDSetupEyeView) + 17.4) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 3.88, CGRectGetMinY(aDSetupEyeView) + 24.61) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView), CGRectGetMinY(aDSetupEyeView) + 17.4)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 10.73, CGRectGetMinY(aDSetupEyeView) + 4.74) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView), CGRectGetMinY(aDSetupEyeView) + 17.4) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 3.93, CGRectGetMinY(aDSetupEyeView) + 9.59)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView)) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 17.53, CGRectGetMinY(aDSetupEyeView) - 0.11) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 27.2, CGRectGetMinY(aDSetupEyeView))];
                [bezier54Path closePath];
                [bezier54Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 32.24, CGRectGetMinY(aDSetupEyeView) + 20.24)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 32.24, CGRectGetMinY(aDSetupEyeView) + 11.76) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 34.58, CGRectGetMinY(aDSetupEyeView) + 17.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 34.58, CGRectGetMinY(aDSetupEyeView) + 14.1)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.75, CGRectGetMinY(aDSetupEyeView) + 11.76) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 29.9, CGRectGetMinY(aDSetupEyeView) + 9.41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 26.1, CGRectGetMinY(aDSetupEyeView) + 9.41)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 23.75, CGRectGetMinY(aDSetupEyeView) + 20.24) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 21.41, CGRectGetMinY(aDSetupEyeView) + 14.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 21.41, CGRectGetMinY(aDSetupEyeView) + 17.9)];
                [bezier54Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 32.24, CGRectGetMinY(aDSetupEyeView) + 20.24) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 26.1, CGRectGetMinY(aDSetupEyeView) + 22.59) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupEyeView) + 29.9, CGRectGetMinY(aDSetupEyeView) + 22.59)];
                [bezier54Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier54Path fill];
            }
        }
    }
}



@end
