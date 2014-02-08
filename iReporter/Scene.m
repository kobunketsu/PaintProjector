//
//  Scene.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Scene.h"

@implementation Scene
- (id)init{
    self = [super init];
    if (self != nil) {
        _aEntities = [[NSMutableArray alloc]init];
        _aCameras = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addEntity:(Entity*)entity{
    [self.aEntities addObject:entity];
}

- (void)flushAll{
    for (Camera *camera in self.aCameras) {
        //culling
        for (Entity *entity in self.aEntities) {
            if ((camera.cullingMask & entity.layerMask) == entity.layerMask) {
                [camera.cullingEntities addObject:entity];
            }
        }
    }
}

- (void)addCamera:(Camera*)camera{
    [self.aCameras addObject:camera];
}

- (void)render{
    for (Camera *camera in self.aCameras) {
        //add scene object with tag to taged camera
        Camera.current = camera;
        [camera render];
    }
}

- (void)update{
    for (Entity *entity in self.aEntities) {
        [entity update];
    }
}

@end
