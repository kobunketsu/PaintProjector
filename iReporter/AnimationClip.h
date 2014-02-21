//
//  AnimationClip.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Object.h"
#import "TPPropertyAnimation.h"
@interface AnimationClip : Object
@property(nonatomic, retain) NSMutableArray *propertyAnimations;
+ (AnimationClip*)animationClipWithPropertyAnimation:(TPPropertyAnimation*)propertyAnimation;
- (void)addPropertyAnimation:(TPPropertyAnimation*)propertyAnimation;
- (void)removePropertyAnimation:(TPPropertyAnimation*)propertyAnimation;
- (void)beginWithTarget:(id)target;
- (void)cancel;
@end
