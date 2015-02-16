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
    CGRect aDConnectDeviceButton = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 28) * 0.50000 + 0.5), CGRectGetMinY(frame), 28, 28);
    
    
    //// ADConnectDeviceButton
    {
        if (isNormal)
        {
            //// Normal 4
            {
                //// Bezier 8 Drawing
                UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 21)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 14.04)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 17.26) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 15.1) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 17.26)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 16.68)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.43, CGRectGetMinY(aDConnectDeviceButton) + 13.43) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 16.68) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.29, CGRectGetMinY(aDConnectDeviceButton) + 13.56)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 10.18) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.32, CGRectGetMinY(aDConnectDeviceButton) + 12.38) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 10.18)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 9.6)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 12.82) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 9.6) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 11.76)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 12.77) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 6)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 10.01)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.71, CGRectGetMinY(aDConnectDeviceButton) + 13.49)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 16.99) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.64, CGRectGetMinY(aDConnectDeviceButton) + 14.29) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 16.99)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.02, CGRectGetMinY(aDConnectDeviceButton) + 21) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 16.99) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 21)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 21)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 16.99)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 14.6)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 19.37) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 14.6) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 18.14)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 16.99) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.59, CGRectGetMinY(aDConnectDeviceButton) + 18.71) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 16.99)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 10.01)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 7.63) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 9.45) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 7.63)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 12.4)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 10.01) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 12.4) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 10.58)];
                [bezier8Path closePath];
                [bezier8Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 22.62) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18.74, CGRectGetMinY(aDConnectDeviceButton) + 27.97) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 25.57)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 22.62) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 18.69)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 22.81, CGRectGetMinY(aDConnectDeviceButton) + 17)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 28, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton), CGRectGetMinY(aDConnectDeviceButton))];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) - 0, CGRectGetMinY(aDConnectDeviceButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 17)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 17)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 22.62) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 18.69) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 22.62)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.63, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 25.51) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 8.64, CGRectGetMinY(aDConnectDeviceButton) + 27.88)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.87, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.71, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.79, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.74, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier8Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.56, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.06, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.45, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier8Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton) + 28)];
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
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 21)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 14.04)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 17.26) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 15.1) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 17.26)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 16.68)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.43, CGRectGetMinY(aDConnectDeviceButton) + 13.43) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 16.68) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 12.29, CGRectGetMinY(aDConnectDeviceButton) + 13.56)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 10.18) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.32, CGRectGetMinY(aDConnectDeviceButton) + 12.38) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9, CGRectGetMinY(aDConnectDeviceButton) + 10.18)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 9.6)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 12.82) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 9.61, CGRectGetMinY(aDConnectDeviceButton) + 9.6) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.89, CGRectGetMinY(aDConnectDeviceButton) + 11.76)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 6) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 12.77) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 6)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 10.01)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.71, CGRectGetMinY(aDConnectDeviceButton) + 13.49)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 16.99) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.64, CGRectGetMinY(aDConnectDeviceButton) + 14.29) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 16.99)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.02, CGRectGetMinY(aDConnectDeviceButton) + 21) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18, CGRectGetMinY(aDConnectDeviceButton) + 16.99) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 21)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.01, CGRectGetMinY(aDConnectDeviceButton) + 21)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 16.99)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 14.6)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 19.37) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 14.6) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 18.14)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 16.99) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 14.59, CGRectGetMinY(aDConnectDeviceButton) + 18.71) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 16.99)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 10.01)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 7.63) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 9.45) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 7.63)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 12.4)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.73, CGRectGetMinY(aDConnectDeviceButton) + 10.01) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.77, CGRectGetMinY(aDConnectDeviceButton) + 12.4) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 16.03, CGRectGetMinY(aDConnectDeviceButton) + 10.58)];
                [bezier5Path closePath];
                [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 22.62) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 18.74, CGRectGetMinY(aDConnectDeviceButton) + 27.97) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 25.57)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 22.62) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 21.23, CGRectGetMinY(aDConnectDeviceButton) + 18.69)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 22.81, CGRectGetMinY(aDConnectDeviceButton) + 17)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 28, CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton), CGRectGetMinY(aDConnectDeviceButton))];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 17) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) - 0, CGRectGetMinY(aDConnectDeviceButton)) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 4.15, CGRectGetMinY(aDConnectDeviceButton) + 17)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 17)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 22.62) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 18.69) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 22.62)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.63, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 6.25, CGRectGetMinY(aDConnectDeviceButton) + 25.51) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 8.64, CGRectGetMinY(aDConnectDeviceButton) + 27.88)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.87, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.71, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 11.79, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 13.74, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.56, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint1: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.06, CGRectGetMinY(aDConnectDeviceButton) + 28) controlPoint2: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.45, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(aDConnectDeviceButton) + 15.52, CGRectGetMinY(aDConnectDeviceButton) + 28)];
                [bezier5Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier5Path fill];
            }
        }
    }
}




@end
