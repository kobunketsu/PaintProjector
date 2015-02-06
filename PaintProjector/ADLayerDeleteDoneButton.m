//
//  LayerDeleteDoneButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-7-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerDeleteDoneButton.h"

@implementation ADLayerDeleteDoneButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// ADLayerDeleteDoneButton
    {
        if (isNormal)
        {
            //// Normal 4
            {
                //// Bezier 11 Drawing
                CGContextSaveGState(context);
                CGContextTranslateCTM(context, 23.21, 21.79);
                CGContextRotateCTM(context, -45 * M_PI / 180);
                
                UIBezierPath* bezier11Path = UIBezierPath.bezierPath;
                [bezier11Path moveToPoint: CGPointMake(2.17, -2.17)];
                [bezier11Path addLineToPoint: CGPointMake(15, -2.17)];
                [bezier11Path addLineToPoint: CGPointMake(15, 2.17)];
                [bezier11Path addLineToPoint: CGPointMake(2.17, 2.17)];
                [bezier11Path addLineToPoint: CGPointMake(2.17, 15)];
                [bezier11Path addLineToPoint: CGPointMake(-2.17, 15)];
                [bezier11Path addLineToPoint: CGPointMake(-2.17, 2.17)];
                [bezier11Path addLineToPoint: CGPointMake(-15, 2.17)];
                [bezier11Path addLineToPoint: CGPointMake(-15, -2.17)];
                [bezier11Path addLineToPoint: CGPointMake(-2.17, -2.17)];
                [bezier11Path addLineToPoint: CGPointMake(-2.17, -15)];
                [bezier11Path addLineToPoint: CGPointMake(2.17, -15)];
                [bezier11Path addLineToPoint: CGPointMake(2.17, -2.17)];
                [bezier11Path closePath];
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier11Path fill];
                
                CGContextRestoreGState(context);
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 4
            {
                //// Bezier 8 Drawing
                CGContextSaveGState(context);
                CGContextTranslateCTM(context, 23.21, 21.79);
                CGContextRotateCTM(context, -45 * M_PI / 180);
                
                UIBezierPath* bezier8Path = UIBezierPath.bezierPath;
                [bezier8Path moveToPoint: CGPointMake(2.17, -2.17)];
                [bezier8Path addLineToPoint: CGPointMake(15, -2.17)];
                [bezier8Path addLineToPoint: CGPointMake(15, 2.17)];
                [bezier8Path addLineToPoint: CGPointMake(2.17, 2.17)];
                [bezier8Path addLineToPoint: CGPointMake(2.17, 15)];
                [bezier8Path addLineToPoint: CGPointMake(-2.17, 15)];
                [bezier8Path addLineToPoint: CGPointMake(-2.17, 2.17)];
                [bezier8Path addLineToPoint: CGPointMake(-15, 2.17)];
                [bezier8Path addLineToPoint: CGPointMake(-15, -2.17)];
                [bezier8Path addLineToPoint: CGPointMake(-2.17, -2.17)];
                [bezier8Path addLineToPoint: CGPointMake(-2.17, -15)];
                [bezier8Path addLineToPoint: CGPointMake(2.17, -15)];
                [bezier8Path addLineToPoint: CGPointMake(2.17, -2.17)];
                [bezier8Path closePath];
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier8Path fill];
                
                CGContextRestoreGState(context);
            }
        }
    }
}


@end
