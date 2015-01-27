//
//  Renderer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REComponent.h"
#import "REMaterial.h"
#import "REGLWrapper.h"
#import "RECamera.h"

@protocol RERendererDelegate
- (void)willRenderSubMeshAtIndex:(int)index;
@end

@interface RERenderer : REComponent
@property (assign, nonatomic) id delegate;
@property (retain, nonatomic) REMaterial *material;
@property (retain, nonatomic) NSMutableArray *materials;
@property (weak, nonatomic) REMaterial *sharedMaterial;
@property (retain, nonatomic) NSMutableArray *sharedMaterials;
- (id)init;

- (void)render;

@end
