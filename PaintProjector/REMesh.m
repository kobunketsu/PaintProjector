//
//  Mesh.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REMesh.h"
#import "REResources.h"

@implementation REMesh
- (id)init{
    self = [super init];
    if (self) {
        _subMeshTriCounts = [[NSMutableArray alloc]init];
//        _topology =  Lines;
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
    REMesh *mesh = [[[self class] allocWithZone:zone]init];
    mesh.vertexAttr = self.vertexAttr;    
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
    [[REGLWrapper current] bindVertexArrayOES:_vertexArray];
#if DEBUG
    glLabelObjectEXT(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexArray, 0, "meshRenderer");
#endif
    
    glGenBuffers(1, &_indexBuffer);
    [[REGLWrapper current] bindElementBuffer:_indexBuffer];
    
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _indexBuffer, 0, "indexBuffer");
#endif
    size_t indicesCount = self.triangleCount * 3;
    GLvoid *indices = (GLvoid *)self.triangles.bytes;
    
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indicesCount * sizeof(short), indices, GL_STATIC_DRAW);
    
    glGenBuffers(1, &_vertexBuffer);
    [[REGLWrapper current] bindBuffer:_vertexBuffer];
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _vertexBuffer, 0, "vertexBuffer");
#endif
    size_t vertLength = self.verticeCount;
    GLvoid *vertices = (GLvoid *)self.vertices.bytes;
    
    //计算步进
    GLsizei stride = 0;
    stride += (self.vertexAttr & Vertex_Position) == Vertex_Position ? 12 : 0;
    stride += (self.vertexAttr & Vertex_Texcoord) == Vertex_Texcoord ? 8 : 0;
    stride += (self.vertexAttr & Vertex_Color) == Vertex_Color ? 16 : 0;
    stride += (self.vertexAttr & Vertex_Normal) == Vertex_Normal ? 12 : 0;
    
    glBufferData(GL_ARRAY_BUFFER, stride * vertLength, vertices, GL_STATIC_DRAW);
    
    GLsizei offset = 0;
    if ((self.vertexAttr & Vertex_Position) == Vertex_Position) {
        glEnableVertexAttribArray(GLKVertexAttribPosition);
        glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, stride, BUFFER_OFFSET(offset));
        offset += 12;
    }

    if ((self.vertexAttr & Vertex_Texcoord) == Vertex_Texcoord) {
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, stride, BUFFER_OFFSET(offset));
        offset += 8;
    }

    if ((self.vertexAttr & Vertex_Color) == Vertex_Color) {
        glEnableVertexAttribArray(GLKVertexAttribColor);
        glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, stride, BUFFER_OFFSET(offset));
        offset += 16;
    }
    
    if ((self.vertexAttr & Vertex_Normal) == Vertex_Normal) {
        glEnableVertexAttribArray(GLKVertexAttribNormal);
        glVertexAttribPointer(GLKVertexAttribNormal, 3, GL_FLOAT, GL_FALSE, stride, BUFFER_OFFSET(offset));
        offset += 12;
    }

    [[REGLWrapper current] bindVertexArrayOES:0];
}

- (void)destroy{
    [super destroy];
    
    [[REGLWrapper current] deleteBuffer:_vertexBuffer];
    
    [[REGLWrapper current] deleteBuffer:_indexBuffer];
    
    [[REGLWrapper current] deleteVertexArrayOES:_vertexArray];
}
@end
