//
//  ShareButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/31/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADShareButton.h"

@implementation ADShareButton

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
    CGRect aDShareButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 49) * 0.50633 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 49, 44);
    
    
    //// ADShareButton
    {
        if (isNormal)
        {
            //// Normal 23
            {
                //// Bezier 47 Drawing
                UIBezierPath* bezier47Path = UIBezierPath.bezierPath;
                [bezier47Path moveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 44.49, CGRectGetMinY(aDShareButton) + 3.15)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 48.34, CGRectGetMinY(aDShareButton) + 17.67) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 48.31, CGRectGetMinY(aDShareButton) + 6.96) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 50.05, CGRectGetMinY(aDShareButton) + 9.75)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 36.9, CGRectGetMinY(aDShareButton) + 34.08) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 46.64, CGRectGetMinY(aDShareButton) + 25.59) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 41.23, CGRectGetMinY(aDShareButton) + 29.77)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 27.94, CGRectGetMinY(aDShareButton) + 41.07) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 34.53, CGRectGetMinY(aDShareButton) + 36.45) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 30.68, CGRectGetMinY(aDShareButton) + 39.21)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 24.67, CGRectGetMinY(aDShareButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 26.04, CGRectGetMinY(aDShareButton) + 42.35) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 24.67, CGRectGetMinY(aDShareButton) + 44)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 21.09, CGRectGetMinY(aDShareButton) + 40.99) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 24.67, CGRectGetMinY(aDShareButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 23.16, CGRectGetMinY(aDShareButton) + 42.32)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 11.95, CGRectGetMinY(aDShareButton) + 34.08) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 18.24, CGRectGetMinY(aDShareButton) + 39.16) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 14.35, CGRectGetMinY(aDShareButton) + 36.48)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 0.49, CGRectGetMinY(aDShareButton) + 17.62) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 7.82, CGRectGetMinY(aDShareButton) + 29.96) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 2.01, CGRectGetMinY(aDShareButton) + 25.54)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 5.13, CGRectGetMinY(aDShareButton) + 3.15) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) - 1.03, CGRectGetMinY(aDShareButton) + 9.7) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 1.11, CGRectGetMinY(aDShareButton) + 7.16)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 17.35, CGRectGetMinY(aDShareButton) + 1.48) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 7.62, CGRectGetMinY(aDShareButton) + 0.67) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 13.31, CGRectGetMinY(aDShareButton) - 0.66)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 24.04, CGRectGetMinY(aDShareButton) + 6.14) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 19.75, CGRectGetMinY(aDShareButton) + 2.75) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 24.04, CGRectGetMinY(aDShareButton) + 6.14)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 31.51, CGRectGetMinY(aDShareButton) + 0.85) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 24.04, CGRectGetMinY(aDShareButton) + 6.14) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 28.53, CGRectGetMinY(aDShareButton) + 2.3)];
                [bezier47Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 44.49, CGRectGetMinY(aDShareButton) + 3.15) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 35.63, CGRectGetMinY(aDShareButton) - 1.17) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 42.06, CGRectGetMinY(aDShareButton) + 0.74)];
                [bezier47Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier47Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 23
            {
                //// Bezier 44 Drawing
                UIBezierPath* bezier44Path = UIBezierPath.bezierPath;
                [bezier44Path moveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 44.49, CGRectGetMinY(aDShareButton) + 3.15)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 48.34, CGRectGetMinY(aDShareButton) + 17.67) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 48.31, CGRectGetMinY(aDShareButton) + 6.96) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 50.05, CGRectGetMinY(aDShareButton) + 9.75)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 36.9, CGRectGetMinY(aDShareButton) + 34.08) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 46.64, CGRectGetMinY(aDShareButton) + 25.59) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 41.23, CGRectGetMinY(aDShareButton) + 29.77)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 27.94, CGRectGetMinY(aDShareButton) + 41.07) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 34.53, CGRectGetMinY(aDShareButton) + 36.45) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 30.68, CGRectGetMinY(aDShareButton) + 39.21)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 24.67, CGRectGetMinY(aDShareButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 26.04, CGRectGetMinY(aDShareButton) + 42.35) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 24.67, CGRectGetMinY(aDShareButton) + 44)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 21.09, CGRectGetMinY(aDShareButton) + 40.99) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 24.67, CGRectGetMinY(aDShareButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 23.16, CGRectGetMinY(aDShareButton) + 42.32)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 11.95, CGRectGetMinY(aDShareButton) + 34.08) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 18.24, CGRectGetMinY(aDShareButton) + 39.16) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 14.35, CGRectGetMinY(aDShareButton) + 36.48)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 0.49, CGRectGetMinY(aDShareButton) + 17.62) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 7.82, CGRectGetMinY(aDShareButton) + 29.96) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 2.01, CGRectGetMinY(aDShareButton) + 25.54)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 5.13, CGRectGetMinY(aDShareButton) + 3.15) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) - 1.03, CGRectGetMinY(aDShareButton) + 9.7) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 1.11, CGRectGetMinY(aDShareButton) + 7.16)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 17.35, CGRectGetMinY(aDShareButton) + 1.48) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 7.62, CGRectGetMinY(aDShareButton) + 0.67) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 13.31, CGRectGetMinY(aDShareButton) - 0.66)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 24.04, CGRectGetMinY(aDShareButton) + 6.14) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 19.75, CGRectGetMinY(aDShareButton) + 2.75) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 24.04, CGRectGetMinY(aDShareButton) + 6.14)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 31.51, CGRectGetMinY(aDShareButton) + 0.85) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 24.04, CGRectGetMinY(aDShareButton) + 6.14) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 28.53, CGRectGetMinY(aDShareButton) + 2.3)];
                [bezier44Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDShareButton) + 44.49, CGRectGetMinY(aDShareButton) + 3.15) controlPoint1: CGPointMake(CGRectGetMinX(aDShareButton) + 35.63, CGRectGetMinY(aDShareButton) - 1.17) controlPoint2: CGPointMake(CGRectGetMinX(aDShareButton) + 42.06, CGRectGetMinY(aDShareButton) + 0.74)];
                [bezier44Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier44Path fill];
            }
        }
    }
}

@end
