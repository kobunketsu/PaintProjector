//
//  ADDeviceManager.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADDeviceButtonShortcut.h"

typedef NS_ENUM(NSInteger, ConnectDeviceType) {
    ConnectDevice_None,
    ConnectDevice_AdonitJotTouch,
    ConnectDevice_WacomStylus,
    ConnectDevice_PogoConnect,
    ConnectDevice_JaJaHex3,
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
@property (assign, nonatomic) ConnectDeviceType deviceType;
@property (retain, nonatomic) NSMutableArray *shortcuts;
@property (retain, nonatomic) ADDeviceButtonShortcut *button1Shortcut;
@property (retain, nonatomic) ADDeviceButtonShortcut *button2Shortcut;
@property (retain, nonatomic) ADDeviceButtonShortcut *button1DefaultShortCut;
@property (retain, nonatomic) ADDeviceButtonShortcut *button2DefaultShortCut;
@property (assign, nonatomic) DeviceWritingStyle writingStyle;

- (void)addShortcutOption:(ADDeviceButtonShortcut *)shortcut;

- (void)addShortcutOptionButton1Default:(ADDeviceButtonShortcut *)shortcut;

- (void)addShortcutOptionButton2Default:(ADDeviceButtonShortcut *)shortcut;

- (void)loadDeviceButtonShortcut:(NSInteger)buttonIndex;


//- (ADDeviceButtonShortcut *)getButton1Shortcut;
//
//- (ADDeviceButtonShortcut *)getButton2Shortcut;
@end
