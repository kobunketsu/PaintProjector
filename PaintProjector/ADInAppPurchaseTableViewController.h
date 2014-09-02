//
//  InAppPurchaseTableViewController.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADInAppPurchaseTableViewCell.h"
#import "ADSimpleIAPManager.h"

@interface ADInAppPurchaseTableViewController : UITableViewController
<UIAlertViewDelegate,
SimpleIAPManagerDelegate,
ADInAppPurchaseTableViewCellDelegate>
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (assign, nonatomic) CGRect superViewBounds;
@property (assign, nonatomic) id brushPreviewDelegate;
- (IBAction)doneButtonTouchUp:(UIButton *)sender;
- (IBAction)restoreButtonTouchUp:(UIButton *)sender;
//产品特点索引号
@property (assign, nonatomic) IAPProPackageFeature iapProPackageFeature;
@end

@protocol ADInAppPurchaseTableViewControllerDelegate
- (void) willIAPPurchaseDone;
- (ADBrush*) willGetBrushByIAPFeatureIndex:(IAPProPackageFeature)feature;
@end