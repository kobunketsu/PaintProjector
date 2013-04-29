//
//  Camera.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-9.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称:
//描述:
//功能:

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
@interface Camera : NSObject{
    GLKVector3 _target;
    GLKVector3 _position;
    GLKVector3 _dir;        
    GLKVector3 _up;    
    GLKVector3 _right;            
    float _aspect;
    float _fov;
    float _nearClip;
    float _farClip;    
    GLKMatrix4 _viewMatrix;
    GLKMatrix4 _projMatrix;    
    GLKMatrix4 _viewProjMatrix;        
}
@property(nonatomic, assign)GLKMatrix4 viewMatrix;
-(void)updateViewMatrix;
- (GLKVector3)target;

- (void)setTarget:(GLKVector3)newValue;

- (GLKVector3)position;

- (void)setPosition:(GLKVector3)newValue;

- (GLKVector3)up;

- (void)setUp:(GLKVector3)newValue;

- (float)aspect;

- (void)setAspect:(float)newValue;

- (float)fov;

- (void)setFov:(float)newValue;

- (float)nearClip;

- (void)setNearClip:(float)newValue;

- (float)farClip;

- (void)setFarClip:(float)newValue;

- (GLKMatrix4)viewProjMatrix;

//- (void)setViewProjMatrix:(GLKMatrix4)newValue;

@end
