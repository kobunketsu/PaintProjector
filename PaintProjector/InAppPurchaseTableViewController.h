//
//  InAppPurchaseTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InAppPurchaseTableViewCell.h"

@interface InAppPurchaseTableViewController : UITableViewController
<UIAlertViewDelegate,
InAppPurchaseTableViewCellDelegate>
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (assign, nonatomic) CGRect superViewBounds;
@property (assign, nonatomic) id brushPreviewDelegate;
- (IBAction)doneButtonTouchUp:(UIButton *)sender;
- (IBAction)restoreButtonTouchUp:(UIButton *)sender;
//产品特点索引号
@property (assign, nonatomic) NSInteger iapProductProPackageFeatureIndex;
@end

@protocol InAppPurchaseTableViewControllerDelegate
- (void) willIAPPurchaseDone;
- (Brush*) willIAPGetBrushById:(NSInteger)brushId;
@end