//
//  Renderer.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import "Material.h"
#import "GLWrapper.h"
#import "Camera.h"

@protocol RendererDelegate
- (void)willRenderSubMeshAtIndex:(int)index;
@end

@interface Renderer : Component
@property (assign, nonatomic) id delegate;
@property (weak, nonatomic) Material *material;
@property (retain, nonatomic) NSMutableArray *materials;

- (id)init;

- (void)render;

@end
