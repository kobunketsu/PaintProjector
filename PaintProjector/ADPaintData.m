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

//-(id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers backgroundLayer:(ADBackgroundLayer*)backgroundLayer version:(NSString*)version{
//    if ((self = [super init])) {
//        _title = title;
//        _version = version;
//        _layers = layers;
//        _backgroundLayer = backgroundLayer;
//    }
//    return self;
//}


#pragma mark NSCoding

#define kTitleKey               @"Title"
#define kVersionKey             @"Version"
#define kLayerKey               @"Layers"
#define kCurLayerIndexKey       @"CurLayerIndex"
#define kBackgroundLayerKey     @"BackgroundLayer"
#define kUserInputParamsKey     @"UserInputParams"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:DocVersion forKey:kVersionKey];
    if (self.version.floatValue <= ((NSString*)DocVersion).floatValue) {
        [encoder encodeObject:self.title forKey:kTitleKey];
        [encoder encodeObject:self.layers forKey:kLayerKey];
        [encoder encodeObject:self.backgroundLayer forKey:kBackgroundLayerKey];
        [encoder encodeInteger:self.curLayerIndex forKey:kCurLayerIndexKey];
    }
    else{
        DebugLogError(DocVersionErrorMessage, _version.floatValue, ((NSString*)DocVersion).floatValue);
        return;
    }
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        _version = [decoder decodeObjectForKey:kVersionKey];
        if (_version.floatValue <= ((NSString*)DocVersion).floatValue) {
            _title = [decoder decodeObjectForKey:kTitleKey];
            _layers = [decoder decodeObjectForKey:kLayerKey];
            _backgroundLayer = [decoder decodeObjectForKey:kBackgroundLayerKey];
            
            if (_version.floatValue >= 1.11) {
                _curLayerIndex = [decoder decodeIntegerForKey:kCurLayerIndexKey];
            }
        }
        else{
            DebugLogError(DocVersionErrorMessage, _version.floatValue, ((NSString*)DocVersion).floatValue);
            return nil;
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    ADPaintData *data = [[ADPaintData alloc] init];
    data.version = self.version;
    if (self.version.floatValue <= ((NSString*)DocVersion).floatValue) {
        data.title = self.title;
        data.layers = [[NSMutableArray alloc]initWithArray:self.layers copyItems:YES];
        data.backgroundLayer = [self.backgroundLayer copyWithZone:zone];
        data.curLayerIndex = self.curLayerIndex;
    }
    else{
        DebugLogError(DocVersionErrorMessage, _version.floatValue, ((NSString*)DocVersion).floatValue);
        return nil;
    }

    return data;
}
@end
