//
//  Camera.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-9.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Camera.h"

@implementation Camera

@synthesize viewMatrix = _viewMatrix;
-(void)updateViewMatrix{
    _dir = GLKVector3Subtract(_target, _position);
    _right = GLKVector3Make(-1, 0, 0);
    _up = GLKVector3CrossProduct(_dir, _right);

    _viewMatrix  = GLKMatrix4MakeLookAt(_position.x, _position.y, _position.z, _target.x, _target.y, _target.z, _up.x, _up.y, _up.z);    
}
-(void)updateProjMatrix{
    _projMatrix = GLKMatrix4MakePerspective(_fov, _aspect, _nearClip, _farClip);    
}

- (GLKVector3)target {
    return _target;
}

- (void)setTarget:(GLKVector3)newValue {
    _target = newValue;
    [self updateViewMatrix];
}

- (GLKVector3)position {
    return _position;
}

- (void)setPosition:(GLKVector3)newValue {
    _position = newValue;
    [self updateViewMatrix];    
}

- (GLKVector3)up {
    return _up;
}

- (void)setUp:(GLKVector3)newValue {
    _up = newValue;
    [self updateViewMatrix];    
}

- (float)aspect {
    return _aspect;
}

- (void)setAspect:(float)newValue {
    _aspect = newValue;
    [self updateProjMatrix];    
}

- (float)fov {
    return _fov;
}

- (void)setFov:(float)newValue {
    _fov = newValue;
    [self updateProjMatrix];        
}

- (float)nearClip {
    return _nearClip;
}

- (void)setNearClip:(float)newValue {
    _nearClip = newValue;
    [self updateProjMatrix];        
}

- (float)farClip {
    return _farClip;
}

- (void)setFarClip:(float)newValue {
    _farClip = newValue;
    [self updateProjMatrix];        
}

- (GLKMatrix4)viewProjMatrix {
    return GLKMatrix4Multiply(_projMatrix, _viewMatrix);
}

//- (void)setViewProjMatrix:(GLKMatrix4)newValue {
//    _viewProjMatrix = newValue;
//}

@end
