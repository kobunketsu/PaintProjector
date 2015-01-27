//
//  AnaDrawIAPManager.h
//  PaintProjector
//
//  Created by kobunketsu on 14-2-24.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "ADInAppPurchaseManager.h"
#import "ADBrush.h"
typedef void (^BuyRequestProductsCompletionHandler)(BOOL success, NSArray * products);

typedef NS_ENUM(NSUInteger, IAPProPackageFeature)
{
    Pro_ReversePaint,
    Pro_Crayons,
    Pro_Finger,
    Pro_MarkerSquare,
    Pro_AirBrush,
    Pro_ChineseBrush,
    Pro_OilBrush,
    Pro_Swatches,
};


@interface ADSimpleIAPManager : ADInAppPurchaseManager
+(id)sharedInstance;
@property(assign, nonatomic) id delegate;
- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler;
- (void)testflightPurchase;
@end

@protocol SimpleIAPManagerDelegate
- (void)willNotifyUserIAPProductContentProvided;
@end