//
//  ADSharedMainButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/5/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedMainButton.h"

@implementation ADSharedMainButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self drawCanvas1WithFrame:rect isSelected:self.isSelected || self.isHighlighted];
}

- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDUndoButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 47) * 0.50617 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 47, 44);
    
    
    //// ADUndoButton
    {
        if (isNormal)
        {
            //// Normal 25
            {
                //// Bezier 51 Drawing
                UIBezierPath* bezier51Path = UIBezierPath.bezierPath;
                [bezier51Path moveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 16.84, CGRectGetMinY(aDUndoButton) + 2.96)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 8.8, CGRectGetMinY(aDUndoButton) + 12.04)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 12.04)];
                [bezier51Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.43, CGRectGetMinY(aDUndoButton) + 16.14) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 36.38, CGRectGetMinY(aDUndoButton) + 12.04) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.38, CGRectGetMinY(aDUndoButton) + 12.95)];
                [bezier51Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.43, CGRectGetMinY(aDUndoButton) + 39.22) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 48.52, CGRectGetMinY(aDUndoButton) + 22.51) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 48.52, CGRectGetMinY(aDUndoButton) + 32.85)];
                [bezier51Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.38, CGRectGetMinY(aDUndoButton) + 42.41) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 36.38, CGRectGetMinY(aDUndoButton) + 44)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 38.73)];
                [bezier51Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.18, CGRectGetMinY(aDUndoButton) + 35.79) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 34.85, CGRectGetMinY(aDUndoButton) + 38.73) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 37.31, CGRectGetMinY(aDUndoButton) + 37.75)];
                [bezier51Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.18, CGRectGetMinY(aDUndoButton) + 19.57) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.93, CGRectGetMinY(aDUndoButton) + 31.87) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.93, CGRectGetMinY(aDUndoButton) + 23.49)];
                [bezier51Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 16.63) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 37.31, CGRectGetMinY(aDUndoButton) + 17.61) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 34.85, CGRectGetMinY(aDUndoButton) + 16.63)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 8.99, CGRectGetMinY(aDUndoButton) + 17.1)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 16.98, CGRectGetMinY(aDUndoButton) + 26.19)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 14.01, CGRectGetMinY(aDUndoButton) + 29)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton), CGRectGetMinY(aDUndoButton) + 14.06)];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 14.01, CGRectGetMinY(aDUndoButton))];
                [bezier51Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 16.84, CGRectGetMinY(aDUndoButton) + 2.96)];
                [bezier51Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier51Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 25
            {
                //// Bezier 52 Drawing
                UIBezierPath* bezier52Path = UIBezierPath.bezierPath;
                [bezier52Path moveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 16.84, CGRectGetMinY(aDUndoButton) + 2.96)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 8.8, CGRectGetMinY(aDUndoButton) + 12.04)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 12.04)];
                [bezier52Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.43, CGRectGetMinY(aDUndoButton) + 16.14) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 36.38, CGRectGetMinY(aDUndoButton) + 12.04) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.38, CGRectGetMinY(aDUndoButton) + 12.95)];
                [bezier52Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.43, CGRectGetMinY(aDUndoButton) + 39.22) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 48.52, CGRectGetMinY(aDUndoButton) + 22.51) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 48.52, CGRectGetMinY(aDUndoButton) + 32.85)];
                [bezier52Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.38, CGRectGetMinY(aDUndoButton) + 42.41) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 36.38, CGRectGetMinY(aDUndoButton) + 44)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 38.73)];
                [bezier52Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.18, CGRectGetMinY(aDUndoButton) + 35.79) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 34.85, CGRectGetMinY(aDUndoButton) + 38.73) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 37.31, CGRectGetMinY(aDUndoButton) + 37.75)];
                [bezier52Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 39.18, CGRectGetMinY(aDUndoButton) + 19.57) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.93, CGRectGetMinY(aDUndoButton) + 31.87) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 42.93, CGRectGetMinY(aDUndoButton) + 23.49)];
                [bezier52Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 32.39, CGRectGetMinY(aDUndoButton) + 16.63) controlPoint1: CGPointMake(CGRectGetMinX(aDUndoButton) + 37.31, CGRectGetMinY(aDUndoButton) + 17.61) controlPoint2: CGPointMake(CGRectGetMinX(aDUndoButton) + 34.85, CGRectGetMinY(aDUndoButton) + 16.63)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 8.99, CGRectGetMinY(aDUndoButton) + 17.1)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 16.98, CGRectGetMinY(aDUndoButton) + 26.19)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 14.01, CGRectGetMinY(aDUndoButton) + 29)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton), CGRectGetMinY(aDUndoButton) + 14.06)];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 14.01, CGRectGetMinY(aDUndoButton))];
                [bezier52Path addLineToPoint: CGPointMake(CGRectGetMinX(aDUndoButton) + 16.84, CGRectGetMinY(aDUndoButton) + 2.96)];
                [bezier52Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier52Path fill];
            }
        }
    }
}

@end
