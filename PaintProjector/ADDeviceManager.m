//
//  ADDeviceManager.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADDeviceManager.h"
#import <WacomDevice/WacomDeviceFramework.h>
#import "T1PogoManager.h"
#import "T1PogoManager+Extension.h"
@interface ADDeviceManager()
@property (retain, nonatomic) NSMutableDictionary *shortcutDics;
@end

@implementation ADDeviceManager
static ADDeviceManager* sharedInstance = nil;

+(ADDeviceManager*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (id)init{
    self = [super init];
    if (self) {
        _shortcuts = [[NSMutableArray alloc]init];
        _shortcutDics = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)addShortcutOption:(ADDeviceButtonShortcut *)shortcut{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        JotShortcut *jotShortCut = [[JotShortcut alloc] initWithDescriptiveText:shortcut.descriptiveText key:shortcut.key target:shortcut.target selector:shortcut.selector];
        shortcut.jotShortCut = jotShortCut;
        [[JotStylusManager sharedInstance] addShortcutOption: jotShortCut];
    }
    else{
        [self.shortcuts addObject:shortcut];
        [self.shortcutDics setValue:shortcut forKey:shortcut.key];
    }
}

- (void)addShortcutOptionButton1Default:(ADDeviceButtonShortcut *)shortcut{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        [[JotStylusManager sharedInstance] addShortcutOptionButton1Default:shortcut.jotShortCut];
    }
    else{
        self.button1DefaultShortCut = shortcut;
    }
}

- (void)addShortcutOptionButton2Default:(ADDeviceButtonShortcut *)shortcut{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        [[JotStylusManager sharedInstance] addShortcutOptionButton2Default:shortcut.jotShortCut];
    }
    else{
        self.button2DefaultShortCut = shortcut;
    }
}

- (NSArray *)shortcuts{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        return [JotStylusManager sharedInstance].shortcuts;
    }
    else{
        return _shortcuts;
    }
}


- (void)setButton1Shortcut:(id)button1Shortcut{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        [JotStylusManager sharedInstance].button1Shortcut = button1Shortcut;
    }
    else{
        _button1Shortcut = button1Shortcut;
        [self recordDeviceButtonShortcut:0];
    }
}

- (void)setButton2Shortcut:(id)button2Shortcut{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        [JotStylusManager sharedInstance].button2Shortcut = button2Shortcut;
    }
    else{
        _button2Shortcut = button2Shortcut;
        [self recordDeviceButtonShortcut:1];
    }
}

- (void)loadDeviceButtonShortcut:(NSInteger)buttonIndex{
    DebugLog(@"loadDeviceButtonShortcut index %d", buttonIndex);
    NSString *key = [ADDeviceManager deviceTypeName:self.deviceType];
    ADDeviceButtonShortcut *defaultShortcut;
    if (buttonIndex == 0) {
        key = [key stringByAppendingString:@"button1Shortcut"];
        defaultShortcut = self.button1DefaultShortCut;
    }
    if (buttonIndex == 1) {
        key = [key stringByAppendingString:@"button2Shortcut"];
        defaultShortcut = self.button2DefaultShortCut;
    }
    __block ADDeviceButtonShortcut *buttonShortcut = nil;
    switch (self.deviceType) {
        case ConnectDevice_None:
        {
            
        }
            break;
        case ConnectDevice_AdonitJot:
        {
            
        }
            break;
        case ConnectDevice_WacomStylus:
        case ConnectDevice_PogoConnect:
        case ConnectDevice_JaJa:
        {
            NSString *buttonShortcutKey = [[NSUserDefaults standardUserDefaults] stringForKey:key];
            buttonShortcut = [self.shortcutDics valueForKey:buttonShortcutKey];
            
            if (!buttonShortcut) {
                buttonShortcut = defaultShortcut;
            }
            if (buttonIndex == 0) {
             _button1Shortcut = buttonShortcut;
            }
            else if (buttonIndex == 1) {
             _button2Shortcut = buttonShortcut;
            }
        }
            break;
        default:
            break;
    }
}

