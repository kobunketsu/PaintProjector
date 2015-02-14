//
//  JaJaControlConnection+Extension.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/14/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "JaJaControlConnection+Extension.h"

@implementation JaJaControlConnection (Extension)

+ (CGFloat)pressure{
    return  ((NSNumber *)objc_getAssociatedObject(self, &PressureKey)).floatValue;
}

+ (void)setPressure:(CGFloat)pressure{
    objc_setAssociatedObject(self, &PressureKey, [NSNumber numberWithFloat:pressure], OBJC_ASSOCIATION_RETAIN);
}
@end
