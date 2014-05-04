//
//  Entity.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Entity.h"
#import "Resources.h"

@implementation Entity
-(id)init{
    self = [super init];
    if (self) {
        _layerMask = Layer_Default;
        _transform = [[Transform alloc]init];
    }
    return self;
}

- (void)render{
#if DEBUG
    NSString *renderLog = [NSString stringWithFormat:@"rendering entity %@", self.name];
    glPushGroupMarkerEXT(0, [renderLog UTF8String]);
#endif
    if (self.renderer) {
        [self.renderer render];
    }
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

-(void)willRenderSubMeshAtIndex:(int)index{
}

- (void)update{
    //do nothing
}

- (void)destroy{
    [super destroy];
    [self setTransform:nil];
    [self setRenderer:nil];
}

- (id)copyWithZone:(NSZone *)zone{
    Entity *entity = (Entity *)[super copyWithZone:zone];
    entity.transform = [self.transform copy];
    entity.renderer = [self.renderer copy];
    entity.layerMask = self.layerMask;
    return entity;
}

- (void)setActive:(BOOL)active{
    [super setActive:active];
    
    [self.renderer setActive:active];
}

@end
