//
//  InAppPurchaseTableViewCell.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "InAppPurchaseTableViewCell.h"
#import "ProductFeatureCollectionView.h"
#import "ProductFeatureCollectionViewCell.h"
#import "AnaDrawIAPManager.h"
#import "Reachability.h"

@interface InAppPurchaseTableViewCell()
{
    
}
@end

@implementation InAppPurchaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buyProductButtonTouchUp:(UIButton *)sender {
    SKProduct *product = [[[AnaDrawIAPManager sharedInstance] products] objectAtIndex:sender.tag];
    if (!product) {
        return;
    }

    if ([[AnaDrawIAPManager sharedInstance] isDeviceJailBroken]) {
        DebugLog(@"越狱设备禁止IAP");
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByJailbreakDevice", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        if ([[AnaDrawIAPManager sharedInstance] canMakePurchases]) {
            DebugLog(@"可以进行购买");
            
            Reachability *reach = [Reachability reachabilityForInternetConnection];
            NetworkStatus netStatus = [reach currentReachabilityStatus];
            if (netStatus == NotReachable) {
                DebugLog(@"没有网络连接, 无法购买产品");
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByNoAccess", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                [alertView show];
            }
            else{
                [[AnaDrawIAPManager sharedInstance] purchaseProduct:product];
            }

        }
        else{
            DebugLog(@"设备禁止IAP");
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByJailbreakDevice", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
            [alertView show];
        }
    }

}

#pragma mark- Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"productFeatureCollectionViewCell";
    ProductFeatureCollectionViewCell *cell = (ProductFeatureCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    NSString *productFeatureDescription = (NSString *)[self.productFeatures objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = productFeatureDescription;
    cell.descriptionLabel.numberOfLines = 3;
    return cell;
}

@end


