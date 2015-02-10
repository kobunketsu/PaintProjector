//
//  TrackedTouch+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/10/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <WacomDevice/WacomDeviceFramework.h>

static char PressureKey;
@interface TrackedTouch (Extension)
@property (assign, nonatomic)NSInteger pressure;
@end
