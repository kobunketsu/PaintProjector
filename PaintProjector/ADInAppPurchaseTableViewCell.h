//
//  InAppPurchaseTableViewCell.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBrushPreview.h"
#import "ADSimpleIAPManager.h"

@protocol ADInAppPurchaseTableViewCellDelegate
- (ADBrush *) willGetBrushByIAPFeatureIndex:(IAPProPackageFeature)feature;
@end

@interface ADInAppPurchaseTableViewCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate>
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UITableView *productFeatureTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *productFeatureCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UIButton *buyProductButton;
@property (retain, nonatomic) NSArray *productFeatures;
- (IBAction)buyProductButtonTouchUp:(UIButton *)sender;

- (BOOL)isBrushPage:(UIScrollView *)scrollView;
//控制Collection View的page属性
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)pageControlValueChanged:(UIPageControl *)sender;

//当前页面的笔刷产品
- (IBAction)brushResetButtonTouchUp:(id)sender;
@property (weak, nonatomic) IBOutlet ADBrushPreview *brushPreview;
@property (retain, nonatomic) ADBrush *brush;

- (void)prepareBrushByIAPFeatureIndex:(IAPProPackageFeature)feature;
- (void)destroyBrush;
@end
