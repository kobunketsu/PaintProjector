//
//  InAppPurchaseTableViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InAppPurchaseTableViewCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *productFeatureTableView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UIButton *buyProductButton;
@property (retain, nonatomic) NSArray *productFeatures;
- (IBAction)buyProductButtonTouchUp:(UIButton *)sender;

@end
