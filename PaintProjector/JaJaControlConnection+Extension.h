//
//  JaJaControlConnection+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/14/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <JaJa-SDK/JaJa-SDK.h>
#import <objc/runtime.h>

static char PressureKey;

@interface JaJaControlConnection (Extension)

+ (CGFloat)pressure;

+ (void)setPressure:(CGFloat)pressure;
@end
