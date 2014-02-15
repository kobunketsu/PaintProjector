//
//  ImportViewController.h
//  iReporter
//
//  Created by 胡 文杰 on 13-4-20.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImportTableViewControllerDelegate
- (void) didSelectImportPhoto;
- (void) didSelectImportCamera;
- (void) didSelectImportDropbox;
@end
@interface ImportTableViewController : UITableViewController
{
}
@property (assign, nonatomic) id delegate;
- (float)tableViewHeight;


@end
