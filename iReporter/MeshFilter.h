//
//  MeshFilter.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import "Mesh.h"

@interface MeshFilter : Component
@property(weak, nonatomic) Mesh *mesh;
@property(weak, nonatomic) Mesh *sharedMesh;
- (id)initWithMesh:(Mesh*)mesh;
@end
