//
//  Mesh.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Object.h"
#import "GLWrapper.h"
#import "VertexCommon.h"

typedef NS_ENUM(NSInteger, MeshTopology) {
    Triangles,
    Quads,//TriangleFan
    Lines,
    LineStrip,
    Points,
};

@interface Mesh : Object
@property (assign, nonatomic) VertexAttributes vertexAttr;
@property (assign, nonatomic) size_t triangleCount;
@property (assign, nonatomic) size_t verticeCount;
@property (retain, nonatomic) NSData *vertices;
@property (retain, nonatomic) NSData *triangles;
@property (retain, nonatomic) NSMutableArray *subMeshTriCounts;
@property (assign, nonatomic) MeshTopology topology;

@property (assign, nonatomic) GLuint vertexBuffer;
@property (assign, nonatomic) GLuint vertexArray;
@property (assign, nonatomic) GLuint indexBuffer;

- (void)reset;
- (void)clear;

- (void)create;
- (id)copyWithZone:(NSZone *)zone;
@end
