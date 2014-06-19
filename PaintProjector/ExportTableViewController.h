//
//  ExportViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-25.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ExportViewControllerDelegate
- (void) didSelectExportToEmail;
- (void) didSelectExportToDropbox;
- (void) didSelectExportToPhotoLibrary;
- (void) didSelectPostToFacebook;
- (void) didSelectPostToTwitter;
- (void) didSelectPostToSinaWeibo;
@end
@interface ExportTableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end
