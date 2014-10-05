//
//  InAppPurchaseManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/20/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADInAppPurchaseManager.h"
#import "BBXBeeblex.h"
#import "BBXIAPTransaction.h"

typedef NS_ENUM(NSInteger, BBTransactionResult) {
    TransactionValidated        = 0,
    TransactionDuplicate        = 1,
    TransactionInvalid          = 2,
    TransactionNoNetwork        = 3,
    TransactionServerError      = 4,
};

@implementation ADInAppPurchaseManager

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers {
    self = [super init];
    if (self) {
        //custom initialize
        _productIdentifiers = productIdentifiers;
        
        // Check for previously purchased products
        _purchasedProductIdentifiers = [NSMutableSet set];
        for (NSString * productIdentifier in _productIdentifiers) {
            BOOL productPurchased = [[NSUserDefaults standardUserDefaults] boolForKey:productIdentifier];
            if (productPurchased) {
                [_purchasedProductIdentifiers addObject:productIdentifier];
                DebugLogWarn(@"Previously purchased: %@", productIdentifier);
            }
            else {
                DebugLogWarn(@"Not purchased: %@", productIdentifier);
            }
        }
        
        // restarts any purchases if they were interrupted last time the app was open
        DebugLog(@"跟踪交易");
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    }
    return self;
}

- (void)dealloc{
    DebugLogSystem(@"移除跟踪交易");
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler
{
    DebugLogFuncStart(@"请求产品列表");
    if (completionHandler) {
        _completionHandler = [completionHandler copy];
    }

    
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:self.productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
    
    
    // we will release the request object in the delegate callback
}

- (void)setProductsFromLocal:(NSArray*)products{
    _products = products;
}

- (BOOL)isRequestingProduct{
    return productsRequest != nil;
}
#pragma mark -
#pragma mark SKProductsRequestDelegate methods

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    DebugLogSystem(@"从AppStore得到产品列表.");
    self.productsRequested = true;
    NSArray *products = response.products;
    _products = [SKProductWrapper productsWithSKProductArray:products];
    
    if (products.count == 0) {
        DebugLogWarn(@"没有产品, 无法购买");
        return;
    }
    NSLocale *local = [NSLocale currentLocale];
    DebugLog(@"当前本地化 %@",local.localeIdentifier);

    DebugLog(@"付费产品数量: %d", [products count]);
    for (SKProductWrapper *product in products) {
        DebugLog(@"产品标题: %@" , product.localizedTitle);
        DebugLog(@"产品描述: %@" , product.localizedDescription);
        DebugLog(@"产品价格: %@" , product.localizedPrice);
        DebugLog(@"产品标识: %@" , product.productIdentifier);
    }
    
    for (NSString *invalidProductId in response.invalidProductIdentifiers)
    {
        DebugLogError(@"产品号不存在: %@" , invalidProductId);
    }
    
    // finally release the reqest we alloc/init’ed in requestProUpgradeProductData
    productsRequest = nil;

    if (_completionHandler) {
        _completionHandler(YES, products);
        _completionHandler = nil;
    }

    [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerProductsFetchedNotification object:self userInfo:nil];
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    DebugLogSystem(@"无法从AppStore得到产品列表.");
    self.productsRequested = false;
    productsRequest = nil;
    
    if (_completionHandler) {
        _completionHandler(NO, nil);
        _completionHandler = nil;
    }
}
#pragma mark-
#pragma Public methods
//
// call this method once on startup
//
//- (void)loadStore
//{
//    DebugLog(@"加载商店");
//    
//    // get the product description (defined in early sections)
//    [self requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
//        //add completion handle here
//        if (success) {
//
//        }
//    }];
//}

