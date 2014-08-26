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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    [self drawCanvas1WithFrame:self.bounds ctx:ctx iconColor:iconColor];
}

- (void)drawCanvas1WithFrame: (CGRect)frame ctx:(CGContextRef)ctx iconColor:(UIColor *)iconColor
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
    UIColor* color2 = [UIColor colorWithRed: 0.852 green: 0.844 blue: 0.844 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Group
    {
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 17)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 37)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 17)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 7)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 37)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 27)];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 37)];
        [bezier2Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [color2 setFill];
        [bezier2Path fill];
        CGContextRestoreGState(context);
        
        
        if (!self.isOpacityLocked) {
            return;
        }
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 7)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 7)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 17)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 17)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 27)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37, CGRectGetMinY(frame) + 17)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 17)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier3Path closePath];
        [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 37)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 37)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 27)];
        [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17, CGRectGetMinY(frame) + 37)];
        [bezier3Path closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
        [iconColor setFill];
        [bezier3Path fill];
        CGContextRestoreGState(context);
        
    }
}


-(void)setIsOpacityLocked:(BOOL)isOpacityLocked{
    _isOpacityLocked = isOpacityLocked;
    [self setNeedsDisplay];
}

@end
