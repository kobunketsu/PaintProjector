//
//  MeshRenderer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RERenderer.h"
#import "REMeshFilter.h"

@interface REMeshRenderer : RERenderer
@property(retain, nonatomic) REMeshFilter *meshFilter;


- (id)initWithMeshFilter:(REMeshFilter*)meshFilter;

@end
