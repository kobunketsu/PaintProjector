//
//  LayerBlendModeButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerBlendModeButton.h"

@implementation ADLayerBlendModeButton

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
    
    //// ADLayerBlendModeButton
    {
        if (isNormal)
        {
            //// Normal 8
            {
                //// Bezier 16 Drawing
                UIBezierPath* bezier16Path = UIBezierPath.bezierPath;
                [bezier16Path moveToPoint: CGPointMake(12.95, 17.95)];
                [bezier16Path addCurveToPoint: CGPointMake(9.96, 22.5) controlPoint1: CGPointMake(11.61, 19.29) controlPoint2: CGPointMake(10.62, 20.84)];
                [bezier16Path addCurveToPoint: CGPointMake(12.95, 27.05) controlPoint1: CGPointMake(10.62, 24.16) controlPoint2: CGPointMake(11.61, 25.71)];
                [bezier16Path addCurveToPoint: CGPointMake(32.05, 27.05) controlPoint1: CGPointMake(18.23, 32.32) controlPoint2: CGPointMake(26.77, 32.32)];
                [bezier16Path addCurveToPoint: CGPointMake(35.04, 22.5) controlPoint1: CGPointMake(33.39, 25.71) controlPoint2: CGPointMake(34.38, 24.16)];
                [bezier16Path addCurveToPoint: CGPointMake(32.05, 17.95) controlPoint1: CGPointMake(34.38, 20.84) controlPoint2: CGPointMake(33.39, 19.29)];
                [bezier16Path addCurveToPoint: CGPointMake(26.27, 14.54) controlPoint1: CGPointMake(30.38, 16.29) controlPoint2: CGPointMake(28.39, 15.15)];
                [bezier16Path addCurveToPoint: CGPointMake(12.95, 17.95) controlPoint1: CGPointMake(21.7, 13.21) controlPoint2: CGPointMake(16.56, 14.35)];
                [bezier16Path closePath];
                [bezier16Path moveToPoint: CGPointMake(32.05, 7.95)];
                [bezier16Path addCurveToPoint: CGPointMake(35.04, 22.5) controlPoint1: CGPointMake(35.98, 11.89) controlPoint2: CGPointMake(36.98, 17.64)];
                [bezier16Path addCurveToPoint: CGPointMake(32.05, 37.05) controlPoint1: CGPointMake(36.98, 27.36) controlPoint2: CGPointMake(35.98, 33.11)];
                [bezier16Path addCurveToPoint: CGPointMake(12.95, 37.05) controlPoint1: CGPointMake(26.77, 42.32) controlPoint2: CGPointMake(18.23, 42.32)];
                [bezier16Path addCurveToPoint: CGPointMake(9.96, 22.5) controlPoint1: CGPointMake(9.02, 33.11) controlPoint2: CGPointMake(8.02, 27.36)];
                [bezier16Path addCurveToPoint: CGPointMake(12.95, 7.95) controlPoint1: CGPointMake(8.02, 17.64) controlPoint2: CGPointMake(9.02, 11.89)];
                [bezier16Path addCurveToPoint: CGPointMake(16.52, 5.39) controlPoint1: CGPointMake(14.03, 6.88) controlPoint2: CGPointMake(15.23, 6.03)];
                [bezier16Path addCurveToPoint: CGPointMake(32.05, 7.95) controlPoint1: CGPointMake(21.57, 2.9) controlPoint2: CGPointMake(27.85, 3.75)];
                [bezier16Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier16Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 8
            {
                //// Bezier 19 Drawing
                UIBezierPath* bezier19Path = UIBezierPath.bezierPath;
                [bezier19Path moveToPoint: CGPointMake(12.95, 17.95)];
                [bezier19Path addCurveToPoint: CGPointMake(9.96, 22.5) controlPoint1: CGPointMake(11.61, 19.29) controlPoint2: CGPointMake(10.62, 20.84)];
                [bezier19Path addCurveToPoint: CGPointMake(12.95, 27.05) controlPoint1: CGPointMake(10.62, 24.16) controlPoint2: CGPointMake(11.61, 25.71)];
                [bezier19Path addCurveToPoint: CGPointMake(32.05, 27.05) controlPoint1: CGPointMake(18.23, 32.32) controlPoint2: CGPointMake(26.77, 32.32)];
                [bezier19Path addCurveToPoint: CGPointMake(35.04, 22.5) controlPoint1: CGPointMake(33.39, 25.71) controlPoint2: CGPointMake(34.38, 24.16)];
                [bezier19Path addCurveToPoint: CGPointMake(32.05, 17.95) controlPoint1: CGPointMake(34.38, 20.84) controlPoint2: CGPointMake(33.39, 19.29)];
                [bezier19Path addCurveToPoint: CGPointMake(26.27, 14.54) controlPoint1: CGPointMake(30.38, 16.29) controlPoint2: CGPointMake(28.39, 15.15)];
                [bezier19Path addCurveToPoint: CGPointMake(12.95, 17.95) controlPoint1: CGPointMake(21.7, 13.21) controlPoint2: CGPointMake(16.56, 14.35)];
                [bezier19Path closePath];
                [bezier19Path moveToPoint: CGPointMake(32.05, 7.95)];
                [bezier19Path addCurveToPoint: CGPointMake(35.04, 22.5) controlPoint1: CGPointMake(35.98, 11.89) controlPoint2: CGPointMake(36.98, 17.64)];
                [bezier19Path addCurveToPoint: CGPointMake(32.05, 37.05) controlPoint1: CGPointMake(36.98, 27.36) controlPoint2: CGPointMake(35.98, 33.11)];
                [bezier19Path addCurveToPoint: CGPointMake(12.95, 37.05) controlPoint1: CGPointMake(26.77, 42.32) controlPoint2: CGPointMake(18.23, 42.32)];
                [bezier19Path addCurveToPoint: CGPointMake(9.96, 22.5) controlPoint1: CGPointMake(9.02, 33.11) controlPoint2: CGPointMake(8.02, 27.36)];
                [bezier19Path addCurveToPoint: CGPointMake(12.95, 7.95) controlPoint1: CGPointMake(8.02, 17.64) controlPoint2: CGPointMake(9.02, 11.89)];
                [bezier19Path addCurveToPoint: CGPointMake(16.52, 5.39) controlPoint1: CGPointMake(14.03, 6.88) controlPoint2: CGPointMake(15.23, 6.03)];
                [bezier19Path addCurveToPoint: CGPointMake(32.05, 7.95) controlPoint1: CGPointMake(21.57, 2.9) controlPoint2: CGPointMake(27.85, 3.75)];
                [bezier19Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier19Path fill];
            }
        }
    }
}



@end
