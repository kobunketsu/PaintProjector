//
//  Layer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-11-22.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADLayer.h"

@implementation ADLayer
- (id)init{
    self = [super init];
    if (self) {
        _visible = true;
        _dirty = true;
    }
    return self;
}

- (void)setVisible:(bool)visible{
    if (_visible != visible) {
        _visible = visible;
        _dirty = true;
    }
}
- (id)copyWithZone:(NSZone *)zone{
    ADLayer *layer = [[[self class]alloc]init];
    layer.visible = self.visible;
    layer.dirty = self.dirty;
    return layer;
}
//- (void)setDirty:(bool)dirty{
//    DebugLogWarn(@"setDirty %i", dirty);
//    _dirty = dirty;
//}
@end
