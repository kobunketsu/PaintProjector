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
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.9 green: 0.9 blue: 0.9 alpha: 1];
    UIColor* iconColor = [UIColor colorWithRed: 0.506 green: 0.506 blue: 0.506 alpha: 1];
    UIColor* iconShadowColorColor = [iconColor colorWithAlphaComponent: 0.87];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 50, 33);
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 30) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 14) * 0.57895 + 0.5), 30, 14);
    
    
    //// Group
    {
        //// Polygon Drawing
        UIBezierPath* polygonPath = [UIBezierPath bezierPath];
        [polygonPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.93301 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75000 * CGRectGetHeight(group))];
        [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.06699 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75000 * CGRectGetHeight(group))];
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
    
    
}


@end
