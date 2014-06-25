//
//  AnimationClip.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "AnimationClip.h"

@implementation AnimationClip
+ (AnimationClip*)animationClipWithPropertyAnimation:(TPPropertyAnimation*)propertyAnimation{
    AnimationClip *animClip = [[AnimationClip alloc]init];
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

- (void)addPropertyAnimation:(TPPropertyAnimation*)propertyAnimation{
    [self.propertyAnimations addObject:propertyAnimation];
}

- (void)removePropertyAnimation:(TPPropertyAnimation*)propertyAnimation{
    [self.propertyAnimations removeObject:propertyAnimation];
}

- (void)beginWithTarget:(id)target{
    for (TPPropertyAnimation *propertAnimation in self.propertyAnimations) {
        [propertAnimation beginWithTarget:target];
    }
}

- (void)cancel{
    for (TPPropertyAnimation *propertAnimation in self.propertyAnimations) {
        [propertAnimation cancel];
    }
}

- (id)copyWithZone:(NSZone *)zone{
    AnimationClip *animClip = (AnimationClip *)[super copyWithZone:zone];
    animClip.propertyAnimations = [self.propertyAnimations copy];

    return animClip;
}
@end
