//
//  ShareTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ADShareTableViewControllerDelegate
- (void) didSelectPostToFacebook;
- (void) didSelectPostToTwitter;
- (void) didSelectPostToSinaWeibo;
- (void) didSelectPostToEmail;
@end

@interface ADShareTableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end
