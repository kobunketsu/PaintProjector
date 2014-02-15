//
//  MeshRenderer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Renderer.h"
#import "MeshFilter.h"

@interface MeshRenderer : Renderer
@property(retain, nonatomic) MeshFilter *meshFilter;


- (id)initWithMeshFilter:(MeshFilter*)meshFilter;

@end
