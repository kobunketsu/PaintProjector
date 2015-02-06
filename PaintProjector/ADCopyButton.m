//
//  CopyButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCopyButton.h"

@implementation ADCopyButton

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
    CGRect aDCopyButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 46) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 46, 44);
    
    
    //// ADCopyButton
    {
        if (isNormal)
        {
            //// Normal 7
            {
                //// Bezier 15 Drawing
                UIBezierPath* bezier15Path = UIBezierPath.bezierPath;
                [bezier15Path moveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 32, CGRectGetMinY(aDCopyButton) + 12)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 29, CGRectGetMinY(aDCopyButton) + 12)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 13) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 28.45, CGRectGetMinY(aDCopyButton) + 12) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 12.45)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 22, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 20) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 21.45, CGRectGetMinY(aDCopyButton) + 19) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 19.45)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 23)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 22, CGRectGetMinY(aDCopyButton) + 24) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 23.55) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 21.45, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 30)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 29, CGRectGetMinY(aDCopyButton) + 31) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 30.55) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 28.45, CGRectGetMinY(aDCopyButton) + 31)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 32, CGRectGetMinY(aDCopyButton) + 31)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 30) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 32.55, CGRectGetMinY(aDCopyButton) + 31) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 30.55)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 39, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 39.55, CGRectGetMinY(aDCopyButton) + 24) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 23.55)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 20)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 39, CGRectGetMinY(aDCopyButton) + 19) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 19.45) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 39.55, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 13)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 32, CGRectGetMinY(aDCopyButton) + 12) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 12.45) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 32.55, CGRectGetMinY(aDCopyButton) + 12)];
                [bezier15Path closePath];
                [bezier15Path moveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 4)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 40)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 42, CGRectGetMinY(aDCopyButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 42.21) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 44.21, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 19, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 40) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 16.79, CGRectGetMinY(aDCopyButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 42.21)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 4)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 19, CGRectGetMinY(aDCopyButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 1.79) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 16.79, CGRectGetMinY(aDCopyButton))];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 42, CGRectGetMinY(aDCopyButton))];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 4) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 44.21, CGRectGetMinY(aDCopyButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 1.79)];
                [bezier15Path closePath];
                [bezier15Path moveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 5)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 6, CGRectGetMinY(aDCopyButton) + 5)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 5.45, CGRectGetMinY(aDCopyButton) + 5) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 5.45)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 38)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 6, CGRectGetMinY(aDCopyButton) + 39) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 38.55) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 5.45, CGRectGetMinY(aDCopyButton) + 39)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 39)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 14, CGRectGetMinY(aDCopyButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 41.21) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 11.79, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 4, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 40) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 1.79, CGRectGetMinY(aDCopyButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 42.21)];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 4)];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 4, CGRectGetMinY(aDCopyButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 1.79) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 1.79, CGRectGetMinY(aDCopyButton))];
                [bezier15Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 14, CGRectGetMinY(aDCopyButton))];
                [bezier15Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 11.79, CGRectGetMinY(aDCopyButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 2.79)];
                [bezier15Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier15Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 7
            {
                //// Bezier 12 Drawing
                UIBezierPath* bezier12Path = UIBezierPath.bezierPath;
                [bezier12Path moveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 32, CGRectGetMinY(aDCopyButton) + 12)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 29, CGRectGetMinY(aDCopyButton) + 12)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 13) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 28.45, CGRectGetMinY(aDCopyButton) + 12) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 12.45)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 22, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 20) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 21.45, CGRectGetMinY(aDCopyButton) + 19) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 19.45)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 23)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 22, CGRectGetMinY(aDCopyButton) + 24) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 21, CGRectGetMinY(aDCopyButton) + 23.55) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 21.45, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 30)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 29, CGRectGetMinY(aDCopyButton) + 31) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 28, CGRectGetMinY(aDCopyButton) + 30.55) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 28.45, CGRectGetMinY(aDCopyButton) + 31)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 32, CGRectGetMinY(aDCopyButton) + 31)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 30) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 32.55, CGRectGetMinY(aDCopyButton) + 31) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 30.55)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 39, CGRectGetMinY(aDCopyButton) + 24)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 23) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 39.55, CGRectGetMinY(aDCopyButton) + 24) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 23.55)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 20)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 39, CGRectGetMinY(aDCopyButton) + 19) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 40, CGRectGetMinY(aDCopyButton) + 19.45) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 39.55, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 19)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 13)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 32, CGRectGetMinY(aDCopyButton) + 12) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 33, CGRectGetMinY(aDCopyButton) + 12.45) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 32.55, CGRectGetMinY(aDCopyButton) + 12)];
                [bezier12Path closePath];
                [bezier12Path moveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 4)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 40)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 42, CGRectGetMinY(aDCopyButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 42.21) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 44.21, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 19, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 40) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 16.79, CGRectGetMinY(aDCopyButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 42.21)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 4)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 19, CGRectGetMinY(aDCopyButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 15, CGRectGetMinY(aDCopyButton) + 1.79) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 16.79, CGRectGetMinY(aDCopyButton))];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 42, CGRectGetMinY(aDCopyButton))];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 4) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 44.21, CGRectGetMinY(aDCopyButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 46, CGRectGetMinY(aDCopyButton) + 1.79)];
                [bezier12Path closePath];
                [bezier12Path moveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 5)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 6, CGRectGetMinY(aDCopyButton) + 5)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 5.45, CGRectGetMinY(aDCopyButton) + 5) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 5.45)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 38)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 6, CGRectGetMinY(aDCopyButton) + 39) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 5, CGRectGetMinY(aDCopyButton) + 38.55) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 5.45, CGRectGetMinY(aDCopyButton) + 39)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 39)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 14, CGRectGetMinY(aDCopyButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 41.21) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 11.79, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 4, CGRectGetMinY(aDCopyButton) + 44)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 40) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 1.79, CGRectGetMinY(aDCopyButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 42.21)];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 4)];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 4, CGRectGetMinY(aDCopyButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton), CGRectGetMinY(aDCopyButton) + 1.79) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 1.79, CGRectGetMinY(aDCopyButton))];
                [bezier12Path addLineToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 14, CGRectGetMinY(aDCopyButton))];
                [bezier12Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDCopyButton) + 11.79, CGRectGetMinY(aDCopyButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDCopyButton) + 10, CGRectGetMinY(aDCopyButton) + 2.79)];
                [bezier12Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier12Path fill];
            }
        }
    }
}




@end
