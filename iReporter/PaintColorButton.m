//
//  PaintColorButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-2.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "PaintColorButton.h"

@implementation PaintColorButton

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
        _color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    }
    return self;
}


- (void)setColor:(UIColor *)newValue{
    _color = newValue;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //code generated from paintCode
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = _color;
    CGFloat* colors = CGColorGetComponents(_color.CGColor);
    UIColor* gradientColor2 = [UIColor colorWithRed: colors[0] * 0.85 green: colors[1] * 0.85 blue: colors[2] * 0.85 alpha: 1];
    UIColor* gradientColor3= [UIColor colorWithRed: colors[0] * 0.9 green: colors[1] * 0.9 blue: colors[2] * 0.9 alpha: 1];
    
    UIColor* shadow3Color = [UIColor colorWithRed: 0.389 green: 0.389 blue: 0.389 alpha: 1];
    UIColor* shadow4Color = [UIColor colorWithRed: 0.922 green: 0.922 blue: 0.922 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)gradientColor2.CGColor,
                               (id)gradientColor3.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.51, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow3 = shadow3Color;
    CGSize shadow3Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow3BlurRadius = 4;
    UIColor* shadow4 = shadow4Color;
    CGSize shadow4Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow4BlurRadius = 4;
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(3, 3, 66, 66)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, shadow4.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [oval2Path addClip];
    CGContextDrawLinearGradient(context, gradient, CGPointMake(36, 3), CGPointMake(36, 69), 0);
    CGContextEndTransparencyLayer(context);
    
    ////// Oval 2 Inner Shadow
    CGRect oval2BorderRect = CGRectInset([oval2Path bounds], -shadow3BlurRadius, -shadow3BlurRadius);
    oval2BorderRect = CGRectOffset(oval2BorderRect, -shadow3Offset.width, -shadow3Offset.height);
    oval2BorderRect = CGRectInset(CGRectUnion(oval2BorderRect, [oval2Path bounds]), -1, -1);
    
    UIBezierPath* oval2NegativePath = [UIBezierPath bezierPathWithRect: oval2BorderRect];
    [oval2NegativePath appendPath: oval2Path];
    oval2NegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadow3Offset.width + round(oval2BorderRect.size.width);
        CGFloat yOffset = shadow3Offset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadow3BlurRadius,
                                    shadow3.CGColor);
        
        [oval2Path addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(oval2BorderRect.size.width), 0);
        [oval2NegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [oval2NegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
 
    
}


@end
