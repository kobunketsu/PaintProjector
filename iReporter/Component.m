//
//  Component.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Component.h"
#import "Animation.h"

@implementation Component
-(id)init{
    self = [super init];
    if (self) {
        _active = true;
    }
    return self;
}
-(void)setAnimation:(Animation *)animation{
    _animation = animation;
    _animation.target = self;
}
- (void)destroy{
    [self setAnimation:nil];
}

- (id)copyWithZone:(NSZone *)zone{
    Component *comp = (Component *)[super copyWithZone:zone];
    if (self.animation) {
        comp.animation = [self.animation copy];
    }

    return comp;
}
@end
