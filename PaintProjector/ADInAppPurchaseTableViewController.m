//
//  InAppPurchaseTableViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADInAppPurchaseTableViewController.h"
#import "ADInAppPurchaseTableViewCell.h"
#import "ADSimpleIAPManager.h"
#import "Reachability.h"

@interface ADInAppPurchaseTableViewController ()
@property(retain, nonatomic)UIActivityIndicatorView *activityView;
@property(retain, nonatomic)UIAlertView *alertView;

@end

@implementation ADInAppPurchaseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    DebugLogSystem(@"viewWillAppear");
    if([self.tableView numberOfSections] == 0){
        return;
    }

    if([self.tableView numberOfRowsInSection:0] == 0){
        return;
    }
    
    ADInAppPurchaseTableViewCell *cell = (ADInAppPurchaseTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    if(self.brushPreviewDelegate){
        cell.brushPreview.delegate = self.brushPreviewDelegate;
        cell.brushPreview.lastBrushState = [cell.brushPreview.delegate willGetLastBrushState];
        
        //初始化brushPreview的绘制
        [cell destroyBrush];
        [cell.brushPreview tearDownGL];
        
        [cell.brushPreview setupGL];
        [cell prepareBrushByIAPFeatureIndex:self.iapProPackageFeature];
        
        cell.pageControl.currentPage = self.iapProPackageFeature;
    }
}

- (void)viewWillLayoutSubviews{
    DebugLogSystem(@"viewWillLayoutSubviews");
    self.view.superview.bounds = self.superViewBounds;

    if([self.tableView numberOfSections] == 0){
        return;
    }
    
    if([self.tableView numberOfRowsInSection:0] == 0){
        return;
    }
    
    ADInAppPurchaseTableViewCell *cell = (ADInAppPurchaseTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    if([cell.productFeatureCollectionView numberOfItemsInSection:0] == 0){
        return;
    }

    cell.pageControl.currentPage = self.iapProPackageFeature;
    CGPoint offset = cell.productFeatureCollectionView.contentOffset;
    offset.x = cell.productFeatureCollectionView.bounds.size.width * self.iapProPackageFeature;
    cell.productFeatureCollectionView.contentOffset = offset;
    
    [cell isBrushPage:cell.productFeatureCollectionView];
}

- (void)viewWillDisappear:(BOOL)animated{
    DebugLogSystem(@"viewWillDisappear");
    if([self.tableView numberOfSections] == 0){
        return;
    }
    
    if([self.tableView numberOfRowsInSection:0] == 0){
        return;
    }
    ADInAppPurchaseTableViewCell *cell = (ADInAppPurchaseTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

    [cell.brushPreview.delegate willSetLastBrushState:cell.brushPreview.lastBrushState];
    [cell destroyBrush];
    [cell.brushPreview tearDownGL];

}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.superViewBounds = CGRectMake(0, 0, 500, 380);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(IAPTransactionSucceeded:) name:kInAppPurchaseManagerTransactionSucceededNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(IAPTransactionFailed:) name:kInAppPurchaseManagerTransactionFailedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(IAPTransactionEnded:) name:kInAppPurchaseManagerTransactionEndedNotification object:nil];
    
    ((ADSimpleIAPManager *)[ADSimpleIAPManager sharedInstance]).delegate = self;
 
    [self reload];
}

- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kInAppPurchaseManagerTransactionSucceededNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kInAppPurchaseManagerTransactionFailedNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kInAppPurchaseManagerTransactionEndedNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)lockInteraction:(BOOL)lock{
    self.view.userInteractionEnabled = !lock;
}
#pragma mark - 交易Purchase

- (void)IAPTransactionSucceeded:(id)arg{
    DebugLog(@"购买产品成功,刷新产品显示");
    [self.tableView reloadData];
    [self lockInteraction:false];
}
- (void)IAPTransactionFailed:(id)arg{
    DebugLog(@"购买产品失败");
    [self lockInteraction:false];
}
- (void)IAPTransactionEnded:(id)arg{
    DebugLog(@"购买产品结束");
    [self lockInteraction:false];
}

- (void)reload{
    //如果应用启动时没有得到产品列表，则立即再次联网尝试获得产品列表
    if (![[ADSimpleIAPManager sharedInstance] isProductsRequested]){
        //检查是否有网络连接
//        Reachability *reach = [Reachability reachabilityForInternetConnection];
//        NetworkStatus netStatus = [reach currentReachabilityStatus];
//        if (netStatus == NotReachable) {
//            DebugLog(@"没有网络连接, 无法得到产品列表");
//            self.alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByNoInternetAccess", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
//            [self.alertView show];
//        }
//        else{
            [[ADSimpleIAPManager sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
                if (success) {
                    DebugLog(@"获得产品列表更新成功,刷新产品显示");
                    [self.tableView reloadData];
                }
                else{
                    if (!products) {
                        DebugLog(@"获得产品列表更新失败,没有本地保存的产品列表，请求联网");
                        self.alertView = [[UIAlertView alloc]initWithTitle:nil message:NSLocalizedString(@"IAPUnavailableByRetreiveProductsFailure", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                        [self.alertView show];
                    }
                    else{
                        DebugLog(@"获得产品列表更新失败,显示本地保存的产品列表");
                    }
                }
                
                //关闭Loading指示器
                if (self.activityView) {
                    [self.activityView stopAnimating];
                    [self.activityView removeFromSuperview];
                    self.activityView = nil;
                }
            }];
    
            //显示Loading指示器
            self.activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            [self.tableView addSubview:self.activityView];
            self.activityView.center = CGPointMake(self.superViewBounds.size.width * 0.5, self.superViewBounds.size.height * 0.5);
            self.activityView.hidesWhenStopped = true;
            [self.activityView startAnimating];
            
            //查询超时处理
//            [self performSelector:@selector(requestProductsTimeOut:) withObject:nil afterDelay:10.0];
//        }
    }
    //已经得到产品列表，直接显示
    else{
        
    }
}

- (void)requestProductsTimeOut:(id)arg{
    DebugLog(@"查询产品超时，无法得到产品列表");
    if ([[ADSimpleIAPManager sharedInstance] isRequestingProduct]) {
        //关闭Loading指示器
        if (self.activityView) {
            [self.activityView stopAnimating];
            [self.activityView removeFromSuperview];
            self.activityView = nil;
        }
        self.alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"IAPUnavailableByRetreiveProductsFailure", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [self.alertView show];
    }
}



#pragma mark - UI
- (IBAction)doneButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"IAP_doneButtonTouchUp" identifier:sender];
    [self.delegate willIAPPurchaseDone];
}

