//
//  TrackedTouch+Extension.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/10/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "TrackedTouch+Extension.h"
#import <objc/runtime.h>

@implementation TrackedTouch (Extension)
- (NSInteger)pressure{
    NSNumber *numPressure = objc_getAssociatedObject(self, &PressureKey);
    return numPressure.integerValue;
}

- (void)setPressure:(NSInteger)pressure{
    objc_setAssociatedObject(self, &PressureKey, [NSNumber numberWithInteger:pressure], OBJC_ASSOCIATION_RETAIN);
}
@end
