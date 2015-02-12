//
//  ADPogoConnectTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/12/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "T1PogoManager.h"
#import "T1PogoManager+Extension.h"

@interface ADPogoConnectTableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
@end

@protocol ADPogoConnectTableViewControllerDelegate
- (void) didDeselectPogoConnect;
- (void) didSelectPogoConnectButtonIndex:(NSInteger)index;
- (void) didSelectOpenPogoConnectSupportURL;
@end