//
//  PaintSaveData.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-3-26.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADPaintData.h"

#define kDataKey        @"Data"
#define kDataFile       @"data.plist"

@implementation ADPaintData

-(id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers backgroundLayer:(ADBackgroundLayer*)backgroundLayer userInputParams:(ADCylinderProjectUserInputParams*)userInputParams version:(NSString*)version{
    if ((self = [super init])) {
        _title = title;
        _version = version;
        _layers = layers;
        _backgroundLayer = backgroundLayer;
        _userInputParams = userInputParams;
    }
    return self;
}

#pragma mark NSCoding

#define kTitleKey               @"Title"
#define kVersionKey             @"Version"
#define kLayerKey               @"Layers"
#define kBackgroundLayerKey     @"BackgroundLayer"
#define kUserInputParamsKey     @"UserInputParams"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.version forKey:kVersionKey];
    [encoder encodeObject:self.title forKey:kTitleKey];
    [encoder encodeObject:self.layers forKey:kLayerKey];
    [encoder encodeObject:self.backgroundLayer forKey:kBackgroundLayerKey];
    [encoder encodeObject:self.userInputParams forKey:kUserInputParamsKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *version = [decoder decodeObjectForKey:kVersionKey];
    NSString *title = [decoder decodeObjectForKey:kTitleKey];
    NSMutableArray *layers = [decoder decodeObjectForKey:kLayerKey];
    ADBackgroundLayer *backgroundLayer = [decoder decodeObjectForKey:kBackgroundLayerKey];
    ADCylinderProjectUserInputParams *userInputParams = [decoder decodeObjectForKey:kUserInputParamsKey];
    return [self initWithTitle:title layers:layers backgroundLayer:backgroundLayer userInputParams:userInputParams version:version];
}

- (id)copyWithZone:(NSZone *)zone{
    ADPaintData *data = [[ADPaintData alloc] init];
    data.title = self.title;
    data.version = self.version;
    data.layers = [self.layers copyWithZone:zone];//?
    data.backgroundLayer = [self.backgroundLayer copyWithZone:zone];
    //TODO: test
    data.userInputParams = [self.userInputParams copyWithZone:zone];
    return data;
}
@end
