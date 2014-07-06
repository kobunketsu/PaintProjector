//
//  Resources.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "REObject.h"

@class REResources;

static NSMutableArray *resources;
@interface REResources : NSObject
+ (void)initialize;
+ (void)destroy;
+ (void)addObject:(REObject*)object;
+ (void)unloadAsset:(REObject*)object;
+ (void)unloadAllAsset;
@end

