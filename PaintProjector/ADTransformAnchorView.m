//
//  TransformAnchorView.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformAnchorView.h"

@implementation ADTransformAnchorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
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
    UIColor* strokeColor = [UIColor colorWithRed: 0.88 green: 0.843 blue: 0.843 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = strokeColor;
    CGSize shadowOffset = CGSizeMake(0.1, -3.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Oval Drawing
    CGFloat size = self.bounds.size.width - 4;
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2, 2, size, size)];
    [[UIColor lightGrayColor] setFill];
    [ovalPath fill];
    
    ////// Oval Inner Shadow
    CGRect ovalBorderRect = CGRectInset([ovalPath bounds], -shadowBlurRadius, -shadowBlurRadius);
    ovalBorderRect = CGRectOffset(ovalBorderRect, -shadowOffset.width, -shadowOffset.height);
    ovalBorderRect = CGRectInset(CGRectUnion(ovalBorderRect, [ovalPath bounds]), -1, -1);
    
    UIBezierPath* ovalNegativePath = [UIBezierPath bezierPathWithRect: ovalBorderRect];
    [ovalNegativePath appendPath: ovalPath];
    ovalNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(ovalBorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow.CGColor);
        
        [ovalPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(ovalBorderRect.size.width), 0);
        [ovalNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [ovalNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    [[UIColor whiteColor] setStroke];
    ovalPath.lineWidth = 0.5;
    [ovalPath stroke];
    
    
    
}


@end
