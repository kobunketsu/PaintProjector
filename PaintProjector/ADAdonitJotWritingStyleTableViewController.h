//
//  ADAdonitJotWritingStyleTableViewController.h
//  PaintProjector
//
//  Created by 文杰 胡 on 2/4/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADSharedPopTableViewController.h"
#import <JotTouchSDK/JotTouchSDK.h>
@interface ADAdonitJotWritingStyleTableViewController : ADSharedPopTableViewController
+ (NSString*)writingStyleName:(JotWritingStyle)writingStyle;
@property (assign, nonatomic) id delegate;
@end

@protocol ADAdonitJotWritingStyleTableViewControllerDelegate
- (void)didSelectConnectDeviceWritingStyle;
@end
