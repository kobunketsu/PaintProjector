//
//  TransformButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformButton.h"

@implementation ADTransformButton

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
    CGRect aDTransformButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 45) * 0.50602 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 45) * 0.45714 + 0.5), 45, 45);
    
    
    //// ADTransformButton
    {
        if (isNormal)
        {
            //// Normal 24
            {
                //// Bezier 49 Drawing
                UIBezierPath* bezier49Path = UIBezierPath.bezierPath;
                [bezier49Path moveToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 29.14, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 15.86)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 45, CGRectGetMinY(aDTransformButton) + 22.5)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 29.14)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 29.14, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 22.5, CGRectGetMinY(aDTransformButton) + 45)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 15.86, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 29.14)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton), CGRectGetMinY(aDTransformButton) + 22.5)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 15.86)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 15.86, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 22.5, CGRectGetMinY(aDTransformButton))];
                [bezier49Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 29.14, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier49Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier49Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 24
            {
                //// Bezier 50 Drawing
                UIBezierPath* bezier50Path = UIBezierPath.bezierPath;
                [bezier50Path moveToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 29.14, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 15.86)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 45, CGRectGetMinY(aDTransformButton) + 22.5)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 29.14)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 36.4, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 25.03, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 29.14, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 22.5, CGRectGetMinY(aDTransformButton) + 45)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 15.86, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 36.4)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 24.78)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 29.14)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton), CGRectGetMinY(aDTransformButton) + 22.5)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 15.86)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 8.6, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 19.72)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 19.97, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 15.86, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 22.5, CGRectGetMinY(aDTransformButton))];
                [bezier50Path addLineToPoint: CGPointMake(CGRectGetMinX(aDTransformButton) + 29.14, CGRectGetMinY(aDTransformButton) + 8.6)];
                [bezier50Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier50Path fill];
            }
        }
    }
}


@end
