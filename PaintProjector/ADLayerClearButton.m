//
//  LayerDeleteButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerClearButton.h"

@implementation ADLayerClearButton

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
    
    //// ADLayerClearButton
    {
        if (isNormal)
        {
            //// Normal 2
            {
                //// Bezier 7 Drawing
                UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
                [bezier7Path moveToPoint: CGPointMake(27.01, 9.34)];
                [bezier7Path addLineToPoint: CGPointMake(35.33, 9.37)];
                [bezier7Path addCurveToPoint: CGPointMake(37, 9.95) controlPoint1: CGPointMake(36.25, 9.37) controlPoint2: CGPointMake(37, 9.19)];
                [bezier7Path addCurveToPoint: CGPointMake(35.33, 12.62) controlPoint1: CGPointMake(37, 10.7) controlPoint2: CGPointMake(36.25, 12.62)];
                [bezier7Path addLineToPoint: CGPointMake(33.7, 12.62)];
                [bezier7Path addLineToPoint: CGPointMake(33.03, 33.62)];
                [bezier7Path addCurveToPoint: CGPointMake(30.36, 37) controlPoint1: CGPointMake(33.03, 35.49) controlPoint2: CGPointMake(31.84, 37)];
                [bezier7Path addLineToPoint: CGPointMake(13.64, 37)];
                [bezier7Path addCurveToPoint: CGPointMake(10.97, 33.62) controlPoint1: CGPointMake(12.16, 37) controlPoint2: CGPointMake(10.97, 35.49)];
                [bezier7Path addLineToPoint: CGPointMake(10.3, 12.62)];
                [bezier7Path addLineToPoint: CGPointMake(8.67, 12.62)];
                [bezier7Path addCurveToPoint: CGPointMake(7, 9.95) controlPoint1: CGPointMake(7.75, 12.62) controlPoint2: CGPointMake(7, 10.64)];
                [bezier7Path addCurveToPoint: CGPointMake(8.67, 9.37) controlPoint1: CGPointMake(7, 9.25) controlPoint2: CGPointMake(7.75, 9.37)];
                [bezier7Path addLineToPoint: CGPointMake(17.03, 9.37)];
                [bezier7Path addCurveToPoint: CGPointMake(19.36, 7) controlPoint1: CGPointMake(17.03, 9.37) controlPoint2: CGPointMake(18.44, 7)];
                [bezier7Path addLineToPoint: CGPointMake(24.7, 7)];
                [bezier7Path addCurveToPoint: CGPointMake(27.01, 9.34) controlPoint1: CGPointMake(25.56, 7) controlPoint2: CGPointMake(26.86, 9.08)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(27.61, 21.26)];
                [bezier7Path addLineToPoint: CGPointMake(16.31, 21.26)];
                [bezier7Path addCurveToPoint: CGPointMake(14.99, 22.65) controlPoint1: CGPointMake(15.58, 21.26) controlPoint2: CGPointMake(14.99, 21.88)];
                [bezier7Path addLineToPoint: CGPointMake(14.99, 23.35)];
                [bezier7Path addCurveToPoint: CGPointMake(16.31, 24.75) controlPoint1: CGPointMake(14.99, 24.12) controlPoint2: CGPointMake(15.58, 24.75)];
                [bezier7Path addLineToPoint: CGPointMake(27.61, 24.75)];
                [bezier7Path addCurveToPoint: CGPointMake(28.94, 23.35) controlPoint1: CGPointMake(28.34, 24.75) controlPoint2: CGPointMake(28.94, 24.12)];
                [bezier7Path addLineToPoint: CGPointMake(28.94, 22.65)];
                [bezier7Path addCurveToPoint: CGPointMake(27.61, 21.26) controlPoint1: CGPointMake(28.94, 21.88) controlPoint2: CGPointMake(28.34, 21.26)];
                [bezier7Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier7Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 2
            {
                //// Bezier 4 Drawing
                UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
                [bezier4Path moveToPoint: CGPointMake(27.01, 9.34)];
                [bezier4Path addLineToPoint: CGPointMake(35.33, 9.37)];
                [bezier4Path addCurveToPoint: CGPointMake(37, 9.95) controlPoint1: CGPointMake(36.25, 9.37) controlPoint2: CGPointMake(37, 9.19)];
                [bezier4Path addCurveToPoint: CGPointMake(35.33, 12.62) controlPoint1: CGPointMake(37, 10.7) controlPoint2: CGPointMake(36.25, 12.62)];
                [bezier4Path addLineToPoint: CGPointMake(33.7, 12.62)];
                [bezier4Path addLineToPoint: CGPointMake(33.03, 33.62)];
                [bezier4Path addCurveToPoint: CGPointMake(30.36, 37) controlPoint1: CGPointMake(33.03, 35.49) controlPoint2: CGPointMake(31.84, 37)];
                [bezier4Path addLineToPoint: CGPointMake(13.64, 37)];
                [bezier4Path addCurveToPoint: CGPointMake(10.97, 33.62) controlPoint1: CGPointMake(12.16, 37) controlPoint2: CGPointMake(10.97, 35.49)];
                [bezier4Path addLineToPoint: CGPointMake(10.3, 12.62)];
                [bezier4Path addLineToPoint: CGPointMake(8.67, 12.62)];
                [bezier4Path addCurveToPoint: CGPointMake(7, 9.95) controlPoint1: CGPointMake(7.75, 12.62) controlPoint2: CGPointMake(7, 10.64)];
                [bezier4Path addCurveToPoint: CGPointMake(8.67, 9.37) controlPoint1: CGPointMake(7, 9.25) controlPoint2: CGPointMake(7.75, 9.37)];
                [bezier4Path addLineToPoint: CGPointMake(17.03, 9.37)];
                [bezier4Path addCurveToPoint: CGPointMake(19.36, 7) controlPoint1: CGPointMake(17.03, 9.37) controlPoint2: CGPointMake(18.44, 7)];
                [bezier4Path addLineToPoint: CGPointMake(24.7, 7)];
                [bezier4Path addCurveToPoint: CGPointMake(27.01, 9.34) controlPoint1: CGPointMake(25.56, 7) controlPoint2: CGPointMake(26.86, 9.08)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(27.61, 21.26)];
                [bezier4Path addLineToPoint: CGPointMake(16.31, 21.26)];
                [bezier4Path addCurveToPoint: CGPointMake(14.99, 22.65) controlPoint1: CGPointMake(15.58, 21.26) controlPoint2: CGPointMake(14.99, 21.88)];
                [bezier4Path addLineToPoint: CGPointMake(14.99, 23.35)];
                [bezier4Path addCurveToPoint: CGPointMake(16.31, 24.75) controlPoint1: CGPointMake(14.99, 24.12) controlPoint2: CGPointMake(15.58, 24.75)];
                [bezier4Path addLineToPoint: CGPointMake(27.61, 24.75)];
                [bezier4Path addCurveToPoint: CGPointMake(28.94, 23.35) controlPoint1: CGPointMake(28.34, 24.75) controlPoint2: CGPointMake(28.94, 24.12)];
                [bezier4Path addLineToPoint: CGPointMake(28.94, 22.65)];
                [bezier4Path addCurveToPoint: CGPointMake(27.61, 21.26) controlPoint1: CGPointMake(28.94, 21.88) controlPoint2: CGPointMake(28.34, 21.26)];
                [bezier4Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier4Path fill];
            }
        }
    }
}



@end
