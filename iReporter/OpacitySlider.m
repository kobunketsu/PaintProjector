//
//  OpacitySlider.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-1.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "OpacitySlider.h"

@implementation OpacitySlider
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
        UIColor* color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"opacityChecker.png"]];
        [self setBackgroundColor:color];
        [self setMinimumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
        [self setMaximumTrackImage:[UIImage alloc] forState:UIControlStateNormal];
        [self setColor: [UIColor whiteColor]];
//        self.layer.opaque = false;
//        self.layer.cornerRadius = 11;
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef beginColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0, 0, 0, 0.0f});
    CGColorRef endColor = [self color].CGColor;
    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor, endColor}, 2, nil);
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
        0.0f,       // 对应起点颜色位置
        1.0f        // 对应终点颜色位置
    });
    CFRelease(colorArray);
    CGColorRelease(beginColor);
//    CGColorRelease(endColor);
    CGColorSpaceRelease(colorSpaceRef);

    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0, 0), CGPointMake(250, 0), 0);
    CGGradientRelease(gradientRef);
    
//    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}


- (UIColor *)color {
    return _color;
}

- (void)setColor:(UIColor *)newValue {
    _color = newValue;
    [self setNeedsDisplay];
}

@end
