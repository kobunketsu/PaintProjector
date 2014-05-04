//
//  Plane.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PlaneMesh.h"

@implementation PlaneMesh
- (id)initWithRow:(size_t)row column:(size_t)column{
    self = [super init];
    if (self != nil) {
        _row = row;
        _column = column;
        
        [self reset];
    }
    return self;
}

- (void)reset{
    [self clear];
    
    //根据row column创建mesh数据
    size_t vertRow = self.row + 1;
    size_t vertColumn = self.column + 1;
    self.verticeCount = vertRow * vertColumn;
    self.triangleCount = self.row * self.column * 2;
    size_t indicesCount = self.triangleCount * 3;
    Vertex *vertices = malloc(self.verticeCount * sizeof(Vertex));
    short *indices = (short*)malloc(indicesCount * sizeof(short));
//    int fadeRow = 5;
//    int fadeColumn = 2;
    
    for (size_t i=0; i < vertRow; i++) {
        for (size_t j=0; j < vertColumn; j++) {
            size_t index = i * vertColumn + j;
            //position
            
            vertices[index].Position[0] = (float)j / (float)self.column - 0.5f;
            vertices[index].Position[1] = 0;
            vertices[index].Position[2] = (float)i / (float)self.row - 0.5f;
            //uv
            vertices[index].Texcoord[0]  = (float)j / (float)self.column;
            vertices[index].Texcoord[1] = 1.0f - (float)i / (float)self.row;
            //color
            vertices[index].Color[0] = 1.0f;
            vertices[index].Color[1] = 1.0f;
            vertices[index].Color[2] = 1.0f;
            vertices[index].Color[3] = 1.0f;
            
            //外围的点是半透明
            //            if(i < fadeRow){
            //                vertices[index*9 + 8] *= (float)i / (float)fadeRow;
            //            }
            //            else if(i > vertRow - fadeRow){
            //                vertices[index*9 + 8] *= (float)(vertRow - i - 1) / (float)fadeRow;
            //            }
            //
            //            if(j < fadeColumn){
            //                vertices[index*9 + 8] *= (float)j / (float)fadeColumn;
            //            }
            //            else if(j > vertColumn - fadeColumn){
            //                vertices[index*9 + 8] *= (float)(vertColumn - j - 1) / (float)fadeColumn;
            //            }
        }
    }
    
    for(size_t i = 0; i < self.row; ++i)
    {
        for(size_t j = 0; j < self.column; ++j)
        {
            size_t index = i * self.column + j;
            size_t vertIndex = i * vertColumn + j;
            indices[index*6] = vertIndex;
            indices[index*6 + 1] = vertIndex + vertColumn;
            indices[index*6 + 2] = vertIndex+1;
            
            indices[index*6 + 3] = vertIndex + vertColumn + 1;
            indices[index*6 + 4] = vertIndex + 1;
            indices[index*6 + 5] = vertIndex + vertColumn;
        }
    }
    
    [self.subMeshTriCounts addObject:[NSNumber numberWithInt:self.triangleCount]];
    
    self.vertices = [NSData dataWithBytesNoCopy:vertices length:self.verticeCount * sizeof(Vertex) freeWhenDone:YES];

    self.triangles = [NSData dataWithBytesNoCopy:indices length:self.triangleCount * 3 * sizeof(short) freeWhenDone:YES];

    self.vertexAttr = Vertex_Position | Vertex_Texcoord | Vertex_Color;
}

- (id)copyWithZone:(NSZone *)zone{
    PlaneMesh *mesh = (PlaneMesh *)[super copyWithZone:zone];
    mesh.row = self.row;
    mesh.column = self.column;
    
    [mesh reset];
    return mesh;
}
@end
