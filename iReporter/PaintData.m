//
//  PaintSaveData.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-26.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintData.h"
#import "PaintLayer.h"
#define kDataKey        @"Data"
#define kDataFile       @"data.plist"

@implementation PaintData
@synthesize version = _version;
@synthesize title = _title;
@synthesize layers = _layers;

-(id)initWithTitle:(NSString*)title{
    if ((self = [super init])) {
        _title = [title copy];
        _version = version;
        _layers = [[NSMutableArray alloc]init];
    }
    return self;
}

-(id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers Version:(NSString*)version{
    if ((self = [super init])) {
        _title = [title copy];        
        _version = [version copy];
        _layers = layers;
    }
    return self;
}

#pragma mark NSCoding

#define kTitleKey       @"Title"
#define kVersionKey     @"Version"
#define kLayerKey       @"Layers"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_version forKey:kVersionKey];
    [encoder encodeObject:_title forKey:kTitleKey];
    [encoder encodeObject:_layers forKey:kLayerKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSString *version = [decoder decodeObjectForKey:kVersionKey];
    NSString *title = [decoder decodeObjectForKey:kTitleKey];
    NSMutableArray *layers = [decoder decodeObjectForKey:kLayerKey];
    return [self initWithTitle:title layers:layers Version:version];
}



@end
