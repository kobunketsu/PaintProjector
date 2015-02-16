//
//  ADConnectDeviceButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/15/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADConnectDeviceButton.h"

@implementation ADConnectDeviceButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self drawADSharedRoundButtonWithFrame:rect isSelected:self.isSelected || self.isHighlighted];
}

- (void)drawADSharedRoundButtonWithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    
    //// Subframes
    CGRect aDConnectDeviceButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 28) * 0.50000 + 0.5), CGRectGetMinY(frame) + 6, 28, 28);
    
    
    //// ADConnectDeviceButton
    {
        if (isNormal)
        {
            //// Normal 4
            {
                //// Bezier 8 Drawing
                UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 17.96)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 14.74) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 16.9) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 14.74)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 15.32)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.43, CGRectGetMinY(aDConnectDeviceButton) + 18.57) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 15.32) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.29, CGRectGetMinY(aDConnectDeviceButton) + 18.44)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 21.82) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.32, CGRectGetMinY(aDConnectDeviceButton) + 19.62) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 21.82)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 22.4)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 19.18) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 22.4) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 20.24)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 26) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 19.23) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 26)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 21.99)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.71, CGRectGetMinY(aDConnectDeviceButton) + 18.51)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 15.01) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.64, CGRectGetMinY(aDConnectDeviceButton) + 17.71) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 15.01)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.02, CGRectGetMinY(aDConnectDeviceButton) + 11) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 15.01) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 15.01)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 17.4)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 12.63) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 17.4) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 13.86)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 15.01) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.59, CGRectGetMinY(aDConnectDeviceButton) + 13.29) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 15.01)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 21.99)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 24.37) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 22.55) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 24.37)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 19.6)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 21.99) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 19.6) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 21.42)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 5.38) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18.74, CGRectGetMinY(aDConnectDeviceButton) + 0.03) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 2.43)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 11) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 5.38) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 9.31)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 22.81, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 28, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton), CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 11) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) - 0, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 5.38) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 9.31) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 5.38)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.63, CGRectGetMinY(aDConnectDeviceButton) + 0) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 2.49) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 8.64, CGRectGetMinY(aDConnectDeviceButton) + 0.12)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.87, CGRectGetMinY(aDConnectDeviceButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.71, CGRectGetMinY(aDConnectDeviceButton) + 0) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.79, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.74, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.56, CGRectGetMinY(aDConnectDeviceButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.06, CGRectGetMinY(aDConnectDeviceButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.45, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier8Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 4
            {
                //// Bezier 5 Drawing
                UIBezierPath* bezier5Path = UIBezierPath.bezierPath;
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 17.96)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 14.74) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 16.9) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 14.74)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 15.32)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.43, CGRectGetMinY(aDConnectDeviceButton) + 18.57) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 15.32) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.29, CGRectGetMinY(aDConnectDeviceButton) + 18.44)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 21.82) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.32, CGRectGetMinY(aDConnectDeviceButton) + 19.62) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 21.82)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 22.4)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 19.18) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 22.4) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 20.24)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 26) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 19.23) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 26)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 21.99)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.71, CGRectGetMinY(aDConnectDeviceButton) + 18.51)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 15.01) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.64, CGRectGetMinY(aDConnectDeviceButton) + 17.71) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 15.01)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.02, CGRectGetMinY(aDConnectDeviceButton) + 11) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 15.01) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 15.01)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 17.4)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 12.63) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 17.4) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 13.86)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 15.01) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.59, CGRectGetMinY(aDConnectDeviceButton) + 13.29) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 15.01)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 21.99)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 24.37) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 22.55) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 24.37)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 19.6)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 21.99) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 19.6) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 21.42)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 5.38) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18.74, CGRectGetMinY(aDConnectDeviceButton) + 0.03) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 2.43)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 11) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 5.38) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 9.31)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 22.81, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 28, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton), CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 11) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) - 0, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 11)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 5.38) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 9.31) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 5.38)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.63, CGRectGetMinY(aDConnectDeviceButton) + 0) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 2.49) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 8.64, CGRectGetMinY(aDConnectDeviceButton) + 0.12)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.87, CGRectGetMinY(aDConnectDeviceButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.71, CGRectGetMinY(aDConnectDeviceButton) + 0) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.79, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.74, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.56, CGRectGetMinY(aDConnectDeviceButton)) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.06, CGRectGetMinY(aDConnectDeviceButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.45, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier5Path fill];
            }
        }
    }
}



@end
