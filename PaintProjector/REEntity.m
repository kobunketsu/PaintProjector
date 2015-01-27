//
//  Entity.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REEntity.h"
#import "REResources.h"

@implementation REEntity
-(id)init{
    self = [super init];
    if (self) {
        _layerMask = Layer_Default;
        _transform = [[RETransform alloc]init];
    }
    return self;
}

- (void)render{

    DebugLogGLGroupStart(@"rendering entity %@", self.name);

    if (self.renderer) {
        [self.renderer render];
    }
    DebugLogGLGroupEnd();
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
    REEntity *entity = (REEntity *)[super copyWithZone:zone];
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
