//
//  UndoButton.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-6.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "UndoButton.h"

@implementation UndoButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)pastPaintCode:(CGContextRef)ctx iconColor:(UIColor *)iconColor{
    //// General Declarations
    CGContextRef context = ctx;
    
    //// Color Declarations

    UIColor* iconDisabledColor = [UIColor colorWithRed: 0.85 green: 0.85 blue: 0.85 alpha: 1];
    UIColor* iconHighlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    UIColor* iconColor = [UIColor colorWithRed: 0.75 green: 0.75 blue: 0.75 alpha: 1];
    CGFloat iconColorHSBA[4];
    [iconColor getHue: &iconColorHSBA[0] saturation: &iconColorHSBA[1] brightness: &iconColorHSBA[2] alpha: &iconColorHSBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithHue: iconColorHSBA[0] saturation: iconColorHSBA[1] brightness: 0.325 alpha: iconColorHSBA[3]];
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* iconShadow = iconShadowColorColor;
    CGSize iconShadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconShadowBlurRadius = 0;
    
    //// Frames
    CGRect frame = self.bounds;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 50) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 44) * 0.41667 + 0.5), 50, 44);
    
    
    //// Group
    {
        //// Main Drawing
        UIBezierPath* mainPath = [UIBezierPath bezierPath];
        [mainPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.35720 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.06844 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.19623 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.25743 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.25743 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.88952 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36491 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.74851 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.25743 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.82849 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29326 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.88952 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.88386 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 1.01157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50821 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 1.01157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.74055 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.66852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.99133 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.82849 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.95551 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.74851 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.99133 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.66852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85020 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.80452 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.78406 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.71774 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.85020 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.76697 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82815 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.80452 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.46470 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.87963 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.69587 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.87963 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.55289 * CGRectGetHeight(group))];
        [mainPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.66852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39856 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.76697 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42061 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.71774 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39856 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.19623 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39856 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.35720 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.58756 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.30059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.65403 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.01821 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33351 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.30059 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00197 * CGRectGetHeight(group))];
        [mainPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.35720 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.06844 * CGRectGetHeight(group))];
        [mainPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
        if (self.enabled) {
            [iconColor setFill];
        }
        else{
            [iconDisabledColor setFill];
        }
        [mainPath fill];
        
        ////// Main Inner Shadow
        CGRect mainBorderRect = CGRectInset([mainPath bounds], -iconShadowBlurRadius, -iconShadowBlurRadius);
        mainBorderRect = CGRectOffset(mainBorderRect, -iconShadowOffset.width, -iconShadowOffset.height);
        mainBorderRect = CGRectInset(CGRectUnion(mainBorderRect, [mainPath bounds]), -1, -1);
        
        UIBezierPath* mainNegativePath = [UIBezierPath bezierPathWithRect: mainBorderRect];
        [mainNegativePath appendPath: mainPath];
        mainNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = iconShadowOffset.width + round(mainBorderRect.size.width);
            CGFloat yOffset = iconShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        iconShadowBlurRadius,
                                        iconShadow.CGColor);
            
            [mainPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(mainBorderRect.size.width), 0);
            [mainNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [mainNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    

}

@end
