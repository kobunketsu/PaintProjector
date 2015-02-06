//
//  FullScreenButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADFullScreenButton.h"

@implementation ADFullScreenButton

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

//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
- (void)drawRect:(CGRect)rect{
    [self drawADSharedRoundButtonWithFrame:rect isSelected:self.isSelected || self.isHighlighted];
}

- (void)drawADSharedRoundButtonWithFrame: (CGRect)frame isSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// FullScreenButton
    {
        if (isNormal)
        {
            //// Normal
            {
                //// Bezier Drawing
                UIBezierPath* bezierPath = UIBezierPath.bezierPath;
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 18)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 18)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 21)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 21)];
                [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 18)];
                [bezierPath closePath];
                [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.14, CGRectGetMinY(frame) + 11.12)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezierPath closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezierPath fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected
            {
                //// Bezier 3 Drawing
                UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 18)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 18)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 21)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 21)];
                [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28, CGRectGetMinY(frame) + 18)];
                [bezier3Path closePath];
                [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 33) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 26.96) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 33)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 13.04, CGRectGetMinY(frame) + 33) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 26.96)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 12.46, CGRectGetMinY(frame) + 8.66) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 15.06) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.14, CGRectGetMinY(frame) + 11.12)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 20.5, CGRectGetMinY(frame) + 6) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 14.7, CGRectGetMinY(frame) + 6.99) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.49, CGRectGetMinY(frame) + 6)];
                [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.96, CGRectGetMinY(frame) + 6) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 34, CGRectGetMinY(frame) + 12.04)];
                [bezier3Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier3Path fill];
            }
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}
 */


@end
