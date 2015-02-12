//
//  ADDeviceButtonTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/4/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"

typedef NS_ENUM(NSInteger, ShortcutMethod) {
    Shortcut_Undo,
    Shortcut_Redo,
    Shortcut_Clear,
    Shortcut_Transform,
    Shortcut_Layer,
    Shortcut_PickColor,
    Shortcut_EyedropColor,
    Shortcut_SwapBrush,
    Shortcut_Count,
};

@interface ADDeviceButtonTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) NSInteger buttonIndex;
@property (weak, nonatomic) UITableViewController *fromController;
@end
@protocol ADDeviceButtonTableViewControllerDelegate
- (void)didSelectConnectDeviceButtonMethod;
@end