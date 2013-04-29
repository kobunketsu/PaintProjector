//
//  MovableObject.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-30.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "MovableObject.h"

@implementation MovableObject
@synthesize translateBeforePanGR = _translateBeforePanGR;
@synthesize translateAfterPanGR = _translateAfterPanGR;
@synthesize worldMatrix;

- (GLKVector3)rotate {
    return _rotate;
}

- (void)setRotate:(GLKVector3)newValue {
    _rotate = newValue;
    [self updateWorldMatrix];
}

- (GLKVector3)scale {
    return _scale;
}

- (void)setScale:(GLKVector3)newValue {
    _scale = newValue;
    [self updateWorldMatrix];
}

- (GLKVector3)translate {
    return _translate;
}

- (void)setTranslate:(GLKVector3)newValue {
    _translate = newValue;
    [self updateWorldMatrix];
}
-(void)updateWorldMatrix{
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(_translate.x, _translate.y, _translate.z);
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(_scale.x, _scale.y, _scale.z);
    self.worldMatrix = GLKMatrix4Multiply(translateMatrix, scaleMatrix);
}
@end
