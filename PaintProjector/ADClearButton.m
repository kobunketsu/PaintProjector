//
//  ClearButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADClearButton.h"

@implementation ADClearButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.layer.delegate = self;
    }
    return self;
}

- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDClearButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 43) * 0.49412 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43) * 0.43243 + 0.5), 43, 43);
    
    
    //// ADClearButton
    {
        if (isNormal)
        {
            //// Normal 6
            {
                //// Bezier 13 Drawing
                UIBezierPath* bezier13Path = UIBezierPath.bezierPath;
                [bezier13Path moveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 28.69, CGRectGetMinY(aDClearButton) + 3.36)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 40.61, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 43, CGRectGetMinY(aDClearButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 41.93, CGRectGetMinY(aDClearButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 43, CGRectGetMinY(aDClearButton) + 3.14)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 40.61, CGRectGetMinY(aDClearButton) + 8.05) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 43, CGRectGetMinY(aDClearButton) + 5.31) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 41.93, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 38.27, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 37.31, CGRectGetMinY(aDClearButton) + 38.16)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 33.49, CGRectGetMinY(aDClearButton) + 43) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 37.31, CGRectGetMinY(aDClearButton) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 35.6, CGRectGetMinY(aDClearButton) + 43)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 9.51, CGRectGetMinY(aDClearButton) + 43)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 5.69, CGRectGetMinY(aDClearButton) + 38.16) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 7.4, CGRectGetMinY(aDClearButton) + 43) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 5.69, CGRectGetMinY(aDClearButton) + 40.83)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 4.73, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 2.39, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton), CGRectGetMinY(aDClearButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 1.07, CGRectGetMinY(aDClearButton) + 8.05) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton), CGRectGetMinY(aDClearButton) + 5.22)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 2.39, CGRectGetMinY(aDClearButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton), CGRectGetMinY(aDClearButton) + 3.23) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 1.07, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 14.38, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 17.72, CGRectGetMinY(aDClearButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 14.38, CGRectGetMinY(aDClearButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 16.4, CGRectGetMinY(aDClearButton))];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 25.37, CGRectGetMinY(aDClearButton))];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 28.71, CGRectGetMinY(aDClearButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 26.69, CGRectGetMinY(aDClearButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 28.71, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 28.69, CGRectGetMinY(aDClearButton) + 3.36)];
                [bezier13Path closePath];
                [bezier13Path moveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 29.54, CGRectGetMinY(aDClearButton) + 20.44)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 13.35, CGRectGetMinY(aDClearButton) + 20.44)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 22.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 12.3, CGRectGetMinY(aDClearButton) + 20.44) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 21.33)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 23.44)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 13.35, CGRectGetMinY(aDClearButton) + 25.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 24.54) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 12.3, CGRectGetMinY(aDClearButton) + 25.44)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 29.54, CGRectGetMinY(aDClearButton) + 25.44)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 23.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 30.59, CGRectGetMinY(aDClearButton) + 25.44) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 24.54)];
                [bezier13Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 22.44)];
                [bezier13Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 29.54, CGRectGetMinY(aDClearButton) + 20.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 21.33) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 30.59, CGRectGetMinY(aDClearButton) + 20.44)];
                [bezier13Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier13Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 6
            {
                //// Bezier 10 Drawing
                UIBezierPath* bezier10Path = UIBezierPath.bezierPath;
                [bezier10Path moveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 28.69, CGRectGetMinY(aDClearButton) + 3.36)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 40.61, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 43, CGRectGetMinY(aDClearButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 41.93, CGRectGetMinY(aDClearButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 43, CGRectGetMinY(aDClearButton) + 3.14)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 40.61, CGRectGetMinY(aDClearButton) + 8.05) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 43, CGRectGetMinY(aDClearButton) + 5.31) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 41.93, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 38.27, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 37.31, CGRectGetMinY(aDClearButton) + 38.16)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 33.49, CGRectGetMinY(aDClearButton) + 43) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 37.31, CGRectGetMinY(aDClearButton) + 40.83) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 35.6, CGRectGetMinY(aDClearButton) + 43)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 9.51, CGRectGetMinY(aDClearButton) + 43)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 5.69, CGRectGetMinY(aDClearButton) + 38.16) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 7.4, CGRectGetMinY(aDClearButton) + 43) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 5.69, CGRectGetMinY(aDClearButton) + 40.83)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 4.73, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 2.39, CGRectGetMinY(aDClearButton) + 8.05)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton), CGRectGetMinY(aDClearButton) + 4.22) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 1.07, CGRectGetMinY(aDClearButton) + 8.05) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton), CGRectGetMinY(aDClearButton) + 5.22)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 2.39, CGRectGetMinY(aDClearButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton), CGRectGetMinY(aDClearButton) + 3.23) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 1.07, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 14.38, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 17.72, CGRectGetMinY(aDClearButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 14.38, CGRectGetMinY(aDClearButton) + 3.39) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 16.4, CGRectGetMinY(aDClearButton))];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 25.37, CGRectGetMinY(aDClearButton))];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 28.71, CGRectGetMinY(aDClearButton) + 3.39) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 26.69, CGRectGetMinY(aDClearButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 28.71, CGRectGetMinY(aDClearButton) + 3.39)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 28.69, CGRectGetMinY(aDClearButton) + 3.36)];
                [bezier10Path closePath];
                [bezier10Path moveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 29.54, CGRectGetMinY(aDClearButton) + 20.44)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 13.35, CGRectGetMinY(aDClearButton) + 20.44)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 22.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 12.3, CGRectGetMinY(aDClearButton) + 20.44) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 21.33)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 23.44)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 13.35, CGRectGetMinY(aDClearButton) + 25.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 11.45, CGRectGetMinY(aDClearButton) + 24.54) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 12.3, CGRectGetMinY(aDClearButton) + 25.44)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 29.54, CGRectGetMinY(aDClearButton) + 25.44)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 23.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 30.59, CGRectGetMinY(aDClearButton) + 25.44) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 24.54)];
                [bezier10Path addLineToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 22.44)];
                [bezier10Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDClearButton) + 29.54, CGRectGetMinY(aDClearButton) + 20.44) controlPoint1: CGPointMake(CGRectGetMinX(aDClearButton) + 31.45, CGRectGetMinY(aDClearButton) + 21.33) controlPoint2: CGPointMake(CGRectGetMinX(aDClearButton) + 30.59, CGRectGetMinY(aDClearButton) + 20.44)];
                [bezier10Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier10Path fill];
            }
        }
    }
}



@end
