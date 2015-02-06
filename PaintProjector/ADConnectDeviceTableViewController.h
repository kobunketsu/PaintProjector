//
//  ADConnectDeviceTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"
#import "ADAdonitJotTableViewController.h"
#import "ADConnectDeviceButtonTableViewController.h"


#define ConnectDeviceCellNum 7
@interface ADConnectDeviceTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end

@protocol ADConnectDeviceTableViewControllerDelegate
- (void) didSelectDeviceAdonitJotTouch;
- (void) didSelectDeviceWacomIntuosCreativeStylus;
- (void) didSelectDevicePogoConnect;
@end