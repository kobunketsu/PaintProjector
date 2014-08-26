//
//  SKProductWrapper.h
//  PaintProjector
//
//  Created by 胡 文杰 on 8/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
@interface SKProductWrapper : NSObject
@property (nonatomic, retain) SKProduct *product;
@property (nonatomic, copy) NSString *localizedDescription;
@property (nonatomic, copy) NSString *localizedTitle;
@property (nonatomic, copy) NSString *productIdentifier;
@property (nonatomic, copy) NSString *localizedPrice;
+ (NSArray*)productsWithSKProductArray:(NSArray*)products;
- (id)initWithSKProduct:(SKProduct*)product;
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
@end
