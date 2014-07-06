
//
//  Animation.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REAnimation.h"
@interface REAnimation()
@end

@class REAnimation;

@implementation REAnimation
+ (id)animationWithAnimClip:(REAnimationClip *)clip{
    REAnimation *anim = [[REAnimation alloc]init];
    [anim addClip:clip];
    anim.clip = clip;
    return  anim;
}

- (id)init{
    self = [super init];
    if (self) {
        _clips = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)addClip:(REAnimationClip*)clip{
    if (!clip.name) {
        DebugLog(@"addClip no name for clip %@", clip);
        return;
    }
    [self.clips setValue:clip forKey:clip.name];
}

- (void)removeClip:(NSString *)name{
    [self.clips removeObjectForKey:name];
}

-(void)setClips:(NSMutableDictionary *)clips{
    if(_clips != nil)
    {
        _clips = nil;
    }
    _clips = [clips mutableCopy];
}

- (void)stop{
    if(!self.target){
        return;
    }
    
    if (!self.clip) {
        return;
    }
    
    self.playing = false;
    [self.clip cancel];
}

- (void)play{
    if(!self.target){
        return;
    }
    
    if (!self.clip) {
        return;
    }
    
    self.playing = true;
    
    [self.clip beginWithTarget:self.target];
}

- (void)destroy{
    [self.clips removeAllObjects];
    self.clips = nil;
}

- (void)dealloc{
    [self destroy];
}

- (void)setTarget:(id)target{
    _target = target;
}

- (id)copyWithZone:(NSZone *)zone{
    REAnimation *anim = (REAnimation *)[super copyWithZone:zone];
    anim.target = self.target;
    anim.clips = [self.clips copy];
    anim.playing = self.playing;
    anim.clip = self.clip;
    
    return anim;
}
@end
