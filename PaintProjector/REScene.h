//
//  Scene.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REObject.h"
#import "REEntity.h"
#import "RERenderSettings.h"

@interface REScene : REObject
@property (retain, nonatomic)NSMutableArray *aCameras;
@property (retain, nonatomic)NSMutableArray *aEntities;

- (void)addEntity:(REEntity*)entity;

- (void)addCamera:(RECamera*)camera;

- (void)removeEntity:(REEntity*)entity;

- (void)removeCamera:(RECamera*)camera;

- (void)destroy;

- (void)flushAll;

- (void)render;

- (void)update;

@end
