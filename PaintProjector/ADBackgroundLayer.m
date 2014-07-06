//
//  BackgroundLayer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADBackgroundLayer.h"

@implementation ADBackgroundLayer

-(id)init{
    if ((self = [super init])) {
        _clearColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _visible = true;
        _dirty = true;
        [self addObserver:self forKeyPath:@"clearColor" options:NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"visible" options:NSKeyValueObservingOptionOld context:nil];
        return self;
    }
    return nil;
}
- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [self removeObserver:self forKeyPath:@"clearColor"];
    [self removeObserver:self forKeyPath:@"visible"];
}
-(id)initWithClearColor:(UIColor*)clearColor visible:(BOOL)visible{
    if ((self = [super init])) {
        _clearColor = clearColor;
        _visible = visible;
        _dirty = true;
        [self addObserver:self forKeyPath:@"clearColor" options:NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"visible" options:NSKeyValueObservingOptionOld context:nil];
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
    ADBackgroundLayer *layer = [[ADBackgroundLayer alloc] init];
    layer.visible = self.visible;
    layer.clearColor = [self.clearColor copy];
    layer.dirty = self.dirty;
    return layer;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"visible"] || [keyPath isEqualToString:@"clearColor"]) {
        if (!((ADBackgroundLayer*)object).visible) {
            [self.delegate willClearColorChanged:[UIColor blackColor]];
        }
        else{
            [self.delegate willClearColorChanged:[self.clearColor copy]];
        }
    }
}
@end
