//
//  WacomDevice+Extension.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "WacomDevice+Extension.h"
#import <objc/runtime.h>

@implementation WacomDevice (Extension)
- (ADDeviceButtonShortCut *)button1shortCut{
    return objc_getAssociatedObject(self, &Button1shortCutKey);
}

- (void)setButton1shortCut:(ADDeviceButtonShortCut *)button1shortCut{
    objc_setAssociatedObject(self, &Button1shortCutKey, button1shortCut, OBJC_ASSOCIATION_RETAIN);
}

- (ADDeviceButtonShortCut *)button2shortCut{
    return objc_getAssociatedObject(self, &Button2shortCutKey);
}
- (void)setButton2shortCut:(ADDeviceButtonShortCut *)button2shortCut{
    objc_setAssociatedObject(self, &Button2shortCutKey, button2shortCut, OBJC_ASSOCIATION_RETAIN);
}

- (unsigned long)batteryLevel{
    NSNumber *numBatteryLevel = (NSNumber *)objc_getAssociatedObject(self, &BatteryLevelKey);
    if (numBatteryLevel) {
        return numBatteryLevel.integerValue;
    }
    else{
        return 0;
    }
}

- (void)setBatteryLevel:(unsigned long)batteryLevel{
    objc_setAssociatedObject(self, &BatteryLevelKey, [NSNumber numberWithInteger:batteryLevel], OBJC_ASSOCIATION_RETAIN);
}
@end
