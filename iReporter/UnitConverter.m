//
//  UnitConverter.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UnitConverter.h"

@implementation UnitConverter

+ (USUnit)usUnitFromMeter:(CGFloat)meter{
    CGFloat inch =  meter * 39.370078740157;
    CGFloat feet = floorf((CGFloat)inch / 12.0);
    inch = inch - feet * 12;
    return USUnitMake(inch, feet);
}

+ (CGFloat)meterFromUSUnit:(USUnit)unit{
    return unit.inch * 0.0254 + unit.feet * 0.3048;
}
@end
