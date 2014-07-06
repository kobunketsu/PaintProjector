//
//  MeshFilter.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REComponent.h"
#import "REMesh.h"

@interface REMeshFilter : REComponent
@property(weak, nonatomic) REMesh *mesh;
@property(weak, nonatomic) REMesh *sharedMesh;
- (id)initWithMesh:(REMesh*)mesh;
@end
