//
//  ADDeviceManager.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADDeviceManager.h"
#import <WacomDevice/WacomDeviceFramework.h>
@interface ADDeviceManager()

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
    }
    return self;
}

- (void)addShortcutOption:(ADDeviceButtonShortCut *)shortcut{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
        JotShortcut *jotShortCut = [[JotShortcut alloc] initWithDescriptiveText:shortcut.descriptiveText key:shortcut.key target:shortcut.target selector:shortcut.selector];
        shortcut.jotShortCut = jotShortCut;
        [[JotStylusManager sharedInstance] addShortcutOption: jotShortCut];
    }
    else{
        [self.shortcuts addObject:shortcut];
    }
}

- (void)addShortcutOptionButton1Default:(ADDeviceButtonShortCut *)shortcut{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
        [[JotStylusManager sharedInstance] addShortcutOptionButton1Default:shortcut.jotShortCut];
    }
    else{
        self.button1DefaultShortCut = shortcut;
    }
}

- (void)addShortcutOptionButton2Default:(ADDeviceButtonShortCut *)shortcut{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
        [[JotStylusManager sharedInstance] addShortcutOptionButton2Default:shortcut.jotShortCut];
    }
    else{
        self.button2DefaultShortCut = shortcut;
    }
}

- (NSArray *)shortcuts{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
        return [JotStylusManager sharedInstance].shortcuts;
    }
    else{
        return _shortcuts;
    }
}


- (void)setButton1Shortcut:(ADDeviceButtonShortCut *)button1Shortcut{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
        [JotStylusManager sharedInstance].button1Shortcut = button1Shortcut.jotShortCut;
    }
    else{
        _button1Shortcut = button1Shortcut;
        
    }
}

- (void)setButton2Shortcut:(ADDeviceButtonShortCut *)button2Shortcut{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
        [JotStylusManager sharedInstance].button2Shortcut = button2Shortcut.jotShortCut;
    }
    else{
        _button2Shortcut = button2Shortcut;
    }
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

//- (DeviceWritingStyle)writingStyle{
//    if (_wri) {
//        <#statements#>
//    }
//}

- (void)setWritingStyle:(DeviceWritingStyle)writingStyle{
    if (self.connectDeviceType == ConnectDevice_AdonitJotTouch) {
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
    else if (self.connectDeviceType == ConnectDevice_WacomStylus) {
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
