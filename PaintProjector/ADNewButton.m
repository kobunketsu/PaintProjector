//
//  NewButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADNewButton.h"

@implementation ADNewButton

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
    CGRect aDNewButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 32.59) * 0.50311 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 46.58) * 0.47874 + 0.08) + 0.42, 32.59, 46.58);
    
    
    //// ADNewButton
    {
        if (isNormal)
        {
            //// Normal 14
            {
                //// Bezier 29 Drawing
                UIBezierPath* bezier29Path = UIBezierPath.bezierPath;
                [bezier29Path moveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 5.33, CGRectGetMinY(aDNewButton) + 23.66)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 0.06, CGRectGetMinY(aDNewButton) + 45.13)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 2.08, CGRectGetMinY(aDNewButton) + 46.58)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 18.96, CGRectGetMinY(aDNewButton) + 32.56)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 28.96, CGRectGetMinY(aDNewButton) + 16.07)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 31.34, CGRectGetMinY(aDNewButton) + 11.96)];
                [bezier29Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 32.45, CGRectGetMinY(aDNewButton) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 31.34, CGRectGetMinY(aDNewButton) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 33.09, CGRectGetMinY(aDNewButton) + 9.21)];
                [bezier29Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 28.45, CGRectGetMinY(aDNewButton) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 31.81, CGRectGetMinY(aDNewButton) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 30.76, CGRectGetMinY(aDNewButton) + 2.83)];
                [bezier29Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 22.45, CGRectGetMinY(aDNewButton) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 26.14, CGRectGetMinY(aDNewButton) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 25.07, CGRectGetMinY(aDNewButton) - 0.08)];
                [bezier29Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 17.95, CGRectGetMinY(aDNewButton) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 19.84, CGRectGetMinY(aDNewButton) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 17.95, CGRectGetMinY(aDNewButton) + 3.35)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 15.29, CGRectGetMinY(aDNewButton) + 7.35)];
                [bezier29Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 5.33, CGRectGetMinY(aDNewButton) + 23.66)];
                [bezier29Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier29Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 14
            {
                //// Bezier 26 Drawing
                UIBezierPath* bezier26Path = UIBezierPath.bezierPath;
                [bezier26Path moveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 5.28, CGRectGetMinY(aDNewButton) + 23.66)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton), CGRectGetMinY(aDNewButton) + 45.13)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 2.02, CGRectGetMinY(aDNewButton) + 46.58)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 18.9, CGRectGetMinY(aDNewButton) + 32.56)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 28.9, CGRectGetMinY(aDNewButton) + 16.07)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 31.29, CGRectGetMinY(aDNewButton) + 11.96)];
                [bezier26Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 32.39, CGRectGetMinY(aDNewButton) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 31.29, CGRectGetMinY(aDNewButton) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 33.03, CGRectGetMinY(aDNewButton) + 9.21)];
                [bezier26Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 28.39, CGRectGetMinY(aDNewButton) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 31.75, CGRectGetMinY(aDNewButton) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 30.71, CGRectGetMinY(aDNewButton) + 2.83)];
                [bezier26Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 22.39, CGRectGetMinY(aDNewButton) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 26.08, CGRectGetMinY(aDNewButton) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 25.01, CGRectGetMinY(aDNewButton) - 0.08)];
                [bezier26Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 17.89, CGRectGetMinY(aDNewButton) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(aDNewButton) + 19.78, CGRectGetMinY(aDNewButton) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(aDNewButton) + 17.89, CGRectGetMinY(aDNewButton) + 3.35)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 15.23, CGRectGetMinY(aDNewButton) + 7.35)];
                [bezier26Path addLineToPoint: CGPointMake(CGRectGetMinX(aDNewButton) + 5.28, CGRectGetMinY(aDNewButton) + 23.66)];
                [bezier26Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier26Path fill];
            }
        }
    }
}

@end
