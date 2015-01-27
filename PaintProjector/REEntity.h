//
//  Entity.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REComponent.h"
#import "RERenderer.h"
#import "RETransform.h"
#import "REAnimation.h"

@interface REEntity : REComponent <RERendererDelegate>
{
}

@property(retain, nonatomic) RERenderer *renderer;
@property(retain, nonatomic) RETransform *transform;
@property(assign, nonatomic) LayerMask layerMask;

- (void)render;

- (void)update;

@end
