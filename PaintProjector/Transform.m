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
        _eulerAngles = GLKVector3Make(0, 0, 0);
        _scale = GLKVector3Make(1, 1, 1);
        _worldMatrix = GLKMatrix4Identity;
        _childs = [[NSMutableArray alloc]init];
        _dirty = true;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    Transform *transform = (Transform *)[super copyWithZone:zone];
    transform.translate = self.translate;
    transform.scale = self.scale;
    transform.rotate = self.rotate;
    transform.eulerAngles = self.eulerAngles;
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
    else if ([keyPath isEqualToString:@"eulerAngles.x"]) {
        NSNumber *num = (NSNumber *)value;
        self.eulerAngles = GLKVector3Make(num.floatValue, self.eulerAngles.y, self.eulerAngles.z);
    }
    else if ([keyPath isEqualToString:@"eulerAngles.y"]) {
        NSNumber *num = (NSNumber *)value;
        self.eulerAngles = GLKVector3Make(self.eulerAngles.x, num.floatValue, self.eulerAngles.z);
    }
    else if ([keyPath isEqualToString:@"eulerAngles.z"]) {
        NSNumber *num = (NSNumber *)value;
        self.eulerAngles = GLKVector3Make(self.eulerAngles.x, self.eulerAngles.y, num.floatValue);
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
    else if ([keyPath isEqualToString:@"eulerAngles.x"]) {
        return [NSNumber numberWithFloat:self.eulerAngles.x];
    }
    else if ([keyPath isEqualToString:@"eulerAngles.y"]) {
        return [NSNumber numberWithFloat:self.eulerAngles.y];
    }
    else if ([keyPath isEqualToString:@"eulerAngles.z"]) {
        return [NSNumber numberWithFloat:self.eulerAngles.z];
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
- (void)setRotate:(GLKQuaternion)rotate{
    if (GLKVector4AllEqualToVector4(GLKVector4Make(_rotate.x, _rotate.y, _rotate.z, _rotate.w), GLKVector4Make(rotate.x, rotate.y, rotate.z, rotate.w))) {
        return;
    }
    _rotate = rotate;
    self.dirty = true;
}
- (void)setTranslate:(GLKVector3)translate{
    if (GLKVector3AllEqualToVector3(_translate, translate)) {
        return;
    }
    _translate = translate;
    self.dirty = true;
}
- (void)setScale:(GLKVector3)scale{
    if (GLKVector3AllEqualToVector3(_scale, scale)) {
        return;
    }
    _scale = scale;
    self.dirty = true;
}
- (void)setEulerAngles:(GLKVector3)eulerAngles{
    if (GLKVector3AllEqualToVector3(_eulerAngles, eulerAngles)) {
        return;
    }
    _eulerAngles = eulerAngles;
    _rotate = [MathHelper quatFromEulerAngles:eulerAngles];
    
    self.dirty = true;
}

- (void)setParent:(Transform *)parent{
    _parent = parent;
    
    if (![self isChildOf:parent]) {
        [parent.childs addObject:self];
    }
}

- (void)setDirty:(BOOL)dirty{
    _dirty = dirty;

    for (Transform *transform in self.childs) {
        transform.dirty = dirty;
    }
}

//如果本节点dirty,所有子节点标记dirty
- (void)update{
    if(self.dirty){
        GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(self.scale.x, self.scale.y, self.scale.z);
        GLKMatrix4 rotateMatrix = GLKMatrix4MakeWithQuaternion(self.rotate);
        GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(self.translate.x, self.translate.y, self.translate.z);
        
        GLKMatrix4 localMatrix = GLKMatrix4Multiply(translateMatrix, GLKMatrix4Multiply(rotateMatrix, scaleMatrix));
        
        if (self.parent) {
            self.worldMatrix = GLKMatrix4Multiply(self.parent.worldMatrix, localMatrix);
        }
        else{
            self.worldMatrix = localMatrix;
        }
        
        //更新完自己的worldMatrix之后更新子transform
        for (Transform *transform in self.childs) {
            [transform update];
        }
        
        //子节点全部更新完毕后标记自己dirty false
        self.dirty = false;
    }
}

- (Transform*)getChild:(NSInteger)index{
    if (index < 0) {
        DebugLogError(@"getChild at negative num index");
        return nil;
    }
    if (index >= self.childs.count) {
        DebugLogError(@"getChild beyond num counts");
        return nil;
    }
    return self.childs[index];
}
- (BOOL)isChildOf:(Transform*)transform{
    return [self.childs containsObject:transform];
}
- (NSUInteger)childCount{
    return self.childs.count;
}
@end