- (IBAction)restoreButtonTouchUp:(UIButton *)sender {
    [RemoteLog logAction:@"IAP_restoreButtonTouchUp" identifier:sender];
    [self willBuyProductByIndex:0 orRestoreAll:true];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[ADSimpleIAPManager sharedInstance] products].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"inAppPurchaseTableViewCell";
    ADInAppPurchaseTableViewCell *cell = (ADInAppPurchaseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    SKProductWrapper *product = [[[ADSimpleIAPManager sharedInstance] products] objectAtIndex:indexPath.row];
    
    if (!product) {
        DebugLogError(@"no product available!");
        return nil;
    }
    //产品名字 减去-之后的部分
    NSString *productName = [product.localizedTitle componentsSeparatedByString:@"-"].firstObject;
    cell.productName.text = productName;

    //产品价格
    cell.buyProductButton.tag = indexPath.row;
     //TODO:语言显示
    if ([[ADSimpleIAPManager sharedInstance]productPurchased:product.productIdentifier]) {
        [cell.buyProductButton setTitle:NSLocalizedString(@"Purchased", nil) forState:UIControlStateNormal];
    }
    else{
        [cell.buyProductButton setTitle:product.localizedPrice forState:UIControlStateNormal];
    }

    //产品特性
    cell.productFeatures = [product.localizedDescription componentsSeparatedByString:@"."];

    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    [(ADInAppPurchaseTableViewCell *)cell isBrushPage:tableView];
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 200;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.titleView;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 66;
//}

#pragma mark- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self.delegate willIAPPurchaseDone];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        [RemoteLog logAction:@"IAP_boughtConfirmed" identifier:nil];
    }
}

#pragma mark- InAppPurchaseTableViewCellDelegate
- (ADBrush *)willGetBrushByIAPFeatureIndex:(IAPProPackageFeature)feature{
    return [self.delegate willGetBrushByIAPFeatureIndex:feature];
}
-(void)willStartPurchase{
    [self lockInteraction:true];
}

- (void)buyProduct:(SKProduct *)product orRestoreAll:(BOOL)restore{
    if (restore) {
        DebugLog(@"恢复产品");
        [[ADSimpleIAPManager sharedInstance] restorePurchase];
    }
    else{
        DebugLog(@"购买产品");
        [[ADSimpleIAPManager sharedInstance] purchaseProduct:product];
    }
}

- (void)willBuyProductByIndex:(NSInteger)productIndex orRestoreAll:(BOOL)restore{
#if TESTFLIGHT //|| DEBUG
    DebugLog(@"测试直接提供IAP");
    [[ADSimpleIAPManager sharedInstance] testflightPurchase];
    return;
#endif
    
    if ([[ADSimpleIAPManager sharedInstance] isDeviceJailBroken]) {
        DebugLog(@"越狱设备禁止IAP");
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"IAPUnavailableByJailbreakDevice", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        if ([[ADSimpleIAPManager sharedInstance] canMakePurchases]) {
            DebugLog(@"设备已打开IAP");
            
            Reachability *reach = [Reachability reachabilityForInternetConnection];
            NetworkStatus netStatus = [reach currentReachabilityStatus];
            if (netStatus == NotReachable) {
                DebugLog(@"没有网络连接, 无法购买产品");
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"IAPUnavailableByNoInternetAccess", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                [alertView show];
            }
            else{
                DebugLog(@"有网络连接");
                SKProductWrapper *productWrapper = [[[ADSimpleIAPManager sharedInstance] products] objectAtIndex:productIndex];
                __block SKProduct *product = productWrapper.product;
                if (!product) {
                    //有产品为空，说明未更新过产品
                    DebugLog(@"申请下载产品列表");
                    //之前一直是断网状态下读取本地SKProductWrapper,内部的SKProduct为空, 重新联网刷新product数据
                    [[ADSimpleIAPManager sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
                        if (success) {
                            DebugLog(@"下载到最新的产品列表");
                            [self lockInteraction:true];
                            [self buyProduct:(SKProduct *)products[productIndex] orRestoreAll:restore];
                        }
                        else{
                            DebugLog(@"但无法得到产品列表");
                            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"IAPUnavailableByRetreiveProductsFailure", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
                            [alertView show];
                        }
                    }];
                }
                else{
                    DebugLog(@"本地有最新的产品列表");
                    [self lockInteraction:true];
                    [self buyProduct:product orRestoreAll:restore];
                }
            }
        }
        else{
            DebugLog(@"设备禁止IAP");
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:NSLocalizedString(@"IAPUnavailableByDevice", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
}
#pragma mark- ADSimpleIAPManagerDelegate
- (void)willNotifyUserIAPProductContentProvided{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"ThankForPurchaseTitle", nil) message:NSLocalizedString(@"ThankForPurchase", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil];
    alertView.tag = 1;
    [alertView show];
}

@end
