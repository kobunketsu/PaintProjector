//
//  Resources.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object.h"

@class Resources;

static NSMutableArray *resources;
@interface Resources : NSObject
+ (void)initialize;

+ (void)addObject:(Object*)object;
+ (void)unloadAsset:(Object*)object;
+ (void)unloadAllAsset;
@end

