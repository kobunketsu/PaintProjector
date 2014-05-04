//
//  ModelEntity.m
//  PaintProjector
//
//  Created by kobunketsu on 14-5-4.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "ModelEntity.h"
#import "MeshRenderer.h"

@implementation ModelEntity
- (id)initWithWaveFrontObj:(OpenGLWaveFrontObject *)obj{
    self = [super init];
    if (self) {
        Mesh *mesh = [[Mesh alloc]init];
        
        //map OpenGLWaveFrontObject vertex structure to specific vertex structure
        OBJVertex* vertices = [obj convertVertexStruct];    //malloc in function
        mesh.verticeCount = obj.numberOfVertices;
        mesh.triangleCount = obj.numberOfFaces;
        //subMesh数量
        for (OpenGLWaveFrontMesh *m in obj.meshes) {
            [mesh.subMeshTriCounts addObject:[NSNumber numberWithInt:m.numberOfFaces]];
        }

        //组成整个triangles索引的数据组
        short *indices = (short*)malloc(obj.numberOfFaces * 3 * sizeof(short));
        size_t offset = 0;
        for (OpenGLWaveFrontMesh *m in obj.meshes) {
            for (size_t i = 0; i< m.numberOfFaces; ++i) {
                indices[offset] = m.faces[i].v1;
                indices[offset + 1] = m.faces[i].v2;
                indices[offset + 2] = m.faces[i].v3;
                DebugLog(@"subMesh %@ triangle v1:%d v2:%d v3:%d", m.name, m.faces[i].v1, m.faces[i].v2, m.faces[i].v3);
            }
            offset += 3;
        }
        
        mesh.triangles = [NSData dataWithBytesNoCopy:indices length:obj.numberOfFaces * 3 * sizeof(short) freeWhenDone:YES];
        mesh.vertices = [NSData dataWithBytesNoCopy:vertices length:obj.numberOfVertices * sizeof(OBJVertex) freeWhenDone:YES];
        mesh.vertexAttr = Vertex_Position | Vertex_Texcoord | Vertex_Normal;
        
        [mesh create];
        
        MeshFilter *meshFilter = [[MeshFilter alloc]initWithMesh:mesh];
        MeshRenderer *meshRenderer = [[MeshRenderer alloc]initWithMeshFilter:meshFilter];
        self.renderer = meshRenderer;
    }
    return self;
}
@end
