//
//  ImportViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-4-20.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADImportTableViewControllerDelegate
- (void) didSelectImportPhoto;
- (void) didSelectImportCamera;
- (void) didSelectImportDropbox;
@end
@interface ADImportTableViewController : UITableViewController
{
}
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;


@end
