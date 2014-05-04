//
//  NSString+Unit.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "NSString+Unit.h"
#import "UnitConverter.h"

@implementation NSString (Unit)
+(NSString*)unitStringFromFloat:(CGFloat)value{
    BOOL isMetric = [[[NSLocale currentLocale] objectForKey:NSLocaleUsesMetricSystem] boolValue];
    if (isMetric) {
        return [NSString stringWithFormat:@"%.3f M", value];
    }
    else{
        USUnit unit = [UnitConverter usUnitFromMeter:value];
        return [NSString stringWithFormat:@"'%.f ''%.1f", unit.feet, unit.inch];
    }
}
@end
