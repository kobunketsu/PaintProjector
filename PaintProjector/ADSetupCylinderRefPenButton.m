//
//  ADSetupCylinderRefPenButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderRefPenButton.h"

@implementation ADSetupCylinderRefPenButton

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
    CGRect aDSetupCylinderRefPenButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 5) * 0.50407 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 48) * 0.50000 + 0.5), 5, 48);
    
    
    //// ADSetupCylinderRefPenButton
    {
        if (isNormal)
        {
            //// Normal 21
            {
                //// Bezier 43 Drawing
                UIBezierPath* bezier43Path = UIBezierPath.bezierPath;
                [bezier43Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43)];
                [bezier43Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier43Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.75, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier43Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 48)];
                [bezier43Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.25, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier43Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier43Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.25, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43.5)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.75, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43.5) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43)];
                [bezier43Path closePath];
                [bezier43Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.44, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.29)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.44, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.85, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.85, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.32)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.03, CGRectGetMinY(aDSetupCylinderRefPenButton) + 3.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.97, CGRectGetMinY(aDSetupCylinderRefPenButton) + 3.1)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.15, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.15, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.68)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.44, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.97, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.03, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.9)];
                [bezier43Path closePath];
                [bezier43Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.44)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.6) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.17)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 5.85) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 36.15)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.86, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.86, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.74, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.2) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.4)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.73, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.29, CGRectGetMinY(aDSetupCylinderRefPenButton) + 42.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.71, CGRectGetMinY(aDSetupCylinderRefPenButton) + 42.15)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.14, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.46, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.4) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.26, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.2)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.14, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.83)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 36.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 5.85)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.73, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.46, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.6)];
                [bezier43Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.71, CGRectGetMinY(aDSetupCylinderRefPenButton) - 0.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.29, CGRectGetMinY(aDSetupCylinderRefPenButton) - 0.15)];
                [bezier43Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier43Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 21
            {
                //// Bezier 39 Drawing
                UIBezierPath* bezier39Path = UIBezierPath.bezierPath;
                [bezier39Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43)];
                [bezier39Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier39Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.75, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier39Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 48)];
                [bezier39Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.25, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier39Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4, CGRectGetMinY(aDSetupCylinderRefPenButton) + 45)];
                [bezier39Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.25, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43.5)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.75, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43.5) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1, CGRectGetMinY(aDSetupCylinderRefPenButton) + 43)];
                [bezier39Path closePath];
                [bezier39Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.44, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.29)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.44, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.85, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.68) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.85, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.32)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.71) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.03, CGRectGetMinY(aDSetupCylinderRefPenButton) + 3.1) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.97, CGRectGetMinY(aDSetupCylinderRefPenButton) + 3.1)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.56, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.15, CGRectGetMinY(aDSetupCylinderRefPenButton) + 2.32) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.15, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.68)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.44, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.29) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.97, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.9) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 2.03, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.9)];
                [bezier39Path closePath];
                [bezier39Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.44)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.6) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.17)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 5.85) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 36.15)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.86, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 5, CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.86, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.74, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.2) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.54, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.4)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.73, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.56) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.29, CGRectGetMinY(aDSetupCylinderRefPenButton) + 42.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.71, CGRectGetMinY(aDSetupCylinderRefPenButton) + 42.15)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.14, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.46, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.4) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.26, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41.2)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.14, CGRectGetMinY(aDSetupCylinderRefPenButton) + 41) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 40.83)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.5) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 36.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 5.85)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.73, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton), CGRectGetMinY(aDSetupCylinderRefPenButton) + 1.17) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 0.46, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.6)];
                [bezier39Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 4.27, CGRectGetMinY(aDSetupCylinderRefPenButton) + 0.44) controlPoint1: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 1.71, CGRectGetMinY(aDSetupCylinderRefPenButton) - 0.15) controlPoint2: CGPointMake(CGRectGetMinX(aDSetupCylinderRefPenButton) + 3.29, CGRectGetMinY(aDSetupCylinderRefPenButton) - 0.15)];
                [bezier39Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier39Path fill];
            }
        }
    }
}

@end
