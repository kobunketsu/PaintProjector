//
//  ShareTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/15/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShareTableViewControllerDelegate
- (void) didSelectPostToFacebook;
- (void) didSelectPostToTwitter;
- (void) didSelectPostToSinaWeibo;
@end

@interface ShareTableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end
