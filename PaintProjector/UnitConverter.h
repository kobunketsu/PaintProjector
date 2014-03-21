//
//  UnitConverter.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
struct USUnit{
    CGFloat inch;
    CGFloat feet;
};
typedef struct USUnit USUnit;

CG_INLINE USUnit
USUnitMake(CGFloat inch, CGFloat feet)
{
    USUnit unit;
    unit.inch = inch;
    unit.feet = feet;
    return unit;
}


@interface UnitConverter : NSObject
+ (USUnit)usUnitFromMeter:(CGFloat)meter;
+ (CGFloat)meterFromUSUnit:(USUnit)unit;
@end
