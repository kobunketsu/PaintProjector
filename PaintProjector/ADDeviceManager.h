//
//  ADDeviceManager.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADDeviceButtonShortCut.h"

typedef NS_ENUM(NSInteger, ConnectDeviceType) {
    ConnectDevice_None,
    ConnectDevice_AdonitJotTouch,
    ConnectDevice_WacomStylus,
    ConnectDevice_PogoConnect,
};

typedef NS_ENUM(NSInteger, DeviceWritingStyle) {
    DeviceWritingStyleRightVertical = 0,
    DeviceWritingStyleRightAverage = 1,
    DeviceWritingStyleRightHorizontal = 2,
    DeviceWritingStyleLeftVertical = 3,
    DeviceWritingStyleLeftAverage = 4,
    DeviceWritingStyleLeftHorizontal = 5,
};

@interface ADDeviceManager : NSObject
+(ADDeviceManager*)sharedInstance;
+(NSString*)writingStyleName:(DeviceWritingStyle)writingStyle;
@property (assign, nonatomic) ConnectDeviceType connectDeviceType;
@property (retain, nonatomic) NSMutableArray *shortcuts;
@property (retain, nonatomic) ADDeviceButtonShortCut *button1Shortcut;
@property (retain, nonatomic) ADDeviceButtonShortCut *button2Shortcut;
@property (retain, nonatomic) ADDeviceButtonShortCut *button1DefaultShortCut;
@property (retain, nonatomic) ADDeviceButtonShortCut *button2DefaultShortCut;
@property (assign, nonatomic) DeviceWritingStyle writingStyle;

- (void)addShortcutOption:(ADDeviceButtonShortCut *)shortcut;

- (void)addShortcutOptionButton1Default:(ADDeviceButtonShortCut *)shortcut;

- (void)addShortcutOptionButton2Default:(ADDeviceButtonShortCut *)shortcut;


@end
