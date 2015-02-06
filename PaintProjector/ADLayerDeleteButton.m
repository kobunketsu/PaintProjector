//
//  ADLayerDeleteButton.m
//  PaintProjector
//
//  Created by kobunketsu on 9/26/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLayerDeleteButton.h"

@implementation ADLayerDeleteButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// ADLayerDeleteButton
    {
        if (isNormal)
        {
            //// Normal 3
            {
                //// Bezier 9 Drawing
                UIBezierPath* bezier9Path = UIBezierPath.bezierPath;
                [bezier9Path moveToPoint: CGPointMake(37, 19.83)];
                [bezier9Path addLineToPoint: CGPointMake(37, 24.17)];
                [bezier9Path addLineToPoint: CGPointMake(7, 24.17)];
                [bezier9Path addLineToPoint: CGPointMake(7, 19.83)];
                [bezier9Path addLineToPoint: CGPointMake(37, 19.83)];
                [bezier9Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier9Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 3
            {
                //// Bezier 6 Drawing
                UIBezierPath* bezier6Path = UIBezierPath.bezierPath;
                [bezier6Path moveToPoint: CGPointMake(37, 19.83)];
                [bezier6Path addLineToPoint: CGPointMake(37, 24.17)];
                [bezier6Path addLineToPoint: CGPointMake(7, 24.17)];
                [bezier6Path addLineToPoint: CGPointMake(7, 19.83)];
                [bezier6Path addLineToPoint: CGPointMake(37, 19.83)];
                [bezier6Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier6Path fill];
            }
        }
    }
}

@end
