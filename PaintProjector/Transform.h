//
//  Transform.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import <GLKit/GLKit.h>

@interface Transform : Component{
}
@property(weak, nonatomic) Transform *parent;
//TODO:关闭childs的访问，设定自己的parent
@property(retain, nonatomic) NSMutableArray *childs;
//局部坐标系
@property(assign, nonatomic) GLKVector3 translate;
@property(assign, nonatomic) GLKQuaternion rotate;
@property(assign, nonatomic) GLKVector3 scale;
@property(assign, nonatomic) GLKVector3 eulerAngles;
@property(assign, nonatomic) BOOL dirty;
//世界坐标系
@property (assign, nonatomic) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵

- (void)update;
- (Transform*)getChild:(NSInteger)index;
- (BOOL)isChildOf:(Transform*)transform;
- (NSUInteger)childCount;

@end
