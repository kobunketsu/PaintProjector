//
//  OpacitySlider.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADOpacitySlider.h"
#define kPatternWidth 14
#define kPatternHeight 14
@implementation ADOpacitySlider
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
        NSString *path = [[NSBundle mainBundle]pathForResource:@"radiusSliderTracker" ofType:@"png"];
        UIImage *trackImage = [[UIImage imageWithContentsOfFile:path] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        [self setMinimumTrackImage:trackImage forState:UIControlStateNormal];
        [self setMaximumTrackImage:trackImage forState:UIControlStateNormal];
    }
    return self;
}


- (void)setValueByOpacity:(CGFloat)opacity{
    CGFloat valueRange = self.maximumValue - self.minimumValue;
    self.value = self.minimumValue + sqrtf(((opacity - self.minimumValue) / valueRange)) * valueRange;
}

- (CGFloat)opacityByValue{
    CGFloat valueRange = self.maximumValue - self.minimumValue;
    CGFloat opacity = self.minimumValue + powf(((self.value - self.minimumValue) / valueRange), 2) * valueRange;
    return opacity;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawChecker{
    CGContextRef context = UIGraphicsGetCurrentContext();
    const CGRect patternBounds = CGRectMake(0, 0, kPatternWidth, kPatternHeight);
    const CGPatternCallbacks kPatternCallbacks = {0, DrawPatternCellCallback, NULL};
    
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
    CGColorSpaceRelease(patternSpace);
    patternSpace = NULL;
    CGPatternRelease(fillPattern);
    fillPattern = NULL;
}
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
    UIColor* cOpacity = _color;
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

void DrawPatternCellCallback(void *info, CGContextRef cgContext)
{
    // Create a CGImage and use CGContextDrawImage() to draw it into the graphics context provided by the callback function.
    UIImage *patternImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"checkerUnit" ofType:@"png"]];
    CGContextDrawImage(cgContext, CGRectMake(0, 0, kPatternWidth, kPatternHeight), patternImage.CGImage);
}

- (UIColor *)color {
    return _color;
}

- (void)setColor:(UIColor *)newValue {
    _color = newValue;
    [self setNeedsDisplay];
}

@end
