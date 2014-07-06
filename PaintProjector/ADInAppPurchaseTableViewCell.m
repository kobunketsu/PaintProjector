//
//  InAppPurchaseTableViewCell.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADInAppPurchaseTableViewCell.h"
#import "ADProductFeatureCollectionView.h"
#import "ADProductFeatureCollectionViewCell.h"
#import "ADIAPManager.h"
#import "Reachability.h"

#define IAP_Brush_Count 6
#define BrushPreviewFadeAnimationDuration 0.1

@interface ADInAppPurchaseTableViewCell()
{
    
}
@end

@implementation ADInAppPurchaseTableViewCell

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
    ADBrush *brush = [self.delegate willGetIAPBrushWithId:brushId];
    brush.delegate = self.brushPreview;
    self.brush = brush;
    [self.brushPreview clear];
    [self.brushPreview prepareBrush:brush];
}

- (void)destroyBrush{
    DebugLogFuncStart(@"destroyBrush");
    if (self.brush) {
        [self.brush tearDownGL];
        self.brush = nil;
    }
}

- (void)createBrushStrokeWithIAPBrushId:(NSInteger)brushId{
    DebugLogFuncStart(@"brushPreviewFlushWithIAPBrushId %d", brushId);
    
    //通过currentPage来刷新BrushPreview的内容
    ADBrush *brush = [self.delegate willGetIAPBrushWithId:brushId];
    self.brush = brush;
    
    //使用新的brush来刷新笔刷预览面板
    [self.brushPreview createStroke:brush];
    [self.brushPreview refreshStroke];
}

- (void)destroyBrushStroke{
    DebugLogFuncStart(@"destroy");
    if (self.brush) {
        [self.brush tearDownGL];
        self.brush = nil;
    }

    [self.brushPreview deleteStroke];
}

- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [self destroyBrush];
    [self.brushPreview tearDownGL];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark- Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger count = 7;
    self.pageControl.numberOfPages = count;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"productFeatureCollectionViewCell";
    NSString *productFeatureDescription = nil;
    NSString *productFeatureTitle = nil;
    ADProductFeatureCollectionViewCell *cell = (ADProductFeatureCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    //配置features的图片,说明
    cell.resetButton.hidden = false;
    cell.tryLabel.hidden = false;

    cell.titleLabel.textColor = [UIColor colorWithRed:50/255.0 green:50 / 255.0 blue:50 / 255.0 alpha:1];
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"iap_brushCrayons.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription0", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle0", nil);
//            cell.titleLabel.textColor = [UIColor colorWithRed:126.0/255.0 green:44.0 / 255.0 blue:99.0 / 255.0 alpha:1];
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"iap_brushFinger.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription1", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle1", nil);
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"iap_brushMarkerHard.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription2", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle2", nil);
            break;
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"iap_brushAirbrush.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription3", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle3", nil);
            break;
        case 4:
            cell.imageView.image = [UIImage imageNamed:@"iap_brushChineseBrush.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription4", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle4", nil);
            break;
        case 5:
            cell.imageView.image = [UIImage imageNamed:@"iap_brushOilBrush.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription5", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle5", nil);
            break;
        case 6:
            cell.imageView.image = [UIImage imageNamed:@"Pro_pallete.png"];
            productFeatureDescription = NSLocalizedString(@"ProductFeatureDescription6", nil);
            productFeatureTitle = NSLocalizedString(@"ProductFeatureTitle6", nil);
            cell.resetButton.hidden = true;
            cell.tryLabel.hidden = true;
            break;
        default:
            break;
    }
    cell.titleLabel.text = productFeatureTitle;
    cell.descriptionLabel.text = productFeatureDescription;
    [cell.descriptionLabel alignTop];
    cell.descriptionLabel.numberOfLines = 10;

    return cell;
}
#pragma mark- IBAction
- (IBAction)buyProductButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"buyProductButtonTouchUp" identifier:sender];
    
    SKProduct *product = [[[ADIAPManager sharedInstance] products] objectAtIndex:sender.tag];
    if (!product) {
        return;
    }
    
    if ([[ADIAPManager sharedInstance] isDeviceJailBroken]) {
        DebugLog(@"越狱设备禁止IAP");
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByJailbreakDevice", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        if ([[ADIAPManager sharedInstance] canMakePurchases]) {
            DebugLog(@"可以进行购买");
            
            Reachability *reach = [Reachability reachabilityForInternetConnection];
            NetworkStatus netStatus = [reach currentReachabilityStatus];
            if (netStatus == NotReachable) {
                DebugLog(@"没有网络连接, 无法购买产品");
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByNoAccess", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                [alertView show];
            }
            else{
                [[ADIAPManager sharedInstance] purchaseProduct:product];
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
- (BOOL)isBrushPage:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger currentPage = (NSInteger)(floorf(offset));
    if (currentPage >= IAP_Brush_Count) {
        self.brushPreview.hidden = true;
        return false;
    }
    else{
        return true;
    }
}
- (IBAction)pageControlValueChanged:(UIPageControl *)sender {
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    DebugLogFuncStart(@"scrollViewWillBeginDragging");
    self.brushPreview.hidden = true;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    DebugLogFuncStart(@"scrollViewDidEndDragging");
    if (!decelerate) {
        if ([self isBrushPage:scrollView]) {
            [self.brushPreview unhiddenAnimationWithDuration:BrushPreviewFadeAnimationDuration completion:nil];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    DebugLogFuncStart(@"scrollViewDidEndDecelerating");

    CGFloat offset = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger currentPage = (NSInteger)(floorf(offset));
   
    if (self.pageControl.currentPage != currentPage) {
        DebugLog(@"self.pageControl.currentPage changed!");
        self.pageControl.currentPage = currentPage;
        if (self.pageControl.currentPage >= IAP_Brush_Count) {
            self.brushPreview.hidden = true;
        }
        else{
            [self.brushPreview unhiddenAnimationWithDuration:BrushPreviewFadeAnimationDuration completion:nil];
            [self prepareBrushIAPBrushId:self.pageControl.currentPage];
        }
    }
    else{
        if (self.pageControl.currentPage >= IAP_Brush_Count) {
            self.brushPreview.hidden = true;
        }
        else{
            [self.brushPreview unhiddenAnimationWithDuration:BrushPreviewFadeAnimationDuration completion:nil];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    DebugLogFuncUpdate(@"scrollViewDidScroll");
}

#pragma mark- Reset
- (IBAction)brushResetButtonTouchUp:(id)sender {
    DebugLogIBAction(@"brushResetButtonTouchUp");
    [self.brushPreview reset];
}
@end


