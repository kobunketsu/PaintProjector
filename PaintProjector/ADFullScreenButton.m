//
//  FullScreenButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-10-6.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADFullScreenButton.h"

@implementation ADFullScreenButton

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
        self.layer.delegate = self;
    }
    return self;
}

//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
- (void)drawRect:(CGRect)rect{
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame;
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* iconColor = [UIColor colorWithRed: 0.679 green: 0.679 blue: 0.679 alpha: 1];
    CGFloat iconColorRGBA[4];
    [iconColor getRed: &iconColorRGBA[0] green: &iconColorRGBA[1] blue: &iconColorRGBA[2] alpha: &iconColorRGBA[3]];
    
    UIColor* iconShadowColorColor = [UIColor colorWithRed: (iconColorRGBA[0] * 0.5) green: (iconColorRGBA[1] * 0.5) blue: (iconColorRGBA[2] * 0.5) alpha: (iconColorRGBA[3] * 0.5 + 0.5)];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 0.863 blue: 0.526 alpha: 1];
    UIColor* gradientColor = [UIColor colorWithRed: 0.911 green: 0.713 blue: 0.225 alpha: 1];
    UIColor* shadow4Color = [UIColor colorWithRed: 0.951 green: 0.951 blue: 0.951 alpha: 1];
    UIColor* shadow3Color = [UIColor colorWithRed: 0.347 green: 0.347 blue: 0.347 alpha: 0.542];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 0.27, 0.54, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)gradientColor2.CGColor, (id)[UIColor colorWithRed: 0.955 green: 0.788 blue: 0.375 alpha: 1].CGColor, (id)gradientColor.CGColor, (id)gradientColor2.CGColor], gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow4 = shadow4Color;
    CGSize shadow4Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow4BlurRadius = 1;
    UIColor* shadow3 = shadow3Color;
    CGSize shadow3Offset = CGSizeMake(0.1, 2.1);
    CGFloat shadow3BlurRadius = 1;
    
    //// Group
    {
        //// Oval 2 Drawing
        CGRect oval2Rect = CGRectMake(CGRectGetMinX(frame) + 7, CGRectGetMinY(frame) + 6, 27, 27);
        UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: oval2Rect];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, [shadow4 CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);
        [oval2Path addClip];
        CGContextDrawLinearGradient(context, gradient,
                                    CGPointMake(CGRectGetMidX(oval2Rect), CGRectGetMinY(oval2Rect)),
                                    CGPointMake(CGRectGetMidX(oval2Rect), CGRectGetMaxY(oval2Rect)),
                                    0);
        CGContextEndTransparencyLayer(context);
        
        ////// Oval 2 Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(oval2Path.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([shadow3 CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [shadow3 colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, shadow3Offset, shadow3BlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [oval2Path fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
        
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + 13, CGRectGetMinY(frame) + 19, 15, 1)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow4Offset, shadow4BlurRadius, [shadow4 CGColor]);
        [iconShadowColorColor setFill];
        [rectanglePath fill];
        
        ////// Rectangle Inner Shadow
        CGContextSaveGState(context);
        UIRectClip(rectanglePath.bounds);
        CGContextSetShadowWithColor(context, CGSizeZero, 0, NULL);
        
        CGContextSetAlpha(context, CGColorGetAlpha([shadow3 CGColor]));
        CGContextBeginTransparencyLayer(context, NULL);
        {
            UIColor* opaqueShadow = [shadow3 colorWithAlphaComponent: 1];
            CGContextSetShadowWithColor(context, shadow3Offset, shadow3BlurRadius, [opaqueShadow CGColor]);
            CGContextSetBlendMode(context, kCGBlendModeSourceOut);
            CGContextBeginTransparencyLayer(context, NULL);
            
            [opaqueShadow setFill];
            [rectanglePath fill];
            
            CGContextEndTransparencyLayer(context);
        }
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
        
        CGContextRestoreGState(context);
        
    }
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}
 */


@end
