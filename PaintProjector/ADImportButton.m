//
//  ImportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADImportButton.h"

@implementation ADImportButton

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
    CGRect aDImportButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 - 0.5) + 1, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 - 0.5) + 1, 44, 44);
    
    
    //// ADImportButton
    {
        if (isNormal)
        {
            //// Normal 11
            {
                //// Bezier 23 Drawing
                UIBezierPath* bezier23Path = UIBezierPath.bezierPath;
                [bezier23Path moveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton))];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 19.67, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 12.02, CGRectGetMinY(aDImportButton))];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 19.67, CGRectGetMinY(aDImportButton) + 25.57)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 11.26, CGRectGetMinY(aDImportButton) + 17.52)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 7.76, CGRectGetMinY(aDImportButton) + 21.35)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 21.67, CGRectGetMinY(aDImportButton) + 35.38)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 36.45, CGRectGetMinY(aDImportButton) + 21.35)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 32.64, CGRectGetMinY(aDImportButton) + 17.52)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 24, CGRectGetMinY(aDImportButton) + 26)];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 24, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 24, CGRectGetMinY(aDImportButton) + 26) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 24.11, CGRectGetMinY(aDImportButton) + 5.88)];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 39, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 31.69, CGRectGetMinY(aDImportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 39, CGRectGetMinY(aDImportButton))];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 41.76, CGRectGetMinY(aDImportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 2.24)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 39)];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 39, CGRectGetMinY(aDImportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 41.76) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 41.76, CGRectGetMinY(aDImportButton) + 44)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton) + 44)];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 39) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 2.24, CGRectGetMinY(aDImportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 41.76)];
                [bezier23Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 5)];
                [bezier23Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 2.24) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 2.24, CGRectGetMinY(aDImportButton))];
                [bezier23Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier23Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 11
            {
                //// Bezier 21 Drawing
                UIBezierPath* bezier21Path = UIBezierPath.bezierPath;
                [bezier21Path moveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton))];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 19.67, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 12.02, CGRectGetMinY(aDImportButton))];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 19.67, CGRectGetMinY(aDImportButton) + 25.57)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 11.26, CGRectGetMinY(aDImportButton) + 17.52)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 7.76, CGRectGetMinY(aDImportButton) + 21.35)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 21.67, CGRectGetMinY(aDImportButton) + 35.38)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 36.45, CGRectGetMinY(aDImportButton) + 21.35)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 32.64, CGRectGetMinY(aDImportButton) + 17.52)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 24, CGRectGetMinY(aDImportButton) + 26)];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 24, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 24, CGRectGetMinY(aDImportButton) + 26) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 24.11, CGRectGetMinY(aDImportButton) + 5.88)];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 39, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 31.69, CGRectGetMinY(aDImportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 39, CGRectGetMinY(aDImportButton))];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 41.76, CGRectGetMinY(aDImportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 2.24)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 39)];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 39, CGRectGetMinY(aDImportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 44, CGRectGetMinY(aDImportButton) + 41.76) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 41.76, CGRectGetMinY(aDImportButton) + 44)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton) + 44)];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 39) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton) + 2.24, CGRectGetMinY(aDImportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 41.76)];
                [bezier21Path addLineToPoint: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 5)];
                [bezier21Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDImportButton) + 5, CGRectGetMinY(aDImportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDImportButton), CGRectGetMinY(aDImportButton) + 2.24) controlPoint2: CGPointMake(CGRectGetMinX(aDImportButton) + 2.24, CGRectGetMinY(aDImportButton))];
                [bezier21Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier21Path fill];
            }
        }
    }
}

@end
