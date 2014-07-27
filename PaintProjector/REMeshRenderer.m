//
//  MeshRenderer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REMeshRenderer.h"

@implementation REMeshRenderer
- (id)initWithMeshFilter:(REMeshFilter*)meshFilter{
    self = [super init];
    if (self != nil) {
        _meshFilter = meshFilter;
        
    }
    return  self;
}

- (void)render{
    [[REGLWrapper current] bindVertexArrayOES:self.meshFilter.mesh.vertexArray];
    size_t offset = 0;
    
    size_t subMeshCount = self.meshFilter.mesh.subMeshTriCounts.count;
    for (size_t i = 0; i < subMeshCount; ++i) {
        REMaterial *material = nil;
        if (i < self.materials.count) {
            material = [self.materials objectAtIndex:i];
        }

        if (!material) {
            material = [self.sharedMaterials objectAtIndex:i];
            if (!material) {
                continue;
            }
        }

        NSNumber *subMeshTriCount = [self.meshFilter.mesh.subMeshTriCounts objectAtIndex:i];
        if (!subMeshTriCount) {
            continue;
        }

        if (material.transparent) {
            glDepthMask(GL_FALSE);
        }
        else{
            glDepthMask(GL_TRUE);
        }
        
        //TODO: convert to REGLWrapper
        [material.shader setBlendMode];
        
//        if (material.effect != nil) {
//            [material.effect prepareToDraw];
//        }
//        else{
            [[REGLWrapper current] useProgram:material.shader.program uniformBlock:^{
            }];
            if (material.mainTexture.texID) {
                [[REGLWrapper current] activeTexSlot:GL_TEXTURE0 bindTexture:material.mainTexture.texID];
            }
//        }
        
        //TODO: use other texture
        [self.delegate willRenderSubMeshAtIndex:i];
        
        //    size_t triangleCount = data.length / (sizeof(short) * 3);
        size_t indiceCount = subMeshTriCount.intValue * 3;
        
        GLvoid *ptr = (GLvoid*)(offset * sizeof(short));
        
        [[REGLWrapper current]setFaceMode:material.faceMode];
        
        if (material.faceMode == RE_DoubleFace) {
            glDisable(GL_CULL_FACE);
        }
        
        //test
        if (self.meshFilter.mesh.topology == Triangles) {
            glDrawElements(GL_TRIANGLES, indiceCount, GL_UNSIGNED_SHORT, ptr);
        }
        else if (self.meshFilter.mesh.topology == Lines) {
            glDrawElements(GL_LINES, indiceCount, GL_UNSIGNED_SHORT, ptr);
        }
        
        offset += indiceCount;
        
        //restore
        if (material.transparent) {
            glDepthMask(GL_TRUE);
        }
        if (material.faceMode == RE_DoubleFace) {
            glEnable(GL_CULL_FACE);
        }
    }
}

- (id)copyWithZone:(NSZone *)zone{
    REMeshRenderer *renderer = (REMeshRenderer *)[super copyWithZone:zone];
    renderer.meshFilter = [self.meshFilter copy];
    return  renderer;
}
@end
