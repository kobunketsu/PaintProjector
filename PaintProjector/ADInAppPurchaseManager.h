//
//  InAppPurchaseManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/20/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#define kInAppPurchaseManagerProductsFetchedNotification @"kInAppPurchaseManagerProductsFetchedNotification"

// add a couple notifications sent out when the transaction completes
#define kInAppPurchaseManagerTransactionFailedNotification @"kInAppPurchaseManagerTransactionFailedNotification"
#define kInAppPurchaseManagerTransactionSucceededNotification @"kInAppPurchaseManagerTransactionSucceededNotification"

typedef void (^RequestProductsCompletionHandler)(BOOL success, NSArray * products);

@interface ADInAppPurchaseManager : NSObject<SKProductsRequestDelegate, SKPaymentTransactionObserver>
{
    SKProduct *proUpgradeProduct;
    SKProductsRequest *productsRequest;
    RequestProductsCompletionHandler _completionHandler;
}
@property(retain, nonatomic)NSSet *productIdentifiers;
@property (retain, nonatomic) NSMutableSet *purchasedProductIdentifiers;
@property(retain, nonatomic, readonly)NSArray *products;
@property(assign, nonatomic, getter = isProductsRequested)BOOL productsRequested;

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers;
- (BOOL)isDeviceJailBroken;
- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler;
- (BOOL)isRequestingProduct;
- (BOOL)canMakePurchases;
- (void)purchaseProduct:(SKProduct*)product;
- (void)restorePurchase;
- (BOOL)productPurchased:(NSString *)productIdentifier;
@end
