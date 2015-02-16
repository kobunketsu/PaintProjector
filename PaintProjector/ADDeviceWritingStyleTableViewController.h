//
//  ADDeviceWritingStyleTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/4/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"

@interface ADDeviceWritingStyleTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
@end

@protocol ADDeviceWritingStyleTableViewControllerDelegate
- (void)didSelectConnectDeviceWritingStyle;
@end
