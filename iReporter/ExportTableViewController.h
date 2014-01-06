//
//  ExportViewController.h
//  iReporter
//
//  Created by 胡 文杰 on 13-4-25.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ExportViewControllerDelegate
- (void) didSelectExportToEmail;
- (void) didSelectExportToDropbox;
- (void) didSelectPostToFacebook;
- (void) didSelectPostToTwitter;
- (void) didSelectPostToSinaWeibo;
- (void) didSelectExportToPhotoLibrary;
@end
@interface ExportTableViewController : UITableViewController
@property (nonatomic, assign) id delegate;
- (float)tableViewHeight;
@end
