//
//  Resources.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REResources.h"
#import "RETexture.h"
#import "REShader.h"
#import "REMaterial.h"
#import "REMesh.h"

@implementation REResources
+ (void)initialize{
    [super initialize];
    if (!resources) {
        resources = [[NSMutableArray alloc]init];
    }

}

+ (void)destroy{
    DebugLogFuncStart(@"destroy");
    if (resources) {
        resources = nil;
    }
}
+ (void)addObject:(REObject*)object{
    if ([resources containsObject:object]) {
        return;
    }
    
    [resources addObject:object];
}

+ (void)unloadAsset:(REObject*)object{
    if (!resources) {
        return;
    }
    
    if (![resources containsObject:object]) {
        return;
    }
    
    [resources removeObject:object];
    
    [REObject destroy:object];
    DebugLog(@"unloaded asset %@", object);
}

+ (void)unloadAllAsset{
    for (int i = 0; i < resources.count; ++i) {
        REObject *object = resources[i];
        [REObject destroy:object];
        DebugLog(@"unloaded asset %@", object);
    }
    [resources removeAllObjects];
}
@end
