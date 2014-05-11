//
//  LayerOpacitySlider.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "LayerOpacitySlider.h"
#import "QuartzCore/QuartzCore.h"

#define kPatternWidth 16
#define kPatternHeight 16
@implementation LayerOpacitySlider

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
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0];
    UIColor* gradientColor2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* shadow2Color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0.318 green: 0.318 blue: 0.318 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 2.1);
    CGFloat shadowBlurRadius = 2;
    UIColor* shadow2 = shadow2Color;
    CGSize shadow2Offset = CGSizeMake(0.1, 1.1);
    CGFloat shadow2BlurRadius = 2;
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(1, 4, self.bounds.size.width - 2, 20) cornerRadius: 10];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor);
    //draw
    CGContextBeginTransparencyLayer(context, NULL);
    [roundedRectanglePath addClip];
    
    //draw background image
    const CGRect patternBounds = CGRectMake(0, 0, kPatternWidth, kPatternHeight);
    const CGPatternCallbacks kPatternCallbacks = {0, DrawPatternCellCallback1, NULL};
    
    CGAffineTransform patternTransform = CGAffineTransformIdentity;
    CGPatternRef fillPattern = CGPatternCreate(
                                               NULL,
                                               patternBounds,
                                               patternTransform,
                                               kPatternWidth, // horizontal spacing
                                               kPatternHeight, // vertical spacing
                                               kCGPatternTilingNoDistortion,
                                               true,
                                               &kPatternCallbacks);
    CGFloat color1[] = {1.0, 1.0, 1.0, 1.0};
    
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, patternSpace);
    CGContextSetFillPattern(context, fillPattern, color1);
    CGContextFillRect(context, self.bounds);
    CGPatternRelease(fillPattern);
    fillPattern = NULL;
    CGColorSpaceRelease(patternSpace);
    patternSpace = NULL;
    
    //draw linearGradient
    CGContextDrawLinearGradient(context, gradient, CGPointMake(1, 11), CGPointMake(self.bounds.size.width - 1, 11), 0);
    CGContextEndTransparencyLayer(context);
    
    ////// Rounded Rectangle Inner Shadow
    CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -shadowBlurRadius, -shadowBlurRadius);
    roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -shadowOffset.width, -shadowOffset.height);
    roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1, -1);
    
    UIBezierPath* roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
    [roundedRectangleNegativePath appendPath: roundedRectanglePath];
    roundedRectangleNegativePath.usesEvenOddFillRule = YES;
    
    CGContextSaveGState(context);
    {
        CGFloat xOffset = shadowOffset.width + round(roundedRectangleBorderRect.size.width);
        CGFloat yOffset = shadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    shadowBlurRadius,
                                    shadow.CGColor);
        
        [roundedRectanglePath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangleBorderRect.size.width), 0);
        [roundedRectangleNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [roundedRectangleNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);

    

}


@end
