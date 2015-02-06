//
//  LayerOpacityLockButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADLayerOpacityLockButton.h"

@implementation ADLayerOpacityLockButton

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
    [self drawADSharedSubButtonWithIsSelected:self.isSelected || self.isHighlighted || self.isOpacityLocked];
}

- (void)drawADSharedSubButtonWithIsSelected: (BOOL)isSelected
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Variable Declarations
    BOOL isNormal = !isSelected;
    
    //// ADLayerOpacityLockButton
    {
        if (isNormal)
        {
            //// Normal 6
            {
                //// Bezier 15 Drawing
                UIBezierPath* bezier15Path = UIBezierPath.bezierPath;
                [bezier15Path moveToPoint: CGPointMake(7, 17)];
                [bezier15Path addLineToPoint: CGPointMake(17, 17)];
                [bezier15Path addLineToPoint: CGPointMake(17, 7)];
                [bezier15Path addLineToPoint: CGPointMake(7, 7)];
                [bezier15Path addLineToPoint: CGPointMake(7, 17)];
                [bezier15Path closePath];
                [bezier15Path moveToPoint: CGPointMake(17, 27)];
                [bezier15Path addLineToPoint: CGPointMake(27, 27)];
                [bezier15Path addLineToPoint: CGPointMake(27, 17)];
                [bezier15Path addLineToPoint: CGPointMake(17, 17)];
                [bezier15Path addLineToPoint: CGPointMake(17, 27)];
                [bezier15Path closePath];
                [bezier15Path moveToPoint: CGPointMake(27, 37)];
                [bezier15Path addLineToPoint: CGPointMake(37, 37)];
                [bezier15Path addLineToPoint: CGPointMake(37, 27)];
                [bezier15Path addLineToPoint: CGPointMake(27, 27)];
                [bezier15Path addLineToPoint: CGPointMake(27, 37)];
                [bezier15Path closePath];
                [bezier15Path moveToPoint: CGPointMake(27, 17)];
                [bezier15Path addLineToPoint: CGPointMake(37, 17)];
                [bezier15Path addLineToPoint: CGPointMake(37, 7)];
                [bezier15Path addLineToPoint: CGPointMake(27, 7)];
                [bezier15Path addLineToPoint: CGPointMake(27, 17)];
                [bezier15Path closePath];
                [bezier15Path moveToPoint: CGPointMake(7, 37)];
                [bezier15Path addLineToPoint: CGPointMake(17, 37)];
                [bezier15Path addLineToPoint: CGPointMake(17, 27)];
                [bezier15Path addLineToPoint: CGPointMake(7, 27)];
                [bezier15Path addLineToPoint: CGPointMake(7, 37)];
                [bezier15Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
                [ADSharedUIStyleKit.cNormal setFill];
                [bezier15Path fill];
                CGContextRestoreGState(context);
                
            }
        }
        
        
        if (isSelected)
        {
            //// Selected 6
            {
                //// Bezier 12 Drawing
                UIBezierPath* bezier12Path = UIBezierPath.bezierPath;
                [bezier12Path moveToPoint: CGPointMake(7, 17)];
                [bezier12Path addLineToPoint: CGPointMake(17, 17)];
                [bezier12Path addLineToPoint: CGPointMake(17, 7)];
                [bezier12Path addLineToPoint: CGPointMake(7, 7)];
                [bezier12Path addLineToPoint: CGPointMake(7, 17)];
                [bezier12Path closePath];
                [bezier12Path moveToPoint: CGPointMake(17, 27)];
                [bezier12Path addLineToPoint: CGPointMake(27, 27)];
                [bezier12Path addLineToPoint: CGPointMake(27, 17)];
                [bezier12Path addLineToPoint: CGPointMake(17, 17)];
                [bezier12Path addLineToPoint: CGPointMake(17, 27)];
                [bezier12Path closePath];
                [bezier12Path moveToPoint: CGPointMake(27, 37)];
                [bezier12Path addLineToPoint: CGPointMake(37, 37)];
                [bezier12Path addLineToPoint: CGPointMake(37, 27)];
                [bezier12Path addLineToPoint: CGPointMake(27, 27)];
                [bezier12Path addLineToPoint: CGPointMake(27, 37)];
                [bezier12Path closePath];
                [bezier12Path moveToPoint: CGPointMake(27, 17)];
                [bezier12Path addLineToPoint: CGPointMake(37, 17)];
                [bezier12Path addLineToPoint: CGPointMake(37, 7)];
                [bezier12Path addLineToPoint: CGPointMake(27, 7)];
                [bezier12Path addLineToPoint: CGPointMake(27, 17)];
                [bezier12Path closePath];
                [bezier12Path moveToPoint: CGPointMake(7, 37)];
                [bezier12Path addLineToPoint: CGPointMake(17, 37)];
                [bezier12Path addLineToPoint: CGPointMake(17, 27)];
                [bezier12Path addLineToPoint: CGPointMake(7, 27)];
                [bezier12Path addLineToPoint: CGPointMake(7, 37)];
                [bezier12Path closePath];
                CGContextSaveGState(context);
                CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
                [ADSharedUIStyleKit.cSelected setFill];
                [bezier12Path fill];
                CGContextRestoreGState(context);
                
            }
        }
    }
}


-(void)setIsOpacityLocked:(BOOL)isOpacityLocked{
    _isOpacityLocked = isOpacityLocked;
    [self setNeedsDisplay];
}

@end
