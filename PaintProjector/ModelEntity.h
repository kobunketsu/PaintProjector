//
//  ModelEntity.h
//  PaintProjector
//
//  Created by kobunketsu on 14-5-4.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "Entity.h"
#import "OpenGLWaveFrontObject.h"
#import "OpenGLWaveFrontMesh.h"

@interface ModelEntity : Entity
- (id)initWithWaveFrontObj:(OpenGLWaveFrontObject *)obj;
@end
