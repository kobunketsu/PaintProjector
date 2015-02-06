//
//  PaintButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-24.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADPaintButton.h"

@implementation ADPaintButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setIsReversePaint:(BOOL)isReversePaint{
    _isReversePaint = isReversePaint;
    [self setNeedsDisplay];
}
- (void)drawCanvas1WithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDPaintButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 32.59) * 0.50311 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 46.58) * 0.47874 + 0.08) + 0.42, 32.59, 46.58);
    
    
    //// ADPaintButton
    {
        if (isNormal)
        {
            //// Normal 15
            {
                //// Bezier 28 Drawing
                UIBezierPath* bezier28Path = UIBezierPath.bezierPath;
                [bezier28Path moveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 5.33, CGRectGetMinY(aDPaintButton) + 23.66)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 0.06, CGRectGetMinY(aDPaintButton) + 45.13)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 2.08, CGRectGetMinY(aDPaintButton) + 46.58)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 18.96, CGRectGetMinY(aDPaintButton) + 32.56)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 28.96, CGRectGetMinY(aDPaintButton) + 16.07)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 31.34, CGRectGetMinY(aDPaintButton) + 11.96)];
                [bezier28Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 32.45, CGRectGetMinY(aDPaintButton) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 31.34, CGRectGetMinY(aDPaintButton) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 33.09, CGRectGetMinY(aDPaintButton) + 9.21)];
                [bezier28Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 28.45, CGRectGetMinY(aDPaintButton) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 31.81, CGRectGetMinY(aDPaintButton) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 30.76, CGRectGetMinY(aDPaintButton) + 2.83)];
                [bezier28Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 22.45, CGRectGetMinY(aDPaintButton) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 26.14, CGRectGetMinY(aDPaintButton) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 25.07, CGRectGetMinY(aDPaintButton) - 0.08)];
                [bezier28Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 17.95, CGRectGetMinY(aDPaintButton) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 19.84, CGRectGetMinY(aDPaintButton) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 17.95, CGRectGetMinY(aDPaintButton) + 3.35)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 15.29, CGRectGetMinY(aDPaintButton) + 7.35)];
                [bezier28Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 5.33, CGRectGetMinY(aDPaintButton) + 23.66)];
                [bezier28Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier28Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 15
            {
                //// Bezier 30 Drawing
                UIBezierPath* bezier30Path = UIBezierPath.bezierPath;
                [bezier30Path moveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 5.28, CGRectGetMinY(aDPaintButton) + 23.66)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton), CGRectGetMinY(aDPaintButton) + 45.13)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 2.02, CGRectGetMinY(aDPaintButton) + 46.58)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 18.9, CGRectGetMinY(aDPaintButton) + 32.56)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 28.9, CGRectGetMinY(aDPaintButton) + 16.07)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 31.29, CGRectGetMinY(aDPaintButton) + 11.96)];
                [bezier30Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 32.39, CGRectGetMinY(aDPaintButton) + 6.6) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 31.29, CGRectGetMinY(aDPaintButton) + 11.96) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 33.03, CGRectGetMinY(aDPaintButton) + 9.21)];
                [bezier30Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 28.39, CGRectGetMinY(aDPaintButton) + 1.27) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 31.75, CGRectGetMinY(aDPaintButton) + 3.99) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 30.71, CGRectGetMinY(aDPaintButton) + 2.83)];
                [bezier30Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 22.39, CGRectGetMinY(aDPaintButton) + 0.18) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 26.08, CGRectGetMinY(aDPaintButton) - 0.3) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 25.01, CGRectGetMinY(aDPaintButton) - 0.08)];
                [bezier30Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 17.89, CGRectGetMinY(aDPaintButton) + 3.35) controlPoint1: CGPointMake(CGRectGetMinX(aDPaintButton) + 19.78, CGRectGetMinY(aDPaintButton) + 0.44) controlPoint2: CGPointMake(CGRectGetMinX(aDPaintButton) + 17.89, CGRectGetMinY(aDPaintButton) + 3.35)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 15.23, CGRectGetMinY(aDPaintButton) + 7.35)];
                [bezier30Path addLineToPoint: CGPointMake(CGRectGetMinX(aDPaintButton) + 5.28, CGRectGetMinY(aDPaintButton) + 23.66)];
                [bezier30Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier30Path fill];
            }
        }
    }
}



@end
