//
//  Animation.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import "TPPropertyAnimation.h"

@interface Animation : Object
@property (assign, nonatomic, getter = isPlaying) BOOL playing;
@property (weak, nonatomic) TPPropertyAnimation *clip;
@property (retain, nonatomic) NSMutableDictionary *clips;
@property (assign, nonatomic) id target;
+ (id)animationWithAnimClip:(TPPropertyAnimation *)clip;
- (void)addClip:(TPPropertyAnimation*)clip;
- (void)removeClip:(NSString *)name;
- (void)play;
- (void)stop;

@end
