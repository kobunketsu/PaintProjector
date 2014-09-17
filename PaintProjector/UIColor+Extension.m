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
@end
