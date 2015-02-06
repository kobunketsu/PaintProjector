//
//  ExportButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADExportButton.h"

@implementation ADExportButton

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
    CGRect aDExportButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 44) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.44444 - 0.5) + 1, 44, 44);
    
    
    //// ADExportButton
    {
        if (isNormal)
        {
            //// Normal 9
            {
                //// Bezier 19 Drawing
                UIBezierPath* bezier19Path = UIBezierPath.bezierPath;
                [bezier19Path moveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton) + 44)];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 19.67, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 12.02, CGRectGetMinY(aDExportButton) + 44)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 19.67, CGRectGetMinY(aDExportButton) + 18.43)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 10.68, CGRectGetMinY(aDExportButton) + 26.48)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 7.76, CGRectGetMinY(aDExportButton) + 22.65)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 21.67, CGRectGetMinY(aDExportButton) + 8.62)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 36.45, CGRectGetMinY(aDExportButton) + 22.65)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 33.33, CGRectGetMinY(aDExportButton) + 26.48)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 24.25, CGRectGetMinY(aDExportButton) + 18.43)];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 24.25, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 24.25, CGRectGetMinY(aDExportButton) + 18.43) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 24.36, CGRectGetMinY(aDExportButton) + 38.12)];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 39, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 31.94, CGRectGetMinY(aDExportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 39, CGRectGetMinY(aDExportButton) + 44)];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 39) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 41.76, CGRectGetMinY(aDExportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 41.76)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 5)];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 39, CGRectGetMinY(aDExportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 2.24) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 41.76, CGRectGetMinY(aDExportButton))];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton))];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 2.24, CGRectGetMinY(aDExportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 2.24)];
                [bezier19Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 39)];
                [bezier19Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 41.76) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 2.24, CGRectGetMinY(aDExportButton) + 44)];
                [bezier19Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier19Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 9
            {
                //// Bezier 17 Drawing
                UIBezierPath* bezier17Path = UIBezierPath.bezierPath;
                [bezier17Path moveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton) + 44)];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 19.67, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 12.02, CGRectGetMinY(aDExportButton) + 44)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 19.67, CGRectGetMinY(aDExportButton) + 18.43)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 10.68, CGRectGetMinY(aDExportButton) + 26.48)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 7.76, CGRectGetMinY(aDExportButton) + 22.65)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 21.67, CGRectGetMinY(aDExportButton) + 8.62)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 36.45, CGRectGetMinY(aDExportButton) + 22.65)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 33.33, CGRectGetMinY(aDExportButton) + 26.48)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 24.25, CGRectGetMinY(aDExportButton) + 18.43)];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 24.25, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 24.25, CGRectGetMinY(aDExportButton) + 18.43) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 24.36, CGRectGetMinY(aDExportButton) + 38.12)];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 39, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 31.94, CGRectGetMinY(aDExportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 39, CGRectGetMinY(aDExportButton) + 44)];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 39) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 41.76, CGRectGetMinY(aDExportButton) + 44) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 41.76)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 5)];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 39, CGRectGetMinY(aDExportButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 44, CGRectGetMinY(aDExportButton) + 2.24) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 41.76, CGRectGetMinY(aDExportButton))];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton))];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 5) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton) + 2.24, CGRectGetMinY(aDExportButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 2.24)];
                [bezier17Path addLineToPoint: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 39)];
                [bezier17Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDExportButton) + 5, CGRectGetMinY(aDExportButton) + 44) controlPoint1: CGPointMake(CGRectGetMinX(aDExportButton), CGRectGetMinY(aDExportButton) + 41.76) controlPoint2: CGPointMake(CGRectGetMinX(aDExportButton) + 2.24, CGRectGetMinY(aDExportButton) + 44)];
                [bezier17Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier17Path fill];
            }
        }
    }
}


@end
