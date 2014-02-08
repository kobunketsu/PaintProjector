//
//  Camera.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-9.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Camera.h"
#import "Ultility.h"
#import "Entity.h"

@interface Camera()
    
@end

@implementation Camera

+(Camera*)mainCamera{
    if (mainCamera == nil) {
        mainCamera = [[Camera alloc]init];
    }
    return mainCamera;
}

+(void)setMainCamera:(Camera*)camera{
    mainCamera = camera;
}

+(Camera*)current{
    if (current == nil) {
        current = mainCamera;
    }
    return current;
}

+(void)setCurrent:(Camera*)camera{
    current = camera;
}

-(id)init{
    self = [super init];
    if (self != nil) {
        _cullingMask = Culling_Everything;
        _cullingEntities = [[NSMutableArray alloc]init];
        _backgroundColor = GLKVector4Make(0, 0, 0, 1);
        
        _position = GLKVector3Make(0, 0, 0);
        _focus = GLKVector3Make(0, 1, 0);
        _up = GLKVector3Make(0, 0, -1);
        _orthor = false;
        _aspect = 1.0;
        _fov = GLKMathDegreesToRadians(45);
        _nearClip = 0.01;
        _farClip = 1000;
        _orthoWidth = 0;
        _orthoHeight = 0;
        
        [self updateViewMatrix];
        [self updateProjMatrix];
        
    }
    return  self;
}

-(id)initPerspectiveWithPosition:(GLKVector3)position focus:(GLKVector3)focus up:(GLKVector3)up fov:(float)fov aspect:(float)aspect nearClip:(float)nearClip farClip:(float)farClip{
    self = [super init];
    if (self != nil) {
        _cullingMask = Culling_Everything;
        _cullingEntities = [[NSMutableArray alloc]init];
        _backgroundColor = GLKVector4Make(0, 0, 0, 1);
        
        _orthor = false;
        _position = position;
        _focus = focus;
        _up = up;
        _aspect = aspect;
        _fov = fov;
        _nearClip = nearClip;
        _farClip = farClip;
        _orthoWidth = 0;
        _orthoHeight = 0;
        
        [self updateViewMatrix];
        [self updateProjMatrix];
    }
    return  self;
}

-(id)initOrthorWithPosition:(GLKVector3)position focus:(GLKVector3)focus up:(GLKVector3)up orthoWidth:(float)orthoWidth orthoHeight:(float)orthoHeight nearClip:(float)nearClip farClip:(float)farClip{
    self = [super init];
    if (self != nil) {
        _cullingMask = Culling_Everything;
        _cullingEntities = [[NSMutableArray alloc]init];
        _backgroundColor = GLKVector4Make(0, 0, 0, 1);
        
        _orthor = true;
        _position = position;
        _focus = focus;
        _up = up;
        _orthoWidth = orthoWidth;
        _orthoHeight = orthoHeight;
        _nearClip = nearClip;
        _farClip = farClip;
        
        [self updateViewMatrix];
        [self updateProjMatrix];
    }
    return  self;
}

- (void)destroy{
    [self.cullingEntities removeAllObjects];
}

- (void)updateViewMatrix{
//    _dir = GLKVector3Subtract(_focus, _position);
//    _right = GLKVector3Make(-1, 0, 0);
//    _up = GLKVector3CrossProduct(_dir, _right);
    _viewMatrix  = GLKMatrix4MakeLookAt(_position.x, _position.y, _position.z, _focus.x, _focus.y, _focus.z, _up.x, _up.y, _up.z);
}
-(void)updateProjMatrix{
    if (self.isOrtho) {
        _projMatrix = GLKMatrix4MakeOrtho(-_orthoWidth * 0.5, _orthoWidth * 0.5, -_orthoHeight * 0.5, _orthoHeight * 0.5,  _nearClip, _farClip);
    }
    else{
        _projMatrix = GLKMatrix4MakePerspective(_fov, _aspect, _nearClip, _farClip);
    }
}

- (void)setFocus:(GLKVector3)focus{
    _focus = focus;
    [self updateViewMatrix];
}

- (void)setPosition:(GLKVector3)position {
    _position = position;
    [self updateViewMatrix];    
}

- (void)setUp:(GLKVector3)up {
    assert(GLKVector3Length(up) > 0);
    
    _up = up;
    [self updateViewMatrix];    
}

- (void)setAspect:(float)aspect {
    assert(aspect > 0);
    
    _aspect = aspect;
    [self updateProjMatrix];    
}

- (void)setFov:(float)fov {
    assert(fov > 0);
    
    _fov = fov;
    [self updateProjMatrix];        
}

- (void)setNearClip:(float)nearClip {
    assert(nearClip > 0);
    
    _nearClip = nearClip;
    [self updateProjMatrix];        
}

- (void)setFarClip:(float)farClip {
    assert(farClip > 0);
    
    _farClip = farClip;
    [self updateProjMatrix];        
}

- (GLKMatrix4)viewProjMatrix {
    return GLKMatrix4Multiply(_projMatrix, _viewMatrix);
}

- (void)setProjMatrix:(GLKMatrix4)projMatrix{
    _projMatrix = projMatrix;
}
- (void)resetProjMatrix{
    [self updateProjMatrix];
}

- (void)render{
    glClearColor(self.backgroundColor.x, self.backgroundColor.y, self.backgroundColor.z, self.backgroundColor.w);
    if (self.targetTexture != nil) {
        [self.targetTexture active];
    }
    //draw to screen buffer
    else{
        [Display.main active];
    }

//    [self preRender];
    for (Entity *entity in self.cullingEntities) {

        [entity render];
    }
//    [self postRender];
}
@end
