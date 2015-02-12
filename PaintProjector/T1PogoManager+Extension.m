//
//  T1PogoManager+Extension.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/12/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "T1PogoManager+Extension.h"
#import <objc/runtime.h>

@implementation T1PogoManager (Extension)
- (T1PogoPen *)penConnected{
    return objc_getAssociatedObject(self, &PenConnectedKey);
}

- (void)setPenConnected:(T1PogoPen *)penConnected{
    objc_setAssociatedObject(self, &PenConnectedKey, penConnected, OBJC_ASSOCIATION_RETAIN);
}

- (NSInteger)lastBatteryLevel{
    return ((NSNumber *) objc_getAssociatedObject(self, &LastBatteryLevelKey)).integerValue;
}

- (void)setLastBatteryLevel:(NSInteger)lastBatteryLevel{
    objc_setAssociatedObject(self, &LastBatteryLevelKey, [NSNumber numberWithInteger:lastBatteryLevel], OBJC_ASSOCIATION_RETAIN);
}

@end
