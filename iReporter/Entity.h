//
//  Entity.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import "Renderer.h"
#import "Transform.h"
#import "Animation.h"

@interface Entity : Component <RendererDelegate>
{
}

@property(retain, nonatomic) Renderer *renderer;
@property(retain, nonatomic) Transform *transform;
@property(assign, nonatomic) LayerMask layerMask;

- (void)render;

- (void)update;
@end
