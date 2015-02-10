//
//  WacomDevice+Extension.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <WacomDevice/WacomDeviceFramework.h>
#import "ADDeviceButtonShortCut.h"
static char Button1shortCutKey;
static char Button2shortCutKey;
static char BatteryLevelKey;

@interface WacomDevice (Extension)
@property (retain, nonatomic) ADDeviceButtonShortCut *button1shortCut;
@property (retain, nonatomic) ADDeviceButtonShortCut *button2shortCut;
@property (assign, nonatomic) unsigned long batteryLevel;
@end
