//
//  Cylinder.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/5/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Cylinder.h"

@implementation Cylinder

-(void)willRenderSubMeshAtIndex:(int)index{
    [super willRenderSubMeshAtIndex:index];
    
    if (index == 0) {
        [self.renderer.material setMatrix:Camera.current.viewMatrix forPropertyName:@"modelViewMatrix"];
        [self.renderer.material setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
        [self.renderer.material setMatrix:Camera.current.projMatrix forPropertyName:@"projMatrix"];
        [self.renderer.material setVector:GLKVector4MakeWithVector3(self.eye, 0) forPropertyName:@"eye"];
        [self.renderer.material setVector:self.reflectionTexUVSpace forPropertyName:@"reflectionTexUVSpace"];
        [self.renderer.material setTexture:self.reflectionTex atIndex:1 forPropertyName:@"reflectionTex"];
    }
    else if (index == 1) {
        Material *matCap = [self.renderer.materials objectAtIndex:index];
        [matCap setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
        [matCap setMatrix:Camera.current.viewProjMatrix forPropertyName:@"viewProjMatrix"];
        [matCap setTexture:matCap.mainTexture atIndex:0 forPropertyName:@"mainTexture"];
    }
}
@end
