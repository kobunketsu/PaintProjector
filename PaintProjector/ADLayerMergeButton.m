//
//  LayerMergeButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-23.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerMergeButton.h"

@implementation ADLayerMergeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// ADLayerMergeButton
    {
        if (isNormal)
        {
            //// Normal 5
            {
                //// Bezier 14 Drawing
                UIBezierPath* bezier14Path = UIBezierPath.bezierPath;
                [bezier14Path moveToPoint: CGPointMake(22, 25)];
                [bezier14Path addLineToPoint: CGPointMake(33.78, 14.03)];
                [bezier14Path addCurveToPoint: CGPointMake(35.24, 14.03) controlPoint1: CGPointMake(34.18, 13.63) controlPoint2: CGPointMake(34.84, 13.63)];
                [bezier14Path addLineToPoint: CGPointMake(36.7, 15.46)];
                [bezier14Path addCurveToPoint: CGPointMake(36.7, 16.89) controlPoint1: CGPointMake(37.1, 15.86) controlPoint2: CGPointMake(37.1, 16.5)];
                [bezier14Path addLineToPoint: CGPointMake(22.82, 29.7)];
                [bezier14Path addCurveToPoint: CGPointMake(22, 30) controlPoint1: CGPointMake(22.6, 29.92) controlPoint2: CGPointMake(22.29, 30.02)];
                [bezier14Path addCurveToPoint: CGPointMake(21.29, 29.8) controlPoint1: CGPointMake(21.75, 30.02) controlPoint2: CGPointMake(21.5, 29.95)];
                [bezier14Path addCurveToPoint: CGPointMake(7.3, 16.89) controlPoint1: CGPointMake(21.18, 29.7) controlPoint2: CGPointMake(7.3, 16.89)];
                [bezier14Path addCurveToPoint: CGPointMake(7.3, 15.46) controlPoint1: CGPointMake(6.9, 16.5) controlPoint2: CGPointMake(6.9, 15.86)];
                [bezier14Path addLineToPoint: CGPointMake(8.76, 14.03)];
                [bezier14Path addCurveToPoint: CGPointMake(10.22, 14.03) controlPoint1: CGPointMake(9.16, 13.63) controlPoint2: CGPointMake(9.82, 13.63)];
                [bezier14Path addLineToPoint: CGPointMake(22, 25)];
                [bezier14Path closePath];
                [bezier14Path moveToPoint: CGPointMake(37, 32.83)];
                [bezier14Path addLineToPoint: CGPointMake(37, 37.17)];
                [bezier14Path addLineToPoint: CGPointMake(7, 37.17)];
                [bezier14Path addLineToPoint: CGPointMake(7, 32.83)];
                [bezier14Path addLineToPoint: CGPointMake(37, 32.83)];
                [bezier14Path closePath];
                [bezier14Path moveToPoint: CGPointMake(37, 6.83)];
                [bezier14Path addLineToPoint: CGPointMake(37, 11.17)];
                [bezier14Path addLineToPoint: CGPointMake(7, 11.17)];
                [bezier14Path addLineToPoint: CGPointMake(7, 6.83)];
                [bezier14Path addLineToPoint: CGPointMake(37, 6.83)];
                [bezier14Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier14Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 5
            {
                //// Bezier 10 Drawing
                UIBezierPath* bezier10Path = UIBezierPath.bezierPath;
                [bezier10Path moveToPoint: CGPointMake(22, 25.17)];
                [bezier10Path addLineToPoint: CGPointMake(33.78, 14.19)];
                [bezier10Path addCurveToPoint: CGPointMake(35.24, 14.19) controlPoint1: CGPointMake(34.18, 13.8) controlPoint2: CGPointMake(34.84, 13.8)];
                [bezier10Path addLineToPoint: CGPointMake(36.7, 15.63)];
                [bezier10Path addCurveToPoint: CGPointMake(36.7, 17.06) controlPoint1: CGPointMake(37.1, 16.02) controlPoint2: CGPointMake(37.1, 16.67)];
                [bezier10Path addLineToPoint: CGPointMake(22.82, 29.87)];
                [bezier10Path addCurveToPoint: CGPointMake(22, 30.16) controlPoint1: CGPointMake(22.6, 30.09) controlPoint2: CGPointMake(22.29, 30.19)];
                [bezier10Path addCurveToPoint: CGPointMake(21.29, 29.97) controlPoint1: CGPointMake(21.75, 30.18) controlPoint2: CGPointMake(21.5, 30.12)];
                [bezier10Path addCurveToPoint: CGPointMake(7.3, 17.06) controlPoint1: CGPointMake(21.18, 29.87) controlPoint2: CGPointMake(7.3, 17.06)];
                [bezier10Path addCurveToPoint: CGPointMake(7.3, 15.63) controlPoint1: CGPointMake(6.9, 16.67) controlPoint2: CGPointMake(6.9, 16.02)];
                [bezier10Path addLineToPoint: CGPointMake(8.76, 14.19)];
                [bezier10Path addCurveToPoint: CGPointMake(10.22, 14.19) controlPoint1: CGPointMake(9.16, 13.8) controlPoint2: CGPointMake(9.82, 13.8)];
                [bezier10Path addLineToPoint: CGPointMake(22, 25.17)];
                [bezier10Path closePath];
                [bezier10Path moveToPoint: CGPointMake(37, 33)];
                [bezier10Path addLineToPoint: CGPointMake(37, 37.33)];
                [bezier10Path addLineToPoint: CGPointMake(7, 37.33)];
                [bezier10Path addLineToPoint: CGPointMake(7, 33)];
                [bezier10Path addLineToPoint: CGPointMake(37, 33)];
                [bezier10Path closePath];
                [bezier10Path moveToPoint: CGPointMake(37, 7)];
                [bezier10Path addLineToPoint: CGPointMake(37, 11.33)];
                [bezier10Path addLineToPoint: CGPointMake(7, 11.33)];
                [bezier10Path addLineToPoint: CGPointMake(7, 7)];
                [bezier10Path addLineToPoint: CGPointMake(37, 7)];
                [bezier10Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier10Path fill];
            }
        }
    }
}


@end
