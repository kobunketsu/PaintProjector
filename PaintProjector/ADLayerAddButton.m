//
//  LayerAddButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerAddButton.h"

@implementation ADLayerAddButton

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
    
    //// ADLayerAddButton
    {
        if (isNormal)
        {
            //// Normal 25
            {
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(24.17, 19.83)];
                [bezierPath addLineToPoint: CGPointMake(37, 19.83)];
                [bezierPath addLineToPoint: CGPointMake(37, 24.17)];
                [bezierPath addLineToPoint: CGPointMake(24.17, 24.17)];
                [bezierPath addLineToPoint: CGPointMake(24.17, 37)];
                [bezierPath addLineToPoint: CGPointMake(19.83, 37)];
                [bezierPath addLineToPoint: CGPointMake(19.83, 24.17)];
                [bezierPath addLineToPoint: CGPointMake(7, 24.17)];
                [bezierPath addLineToPoint: CGPointMake(7, 19.83)];
                [bezierPath addLineToPoint: CGPointMake(19.83, 19.83)];
                [bezierPath addLineToPoint: CGPointMake(19.83, 7)];
                [bezierPath addLineToPoint: CGPointMake(24.17, 7)];
                [bezierPath addLineToPoint: CGPointMake(24.17, 19.83)];
                [bezierPath closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezierPath fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 25
            {
                //// Bezier 2 Drawing
                UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
                [bezier2Path moveToPoint: CGPointMake(24.17, 19.83)];
                [bezier2Path addLineToPoint: CGPointMake(37, 19.83)];
                [bezier2Path addLineToPoint: CGPointMake(37, 24.17)];
                [bezier2Path addLineToPoint: CGPointMake(24.17, 24.17)];
                [bezier2Path addLineToPoint: CGPointMake(24.17, 37)];
                [bezier2Path addLineToPoint: CGPointMake(19.83, 37)];
                [bezier2Path addLineToPoint: CGPointMake(19.83, 24.17)];
                [bezier2Path addLineToPoint: CGPointMake(7, 24.17)];
                [bezier2Path addLineToPoint: CGPointMake(7, 19.83)];
                [bezier2Path addLineToPoint: CGPointMake(19.83, 19.83)];
                [bezier2Path addLineToPoint: CGPointMake(19.83, 7)];
                [bezier2Path addLineToPoint: CGPointMake(24.17, 7)];
                [bezier2Path addLineToPoint: CGPointMake(24.17, 19.83)];
                [bezier2Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier2Path fill];
            }
        }
    }
}


@end
