//
//  ProductInfoTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 3/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProductInfoTableViewControllerDelegate
- (void) willOpenWelcomGuideURL;
- (void) willOpenUserManualURL;
- (void) willOpenSupportURL;
- (void) willOpenGalleryURL;
- (void) willOpenTutorial;
@end

@interface ProductInfoTableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end
