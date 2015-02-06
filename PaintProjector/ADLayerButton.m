//
//  LayerButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerButton.h"

@implementation ADLayerButton

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
    CGRect aDLayerButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 43.45) * 0.43776 - 0.05) + 0.55, 44, 43.45);
    
    
    //// ADLayerButton
    {
        if (isNormal)
        {
            //// Normal 13
            {
                //// Bezier 27 Drawing
                UIBezierPath* bezier27Path = UIBezierPath.bezierPath;
                [bezier27Path moveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 7.7)];
                [bezier27Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 1.96, CGRectGetMinY(aDLayerButton) + 9.9) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 8.92) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 0.88, CGRectGetMinY(aDLayerButton) + 9.9)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 37.16, CGRectGetMinY(aDLayerButton) + 9.9)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 39.11, CGRectGetMinY(aDLayerButton) + 7.7)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 2.2)];
                [bezier27Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 42.04, CGRectGetMinY(aDLayerButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 0.98) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 43.12, CGRectGetMinY(aDLayerButton))];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 6.84, CGRectGetMinY(aDLayerButton))];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 4.89, CGRectGetMinY(aDLayerButton) + 2.2)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 7.7)];
                [bezier27Path closePath];
                [bezier27Path moveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 24.75)];
                [bezier27Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 1.96, CGRectGetMinY(aDLayerButton) + 26.95) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 25.97) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 0.88, CGRectGetMinY(aDLayerButton) + 26.95)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 37.16, CGRectGetMinY(aDLayerButton) + 26.95)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 39.11, CGRectGetMinY(aDLayerButton) + 24.75)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 19.25)];
                [bezier27Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 42.04, CGRectGetMinY(aDLayerButton) + 17.05) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 18.03) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 43.12, CGRectGetMinY(aDLayerButton) + 17.05)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 6.84, CGRectGetMinY(aDLayerButton) + 17.05)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 4.89, CGRectGetMinY(aDLayerButton) + 19.25)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 24.75)];
                [bezier27Path closePath];
                [bezier27Path moveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 41.25)];
                [bezier27Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 1.96, CGRectGetMinY(aDLayerButton) + 43.45) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 42.47) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 0.88, CGRectGetMinY(aDLayerButton) + 43.45)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 37.16, CGRectGetMinY(aDLayerButton) + 43.45)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 39.11, CGRectGetMinY(aDLayerButton) + 41.25)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 35.75)];
                [bezier27Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 42.04, CGRectGetMinY(aDLayerButton) + 33.55) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 34.53) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 43.12, CGRectGetMinY(aDLayerButton) + 33.55)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 6.84, CGRectGetMinY(aDLayerButton) + 33.55)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 4.89, CGRectGetMinY(aDLayerButton) + 35.75)];
                [bezier27Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 41.25)];
                [bezier27Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier27Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 13
            {
                //// Bezier 24 Drawing
                UIBezierPath* bezier24Path = UIBezierPath.bezierPath;
                [bezier24Path moveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 7.7)];
                [bezier24Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 1.96, CGRectGetMinY(aDLayerButton) + 9.9) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 8.92) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 0.88, CGRectGetMinY(aDLayerButton) + 9.9)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 37.16, CGRectGetMinY(aDLayerButton) + 9.9)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 39.11, CGRectGetMinY(aDLayerButton) + 7.7)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 2.2)];
                [bezier24Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 42.04, CGRectGetMinY(aDLayerButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 0.98) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 43.12, CGRectGetMinY(aDLayerButton))];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 6.84, CGRectGetMinY(aDLayerButton))];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 4.89, CGRectGetMinY(aDLayerButton) + 2.2)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 7.7)];
                [bezier24Path closePath];
                [bezier24Path moveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 24.75)];
                [bezier24Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 1.96, CGRectGetMinY(aDLayerButton) + 26.95) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 25.97) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 0.88, CGRectGetMinY(aDLayerButton) + 26.95)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 37.16, CGRectGetMinY(aDLayerButton) + 26.95)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 39.11, CGRectGetMinY(aDLayerButton) + 24.75)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 19.25)];
                [bezier24Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 42.04, CGRectGetMinY(aDLayerButton) + 17.05) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 18.03) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 43.12, CGRectGetMinY(aDLayerButton) + 17.05)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 6.84, CGRectGetMinY(aDLayerButton) + 17.05)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 4.89, CGRectGetMinY(aDLayerButton) + 19.25)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 24.75)];
                [bezier24Path closePath];
                [bezier24Path moveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 41.25)];
                [bezier24Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 1.96, CGRectGetMinY(aDLayerButton) + 43.45) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 42.47) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 0.88, CGRectGetMinY(aDLayerButton) + 43.45)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 37.16, CGRectGetMinY(aDLayerButton) + 43.45)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 39.11, CGRectGetMinY(aDLayerButton) + 41.25)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 35.75)];
                [bezier24Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 42.04, CGRectGetMinY(aDLayerButton) + 33.55) controlPoint1: CGPointMake(CGRectGetMinX(aDLayerButton) + 44, CGRectGetMinY(aDLayerButton) + 34.53) controlPoint2: CGPointMake(CGRectGetMinX(aDLayerButton) + 43.12, CGRectGetMinY(aDLayerButton) + 33.55)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 6.84, CGRectGetMinY(aDLayerButton) + 33.55)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton) + 4.89, CGRectGetMinY(aDLayerButton) + 35.75)];
                [bezier24Path addLineToPoint: CGPointMake(CGRectGetMinX(aDLayerButton), CGRectGetMinY(aDLayerButton) + 41.25)];
                [bezier24Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier24Path fill];
            }
        }
    }
}


@end
