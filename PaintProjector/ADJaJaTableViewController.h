//
//  ADJaJaTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/14/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JaJa-SDK/jaJa-SDK.h>
#import "JaJaControlConnection+Extension.h"
@interface ADJaJaTableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
@end

@protocol ADJaJaTableViewControllerDelegate
- (void) didDeselectJaJa;
- (void) didSelectJaJaButtonIndex:(NSInteger)index;
- (void) didSelectOpenJaJaSupportURL;
@end