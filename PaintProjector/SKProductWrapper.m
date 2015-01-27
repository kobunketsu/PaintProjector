//
//  SKProductWrapper.m
//  PaintProjector
//
//  Created by 胡 文杰 on 8/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "SKProductWrapper.h"

#define kLocalizedDescriptionKey    @"localizedDescription"
#define kLocalizedTitleKey          @"localizedTitle"
#define kProductIdentifierKey       @"productIdentifier"
#define kLocalizedPrice             @"localizedPrice"
//#define kDownloadableKey            @"downloadable"
//#define kDownloadContentLengthsKey  @"downloadContentLengths"
//#define kDownloadContentVersionKey  @"downloadContentVersion"

@implementation SKProductWrapper
+ (NSArray*)productsWithSKProductArray:(NSArray*)products{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:products.count];
    for (SKProduct *product in products) {
        SKProductWrapper *wrapper = [[SKProductWrapper alloc]initWithSKProduct:product];
        [array addObject:wrapper];
    }
    return array;
}

- (id)initWithSKProduct:(SKProduct*)product{
    self = [super init];
    if (self) {
        _product = product;
        _localizedDescription = product.localizedDescription;
        _localizedTitle = product.localizedTitle;
        _productIdentifier = product.productIdentifier;
        _localizedPrice = product.localizedPrice;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if (self) {
        _localizedDescription = [decoder decodeObjectForKey:kLocalizedDescriptionKey];
        _localizedTitle = [decoder decodeObjectForKey:kLocalizedTitleKey];
        _productIdentifier = [decoder decodeObjectForKey:kProductIdentifierKey];
        _localizedPrice = [decoder decodeObjectForKey:kLocalizedPrice];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.localizedDescription forKey:kLocalizedDescriptionKey];
    [encoder encodeObject:self.localizedTitle forKey:kLocalizedTitleKey];
    [encoder encodeObject:self.productIdentifier forKey:kProductIdentifierKey];
    [encoder encodeObject:self.localizedPrice forKey:kLocalizedPrice];
}
@end
