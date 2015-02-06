//
//  LayerVisibleButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-20.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerVisibleButton.h"

@implementation ADLayerVisibleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self drawADSharedSubButtonWithIsSelected:self.isSelected || self.isHighlighted || !self.isVisible];
}

- (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// ADLayerVisibleButton
    {
        if (isNormal)
        {
            //// Normal 7
            {
                //// Bezier 18 Drawing
                UIBezierPath* bezier18Path = UIBezierPath.bezierPath;
                [bezier18Path moveToPoint: CGPointMake(23.27, 16.91)];
                [bezier18Path addCurveToPoint: CGPointMake(21.04, 17.38) controlPoint1: CGPointMake(22.47, 16.91) controlPoint2: CGPointMake(21.72, 17.08)];
                [bezier18Path addCurveToPoint: CGPointMake(17.77, 22.41) controlPoint1: CGPointMake(19.11, 18.24) controlPoint2: CGPointMake(17.77, 20.17)];
                [bezier18Path addCurveToPoint: CGPointMake(23.27, 27.91) controlPoint1: CGPointMake(17.77, 25.45) controlPoint2: CGPointMake(20.23, 27.91)];
                [bezier18Path addCurveToPoint: CGPointMake(28.77, 22.41) controlPoint1: CGPointMake(26.3, 27.91) controlPoint2: CGPointMake(28.77, 25.45)];
                [bezier18Path addCurveToPoint: CGPointMake(23.27, 16.91) controlPoint1: CGPointMake(28.77, 19.37) controlPoint2: CGPointMake(26.3, 16.91)];
                [bezier18Path closePath];
                [bezier18Path moveToPoint: CGPointMake(25.02, 12.18)];
                [bezier18Path addCurveToPoint: CGPointMake(31.01, 13.66) controlPoint1: CGPointMake(26.77, 12.42) controlPoint2: CGPointMake(28.66, 12.93)];
                [bezier18Path addCurveToPoint: CGPointMake(41.54, 22.05) controlPoint1: CGPointMake(37.76, 15.76) controlPoint2: CGPointMake(41.54, 22.05)];
                [bezier18Path addCurveToPoint: CGPointMake(31.01, 31.16) controlPoint1: CGPointMake(41.54, 22.05) controlPoint2: CGPointMake(37.76, 28.89)];
                [bezier18Path addCurveToPoint: CGPointMake(14.52, 31.16) controlPoint1: CGPointMake(24.26, 33.44) controlPoint2: CGPointMake(21.27, 33.23)];
                [bezier18Path addCurveToPoint: CGPointMake(4, 22.92) controlPoint1: CGPointMake(7.77, 29.1) controlPoint2: CGPointMake(4, 22.92)];
                [bezier18Path addCurveToPoint: CGPointMake(14.52, 13.66) controlPoint1: CGPointMake(4, 22.92) controlPoint2: CGPointMake(7.77, 15.97)];
                [bezier18Path addCurveToPoint: CGPointMake(25.02, 12.18) controlPoint1: CGPointMake(18.92, 12.15) controlPoint2: CGPointMake(21.73, 11.71)];
                [bezier18Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier18Path fill];
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 7
            {
                //// Bezier 13 Drawing
                UIBezierPath* bezier13Path = UIBezierPath.bezierPath;
                [bezier13Path moveToPoint: CGPointMake(23.27, 16.91)];
                [bezier13Path addCurveToPoint: CGPointMake(21.04, 17.38) controlPoint1: CGPointMake(22.47, 16.91) controlPoint2: CGPointMake(21.72, 17.08)];
                [bezier13Path addCurveToPoint: CGPointMake(17.77, 22.41) controlPoint1: CGPointMake(19.11, 18.24) controlPoint2: CGPointMake(17.77, 20.17)];
                [bezier13Path addCurveToPoint: CGPointMake(23.27, 27.91) controlPoint1: CGPointMake(17.77, 25.45) controlPoint2: CGPointMake(20.23, 27.91)];
                [bezier13Path addCurveToPoint: CGPointMake(28.77, 22.41) controlPoint1: CGPointMake(26.3, 27.91) controlPoint2: CGPointMake(28.77, 25.45)];
                [bezier13Path addCurveToPoint: CGPointMake(23.27, 16.91) controlPoint1: CGPointMake(28.77, 19.37) controlPoint2: CGPointMake(26.3, 16.91)];
                [bezier13Path closePath];
                [bezier13Path moveToPoint: CGPointMake(25.02, 12.18)];
                [bezier13Path addCurveToPoint: CGPointMake(31.01, 13.66) controlPoint1: CGPointMake(26.77, 12.42) controlPoint2: CGPointMake(28.66, 12.93)];
                [bezier13Path addCurveToPoint: CGPointMake(41.54, 22.05) controlPoint1: CGPointMake(37.76, 15.76) controlPoint2: CGPointMake(41.54, 22.05)];
                [bezier13Path addCurveToPoint: CGPointMake(31.01, 31.16) controlPoint1: CGPointMake(41.54, 22.05) controlPoint2: CGPointMake(37.76, 28.89)];
                [bezier13Path addCurveToPoint: CGPointMake(14.52, 31.16) controlPoint1: CGPointMake(24.26, 33.44) controlPoint2: CGPointMake(21.27, 33.23)];
                [bezier13Path addCurveToPoint: CGPointMake(4, 22.92) controlPoint1: CGPointMake(7.77, 29.1) controlPoint2: CGPointMake(4, 22.92)];
                [bezier13Path addCurveToPoint: CGPointMake(14.52, 13.66) controlPoint1: CGPointMake(4, 22.92) controlPoint2: CGPointMake(7.77, 15.97)];
                [bezier13Path addCurveToPoint: CGPointMake(25.02, 12.18) controlPoint1: CGPointMake(18.92, 12.15) controlPoint2: CGPointMake(21.73, 11.71)];
                [bezier13Path closePath];
                [ADSharedUIStyleKit.cHidden setFill];
                [bezier13Path fill];
            }
        }
    }
}



-(void)setIsVisible:(BOOL)isVisible{
    _isVisible = isVisible;
    [self setNeedsDisplay];
}

@end