//
// call this before making a purchase
//
- (BOOL)canMakePurchases
{
    return [SKPaymentQueue canMakePayments];
}
//
// kick off the upgrade transaction
//
- (void)purchaseProduct:(SKProduct*)product
{
    DebugLog(@"将购买产品加入购买列表");
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:product.priceLocale];
    NSString *formattedString = [numberFormatter stringFromNumber:product.price];
    
    DebugLog(@"购买产品: %@ 价格: %@", product.localizedTitle, formattedString);
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)restorePurchase{
    DebugLog(@"恢复购买");
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (BOOL)productPurchased:(NSString *)productIdentifier {
    return [_purchasedProductIdentifiers containsObject:productIdentifier];
}

#pragma mark- Device JailBreak
//
// call this to diable IAP
//
- (BOOL)isDeviceJailBroken{
    if ([[NSFileManager defaultManager]fileExistsAtPath:@"/Applications/Cydia.app"]) {
        DebugLogError(@"Jialbreak detected");
        return true;
    }
    return false;
}

#pragma mark- Beeblex Verifying receipts
- (void)validateReceipt:(SKPaymentTransaction *)transaction restore:(BOOL)restore {
    __block BBTransactionResult transactionResult = 2;
    if (![BBXIAPTransaction canValidateTransactions]) {
        transactionResult = TransactionNoNetwork;
        DebugLogWarn(@"没有网络连接,无法验证交易.请连接网络后尝试");
        return; // There is no connectivity to reach the server.
        // You should try the validation at a later date.
    }
    
    BBXIAPTransaction *bbxTransaction = [[BBXIAPTransaction alloc] initWithTransaction:transaction];
    bbxTransaction.useSandbox = YES;
    
    [bbxTransaction validateWithCompletionBlock:^(NSError *error) {
        
        if (bbxTransaction.transactionVerified) {
            if (bbxTransaction.transactionIsDuplicate) {
                // The transaction is valid, but duplicate - it has already been
                // sent to Beeblex in the past.
                transactionResult = TransactionDuplicate;
                DebugLogWarn(@"验证交易已存在");
                [self finishTransaction:transaction wasSuccessful:YES];
            }
            else {
                
                // The transaction has been successfully validated
                // and is unique.
                
                DebugLog(@"交易数据: %@", bbxTransaction.validatedTransactionData);
                transactionResult = TransactionValidated;
                DebugLog(@"验证交易成功,提供产品下载");
                if (restore) {
                    [self provideContent:transaction.originalTransaction.payment.productIdentifier];
                }
                else{
                    [self provideContent:transaction.payment.productIdentifier];
                }

                [self finishTransaction:transaction wasSuccessful:YES];
            }

        } else {
            
            // Check whether this is a validation error, or if something
            // went wrong with Beeblex.
            
            if (bbxTransaction.hasServerError) {
                
                // The error was not caused by a problem with the data, but is
                // most likely due to some transient networking issues.
                transactionResult = TransactionServerError;
                DebugLogWarn(@"验证交易服务器错误,请稍后尝试");
                [self cancelTransaction:transaction];
            }
            else {
                
                // The transaction supplied to the validation service was not valid according to Apple.
                transactionResult = TransactionInvalid;
                DebugLogWarn(@"验证交易失败");
                [self finishTransaction:transaction wasSuccessful:NO];
            }
            
        }
       
    }];
}

#pragma mark-
#pragma Purchase helpers
//
// saves a record of the transaction by storing the receipt to disk
//

//- (void)recordTransaction:(SKPaymentTransaction *)transaction
//{
//    DebugLog(@"记录交易,交易记录保存到磁盘存储收据");
//    if ([transaction.payment.productIdentifier isEqualToString:kInAppPurchaseProUpgradeProductId])
//    {
//        // save the transaction receipt to disk
//        NSString *productTransactionReceipt = [transaction.payment.productIdentifier stringByAppendingString:@"Receipt"];
//        [[NSUserDefaults standardUserDefaults] setValue:transaction.transactionReceipt forKey:@"proUpgradeTransactionReceipt" ];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
//}

- (void)recordTransaction:(SKPaymentTransaction *)transaction
{
    DebugLogSystem(@"记录交易,交易记录保存到磁盘存储收据");
    // save the transaction receipt to disk
    NSString *productTransactionReceipt = [transaction.payment.productIdentifier stringByAppendingString:@"Receipt"];
    NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:receiptURL];
    if(!receipt) {
        /* No local receipt -- handle the error. */
    }
    NSString *jsonObjectString = [receipt base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [[NSUserDefaults standardUserDefaults] setValue:jsonObjectString forKey:productTransactionReceipt];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//
// enable pro features
//
- (void)provideContent:(NSString *)productIdentifier
{
    
    [_purchasedProductIdentifiers addObject:productIdentifier];
}
//
// removes the transaction from the queue and posts a notification with the transaction result
//
- (void)cancelTransaction:(SKPaymentTransaction *)transaction{
    DebugLogFuncStart(@"取消交易");
    [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionCanceledNotification object:self userInfo:nil];
}
- (void)finishTransaction:(SKPaymentTransaction *)transaction wasSuccessful:(BOOL)wasSuccessful
{
    DebugLogFuncStart(@"结束交易");
    // remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:transaction, @"transaction" , nil];
    if (wasSuccessful)
    {
        // send out a notification that we’ve finished the transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionSucceededNotification object:self userInfo:userInfo];
    }
    else
    {
        // send out a notification for the failed transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionFailedNotification object:self userInfo:userInfo];
    }
}
//
// called when the transaction was successful
//
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    DebugLogFuncStart(@"完成交易,验证收据中");
    [self validateReceipt:transaction restore:NO];
}
//
// called when a transaction has been restored and and successfully completed
//
- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
    DebugLogFuncStart(@"恢复交易,验证收据中");
    [self validateReceipt:transaction restore:YES];
}

- (void)waitContinueTransaction{
    DebugLogFuncStart(@"等待继续交易");
}
//
// called when a transaction has failed
//
- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    switch (transaction.error.code) {
            
        case SKErrorUnknown:
            
            NSLog(@"SKErrorUnknown");
            
            break;
            
        case SKErrorClientInvalid:
            
            NSLog(@"SKErrorClientInvalid");
            
            break;
            
        case SKErrorPaymentCancelled:
            
            NSLog(@"SKErrorPaymentCancelled");
            
            break;
            
        case SKErrorPaymentInvalid:
            
            NSLog(@"SKErrorPaymentInvalid");
            
            break;
            
        case SKErrorPaymentNotAllowed:
            
            NSLog(@"SKErrorPaymentNotAllowed");
            
            break;
            
        default:
            
            NSLog(@"No Match Found for error");
            
            break;
            
    }
    
    NSLog(@"交易失败 %@",[transaction.error description]);

    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        // error!
        [self finishTransaction:transaction wasSuccessful:NO];
    }
    else
    {
        // this is fine, the user just cancelled, so don’t notify
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        [self cancelTransaction:transaction];
    }
}
#pragma mark -
#pragma mark SKPaymentTransactionObserver methods
//
// called when the transaction status is updated
//
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    DebugLogFuncStart(@"付款队列更新交易状态");
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
            default:
                [self waitContinueTransaction];
                break;
        }
    }
}

@end
