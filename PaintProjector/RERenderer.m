//
//  Renderer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RERenderer.h"
#import "REResources.h"

@implementation RERenderer
- (id)init{
    self = [super init];
    if (self) {
        _materials = [[NSMutableArray alloc]init];
        _sharedMaterials = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)setMaterial:(REMaterial *)material{
    if (self.materials.count == 0) {
        [self.materials addObject:material];
    }
    else{
        [self.materials replaceObjectAtIndex:0 withObject:material];
    }
}

-(void)setMaterials:(NSMutableArray *)materials{
    if(_materials != nil)
    {
        _materials = nil;
    }
    _materials = [materials mutableCopy];
}

- (REMaterial *)material{
    if (!self.sharedMaterial) {
        return nil;
    }
    
    if (self.materials.firstObject != nil) {
        return self.materials.firstObject;
    }
    
    [self.materials addObject:[self.sharedMaterial copy]];
    return self.materials.firstObject;
}

- (void)setSharedMaterial:(REMaterial *)sharedMaterial{
    if (self.sharedMaterials.count == 0) {
        [self.sharedMaterials addObject:sharedMaterial];
    }
    else{
        self.sharedMaterials[0] = sharedMaterial;
    }
}

- (REMaterial *)sharedMaterial{
    if (self.sharedMaterials.count > 0) {
        return self.sharedMaterials.firstObject;
    }
    return nil;
}


- (void)render{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)destroy{
    [super destroy];
//    self.material = nil;
//    self.sharedMaterial = nil;
    [self.materials removeAllObjects];
    [self.sharedMaterials removeAllObjects];

}

- (id)copyWithZone:(NSZone *)zone{
    RERenderer *renderer = (RERenderer *)[super copyWithZone:zone];
    renderer.delegate = self.delegate;
//    renderer.materials = [self.materials copy];
    renderer.sharedMaterials = [self.sharedMaterials mutableCopy];//shallow copy
    return  renderer;
}

- (void)setActive:(BOOL)active{
    [super setActive:active];
    
    //TODO: should be rewrite
    if (!self.active) {
        for (REMaterial *material in self.materials) {
            [material destroy];
        }
    }
}

@end
