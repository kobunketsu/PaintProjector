//
//  ADSetupCylinderBackButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 9/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADSetupCylinderBackButton.h"

@implementation ADSetupCylinderBackButton

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
    CGRect aDSetupCylinderBackButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 + 0.5), 44, 44);
    
    
    //// ADSetupCylinderBackButton
    {
        if (isNormal)
        {
            //// Normal 17
            {
                //// Bezier 35 Drawing
                UIBezierPath* bezier35Path = UIBezierPath.bezierPath;
                [bezier35Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 25.05, CGRectGetMinY(aDSetupCylinderBackButton) + 2.82)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 8.54, CGRectGetMinY(aDSetupCylinderBackButton) + 19.18)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 44, CGRectGetMinY(aDSetupCylinderBackButton) + 19.18)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 44, CGRectGetMinY(aDSetupCylinderBackButton) + 23.55)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 8.72, CGRectGetMinY(aDSetupCylinderBackButton) + 23.99)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 25.18, CGRectGetMinY(aDSetupCylinderBackButton) + 41.33)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 22.31, CGRectGetMinY(aDSetupCylinderBackButton) + 44)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton), CGRectGetMinY(aDSetupCylinderBackButton) + 21.1)];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 22.31, CGRectGetMinY(aDSetupCylinderBackButton))];
                [bezier35Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 25.05, CGRectGetMinY(aDSetupCylinderBackButton) + 2.82)];
                [bezier35Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier35Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 17
            {
                //// Bezier 32 Drawing
                UIBezierPath* bezier32Path = UIBezierPath.bezierPath;
                [bezier32Path moveToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 25.05, CGRectGetMinY(aDSetupCylinderBackButton) + 2.82)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 8.54, CGRectGetMinY(aDSetupCylinderBackButton) + 19.18)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 44, CGRectGetMinY(aDSetupCylinderBackButton) + 19.18)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 44, CGRectGetMinY(aDSetupCylinderBackButton) + 23.55)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 8.72, CGRectGetMinY(aDSetupCylinderBackButton) + 23.99)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 25.18, CGRectGetMinY(aDSetupCylinderBackButton) + 41.33)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 22.31, CGRectGetMinY(aDSetupCylinderBackButton) + 44)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton), CGRectGetMinY(aDSetupCylinderBackButton) + 21.1)];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 22.31, CGRectGetMinY(aDSetupCylinderBackButton))];
                [bezier32Path addLineToPoint: CGPointMake(CGRectGetMinX(aDSetupCylinderBackButton) + 25.05, CGRectGetMinY(aDSetupCylinderBackButton) + 2.82)];
                [bezier32Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier32Path fill];
            }
        }
    }
}


@end
