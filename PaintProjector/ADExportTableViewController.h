//
//  ExportViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-25.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADSharedPopTableViewController.h"
@protocol ADExportViewControllerDelegate
- (void) didSelectExportToEmail;
- (void) didSelectExportToDropbox;
- (void) didSelectExportToPhotoLibrary;
- (void) didSelectExportToSocialName:(NSString*)socialName;
@end
@interface ADExportTableViewController : ADSharedPopTableViewController
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;
@end
