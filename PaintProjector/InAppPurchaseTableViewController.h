//
//  InAppPurchaseTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InAppPurchaseTableViewController : UITableViewController
<UIAlertViewDelegate>
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (assign, nonatomic) CGRect superViewBounds;
- (IBAction)doneButtonTouchUp:(UIButton *)sender;
- (IBAction)restoreButtonTouchUp:(UIButton *)sender;


@end

@protocol InAppPurchaseTableViewControllerDelegate
- (void) willPurchaseDone;
@end