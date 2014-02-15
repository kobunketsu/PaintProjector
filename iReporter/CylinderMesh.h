//
//  CylinderMesh.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/4/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Mesh.h"

@interface CylinderMesh : Mesh

@property (assign, nonatomic) float radius;//半径
@property (assign, nonatomic) int sides;//段数
@property (assign, nonatomic) float height;//高度

- (id)initWithRadius:(CGFloat)radius sides:(size_t)sides height:(CGFloat)height;
@end
