//
//  Scene.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REScene.h"

@implementation REScene
- (id)init{
    self = [super init];
    if (self != nil) {
        _aEntities = [[NSMutableArray alloc]init];
        _aCameras = [[NSMutableArray alloc]init];
        [RERenderSettings initialize];
    }
    return self;
}

- (void)addEntity:(REEntity*)entity{
    [self.aEntities addObject:entity];
    
    for (RECamera *camera in self.aCameras) {
        if ((camera.cullingMask & entity.layerMask) == entity.layerMask) {
            if (![camera.cullingEntities containsObject:entity]) {
                [camera.cullingEntities addObject:entity];
            }
        }
    }
}
- (void)removeEntity:(REEntity*)entity{
    if ([self.aEntities containsObject:entity]) {
        [self.aEntities removeObject:entity];
    }
}

- (void)removeCamera:(RECamera*)camera{
    if ([self.aCameras containsObject:camera]) {
        [self.aCameras removeObject:camera];
    }
}
- (void)flushAll{
    for (RECamera *camera in self.aCameras) {
        //culling
        [camera.cullingEntities removeAllObjects];
        for (REEntity *entity in self.aEntities) {
            if ((camera.cullingMask & entity.layerMask) == entity.layerMask) {
                [camera.cullingEntities addObject:entity];
            }
        }
    }
}

- (void)addCamera:(RECamera*)camera{
    [self.aCameras addObject:camera];
    
    [camera.cullingEntities removeAllObjects];
    for (REEntity *entity in self.aEntities) {
        if ((camera.cullingMask & entity.layerMask) == entity.layerMask) {
            [camera.cullingEntities addObject:entity];
        }
    }
}

- (void)render{
    for (RECamera *camera in self.aCameras) {
        //add scene object with tag to taged camera
        RECamera.current = camera;
        [camera render];
    }
}

- (void)update{
    for (REEntity *entity in self.aEntities) {
        [entity update];
    }
}

- (void)destroy{
    [super destroy];
    
    [self.aCameras removeAllObjects];
    [self.aEntities removeAllObjects];
    
    [RERenderSettings destroy];
}
@end
