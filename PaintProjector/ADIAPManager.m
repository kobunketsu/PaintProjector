//
//  AnaDrawIAPManager.m
//  PaintProjector
//
//  Created by kobunketsu on 14-2-24.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "ADIAPManager.h"

//#define kInAppPurchaseProUpgradeProductId @"AnaDrawProVersionPackage"

@implementation ADIAPManager
static ADIAPManager* sharedInstance = nil;

+(ADIAPManager*)sharedInstance{
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

//- (void)unlockLayerQuantityLimitation{
//    
//}

@end
