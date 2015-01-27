//
//  REAnimationClip.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REAnimationClip.h"

@implementation REAnimationClip
+ (REAnimationClip*)animationClipWithPropertyAnimation:(REPropertyAnimation*)propertyAnimation{
    REAnimationClip *animClip = [[REAnimationClip alloc]init];
    [animClip addPropertyAnimation:propertyAnimation];
    return animClip;
}

- (id)init{
    self = [super init];
    if (self) {
        _propertyAnimations = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)dealloc{
    [self destroy];
}
- (void)destroy{
    [self.propertyAnimations removeAllObjects];
}

- (void)addPropertyAnimation:(REPropertyAnimation*)propertyAnimation{
    [self.propertyAnimations addObject:propertyAnimation];
}

- (void)removePropertyAnimation:(REPropertyAnimation*)propertyAnimation{
    [self.propertyAnimations removeObject:propertyAnimation];
}

- (void)beginWithTarget:(id)target{
    for (REPropertyAnimation *propertAnimation in self.propertyAnimations) {
        [propertAnimation beginWithTarget:target];
    }
}

- (void)cancel{
    for (REPropertyAnimation *propertAnimation in self.propertyAnimations) {
        [propertAnimation cancel];
    }
}

- (id)copyWithZone:(NSZone *)zone{
    REAnimationClip *animClip = (REAnimationClip *)[super copyWithZone:zone];
    animClip.propertyAnimations = [self.propertyAnimations copy];

    return animClip;
}
@end
