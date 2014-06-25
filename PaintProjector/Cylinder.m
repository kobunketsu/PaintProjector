//
//  Cylinder.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Cylinder.h"

@implementation Cylinder
- (id)init{
    self = [super init];
    if (self) {
        _reflectionStrength = 1;
    }
    return self;
}

-(void)willRenderSubMeshAtIndex:(int)index{
    [super willRenderSubMeshAtIndex:index];
    
    if (index == 0) {
        [self.renderer.sharedMaterial setMatrix:Camera.current.viewMatrix forPropertyName:@"modelViewMatrix"];
        [self.renderer.sharedMaterial setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
        [self.renderer.sharedMaterial setMatrix:Camera.current.projMatrix forPropertyName:@"projMatrix"];
        [self.renderer.sharedMaterial setVector:GLKVector4MakeWithVector3(self.eye, self.reflectionStrength) forPropertyName:@"eye"];
        [self.renderer.sharedMaterial setVector:self.reflectionTexUVSpace forPropertyName:@"reflectionTexUVSpace"];
        [self.renderer.sharedMaterial setTexture:self.reflectionTex atIndex:1 forPropertyName:@"reflectionTex"];
    }
    else if (index == 1) {
        Material *matCap = [self.renderer.sharedMaterials objectAtIndex:index];
        [matCap setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
        [matCap setMatrix:Camera.current.viewProjMatrix forPropertyName:@"viewProjMatrix"];
        [matCap setTexture:matCap.mainTexture atIndex:0 forPropertyName:@"mainTexture"];
    }
}

- (void)update{
    [super update];
    
//    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(self.transform.scale.x, self.transform.scale.y, self.transform.scale.z);
//    GLKMatrix4 rotateMatrix = GLKMatrix4MakeWithQuaternion(self.transform.rotate);
//    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(self.transform.translate.x, self.transform.translate.y, self.transform.translate.z);
//    
//    self.transform.worldMatrix = GLKMatrix4Multiply(translateMatrix, GLKMatrix4Multiply(rotateMatrix, scaleMatrix));
}
@end
