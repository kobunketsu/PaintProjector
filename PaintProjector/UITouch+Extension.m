//
//  UITouch+Extension.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/6/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "UITouch+Extension.h"
#import <objc/runtime.h>

@implementation UITouch (Extension)
- (void)setIsPaintTouch:(BOOL)isPaintTouch{
    NSNumber *numIsPaintTouch = (NSNumber *)objc_getAssociatedObject(self, &IsPaintTouchKey);
    if (!numIsPaintTouch) {
        numIsPaintTouch = [NSNumber numberWithBool:isPaintTouch];
        objc_setAssociatedObject(self, &IsPaintTouchKey, numIsPaintTouch, OBJC_ASSOCIATION_RETAIN);
    }
}

- (BOOL)isPaintTouch{
    NSNumber *numIsPaintTouch = (NSNumber *)objc_getAssociatedObject(self, &IsPaintTouchKey);
    if (numIsPaintTouch) {
        return numIsPaintTouch.boolValue;
    }
    else{
        return false;
    }
}

- (void)setPreLocation:(CGRect)location{
//    DebugLogWarn(@"setPreLocation %@", NSStringFromCGRect(location));
    objc_setAssociatedObject(self, &PreLocationKey, [NSValue valueWithCGRect:location], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)preLocation{
    NSValue *valPreLocation = (NSValue *)objc_getAssociatedObject(self, &PreLocationKey);
    if (valPreLocation) {
//        DebugLogWarn(@"getPreLocation %@", NSStringFromCGRect(valPreLocation.CGRectValue));
        return valPreLocation.CGRectValue;
    }
    else{
//        DebugLogWarn(@"getPreLocation nil");
        return CGRectZero;
    }
}
@end
