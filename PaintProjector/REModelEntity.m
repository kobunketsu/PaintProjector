//
//  ModelEntity.m
//  PaintProjector
//
//  Created by kobunketsu on 14-5-4.
//  Copyright (c) 2014年 WenjiHu. All rights reserved.
//

#import "REModelEntity.h"
#import "REMeshRenderer.h"
#import "REMaterial.h"
#import "ADShaderDiffuse.h"
#import "OpenGLWaveFrontObject.h"
#import "OpenGLWaveFrontGroup.h"
#import "OpenGLTexture3D.h"
#import "RERenderSettings.h"

@implementation REModelEntity
- (id)initWithWaveFrontObj:(OpenGLWaveFrontObject *)obj{
    self = [super init];
    if (self) {
        REMesh *mesh = [[REMesh alloc]init];
        
        //map OpenGLWaveFrontObject vertex structure to specific vertex structure
        OBJVertex* vertices = [obj convertVertexStruct];    //malloc in function
        mesh.verticeCount = obj.numberOfVertices;
        mesh.triangleCount = obj.numberOfFaces;
        //subMesh数量
        for (OpenGLWaveFrontGroup *m in obj.groups) {
            [mesh.subMeshTriCounts addObject:[NSNumber numberWithInt:m.numberOfFaces]];
        }

        //组成整个triangles索引的数据组
        short *indices = (short*)malloc(obj.numberOfFaces * 3 * sizeof(short));
        for (OpenGLWaveFrontGroup *m in obj.groups) {
            //遍历三角面
            for (size_t i = 0; i< m.numberOfFaces; ++i) {
                indices[i * 3] = m.faces[i].v1;
                indices[i * 3 + 1] = m.faces[i].v2;
                indices[i * 3 + 2] = m.faces[i].v3;
//                DebugLog(@"subMesh %@ triangle index %d v1:%d v2:%d v3:%d", m.name, i, indices[i * 3], indices[i * 3 + 1] , indices[i * 3 + 2]);
            }
        }
        
        //填充模型数据
        mesh.triangles = [NSData dataWithBytesNoCopy:indices length:obj.numberOfFaces * 3 * sizeof(short) freeWhenDone:YES];
        mesh.vertices = [NSData dataWithBytesNoCopy:vertices length:obj.numberOfVertices * sizeof(OBJVertex) freeWhenDone:YES];
        mesh.vertexAttr = Vertex_Position | Vertex_Texcoord | Vertex_Normal;
        //创建模型数据到内存
        [mesh create];
        //创建模型渲染组件
        REMeshFilter *meshFilter = [[REMeshFilter alloc]initWithMesh:mesh];
        REMeshRenderer *meshRenderer = [[REMeshRenderer alloc]initWithMeshFilter:meshFilter];
        self.renderer = meshRenderer;
        self.renderer.delegate = self;
        
        //处理材质
        for (OpenGLWaveFrontGroup *glObjMesh in obj.groups) {
            OpenGLWaveFrontMaterial *glObjMat = glObjMesh.material;
            //创建材质
            ADShaderDiffuse *shaderDiffuse = [[ADShaderDiffuse alloc]init];
            REMaterial *material = [[REMaterial alloc]initWithShader:shaderDiffuse];
            if (glObjMat.texture != nil) {
                if (glObjMat.texture.filename != nil) {
                    NSString *fileExt = [glObjMat.texture.filename pathExtension];
                    NSString *fileName = [[glObjMat.texture.filename lastPathComponent]stringByDeletingPathExtension];
                    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:fileExt];
                    material.mainTexture = [RETexture textureFromImagePath:path reload:true];
                }

            }
            else{

            }

            [self.renderer.sharedMaterials addObject:material];
        }
    }
    return self;
}

- (void)willRenderSubMeshAtIndex:(int)index{
    [super willRenderSubMeshAtIndex:index];
    REMaterial *material = self.renderer.material;
    if (!material) {
        material = self.renderer.sharedMaterial;
    }
    
    [material setMatrix:RECamera.current.viewProjMatrix forPropertyName:@"viewProjMatrix"];
    [material setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
    [material setVector:GLKVector4Make(-0.5, 0.5, -0.5, 0) forPropertyName:@"vLightPos"];
    [material setVector:renderSettings.Ambient forPropertyName:@"cAmbient"];
}

- (void)update{
    [super update];
    
    [self.transform update];
}
@end
