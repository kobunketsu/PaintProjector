//
//  Resources.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Resources.h"
#import "Texture.h"
#import "Shader.h"
#import "Material.h"
#import "Mesh.h"

@implementation Resources
+ (void)initialize{
    [super initialize];
    if (!resources) {
        resources = [[NSMutableArray alloc]init];
    }

}

+ (void)addObject:(Object*)object{
    if ([resources containsObject:object]) {
        return;
    }
    
    [resources addObject:object];
}

+ (void)unloadAsset:(Object*)object{
    if (!resources) {
        return;
    }
    
    if (![resources containsObject:object]) {
        return;
    }
    
    [resources removeObject:object];
    
    [Object destroy:object];
    DebugLog(@"unloaded asset %@", object);
}

+ (void)unloadAllAsset{
    for (int i = 0; i < resources.count; ++i) {
        Object *object = resources[i];
        [Object destroy:object];
        DebugLog(@"unloaded asset %@", object);
    }
    [resources removeAllObjects];
}
@end
