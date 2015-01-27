//
//  LayerTransformButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-26.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerTransformButton.h"

@implementation ADLayerTransformButton

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
     UIColor* color = [UIColor colorWithRed: 0.559 green: 0.559 blue: 0.559 alpha: 1];
     UIColor* shadowColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.2];
     
     //// Shadow Declarations
     UIColor* highlight = [UIColor whiteColor];
     CGSize highlightOffset = CGSizeMake(0.1, 1.1);
     CGFloat highlightBlurRadius = 0;
     UIColor* shadow = shadowColor2;
     CGSize shadowOffset = CGSizeMake(0.1, 1.1);
     CGFloat shadowBlurRadius = 0;
     
     //// transformIcon Drawing
     UIBezierPath* transformIconPath = [UIBezierPath bezierPath];
     [transformIconPath moveToPoint: CGPointMake(28.58, 10.47)];
     [transformIconPath addLineToPoint: CGPointMake(24.11, 10.47)];
     [transformIconPath addLineToPoint: CGPointMake(24.11, 20.5)];
     [transformIconPath addLineToPoint: CGPointMake(33.89, 20.5)];
     [transformIconPath addLineToPoint: CGPointMake(33.79, 16.08)];
     [transformIconPath addLineToPoint: CGPointMake(40.54, 21.9)];
     [transformIconPath addLineToPoint: CGPointMake(34.09, 28.29)];
     [transformIconPath addLineToPoint: CGPointMake(33.98, 23.59)];
     [transformIconPath addLineToPoint: CGPointMake(24.11, 23.59)];
     [transformIconPath addLineToPoint: CGPointMake(24.11, 33.72)];
     [transformIconPath addLineToPoint: CGPointMake(28.44, 33.61)];
     [transformIconPath addLineToPoint: CGPointMake(22.74, 40.5)];
     [transformIconPath addLineToPoint: CGPointMake(16.49, 33.92)];
     [transformIconPath addLineToPoint: CGPointMake(21.1, 33.81)];
     [transformIconPath addLineToPoint: CGPointMake(21.1, 23.59)];
     [transformIconPath addLineToPoint: CGPointMake(11.13, 23.59)];
     [transformIconPath addLineToPoint: CGPointMake(11.13, 28.15)];
     [transformIconPath addLineToPoint: CGPointMake(4.54, 22.04)];
     [transformIconPath addLineToPoint: CGPointMake(11.13, 15.94)];
     [transformIconPath addLineToPoint: CGPointMake(11.13, 20.5)];
     [transformIconPath addLineToPoint: CGPointMake(21.1, 20.5)];
     [transformIconPath addLineToPoint: CGPointMake(21.1, 10.47)];
     [transformIconPath addLineToPoint: CGPointMake(16.63, 10.47)];
     [transformIconPath addLineToPoint: CGPointMake(22.6, 4.5)];
     [transformIconPath addLineToPoint: CGPointMake(28.58, 10.47)];
     [transformIconPath closePath];
     CGContextSaveGState(context);
     CGContextSetShadowWithColor(context, highlightOffset, highlightBlurRadius, highlight.CGColor);
     [color setFill];
     [transformIconPath fill];
     
     ////// transformIcon Inner Shadow
     CGRect transformIconBorderRect = CGRectInset([transformIconPath bounds], -shadowBlurRadius, -shadowBlurRadius);
     transformIconBorderRect = CGRectOffset(transformIconBorderRect, -shadowOffset.width, -shadowOffset.height);
     transformIconBorderRect = CGRectInset(CGRectUnion(transformIconBorderRect, [transformIconPath bounds]), -1, -1);
     
     UIBezierPath* transformIconNegativePath = [UIBezierPath bezierPathWithRect: transformIconBorderRect];
     [transformIconNegativePath appendPath: transformIconPath];
     transformIconNegativePath.usesEvenOddFillRule = YES;
     
     CGContextSaveGState(context);
     {
         CGFloat xOffset = shadowOffset.width + round(transformIconBorderRect.size.width);
         CGFloat yOffset = shadowOffset.height;
         CGContextSetShadowWithColor(context,
                                     CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                     shadowBlurRadius,
                                     shadow.CGColor);
         
         [transformIconPath addClip];
         CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(transformIconBorderRect.size.width), 0);
         [transformIconNegativePath applyTransform: transform];
         [[UIColor grayColor] setFill];
         [transformIconNegativePath fill];
     }
     CGContextRestoreGState(context);
     
     CGContextRestoreGState(context);
     
     
     

 }

@end
