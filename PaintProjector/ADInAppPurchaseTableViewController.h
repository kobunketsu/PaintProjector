//
//  InAppPurchaseTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADInAppPurchaseTableViewCell.h"

@interface ADInAppPurchaseTableViewController : UITableViewController
<UIAlertViewDelegate,
ADInAppPurchaseTableViewCellDelegate>
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (assign, nonatomic) CGRect superViewBounds;
@property (assign, nonatomic) id brushPreviewDelegate;
- (IBAction)doneButtonTouchUp:(UIButton *)sender;
- (IBAction)restoreButtonTouchUp:(UIButton *)sender;
//产品特点索引号
@property (assign, nonatomic) NSInteger iapProductProPackageFeatureIndex;
@end

@protocol ADInAppPurchaseTableViewControllerDelegate
- (void) willIAPPurchaseDone;
- (ADBrush*) willIAPGetBrushById:(NSInteger)brushId;
@end