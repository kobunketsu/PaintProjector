//
//  ADConnectDeviceTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"
#import "ADAdonitJotTableViewController.h"
#import "ADWacomStylusTableViewController.h"
#import "ADDeviceButtonTableViewController.h"
#import "ADPogoConnectTableViewController.h"
#import "ADJaJaTableViewController.h"

#define ConnectDeviceCellNum 6
@interface ADConnectDeviceTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end

@protocol ADConnectDeviceTableViewControllerDelegate
- (void) didSelectDeviceAdonitJot;
- (void) didSelectDeviceWacomStylus;
- (void) didSelectDevicePogoConnect;
- (void) didSelectDeviceJaJa;
@end