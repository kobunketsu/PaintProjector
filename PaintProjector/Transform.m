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

-(void)setValue:(id)value forKeyPath:(NSString *)keyPath{
    if ([keyPath isEqualToString:@"translate.x"]) {
        NSNumber *num = (NSNumber *)value;
        self.translate = GLKVector3Make( num.floatValue, self.translate.y, self.translate.z);
    }
    else if ([keyPath isEqualToString:@"translate.y"]) {
        NSNumber *num = (NSNumber *)value;
        self.translate = GLKVector3Make( self.translate.x, num.floatValue, self.translate.z);
    }
    else if ([keyPath isEqualToString:@"translate.z"]) {
        NSNumber *num = (NSNumber *)value;
        self.translate = GLKVector3Make( self.translate.x, self.translate.y, num.floatValue);
    }
    else if ([keyPath isEqualToString:@"rotate.x"]) {
        NSNumber *num = (NSNumber *)value;
        self.rotate = GLKQuaternionMake(num.floatValue, self.rotate.y, self.rotate.z, self.rotate.w);
    }
    else if ([keyPath isEqualToString:@"rotate.y"]) {
        NSNumber *num = (NSNumber *)value;
        self.rotate = GLKQuaternionMake(self.rotate.x, num.floatValue, self.rotate.z, self.rotate.w);
    }
    else if ([keyPath isEqualToString:@"rotate.z"]) {
        NSNumber *num = (NSNumber *)value;
        self.rotate = GLKQuaternionMake(self.rotate.x, self.rotate.y, num.floatValue, self.rotate.w);
    }
    else if ([keyPath isEqualToString:@"rotate.w"]) {
        NSNumber *num = (NSNumber *)value;
        self.rotate = GLKQuaternionMake(self.rotate.x, self.rotate.y, self.rotate.z, num.floatValue);
    }
    else if ([keyPath isEqualToString:@"scale.x"]) {
        NSNumber *num = (NSNumber *)value;
        self.scale = GLKVector3Make( num.floatValue, self.scale.y, self.scale.z);
    }
    else if ([keyPath isEqualToString:@"scale.y"]) {
        NSNumber *num = (NSNumber *)value;
        self.scale = GLKVector3Make( self.scale.x, num.floatValue, self.scale.z);
    }
    else if ([keyPath isEqualToString:@"scale.z"]) {
        NSNumber *num = (NSNumber *)value;
        self.scale = GLKVector3Make( self.scale.x, self.scale.y, num.floatValue);
    }
}

- (id)valueForKeyPath:(NSString *)keyPath{
    if ([keyPath isEqualToString:@"translate.x"]) {
        return [NSNumber numberWithFloat:self.translate.x];
    }
    else if ([keyPath isEqualToString:@"translate.y"]) {
        return [NSNumber numberWithFloat:self.translate.y];
    }
    else if ([keyPath isEqualToString:@"translate.z"]) {
        return [NSNumber numberWithFloat:self.translate.z];
    }
    else if ([keyPath isEqualToString:@"rotate.x"]) {
        return [NSNumber numberWithFloat:self.rotate.x];
    }
    else if ([keyPath isEqualToString:@"rotate.y"]) {
        return [NSNumber numberWithFloat:self.rotate.y];
    }
    else if ([keyPath isEqualToString:@"rotate.z"]) {
        return [NSNumber numberWithFloat:self.rotate.z];
    }
    else if ([keyPath isEqualToString:@"rotate.w"]) {
        return [NSNumber numberWithFloat:self.rotate.w];
    }
    else if ([keyPath isEqualToString:@"scale.x"]) {
        return [NSNumber numberWithFloat:self.scale.x];
    }
    else if ([keyPath isEqualToString:@"scale.y"]) {
        return [NSNumber numberWithFloat:self.scale.y];
    }
    else if ([keyPath isEqualToString:@"scale.z"]) {
        return [NSNumber numberWithFloat:self.scale.z];
    }
    return nil;
}
@end
