//
//  CylinderMesh.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CylinderMesh.h"

@implementation CylinderMesh
- (id)initWithRadius:(CGFloat)radius sides:(size_t)sides height:(CGFloat)height{
    self = [super init];
    if (self != nil) {
        _radius = radius;
        _sides = sides;
        _height = height;
        
        [self reset];
    }
    return self;
}

- (void)reset{
    [self clear];
    
    self.verticeCount = self.sides * 2;
    self.verticeCount += self.sides + 1;
    Vertex* vertices = malloc(self.verticeCount * sizeof(Vertex));
    //fill
    //main
    float anglePerSide = M_PI * 2 / (self.sides);
    for (size_t i = 0; i < self.sides; ++i) {
        float angle = anglePerSide * i;
        vertices[2*i].Position[0] = cosf(angle) * self.radius;
        vertices[2*i].Position[1] = self.height;
        vertices[2*i].Position[2] = sinf(angle) * self.radius;
        vertices[2*i].Texcoord[0] = (float)i / (float)self.sides;
        vertices[2*i].Texcoord[1] = 1;
        vertices[2*i].Color[0] = 1;
        vertices[2*i].Color[1] = 1;
        vertices[2*i].Color[2] = 1;
        vertices[2*i].Color[3] = 1;
        
        vertices[2*i+1].Position[0] = cosf(angle) * self.radius;
        vertices[2*i+1].Position[1] = 0;
        vertices[2*i+1].Position[2] = sinf(angle) * self.radius;
        vertices[2*i+1].Texcoord[0] = (float)i / (float)self.sides;
        vertices[2*i+1].Texcoord[1] = 0.0;
        vertices[2*i+1].Color[0] = 1;
        vertices[2*i+1].Color[1] = 1;
        vertices[2*i+1].Color[2] = 1;
        vertices[2*i+1].Color[3] = 1;
    }
    

    self.triangleCount = self.sides * 2 + self.sides;
    short *indices = (short*)malloc(self.triangleCount * 3 * sizeof(short));
    
    size_t indicesCount = self.sides * 2 * 3;
    for (size_t i = 0; i < (self.sides - 1); ++i) {
        indices[i * 6] = i * 2;
        indices[i * 6 + 1] = i * 2 + 2;
        indices[i * 6 + 2] = i * 2 + 1;
        indices[i * 6 + 3] = i * 2 + 1;
        indices[i * 6 + 4] = i * 2 + 2;
        indices[i * 6 + 5] = i * 2 + 3;
    }
    
    size_t i = self.sides - 1;
    indices[i * 6] = i * 2;
    indices[i * 6 + 1] = 0;
    indices[i * 6 + 2] = i * 2 + 1;
    indices[i * 6 + 3] = i * 2 + 1;
    indices[i * 6 + 4] = 0;
    indices[i * 6 + 5] = 1;

    [self.subMeshTriCounts addObject:[NSNumber numberWithInt:self.self.sides * 2]];
    
    //cap
    size_t vertStart = self.sides * 2;
    for (size_t i = 0; i < self.sides; ++i) {
        float angle = anglePerSide * i;
        vertices[vertStart+i].Position[0] = cosf(angle) * self.radius;
        vertices[vertStart+i].Position[1] = self.height;
        vertices[vertStart+i].Position[2] = sinf(angle) * self.radius;
        vertices[vertStart+i].Texcoord[0] = cosf(angle) * 0.5 + 0.5;
        vertices[vertStart+i].Texcoord[1] = sinf(angle) * 0.5 + 0.5;
        vertices[vertStart+i].Color[0] = 1;
        vertices[vertStart+i].Color[1] = 1;
        vertices[vertStart+i].Color[2] = 1;
        vertices[vertStart+i].Color[3] = 1;
    }
    
    size_t vertCenter = vertStart + self.sides;
    vertices[vertCenter].Position[0] = 0;
    vertices[vertCenter].Position[1] = self.height;
    vertices[vertCenter].Position[2] = 0;
    vertices[vertCenter].Texcoord[0] = 0.5;
    vertices[vertCenter].Texcoord[1] = 0.5;
    vertices[vertCenter].Color[0] = 1;
    vertices[vertCenter].Color[1] = 1;
    vertices[vertCenter].Color[2] = 1;
    vertices[vertCenter].Color[3] = 1;
    
    
    size_t indiceStart = self.sides * 6;
    indicesCount = self.sides * 3;
    for (size_t i = 0; i < (self.sides - 1); ++i) {
        indices[indiceStart + i * 3] = vertStart;
        indices[indiceStart + i * 3 + 1] = vertStart + i + 2;
        indices[indiceStart + i * 3 + 2] = vertStart + i + 1;
    }
    indices[indiceStart + (self.sides - 1) * 3] = vertCenter;
    indices[indiceStart + (self.sides - 1) * 3 + 1] = vertStart;
    indices[indiceStart + (self.sides - 1) * 3 + 2] = vertStart + self.sides - 1;
    
    [self.subMeshTriCounts addObject:[NSNumber numberWithInt:self.self.sides]];
    
    self.triangles = [NSData dataWithBytesNoCopy:indices length:self.triangleCount * 3 * sizeof(short) freeWhenDone:YES];
    self.vertices = [NSData dataWithBytesNoCopy:vertices length:self.verticeCount * sizeof(Vertex) freeWhenDone:YES];
    
    self.vertexAttr = Vertex_Position | Vertex_Texcoord | Vertex_Color;    
}

- (id)copyWithZone:(NSZone *)zone{
    CylinderMesh *mesh = (CylinderMesh *)[super copyWithZone:zone];
    mesh.radius = self.radius;
    mesh.sides = self.sides;
    mesh.height = self.height;
    
    [mesh reset];
    
    return mesh;
}
@end
