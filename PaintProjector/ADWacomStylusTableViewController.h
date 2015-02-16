//
//  ADWacomIntuosCreativeStylusTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/3/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"
#import <WacomDevice/WacomDeviceFramework.h>
#import "WacomDevice+Extension.h"
#import "TrackedTouch+Extension.h"

@interface ADWacomStylusTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
@end
@protocol ADWacomStylusTableViewControllerDelegate
- (void) didDeselectWacomStylus;
- (void) didSelectWacomStylusButtonIndex:(NSInteger)index;
- (void) didSelectOpenWacomStylusSupportURL;
- (void) didSelectWacomStylusWritingStylus;
//- (void) willWacomStylusButtonTouchDown;
//- (void) willWacomStylusButtonTouchUp;

@end