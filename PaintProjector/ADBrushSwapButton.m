//
//  BrushSwapButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADBrushSwapButton.h"

@implementation ADBrushSwapButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self drawADSharedRoundButtonWithFrame:rect isSelected:self.isSelected || self.isHighlighted];
}

- (void)drawADSharedRoundButtonWithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// ADBrushSwapButton
    {
        if (isNormal)
        {
            //// Normal 3
            {
                //// Bezier 4 Drawing
                UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 13)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 19)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 19)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 18.42)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 17.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 14.16)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21.58)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.01, CGRectGetMinY(frame) + 24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.61, CGRectGetMinY(frame) + 22.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.2, CGRectGetMinY(frame) + 23.9)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 26.42) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11, CGRectGetMinY(frame) + 24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.57, CGRectGetMinY(frame) + 25.84)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 27)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 27)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier4Path closePath];
                [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.19, CGRectGetMinY(frame) + 9.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 8.61, CGRectGetMinY(frame) + 12.18)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.59, CGRectGetMinY(frame) + 9.34) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.01, CGRectGetMinY(frame) + 8.99)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier4Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier4Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier4Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 3
            {
                //// Bezier 7 Drawing
                UIBezierPath* bezier7Path = UIBezierPath.bezierPath;
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 13)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16, CGRectGetMinY(frame) + 19)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 19)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 18.42)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 17.84) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13.58) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31, CGRectGetMinY(frame) + 16) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.43, CGRectGetMinY(frame) + 14.16)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.03, CGRectGetMinY(frame) + 13)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21.58)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.01, CGRectGetMinY(frame) + 24) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.61, CGRectGetMinY(frame) + 22.14) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.2, CGRectGetMinY(frame) + 23.9)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 26.42) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11, CGRectGetMinY(frame) + 24) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 14.57, CGRectGetMinY(frame) + 25.84)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 27)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 27)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26, CGRectGetMinY(frame) + 21)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier7Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15.97, CGRectGetMinY(frame) + 21)];
                [bezier7Path closePath];
                [bezier7Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 11.19, CGRectGetMinY(frame) + 9.72) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.65) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 8.61, CGRectGetMinY(frame) + 12.18)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.59, CGRectGetMinY(frame) + 9.34) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.01, CGRectGetMinY(frame) + 8.99)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier7Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier7Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier7Path fill];
            }
        }
    }
}




@end
