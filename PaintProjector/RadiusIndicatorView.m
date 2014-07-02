//
//  RadiusIndicatorButton.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-4.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "RadiusIndicatorView.h"

@implementation RadiusIndicatorView

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
        _label = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width * 0.5 - 10, self.bounds.size.height * 0.5 - 10, 40, 20)];
        _label.textColor = [UIColor whiteColor];
        _label.text = [NSString stringWithFormat:@"%.0f",_radius];
        _label.opaque = false;
        _label.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_label];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    super.frame = frame;
    self.label.frame = CGRectMake(frame.size.width * 0.5 - 10, frame.size.height * 0.5 - 10, 40, 20);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.6 green: 0.6 blue: 0.6 alpha: 0.1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.6 green: 0.6 blue: 0.6 alpha: 0.1];
    UIColor* shadow2Color = [UIColor colorWithRed: 0.877 green: 0.877 blue: 0.877 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0.434 green: 0.434 blue: 0.434 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Shadow Declarations
    UIColor* shadow = shadowColor2;
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 2;
    UIColor* shadow2 = shadow2Color;
    CGSize shadow2Offset = CGSizeMake(0.1, 1.1);
    CGFloat shadow2BlurRadius = 2;
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: self.bounds];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow2Offset, shadow2BlurRadius, shadow2.CGColor);
    CGContextBeginTransparencyLayer(context, NULL);
    [ovalPath addClip];
    CGContextDrawRadialGradient(context, gradient,
                                CGPointMake(22, 22), 3.98,
                                CGPointMake(22, 22), 41.08,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    //draw radius
    UIBezierPath* radiusPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.frame.size.width * 0.5 - _radius, self.frame.size.height * 0.5 - _radius, _radius * 2, _radius * 2)];
    UIColor* blackColor = [UIColor colorWithRed: 0.3 green: 0.3 blue: 0.3 alpha: 1];
    [blackColor setFill];
    [radiusPath fill];
    
    CGContextEndTransparencyLayer(context);
    
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
    
    CGContextRestoreGState(context);
    
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (float)radius {
    return _radius;
}

- (void)setRadius:(float)newValue {
    _radius = newValue;
    if(_radius > 32){
        _label.hidden = false;
        _label.text = [NSString stringWithFormat:@"%.0f",_radius];
    }
    else{
        _label.hidden = true;
    }
    [self setNeedsDisplay];
}
@end
