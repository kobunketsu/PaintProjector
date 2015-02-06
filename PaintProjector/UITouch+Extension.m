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
@end
