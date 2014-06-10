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

#define IAP_Brush_Count 6

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
        [self initCustom];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCustom];
    }
    return self;
}
- (void)initCustom{
    DebugLogFuncStart(@"initCustom");
    self.productFeatureCollectionView.delegate = self;
}

- (void)prepareBrushIAPBrushId:(NSInteger)brushId{
    DebugLogFuncStart(@"prepareBrushIAPBrushId %d", brushId);
    Brush *brush = [self.delegate willGetIAPBrushWithId:brushId];
    self.brush = brush;
    [self.brushPreview prepareBrush:brush];
}

- (void)destroyBrush{
    DebugLogFuncStart(@"destroyBrush");
    [self.brush tearDownGL];
    self.brush = nil;
}

- (void)createBrushStrokeWithIAPBrushId:(NSInteger)brushId{
    DebugLogFuncStart(@"brushPreviewFlushWithIAPBrushId %d", brushId);
    
    //通过currentPage来刷新BrushPreview的内容
    Brush *brush = [self.delegate willGetIAPBrushWithId:brushId];
    self.brush = brush;
    
    //使用新的brush来刷新笔刷预览面板
    [self.brushPreview createStroke:brush];
    [self.brushPreview refresh];
}

- (void)destroyBrushStroke{
    DebugLogFuncStart(@"destroy");
    [self.brush tearDownGL];
    self.brush = nil;

    [self.brushPreview deleteStroke];
}
- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [self destroyBrushStroke];
    [self.brushPreview tearDownGL];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark- Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = 8;
    self.pageControl.numberOfPages = count;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"productFeatureCollectionViewCell";
    NSString *productFeatureDescription = nil;
    ProductFeatureCollectionViewCell *cell = (ProductFeatureCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    //配置features的图片,说明
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"Pro_extraBrushes.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription0", nil);
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"FactorsWhichDistortEffect.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription1", nil);
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            break;
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            break;
        case 4:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            break;
        case 5:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            break;
        case 6:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            break;
        case 7:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            break;
        default:
            break;
    }

    cell.descriptionLabel.text = productFeatureDescription;
    cell.descriptionLabel.numberOfLines = 10;

    return cell;
}
#pragma mark- IBAction
- (IBAction)buyProductButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"buyProductButtonTouchUp" identifier:sender];
    
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
#pragma mark- Scroll
- (IBAction)pageControlValueChanged:(UIPageControl *)sender {
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    DebugLogFuncStart(@"scrollViewWillBeginDragging");
    self.brushPreview.hidden = true;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    DebugLogFuncStart(@"scrollViewDidEndDragging");
    if (!decelerate) {
        self.brushPreview.hidden = false;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    DebugLogFuncStart(@"scrollViewDidEndDecelerating");
    self.brushPreview.hidden = false;

    CGFloat offset = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger currentPage = (NSInteger)(floorf(offset));
    if (self.pageControl.currentPage != currentPage) {
        DebugLog(@"self.pageControl.currentPage changed!");
        self.pageControl.currentPage = currentPage;
        if (self.pageControl.currentPage >= IAP_Brush_Count) {
            self.brushPreview.hidden = true;
        }
        else{
            self.brushPreview.hidden = false;
            [self prepareBrushIAPBrushId:self.pageControl.currentPage];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    DebugLogFuncUpdate(@"scrollViewDidScroll");
}

@end


