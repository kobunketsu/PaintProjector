//
//  Scene.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Object.h"
#import "Entity.h"

@interface Scene : Object
@property (retain, nonatomic)NSMutableArray* aCameras;
@property (retain, nonatomic)NSMutableArray* aEntities;

- (void)addEntity:(Entity*)entity;

- (void)addCamera:(Camera*)camera;

- (void)flushAll;

- (void)render;

- (void)update;
@end
