//
//  DeleteButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-9-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADDeleteButton.h"

@implementation ADDeleteButton

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
    CGRect aDDeleteButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 43) * 0.49412 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43) * 0.43243 + 0.5), 43, 43);
    
    
    //// ADDeleteButton
    {
        if (isNormal)
        {
            //// Normal 8
            {
                //// Bezier 14 Drawing
                UIBezierPath* bezier14Path = UIBezierPath.bezierPath;
                [bezier14Path moveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.69, CGRectGetMinY(aDDeleteButton) + 3.36)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 40.61, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 43, CGRectGetMinY(aDDeleteButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 41.93, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 43, CGRectGetMinY(aDDeleteButton) + 3.14)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 40.61, CGRectGetMinY(aDDeleteButton) + 8.05) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 43, CGRectGetMinY(aDDeleteButton) + 5.31) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 41.93, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 38.27, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 37.31, CGRectGetMinY(aDDeleteButton) + 38.16)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 33.49, CGRectGetMinY(aDDeleteButton) + 43) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 37.31, CGRectGetMinY(aDDeleteButton) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 35.6, CGRectGetMinY(aDDeleteButton) + 43)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 9.51, CGRectGetMinY(aDDeleteButton) + 43)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 5.69, CGRectGetMinY(aDDeleteButton) + 38.16) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 7.4, CGRectGetMinY(aDDeleteButton) + 43) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 5.69, CGRectGetMinY(aDDeleteButton) + 40.83)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 4.73, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 2.39, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton), CGRectGetMinY(aDDeleteButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 1.07, CGRectGetMinY(aDDeleteButton) + 8.05) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton), CGRectGetMinY(aDDeleteButton) + 5.22)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 2.39, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton), CGRectGetMinY(aDDeleteButton) + 3.23) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 1.07, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 14.38, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 17.72, CGRectGetMinY(aDDeleteButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 14.38, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 16.4, CGRectGetMinY(aDDeleteButton))];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 25.37, CGRectGetMinY(aDDeleteButton))];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.71, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 26.69, CGRectGetMinY(aDDeleteButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.71, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.69, CGRectGetMinY(aDDeleteButton) + 3.36)];
                [bezier14Path closePath];
                [bezier14Path moveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 29.54, CGRectGetMinY(aDDeleteButton) + 20.44)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 13.35, CGRectGetMinY(aDDeleteButton) + 20.44)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 22.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 12.3, CGRectGetMinY(aDDeleteButton) + 20.44) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 21.33)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 23.44)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 13.35, CGRectGetMinY(aDDeleteButton) + 25.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 24.54) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 12.3, CGRectGetMinY(aDDeleteButton) + 25.44)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 29.54, CGRectGetMinY(aDDeleteButton) + 25.44)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 23.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 30.59, CGRectGetMinY(aDDeleteButton) + 25.44) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 24.54)];
                [bezier14Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 22.44)];
                [bezier14Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 29.54, CGRectGetMinY(aDDeleteButton) + 20.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 21.33) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 30.59, CGRectGetMinY(aDDeleteButton) + 20.44)];
                [bezier14Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier14Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 8
            {
                //// Bezier 16 Drawing
                UIBezierPath* bezier16Path = UIBezierPath.bezierPath;
                [bezier16Path moveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.69, CGRectGetMinY(aDDeleteButton) + 3.36)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 40.61, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 43, CGRectGetMinY(aDDeleteButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 41.93, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 43, CGRectGetMinY(aDDeleteButton) + 3.14)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 40.61, CGRectGetMinY(aDDeleteButton) + 8.05) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 43, CGRectGetMinY(aDDeleteButton) + 5.31) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 41.93, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 38.27, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 37.31, CGRectGetMinY(aDDeleteButton) + 38.16)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 33.49, CGRectGetMinY(aDDeleteButton) + 43) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 37.31, CGRectGetMinY(aDDeleteButton) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 35.6, CGRectGetMinY(aDDeleteButton) + 43)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 9.51, CGRectGetMinY(aDDeleteButton) + 43)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 5.69, CGRectGetMinY(aDDeleteButton) + 38.16) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 7.4, CGRectGetMinY(aDDeleteButton) + 43) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 5.69, CGRectGetMinY(aDDeleteButton) + 40.83)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 4.73, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 2.39, CGRectGetMinY(aDDeleteButton) + 8.05)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton), CGRectGetMinY(aDDeleteButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 1.07, CGRectGetMinY(aDDeleteButton) + 8.05) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton), CGRectGetMinY(aDDeleteButton) + 5.22)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 2.39, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton), CGRectGetMinY(aDDeleteButton) + 3.23) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 1.07, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 14.38, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 17.72, CGRectGetMinY(aDDeleteButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 14.38, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 16.4, CGRectGetMinY(aDDeleteButton))];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 25.37, CGRectGetMinY(aDDeleteButton))];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.71, CGRectGetMinY(aDDeleteButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 26.69, CGRectGetMinY(aDDeleteButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.71, CGRectGetMinY(aDDeleteButton) + 3.39)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 28.69, CGRectGetMinY(aDDeleteButton) + 3.36)];
                [bezier16Path closePath];
                [bezier16Path moveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 29.54, CGRectGetMinY(aDDeleteButton) + 20.44)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 13.35, CGRectGetMinY(aDDeleteButton) + 20.44)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 22.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 12.3, CGRectGetMinY(aDDeleteButton) + 20.44) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 21.33)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 23.44)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 13.35, CGRectGetMinY(aDDeleteButton) + 25.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 11.45, CGRectGetMinY(aDDeleteButton) + 24.54) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 12.3, CGRectGetMinY(aDDeleteButton) + 25.44)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 29.54, CGRectGetMinY(aDDeleteButton) + 25.44)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 23.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 30.59, CGRectGetMinY(aDDeleteButton) + 25.44) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 24.54)];
                [bezier16Path addLineToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 22.44)];
                [bezier16Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDDeleteButton) + 29.54, CGRectGetMinY(aDDeleteButton) + 20.44) controlPoint1: CGPointMake(CGRectGetMinX(aDDeleteButton) + 31.45, CGRectGetMinY(aDDeleteButton) + 21.33) controlPoint2: CGPointMake(CGRectGetMinX(aDDeleteButton) + 30.59, CGRectGetMinY(aDDeleteButton) + 20.44)];
                [bezier16Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier16Path fill];
            }
        }
    }
}



@end
