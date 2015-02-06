//
//  RedoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-10.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADRedoButton.h"

@implementation ADRedoButton

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
    CGRect aDRedoButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 47.05) * 0.50650 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 47.05, 44);
    
    
    //// ADRedoButton
    {
        if (isNormal)
        {
            //// Normal 16
            {
                //// Bezier 33 Drawing
                UIBezierPath* bezier33Path = UIBezierPath.bezierPath;
                [bezier33Path moveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 30.19, CGRectGetMinY(aDRedoButton) + 41.04)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 38.24, CGRectGetMinY(aDRedoButton) + 31.96)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton) + 31.96)];
                [bezier33Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.58, CGRectGetMinY(aDRedoButton) + 27.86) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 10.63, CGRectGetMinY(aDRedoButton) + 31.96) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.63, CGRectGetMinY(aDRedoButton) + 31.05)];
                [bezier33Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.58, CGRectGetMinY(aDRedoButton) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) - 1.53, CGRectGetMinY(aDRedoButton) + 21.49) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) - 1.53, CGRectGetMinY(aDRedoButton) + 11.15)];
                [bezier33Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.63, CGRectGetMinY(aDRedoButton) + 1.59) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 10.63, CGRectGetMinY(aDRedoButton))];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton) + 5.27)];
                [bezier33Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.83, CGRectGetMinY(aDRedoButton) + 8.21) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 12.17, CGRectGetMinY(aDRedoButton) + 5.27) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 9.7, CGRectGetMinY(aDRedoButton) + 6.25)];
                [bezier33Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.83, CGRectGetMinY(aDRedoButton) + 24.43) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.07, CGRectGetMinY(aDRedoButton) + 12.13) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.07, CGRectGetMinY(aDRedoButton) + 20.51)];
                [bezier33Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton) + 27.37) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 9.7, CGRectGetMinY(aDRedoButton) + 26.39) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 12.17, CGRectGetMinY(aDRedoButton) + 27.37)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 38.05, CGRectGetMinY(aDRedoButton) + 26.9)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 30.05, CGRectGetMinY(aDRedoButton) + 17.81)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 33.02, CGRectGetMinY(aDRedoButton) + 15)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 47.05, CGRectGetMinY(aDRedoButton) + 29.94)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 33.02, CGRectGetMinY(aDRedoButton) + 44)];
                [bezier33Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 30.19, CGRectGetMinY(aDRedoButton) + 41.04)];
                [bezier33Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier33Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 16
            {
                //// Bezier 31 Drawing
                UIBezierPath* bezier31Path = UIBezierPath.bezierPath;
                [bezier31Path moveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 30.19, CGRectGetMinY(aDRedoButton) + 41.04)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 38.24, CGRectGetMinY(aDRedoButton) + 31.96)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton) + 31.96)];
                [bezier31Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.58, CGRectGetMinY(aDRedoButton) + 27.86) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 10.63, CGRectGetMinY(aDRedoButton) + 31.96) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.63, CGRectGetMinY(aDRedoButton) + 31.05)];
                [bezier31Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.58, CGRectGetMinY(aDRedoButton) + 4.78) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) - 1.53, CGRectGetMinY(aDRedoButton) + 21.49) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) - 1.53, CGRectGetMinY(aDRedoButton) + 11.15)];
                [bezier31Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.63, CGRectGetMinY(aDRedoButton) + 1.59) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 10.63, CGRectGetMinY(aDRedoButton))];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton) + 5.27)];
                [bezier31Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.83, CGRectGetMinY(aDRedoButton) + 8.21) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 12.17, CGRectGetMinY(aDRedoButton) + 5.27) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 9.7, CGRectGetMinY(aDRedoButton) + 6.25)];
                [bezier31Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 7.83, CGRectGetMinY(aDRedoButton) + 24.43) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.07, CGRectGetMinY(aDRedoButton) + 12.13) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 4.07, CGRectGetMinY(aDRedoButton) + 20.51)];
                [bezier31Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 14.63, CGRectGetMinY(aDRedoButton) + 27.37) controlPoint1: CGPointMake(CGRectGetMinX(aDRedoButton) + 9.7, CGRectGetMinY(aDRedoButton) + 26.39) controlPoint2: CGPointMake(CGRectGetMinX(aDRedoButton) + 12.17, CGRectGetMinY(aDRedoButton) + 27.37)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 38.05, CGRectGetMinY(aDRedoButton) + 26.9)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 30.05, CGRectGetMinY(aDRedoButton) + 17.81)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 33.02, CGRectGetMinY(aDRedoButton) + 15)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 47.05, CGRectGetMinY(aDRedoButton) + 29.94)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 33.02, CGRectGetMinY(aDRedoButton) + 44)];
                [bezier31Path addLineToPoint: CGPointMake(CGRectGetMinX(aDRedoButton) + 30.19, CGRectGetMinY(aDRedoButton) + 41.04)];
                [bezier31Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier31Path fill];
            }
        }
    }
}

@end
