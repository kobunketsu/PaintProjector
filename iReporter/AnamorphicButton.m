//
//  AnamorphicButton.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-8-25.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "AnamorphicButton.h"

@implementation AnamorphicButton

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

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    UIGraphicsPushContext(ctx);
    
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = ctx;
    
    //// Color Declarations
    UIColor* iconHighlightColor = [UIColor colorWithRed: 0.873 green: 0.878 blue: 1 alpha: 1];
    CGFloat r = ((CustomLayer*)layer).baseColorR;
    CGFloat g = ((CustomLayer*)layer).baseColorG;
    CGFloat b = ((CustomLayer*)layer).baseColorB;
    UIColor* iconColor = self.isHighlighted ? [UIColor whiteColor] : [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    UIColor* icongGlowFadeColor = [iconColor colorWithAlphaComponent: 0];
    UIColor* labelHightlightColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* iconGlowGradientColor = [UIColor colorWithRed: 0.47 green: 0.463 blue: 0.471 alpha: 0.23];
    
    //// Gradient Declarations
    NSArray* iconGlowGradientColors = [NSArray arrayWithObjects:
                                       (id)iconGlowGradientColor.CGColor,
                                       (id)icongGlowFadeColor.CGColor, nil];
    CGFloat iconGlowGradientLocations[] = {0, 1};
    CGGradientRef iconGlowGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)iconGlowGradientColors, iconGlowGradientLocations);
    
    //// Shadow Declarations
    UIColor* iconHighlight = iconHighlightColor;
    CGSize iconHighlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat iconHighlightBlurRadius = 0;
    UIColor* labelHightlight = labelHightlightColor;
    CGSize labelHightlightOffset = CGSizeMake(0.1, 1.1);
    CGFloat labelHightlightBlurRadius = 0;
    
    //// Abstracted Attributes
    NSString* textContent = @"Anamorph";
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 128, 80)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, iconHighlightOffset, iconHighlightBlurRadius, iconHighlight.CGColor);
    CGContextRestoreGState(context);
    
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, -43, 131, 112)];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, iconGlowGradient,
                                CGPointMake(64.05, 23.12), 4.84,
                                CGPointMake(63.76, 55.6), 47.32,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);
    
    
    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(51, 10, 25, 6)];
    [iconColor setFill];
    [oval4Path fill];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(76, 50)];
    [bezierPath addLineToPoint: CGPointMake(75.26, 50)];
    [bezierPath addCurveToPoint: CGPointMake(72.19, 51.12) controlPoint1: CGPointMake(74.63, 50.41) controlPoint2: CGPointMake(73.61, 50.79)];
    [bezierPath addCurveToPoint: CGPointMake(53.81, 51.12) controlPoint1: CGPointMake(67.12, 52.29) controlPoint2: CGPointMake(58.88, 52.29)];
    [bezierPath addCurveToPoint: CGPointMake(50.74, 50) controlPoint1: CGPointMake(52.39, 50.79) controlPoint2: CGPointMake(51.37, 50.41)];
    [bezierPath addLineToPoint: CGPointMake(50, 50)];
    [bezierPath addLineToPoint: CGPointMake(50, 15)];
    [bezierPath addCurveToPoint: CGPointMake(53.81, 17.12) controlPoint1: CGPointMake(50, 15.77) controlPoint2: CGPointMake(51.27, 16.54)];
    [bezierPath addCurveToPoint: CGPointMake(72.19, 17.12) controlPoint1: CGPointMake(58.88, 18.29) controlPoint2: CGPointMake(67.12, 18.29)];
    [bezierPath addCurveToPoint: CGPointMake(76, 15) controlPoint1: CGPointMake(74.73, 16.54) controlPoint2: CGPointMake(76, 15.77)];
    [bezierPath addLineToPoint: CGPointMake(76, 50)];
    [bezierPath closePath];
    [iconColor setFill];
    [bezierPath fill];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(48.46, 51.37)];
    [bezier3Path addLineToPoint: CGPointMake(49.3, 51.37)];
    [bezier3Path addCurveToPoint: CGPointMake(52.74, 52.67) controlPoint1: CGPointMake(50, 51.84) controlPoint2: CGPointMake(51.15, 52.29)];
    [bezier3Path addCurveToPoint: CGPointMake(73.38, 52.67) controlPoint1: CGPointMake(58.44, 54.03) controlPoint2: CGPointMake(67.68, 54.03)];
    [bezier3Path addCurveToPoint: CGPointMake(76.83, 51.37) controlPoint1: CGPointMake(74.98, 52.29) controlPoint2: CGPointMake(76.12, 51.84)];
    [bezier3Path addLineToPoint: CGPointMake(77.66, 51.37)];
    [bezier3Path addLineToPoint: CGPointMake(77.66, 45.29)];
    [bezier3Path addCurveToPoint: CGPointMake(85.13, 46.61) controlPoint1: CGPointMake(80.34, 45.63) controlPoint2: CGPointMake(82.86, 46.07)];
    [bezier3Path addCurveToPoint: CGPointMake(85.13, 57.29) controlPoint1: CGPointMake(97.62, 49.56) controlPoint2: CGPointMake(97.62, 54.34)];
    [bezier3Path addCurveToPoint: CGPointMake(39.87, 57.29) controlPoint1: CGPointMake(72.63, 60.24) controlPoint2: CGPointMake(52.37, 60.24)];
    [bezier3Path addCurveToPoint: CGPointMake(39.87, 46.61) controlPoint1: CGPointMake(27.38, 54.34) controlPoint2: CGPointMake(27.38, 49.56)];
    [bezier3Path addCurveToPoint: CGPointMake(48.46, 45.16) controlPoint1: CGPointMake(42.45, 46) controlPoint2: CGPointMake(45.36, 45.51)];
    [bezier3Path addLineToPoint: CGPointMake(48.46, 51.37)];
    [bezier3Path closePath];
    [iconColor setFill];
    [bezier3Path fill];
    
    
    //// Text Drawing
//    CGRect textRect = CGRectMake(35, 57, 61, 12);
//    CGContextSaveGState(context);
//    CGContextSetShadowWithColor(context, labelHightlightOffset, labelHightlightBlurRadius, labelHightlight.CGColor);
//    [iconColor setFill];
//    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 12] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
//    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(iconGlowGradient);
    CGColorSpaceRelease(colorSpace);
    
    
    UIGraphicsPopContext();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}
*/

@end
