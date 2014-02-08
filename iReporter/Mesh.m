//
//  Mesh.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Mesh.h"
#import "Resources.h"

@implementation Mesh
- (id)init{
    self = [super init];
    if (self) {
        _subMeshTriCounts = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)clear{
    if (self.vertices && self.vertices.bytes) {
        free((void*)self.vertices.bytes);
    }
    
    if (self.triangles && self.triangles.bytes) {
        free((void*)self.triangles.bytes);
    }
}

- (void)reset{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (id)copyWithZone:(NSZone *)zone{
    Mesh *mesh = [[[self class] allocWithZone:zone]init];
    
    mesh.triangles = [NSData dataWithBytes:self.triangles.bytes length:self.triangles.length];
    mesh.vertices = [NSData dataWithBytes:self.vertices.bytes length:self.vertices.length];
    mesh.vertexArray = self.vertexArray;
    mesh.vertexBuffer = self.vertexBuffer;
    mesh.indexBuffer = self.indexBuffer;
    return mesh;
}

- (void)create{
    //绑定gpu
    glGenVertexArraysOES(1, &_vertexArray);
    [GLWrapper.current bindVertexArrayOES:_vertexArray];
#if DEBUG
    glLabelObjectEXT(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexArray, 0, "meshRenderer");
#endif
    
    glGenBuffers(1, &_indexBuffer);
    [GLWrapper.current bindElementBuffer:_indexBuffer];
    
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _indexBuffer, 0, "indexBuffer");
#endif
    size_t indicesCount = self.triangleCount * 3;
    GLvoid *indices = (GLvoid *)self.triangles.bytes;
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indicesCount * sizeof(short), indices, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_vertexBuffer);
    [GLWrapper.current bindBuffer:_vertexBuffer];
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _vertexBuffer, 0, "vertexBuffer");
#endif
    size_t vertLength = self.verticeCount;
    GLvoid *vertices = (GLvoid *)self.vertices.bytes;
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertex) * vertLength, vertices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 36, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 36, BUFFER_OFFSET(12));
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 36, BUFFER_OFFSET(20));
    [GLWrapper.current bindVertexArrayOES:0];
}

- (void)destroy{
    [super destroy];
    
//    [self clear];
    
    RELEASE_BUFFER(_vertexBuffer);
    
    RELEASE_BUFFER(_indexBuffer);
    
    RELEASE_VERTEXARRAY(_vertexArray);
}
@end
