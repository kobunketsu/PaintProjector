//
//  BackgroundLayer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

-(id)init{
    if ((self = [super init])) {
        _clearColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _visible = true;
        _dirty = true;
        return self;
    }
    return nil;
}

-(id)initWithClearColor:(UIColor*)clearColor visible:(BOOL)visible{
    if ((self = [super init])) {
        _clearColor = clearColor;
        _visible = visible;
        _dirty = true;
        return self;
    }
    return nil;
}
#define kVisibleKey       @"Visible"
#define kClearColorKey       @"ClearColor"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.clearColor forKey:kClearColorKey];
    [encoder encodeBool:self.visible forKey:kVisibleKey];
}

- (id) initWithCoder:(NSCoder *)decoder {
    UIColor *clearColor = [decoder decodeObjectForKey:kClearColorKey];
    bool visible = [decoder decodeBoolForKey:kVisibleKey];
    
    return [self initWithClearColor:clearColor visible:visible];
}

- (id)copyWithZone:(NSZone *)zone{
    BackgroundLayer *layer = [[BackgroundLayer alloc] init];
    layer.visible = self.visible;
    layer.clearColor = [self.clearColor copy];
    layer.dirty = self.dirty;
    return layer;
}
@end
