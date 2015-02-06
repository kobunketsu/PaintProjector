//
//  InfoButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 3/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADInfoButton.h"

@implementation ADInfoButton

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
    CGRect aDInfoButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
    //// ADInfoButton
    {
        if (isNormal)
        {
            //// Normal 12
            {
                //// Bezier 25 Drawing
                UIBezierPath* bezier25Path = UIBezierPath.bezierPath;
                [bezier25Path moveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 10.04)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 10.04)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 14.34)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 14.34)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 10.04)];
                [bezier25Path closePath];
                [bezier25Path moveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 16.72)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 16.72)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 34.27)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 34.27)];
                [bezier25Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 16.72)];
                [bezier25Path closePath];
                [bezier25Path moveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 37.56, CGRectGetMinY(aDInfoButton) + 6.44)];
                [bezier25Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 37.56, CGRectGetMinY(aDInfoButton) + 37.56) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) + 46.15, CGRectGetMinY(aDInfoButton) + 15.04) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) + 46.15, CGRectGetMinY(aDInfoButton) + 28.96)];
                [bezier25Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 6.44, CGRectGetMinY(aDInfoButton) + 37.56) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) + 28.96, CGRectGetMinY(aDInfoButton) + 46.15) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) + 15.04, CGRectGetMinY(aDInfoButton) + 46.15)];
                [bezier25Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 6.44, CGRectGetMinY(aDInfoButton) + 6.44) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) - 2.15, CGRectGetMinY(aDInfoButton) + 28.96) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) - 2.15, CGRectGetMinY(aDInfoButton) + 15.04)];
                [bezier25Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 37.56, CGRectGetMinY(aDInfoButton) + 6.44) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) + 15.04, CGRectGetMinY(aDInfoButton) - 2.15) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) + 28.96, CGRectGetMinY(aDInfoButton) - 2.15)];
                [bezier25Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier25Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 12
            {
                //// Bezier 22 Drawing
                UIBezierPath* bezier22Path = UIBezierPath.bezierPath;
                [bezier22Path moveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 10.04)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 10.04)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 14.34)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 14.34)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 10.04)];
                [bezier22Path closePath];
                [bezier22Path moveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 16.72)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 16.72)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 20.15, CGRectGetMinY(aDInfoButton) + 34.27)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 34.27)];
                [bezier22Path addLineToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 24.79, CGRectGetMinY(aDInfoButton) + 16.72)];
                [bezier22Path closePath];
                [bezier22Path moveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 37.56, CGRectGetMinY(aDInfoButton) + 6.44)];
                [bezier22Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 37.56, CGRectGetMinY(aDInfoButton) + 37.56) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) + 46.15, CGRectGetMinY(aDInfoButton) + 15.04) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) + 46.15, CGRectGetMinY(aDInfoButton) + 28.96)];
                [bezier22Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 6.44, CGRectGetMinY(aDInfoButton) + 37.56) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) + 28.96, CGRectGetMinY(aDInfoButton) + 46.15) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) + 15.04, CGRectGetMinY(aDInfoButton) + 46.15)];
                [bezier22Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 6.44, CGRectGetMinY(aDInfoButton) + 6.44) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) - 2.15, CGRectGetMinY(aDInfoButton) + 28.96) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) - 2.15, CGRectGetMinY(aDInfoButton) + 15.04)];
                [bezier22Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDInfoButton) + 37.56, CGRectGetMinY(aDInfoButton) + 6.44) controlPoint1: CGPointMake(CGRectGetMinX(aDInfoButton) + 15.04, CGRectGetMinY(aDInfoButton) - 2.15) controlPoint2: CGPointMake(CGRectGetMinX(aDInfoButton) + 28.96, CGRectGetMinY(aDInfoButton) - 2.15)];
                [bezier22Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier22Path fill];
            }
        }
    }
}



@end
