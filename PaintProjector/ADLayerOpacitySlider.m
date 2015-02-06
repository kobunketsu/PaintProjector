//
//  LayerOpacitySlider.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayerOpacitySlider.h"
#import "QuartzCore/QuartzCore.h"

#define kPatternWidth 14
#define kPatternHeight 14
@implementation ADLayerOpacitySlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    [self setMinimumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
    //    [self setColor: [UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
    }
    //旋转heigtSlider为垂直
    CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI * 0.5);
    self.transform = trans;
    [self setMinimumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
//    [self setColor: [UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    return self;
}

void DrawPatternCellCallback1(void *info, CGContextRef cgContext)
{
    // Create a CGImage and use CGContextDrawImage() to draw it into the graphics context provided by the callback function.
    UIImage *patternImage = [UIImage imageNamed:@"checkerUnit.png"];
    CGContextDrawImage(cgContext, CGRectMake(0, 0, kPatternWidth, kPatternHeight), patternImage.CGImage);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawADOpacitySliderWithFrame:rect];
}

- (void)drawADOpacitySliderWithFrame: (CGRect)frame
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* cOpacity = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* cOpacityZero = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    
    //// Gradient Declarations
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)cOpacityZero.CGColor, (id)cOpacity.CGColor], gradientLocations);
    
    //// Rounded Rectangle Drawing
    CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(frame) + 1, CGRectGetMinY(frame) + 5, 248, 20);
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect cornerRadius: 10];
    CGContextSaveGState(context);
    [roundedRectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMinX(roundedRectangleRect), CGRectGetMidY(roundedRectangleRect)),
                                CGPointMake(CGRectGetMaxX(roundedRectangleRect), CGRectGetMidY(roundedRectangleRect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
