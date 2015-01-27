//
//  ModelEntity.h
//  PaintProjector
//
//  Created by kobunketsu on 14-5-4.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "REEntity.h"
@class OpenGLWaveFrontObject;

@interface REModelEntity : REEntity
- (id)initWithWaveFrontObj:(OpenGLWaveFrontObject *)obj;
@end