- (void)recordDeviceButtonShortcut:(NSInteger)buttonIndex{
    DebugLog(@"recordDeviceButtonShortcut index %d", buttonIndex);
    NSString *buttonShortbutKeyValue = nil;
    NSString *key = [ADDeviceManager deviceTypeName:self.deviceType];
    if (buttonIndex == 0) {
        buttonShortbutKeyValue = [ADDeviceManager sharedInstance].button1Shortcut.key;
        key = [key stringByAppendingString:@"button1Shortcut"];
    }
    else if (buttonIndex == 1) {
        buttonShortbutKeyValue = [ADDeviceManager sharedInstance].button2Shortcut.key;
        key = [key stringByAppendingString:@"button2Shortcut"];
    }

    switch (self.deviceType) {
        case ConnectDevice_AdonitJot:
        {
            
        }
            break;
        case ConnectDevice_WacomStylus:
        case ConnectDevice_PogoConnect:
        case ConnectDevice_JaJa:
        {
            [[NSUserDefaults standardUserDefaults] setValue:buttonShortbutKeyValue forKey:key];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
            break;
        default:
            break;
    }
}

+ (NSString *)deviceTypeName:(ConnectDeviceType)deviceType{
    NSString *name = nil;
    switch (deviceType) {
        case ConnectDevice_None:
            name = @"DeviceNone";
            break;
        case ConnectDevice_AdonitJot:
            name = @"DeviceAdonitJot";
            break;
        case ConnectDevice_WacomStylus:
            name = @"DeviceWacomStylus";
            break;
        case ConnectDevice_PogoConnect:
            name = @"DevicePogoConnect";
            break;
        case ConnectDevice_JaJa:
            name = @"DeviceJaJa";
            break;
            
        default:
            break;
    }
    return name;
}

+ (NSString*)writingStyleName:(DeviceWritingStyle)writingStyle{
    NSString *name = nil;
    switch (writingStyle) {
        case DeviceWritingStyleRightHorizontal:
            name = NSLocalizedString(@"WritingStyleRH", nil);
            break;
        case DeviceWritingStyleRightAverage:
            name = NSLocalizedString(@"WritingStyleRA", nil);
            break;
        case DeviceWritingStyleRightVertical:
            name = NSLocalizedString(@"WritingStyleRV", nil);
            break;
        case DeviceWritingStyleLeftHorizontal:
            name = NSLocalizedString(@"WritingStyleLH", nil);
            break;
        case DeviceWritingStyleLeftAverage:
            name = NSLocalizedString(@"WritingStyleLA", nil);
            break;
        case DeviceWritingStyleLeftVertical:
            name = NSLocalizedString(@"WritingStyleLV", nil);
            break;
        default:
            break;
    }
    return name;
}


- (void)setWritingStyle:(DeviceWritingStyle)writingStyle{
    if (self.deviceType == ConnectDevice_AdonitJot) {
        switch (writingStyle) {
            case DeviceWritingStyleRightVertical:
                [JotStylusManager sharedInstance].writingStyle = JotWritingStyleRightVertical;
                break;
            case DeviceWritingStyleRightAverage:
                [JotStylusManager sharedInstance].writingStyle = JotWritingStyleRightAverage;
                break;
            case DeviceWritingStyleRightHorizontal:
                [JotStylusManager sharedInstance].writingStyle = JotWritingStyleRightHorizontal;
                break;
            case DeviceWritingStyleLeftVertical:
                [JotStylusManager sharedInstance].writingStyle = JotWritingStyleLeftVertical;
                break;
            case DeviceWritingStyleLeftAverage:
                [JotStylusManager sharedInstance].writingStyle = JotWritingStyleLeftAverage;
                break;
            case DeviceWritingStyleLeftHorizontal:
                [JotStylusManager sharedInstance].writingStyle = JotWritingStyleLeftHorizontal;
                break;
                
            default:
                break;
        }
    }
    else if (self.deviceType == ConnectDevice_WacomStylus) {
        switch (writingStyle) {
            case DeviceWritingStyleRightVertical:
                [[TouchManager GetTouchManager] setHandedness:eh_RightUpward];
                break;
            case DeviceWritingStyleRightAverage:
                [[TouchManager GetTouchManager] setHandedness:eh_Right];
                break;
            case DeviceWritingStyleRightHorizontal:
                [[TouchManager GetTouchManager] setHandedness:eh_RightDownward];
                break;
            case DeviceWritingStyleLeftVertical:
                [[TouchManager GetTouchManager] setHandedness:eh_LeftUpward];
                break;
            case DeviceWritingStyleLeftAverage:
                [[TouchManager GetTouchManager] setHandedness:eh_Left];
                break;
            case DeviceWritingStyleLeftHorizontal:
                [[TouchManager GetTouchManager] setHandedness:eh_LeftDownward];
                break;
                
            default:
                break;
        }
    }
    _writingStyle = writingStyle;
}
@end
