//
//  Animation.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REComponent.h"
#import "REAnimationClip.h"

@interface REAnimation : REObject
@property (assign, nonatomic, getter = isPlaying) BOOL playing;
@property (weak, nonatomic) REAnimationClip *clip;
@property (retain, nonatomic) NSMutableDictionary *clips;
@property (assign, nonatomic) id target;
+ (id)animationWithAnimClip:(REAnimationClip *)clip;
- (void)addClip:(REAnimationClip*)clip;
- (void)removeClip:(NSString *)name;
- (void)play;
- (void)stop;

@end
