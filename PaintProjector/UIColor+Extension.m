//
//  UIColor+UIColor_String.m
//  PaintProjector
//
//  Created by kobunketsu on 14-3-1.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+(UIColor*)colorWithString:(NSString*)string{
    NSArray *rgb = [string componentsSeparatedByString:@" "];
    CGFloat r = [rgb[0] integerValue] / 255.0;
    CGFloat g = [rgb[1] integerValue] / 255.0;
    CGFloat b = [rgb[2] integerValue] / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

-(NSString*)colorString{
    const CGFloat *colorPtr = CGColorGetComponents(self.CGColor);
    NSString *colorData = [NSString stringWithFormat:@"%u %u %u", (NSUInteger)(colorPtr[0]*255.0), (NSUInteger)(colorPtr[1]*255.0), (NSUInteger)(colorPtr[2]*255.0)];
    return colorData;
}

#pragma mark- Common Colors
+ (UIColor*)selectableColor{
    return [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
}

-(UIColor*)blendColor:(UIColor*)color withAlpha:(CGFloat)alpha{
//    DebugLog(@"srcColor %@", self);
//    DebugLog(@"targetColor %@", color);
    const CGFloat* srcColors = CGColorGetComponents(self.CGColor);
    const CGFloat* targetColors = CGColorGetComponents(color.CGColor);
    CGFloat r = srcColors[0] * (1-alpha) + targetColors[0] * alpha;
    CGFloat g = srcColors[1] * (1-alpha) + targetColors[1] * alpha;
    CGFloat b = srcColors[2] * (1-alpha) + targetColors[2] * alpha;
    CGFloat a = srcColors[3] * (1-alpha) + targetColors[3] * alpha;
    return  [UIColor colorWithRed:r green:g blue:b alpha:a];
}
@end
