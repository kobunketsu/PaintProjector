//
//  InAppPurchaseTableViewController.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "InAppPurchaseTableViewController.h"
#import "InAppPurchaseTableViewCell.h"
#import "AnaDrawIAPManager.h"
#import "Reachability.h"

@interface InAppPurchaseTableViewController ()
@property(retain, nonatomic)UIActivityIndicatorView *activityView;
@property(retain, nonatomic)UIAlertView *alertView;

@end

@implementation InAppPurchaseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    

}

- (void)viewWillDisappear:(BOOL)animated{
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.superViewBounds = CGRectMake(0, 0, 500, 320);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transactionSucceeded:) name:kInAppPurchaseManagerTransactionSucceededNotification object:nil];
 
    [self reload];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)transactionSucceeded:(id)arg{
    DebugLog(@"购买产品成功,刷新产品显示");
    [self.tableView reloadData];
}

- (void)reload{
    //如果应用启动时没有得到产品列表，则立即再次联网尝试获得产品列表
    if (![[AnaDrawIAPManager sharedInstance] isProductsRequested]){
        //检查是否有网络连接
        Reachability *reach = [Reachability reachabilityForInternetConnection];
        NetworkStatus netStatus = [reach currentReachabilityStatus];
        if (netStatus == NotReachable) {
            DebugLog(@"没有网络连接, 无法得到产品列表");
            self.alertView = [[UIAlertView alloc]initWithTitle:nil message:@"No access to AppStore.Please check your internet and try later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.alertView show];
        }
        else{
            [[AnaDrawIAPManager sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
                if (success) {
                    DebugLog(@"获得产品列表成功,刷新产品显示");
                    [self.tableView reloadData];
                }
                else{
                    DebugLog(@"获得产品列表失败");
                    self.alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Get products from AppStore failed. Please try later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [self.alertView show];
                }
                
                //关闭Loading指示器
                [self.activityView stopAnimating];
                [self.activityView removeFromSuperview];
                self.activityView = nil;
            }];
    
            //显示Loading指示器
            self.activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            [self.tableView addSubview:self.activityView];
            self.activityView.center = CGPointMake(self.superViewBounds.size.width * 0.5, self.superViewBounds.size.height * 0.5);
            self.activityView.hidesWhenStopped = true;
            [self.activityView startAnimating];
            
            //查询超时处理
            [self performSelector:@selector(requestProductsTimeOut:) withObject:nil afterDelay:30.0];
        }
    }
    //已经得到产品列表，直接显示
    else{
        
    }
}

- (void)requestProductsTimeOut:(id)arg{
    DebugLog(@"查询产品超时，无法得到产品列表");
    if ([[AnaDrawIAPManager sharedInstance] isRequestingProduct]) {
        //关闭Loading指示器
        [self.activityView stopAnimating];
        [self.activityView removeFromSuperview];
        self.activityView = nil;
        
        self.alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Get products from AppStore failed. Please try later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [self.alertView show];
    }
}

//改变form sheet大小
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.view.superview.bounds = self.superViewBounds;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
- (IBAction)doneButtonTouchUp:(UIButton *)sender {
    [self.delegate willPurchaseDone];
}

- (IBAction)restoreButtonTouchUp:(UIButton *)sender {
    if ([[AnaDrawIAPManager sharedInstance] isDeviceJailBroken]) {
        DebugLog(@"越狱设备禁止IAP");
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"jailbreak device can not restore product" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else{
        if ([[AnaDrawIAPManager sharedInstance] canMakePurchases]) {
            DebugLog(@"可以进行恢复");
            Reachability *reach = [Reachability reachabilityForInternetConnection];
            NetworkStatus netStatus = [reach currentReachabilityStatus];
            if (netStatus == NotReachable) {
                DebugLog(@"没有网络连接, 无法恢复产品");
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"No access to AppStore.Please check your internet and try later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            }
            else{
                [[AnaDrawIAPManager sharedInstance] restorePurchase];   
            }
        }
        else{
            DebugLog(@"设备禁止IAP");
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"InAppPurchase disabled by device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[AnaDrawIAPManager sharedInstance] products].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"inAppPurchaseTableViewCell";
    InAppPurchaseTableViewCell *cell = (InAppPurchaseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    SKProduct *product = [[[AnaDrawIAPManager sharedInstance] products] objectAtIndex:indexPath.row];
    
    if (!product) {
        return nil;
    }
    
    cell.productName.text = product.localizedTitle;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:product.priceLocale];
    NSString *formattedString = [numberFormatter stringFromNumber:product.price];

    cell.buyProductButton.tag = indexPath.row;
    
    //TODO:语言显示
    if ([[AnaDrawIAPManager sharedInstance]productPurchased:product.productIdentifier]) {
        [cell.buyProductButton setTitle:@"Purchased" forState:UIControlStateNormal];
    }
    else{
        [cell.buyProductButton setTitle:formattedString forState:UIControlStateNormal];
    }

    
    cell.productFeatures = [product.localizedDescription componentsSeparatedByString:@"."];
    
    return cell;
}

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
    [self.delegate willPurchaseDone];
}
@end
