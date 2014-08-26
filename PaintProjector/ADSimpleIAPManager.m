//
//  AnaDrawIAPManager.m
//  PaintProjector
//
//  Created by kobunketsu on 14-2-24.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "ADSimpleIAPManager.h"

//#define kInAppPurchaseProUpgradeProductId @"AnaDrawProVersionPackage"
#define kProductWrapperKey @"SKProductWrapper"
#define kIAPProductListKey @"IAPProductList"

@implementation ADSimpleIAPManager
static ADSimpleIAPManager* sharedInstance = nil;

+(ADSimpleIAPManager*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"ProductList" withExtension:@"plist"];
        NSSet * productIdentifiers = [NSArray arrayWithContentsOfURL:url];
        sharedInstance = [[self alloc] initWithProductIdentifiers:productIdentifiers];
    });
    return sharedInstance;
}

- (void)requestProductsWithCompletionHandler:(RequestProductsCompletionHandler)completionHandler{
    //查询产品更新,将更新的产品信息存入本地,如果没有则从本地取出本地版本的产品信息
    [super requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            //存储products信息到本地cache
            DebugLogWriteSuccess(@"Save IAPProductList from internet to local");
            //SKProductWrapper array 转换 NSData array
            NSMutableArray *productDatas = [[NSMutableArray alloc]initWithCapacity:products.count];
            for (SKProduct *product in products) {
                SKProductWrapper *productWrapper = [[SKProductWrapper alloc]initWithSKProduct:product];
                NSMutableData *productData = [NSMutableData data];
                NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:productData];
                [archiver encodeObject:productWrapper forKey:kProductWrapperKey];
                [archiver finishEncoding];
                [productDatas addObject:productData];
            }
            [[NSUserDefaults standardUserDefaults] setObject:productDatas forKey:kIAPProductListKey];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            if (completionHandler) {
                completionHandler(YES, products);
            }
        }
        else{
            //无法联网得到产品列表，从本地cache读取预先存储的产品列表
            NSArray *productDatas = (NSArray *)[[NSUserDefaults standardUserDefaults] objectForKey:kIAPProductListKey];
            if (!productDatas) {
            }
            else{
                //NSData array 转换 SKProductWrapper array
                NSMutableArray *products = [[NSMutableArray alloc]initWithCapacity:productDatas.count];
                for (NSData *productData in productDatas) {
                    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:productData];
                    SKProductWrapper *productWrapper = (SKProductWrapper *)[unarchiver decodeObjectForKey:kProductWrapperKey];
                    [products addObject:productWrapper];
                }
                [[ADSimpleIAPManager sharedInstance] setProductsFromLocal:products];
            }
           
            if (completionHandler) {
                completionHandler(NO, products);
            }
        }
    }];
}

@end
