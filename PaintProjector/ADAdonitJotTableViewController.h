//
//  ADAdonitJotTouchSetupTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"
#import "ADDeviceWritingStyleTableViewController.h"
#import "JotTouchStatusHUD.h"
#define AdonitSDKConnectTypeTapAvailable false
@interface ADAdonitJotTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
@end
@protocol ADAdonitJotTableViewControllerDelegate
- (void) didDeselectAdonitJotTouch;
- (void) didSelectAdonitJotButtonIndex:(NSInteger)index;
- (void) didSelectOpenAdonitJotSupportURL;
- (void) didSelectAdonitJotWritingStylus;
- (void) willAdonitJotButtonTouchDown;
- (void) willAdonitJotButtonTouchUp;

@end