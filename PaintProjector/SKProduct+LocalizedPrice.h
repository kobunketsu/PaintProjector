//
//  SKProduct+LocalizedPrice.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/20/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface SKProduct (LocalizedPrice)

@property (nonatomic, readonly) NSString *localizedPrice;

@end
