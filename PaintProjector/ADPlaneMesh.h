//
//  Plane.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/2/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REMesh.h"

@interface ADPlaneMesh : REMesh
@property (assign, nonatomic) size_t row;//投影模型网格参数
@property (assign, nonatomic) size_t column;//投影模型网格参数

- (id)initWithRow:(size_t)row column:(size_t)column;
@end
