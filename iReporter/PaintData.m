//
//  PaintSaveData.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-26.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintData.h"

#define kDataKey        @"Data"
#define kDataFile       @"data.plist"

@implementation PaintData

-(id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers backgroundLayer:(BackgroundLayer*)backgroundLayer version:(NSString*)version{
    if ((self = [super init])) {
        _title = title;
        _version = version;
        _layers = layers;
        _backgroundLayer = backgroundLayer;
    }
    return self;
}

#pragma mark NSCoding

#define kTitleKey               @"Title"
#define kVersionKey             @"Version"
#define kLayerKey               @"Layers"
#define kBackgroundLayerKey     @"BackgroundLayer"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.version forKey:kVersionKey];
    [encoder encodeObject:self.title forKey:kTitleKey];
    [encoder encodeObject:self.layers forKey:kLayerKey];
    [encoder encodeObject:self.backgroundLayer forKey:kBackgroundLayerKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *version = [decoder decodeObjectForKey:kVersionKey];
    NSString *title = [decoder decodeObjectForKey:kTitleKey];
    NSMutableArray *layers = [decoder decodeObjectForKey:kLayerKey];
    BackgroundLayer *backgroundLayer = [decoder decodeObjectForKey:kBackgroundLayerKey];
    return [self initWithTitle:title layers:layers backgroundLayer:backgroundLayer version:version];
}

- (id)copyWithZone:(NSZone *)zone{
    PaintData *data = [[PaintData alloc] init];
    data.title = self.title;
    data.version = self.version;
    data.layers = [self.layers copyWithZone:zone];//?
    data.backgroundLayer = [self.backgroundLayer copy];
    return data;
}
@end
