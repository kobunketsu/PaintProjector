//
//  Transform.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Transform.h"

@implementation Transform
-(id)init{
    self = [super init];
    if (self) {
        _translate = GLKVector3Make(0, 0, 0);
        _rotate = GLKQuaternionIdentity;
        _scale = GLKVector3Make(1, 1, 1);
        _worldMatrix = GLKMatrix4Identity;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    Transform *transform = (Transform *)[super copyWithZone:zone];
    transform.translate = self.translate;
    transform.scale = self.scale;
    transform.rotate = self.rotate;
    return transform;
}
@end
