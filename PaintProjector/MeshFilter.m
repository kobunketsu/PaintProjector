//
//  MeshFilter.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "MeshFilter.h"

@implementation MeshFilter
- (id)initWithMesh:(Mesh*)mesh{
    self = [super init];
    if (self != nil) {
        _sharedMesh = mesh;
        //TODO:实现拷贝
//        _mesh = [mesh copy];
        _mesh = mesh;
    }
    return  self;
}

- (id)copyWithZone:(NSZone *)zone{
    MeshFilter *filter = (MeshFilter *)[super copyWithZone:zone];
    filter.mesh = self.mesh;
    filter.sharedMesh = self.sharedMesh;
    return  filter;
}
@end
