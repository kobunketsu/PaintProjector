//
//  Transform.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import <GLKit/GLKit.h>

@interface Transform : Component
@property(assign, nonatomic) GLKVector3 translate;
@property(assign, nonatomic) GLKQuaternion rotate;
@property(assign, nonatomic) GLKVector3 scale;
@property (assign, nonatomic) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵
@end
