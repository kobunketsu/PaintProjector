//
//  REAnimationClip.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/17/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REObject.h"
#import "REPropertyAnimation.h"
@interface REAnimationClip : REObject
@property(nonatomic, retain) NSMutableArray *propertyAnimations;
+ (REAnimationClip*)animationClipWithPropertyAnimation:(REPropertyAnimation*)propertyAnimation;
- (void)addPropertyAnimation:(REPropertyAnimation*)propertyAnimation;
- (void)removePropertyAnimation:(REPropertyAnimation*)propertyAnimation;
- (void)beginWithTarget:(id)target;
- (void)cancel;
@end
