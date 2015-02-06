//
//  FullScreenReverseButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADFullScreenReverseButton.h"

@implementation ADFullScreenReverseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawADSharedRoundButtonWithFrame:rect isSelected:self.isSelected || self.isHighlighted];
}

- (void)drawADSharedRoundButtonWithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// FullScreenReverseButton
    {
        if (isNormal)
        {
            //// Normal 2
            {
                //// Bezier 6 Drawing
                UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
                [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 11)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 11)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 14.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 12.51)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 18.27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 16.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 18.27)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 18.27)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 20.51)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 20.51)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 27.79)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 27.79)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 20.51)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29, CGRectGetMinY(frame) + 20.51)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29, CGRectGetMinY(frame) + 18.27)];
                [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 18.27)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 15.65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 18.27) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 17.08)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 13.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 11)];
                [bezier6Path closePath];
                [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.14, CGRectGetMinY(frame) + 11.12)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier6Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier6Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 2
            {
                //// Bezier 2 Drawing
                UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 11)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 11)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 14.16) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 11) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 12.51)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 18.27) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 16.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 18.27)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 18.27)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 12, CGRectGetMinY(frame) + 20.51)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 20.51)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.37, CGRectGetMinY(frame) + 27.79)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 27.79)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 20.51)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29, CGRectGetMinY(frame) + 20.51)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 29, CGRectGetMinY(frame) + 18.27)];
                [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 18.27)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 15.65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 18.27) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 17.08)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 11) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 13.57) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 11)];
                [bezier2Path closePath];
                [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.14, CGRectGetMinY(frame) + 11.12)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier2Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier2Path fill];
            }
        }
    }
}





@end
