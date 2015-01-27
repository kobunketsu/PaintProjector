//
//  NSObject+PropertyAnimation.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/25/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "NSObject+PropertyAnimation.h"


@implementation NSObject (PropertyAnimation)
- (void)animationToTarget:(id)target params:(NSMutableDictionary*)params duration:(CGFloat)duration timing:(REPropertyAnimationTiming)timing completionDelegate:(id)delegate completionBlock:(void (^) (void))block{
    REAnimationClip *animClip = [[REAnimationClip alloc]init];
//    animClip.name = @"userInputParamsTargetAnimClip";
    NSEnumerator *enumeratorKeyPath = [params keyEnumerator];
    for (NSObject *keyPath in enumeratorKeyPath) {
        NSNumber *toValue = [params objectForKey:keyPath];
        
        REPropertyAnimation *propAnim = [REPropertyAnimation propertyAnimationWithKeyPath:(NSString*)keyPath];
        propAnim.fromValue = [target valueForKeyPath:(NSString*)keyPath];
        propAnim.toValue = toValue;
        propAnim.duration = duration;
        propAnim.target = target;
        propAnim.timing = timing;
        [animClip addPropertyAnimation:propAnim];
    }
    
    REPropertyAnimation* propAnim = animClip.propertyAnimations.firstObject;
    propAnim.delegate = delegate;
    [propAnim setCompletionBlock:^{
        if (block) {
            block();
        }
    }];
    
    REAnimation *animation = [REAnimation animationWithAnimClip:animClip];
    animation.target = target;
    [animation play];
}
@end
