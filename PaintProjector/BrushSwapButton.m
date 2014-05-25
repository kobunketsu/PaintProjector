//
//  BrushSwapButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "BrushSwapButton.h"

@implementation BrushSwapButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconColor = [UIColor colorWithRed: 0.991 green: 0.744 blue: 0.281 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.5) green: (iconColorRGBA[1] * 0.5) blue: (iconColorRGBA[2] * 0.5) alpha: (iconColorRGBA[3] * 0.5 + 0.5)];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 0.863 blue: 0.526 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.911 green: 0.713 blue: 0.225 alpha: 1];
    UIColor* shadow4Color = [UIColor colorWithRed: 0.951 green: 0.951 blue: 0.951 alpha: 1];
    UIColor* shadow3Color = [UIColor colorWithRed: 0.347 green: 0.347 blue: 0.347 alpha: 0.542];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor2.CGColor,
                               (id)[UIColor colorWithRed: 0.955 green: 0.788 blue: 0.375 alpha: 1].CGColor,
                               (id)gradientColor.CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.27, 0.54, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow4 = shadow4Color;
    CGSize shadow4Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow4BlurRadius = 1;
    UIColor* shadow3 = shadow3Color;
    CGSize shadow3Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow3BlurRadius = 1;
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 50, 33);
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 21) * 0.51724 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 21) * 0.50000 + 0.5), 21, 21);
    
    
    //// Group
    {
        //// Oval 2 Drawing
        CGRect oval2Rect = CGRectMake(CGRectGetMinX(group), CGRectGetMinY(group) + CGRectGetHeight(group) - 21, 21, 21);
        UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: oval2Rect];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, shadow4.CGColor);
        CGContextBeginTransparencyLayer(context, NULL);
        [oval2Path addClip];
        CGContextDrawLinearGradient(context, gradient,
                                    CGPointMake(CGRectGetMidX(oval2Rect), CGRectGetMinY(oval2Rect)),
                                    CGPointMake(CGRectGetMidX(oval2Rect), CGRectGetMaxY(oval2Rect)),
                                    0);
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
        
        
        
        //// Polygon Drawing
        UIBezierPath* polygonPath = [UIBezierPath bezierPath];
        [polygonPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.14286 * CGRectGetHeight(group))];
        [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.64434 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42857 * CGRectGetHeight(group))];
        [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.35566 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42857 * CGRectGetHeight(group))];
        [polygonPath closePath];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, shadow4.CGColor);
        [iconShadowColorColor setFill];
        [polygonPath fill];
        
        ////// Polygon Inner Shadow
        CGRect polygonBorderRect = CGRectInset([polygonPath bounds], -shadow3BlurRadius, -shadow3BlurRadius);
        polygonBorderRect = CGRectOffset(polygonBorderRect, -shadow3Offset.width, -shadow3Offset.height);
        polygonBorderRect = CGRectInset(CGRectUnion(polygonBorderRect, [polygonPath bounds]), -1, -1);
        
        UIBezierPath* polygonNegativePath = [UIBezierPath bezierPathWithRect: polygonBorderRect];
        [polygonNegativePath appendPath: polygonPath];
        polygonNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadow3Offset.width + round(polygonBorderRect.size.width);
            CGFloat yOffset = shadow3Offset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadow3BlurRadius,
                                        shadow3.CGColor);
            
            [polygonPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(polygonBorderRect.size.width), 0);
            [polygonNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [polygonNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + 7, CGRectGetMinY(group) + CGRectGetHeight(group) - 12, 7, 9)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, shadow4.CGColor);
        [iconShadowColorColor setFill];
        [rectanglePath fill];
        
        ////// Rectangle Inner Shadow
        CGRect rectangleBorderRect = CGRectInset([rectanglePath bounds], -shadow3BlurRadius, -shadow3BlurRadius);
        rectangleBorderRect = CGRectOffset(rectangleBorderRect, -shadow3Offset.width, -shadow3Offset.height);
        rectangleBorderRect = CGRectInset(CGRectUnion(rectangleBorderRect, [rectanglePath bounds]), -1, -1);
        
        UIBezierPath* rectangleNegativePath = [UIBezierPath bezierPathWithRect: rectangleBorderRect];
        [rectangleNegativePath appendPath: rectanglePath];
        rectangleNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadow3Offset.width + round(rectangleBorderRect.size.width);
            CGFloat yOffset = shadow3Offset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        shadow3BlurRadius,
                                        shadow3.CGColor);
            
            [rectanglePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(rectangleBorderRect.size.width), 0);
            [rectangleNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [rectangleNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
  
}

@end
