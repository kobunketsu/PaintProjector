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
#import "InAppPurchaseManager.h"

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
    SKProduct *product = [[[InAppPurchaseManager sharedInstance] products] objectAtIndex:sender.tag];
    if (!product) {
        return;
    }

    [[InAppPurchaseManager sharedInstance] purchase:product];

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


