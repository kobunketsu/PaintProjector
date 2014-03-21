//
//  FullScreenReverseButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "FullScreenReverseButton.h"

@implementation FullScreenReverseButton

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
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.92 green: 0.92 blue: 0.92 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.675 green: 0.675 blue: 0.675 alpha: 1];
    UIColor* iconShadowColorColor = [iconColor colorWithAlphaComponent: 0.87];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, -60, 110, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Polygon Drawing
    UIBezierPath* polygonPath = [UIBezierPath bezierPath];
    [polygonPath moveToPoint: CGPointMake(20, 20)];
    [polygonPath addLineToPoint: CGPointMake(7.01, 9.5)];
    [polygonPath addLineToPoint: CGPointMake(32.99, 9.5)];
    [polygonPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    [iconColor setFill];
    [polygonPath fill];
    
    ////// Polygon Inner Shadow
    CGRect polygonBorderRect = CGRectInset([polygonPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
    polygonBorderRect = CGRectOffset(polygonBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
    polygonBorderRect = CGRectInset(CGRectUnion(polygonBorderRect, [polygonPath bounds]), -1, -1);
    
    UIBezierPath* polygonNegativePath = [UIBezierPath bezierPathWithRect: polygonBorderRect];
    [polygonNegativePath appendPath: polygonPath];
    polygonNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = iconShadowOffset.width + round(polygonBorderRect.size.width);
        CGFloat yOffset = iconShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    iconShadowBlurRadius,
                                    iconShadow.CGColor);
        
        [polygonPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(polygonBorderRect.size.width), 0);
        [polygonNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [polygonNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    

}


@end
