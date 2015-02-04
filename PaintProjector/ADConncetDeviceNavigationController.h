//
//  ADConncetDeviceNavigationController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADConnectDeviceTableViewController.h"


@interface ADConncetDeviceNavigationController : UINavigationController
<ADConnectDeviceTableViewControllerDelegate>
@property(assign, nonatomic) CGFloat viewHeight;
@end
