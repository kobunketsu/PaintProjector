//
//  Camera.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-9.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "RECamera.h"
#import "ADUltility.h"
#import "REEntity.h"

@interface RECamera()
    
@end

@implementation RECamera

+(RECamera*)mainCamera{
    if (mainCamera == nil) {
        mainCamera = [[RECamera alloc]init];
    }
    return mainCamera;
}

+(void)setMainCamera:(RECamera*)camera{
    mainCamera = camera;
}

+(RECamera*)current{
    if (current == nil) {
        current = mainCamera;
    }
    return current;
}

+(void)setCurrent:(RECamera*)camera{
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
        _farClip = 100;
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
    [super destroy];
    
    [self.cullingEntities removeAllObjects];
    
    [self.targetTexture destroy];
    self.targetTexture = nil;
}

- (id)copyWithZone:(NSZone *)zone{
    RECamera *camera = (RECamera *)[super copyWithZone:zone];
    camera.position = self.position;
    camera.focus = self.focus;
    camera.dir = self.dir;
    camera.up = self.up;
    camera.right = self.right;
    camera.aspect = self.aspect;
    camera.fov = self.fov;
    camera.orthor = self.orthor;
    camera.orthoWidth = self.orthoWidth;
    camera.orthoHeight = self.orthoHeight;
    camera.nearClip = self.nearClip;
    camera.farClip = self.farClip;
    camera.viewMatrix = self.viewMatrix;
    camera.projMatrix = self.projMatrix;
    camera.viewProjMatrix = self.viewProjMatrix;
    camera.backgroundColor = self.backgroundColor;
    camera.cullingMask = self.cullingMask;
    camera.cullingEntities = [self.cullingEntities mutableCopy];
    camera.targetTexture = self.targetTexture;
    
    return camera;
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

- (void)setOrthoWidth:(float)orthoWidth{
    assert(orthoWidth >= 0);
    _orthoWidth = orthoWidth;
    [self updateProjMatrix];
}

- (void)setOrthoHeight:(float)orthoHeight{
    assert(orthoHeight >= 0);
    _orthoHeight = orthoHeight;
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
    DebugLogGLGroupStart(@"Camera %@ rendering", self.name);
    [self preRender];

    if (self.targetTexture != nil) {
        [self.targetTexture active];
    }
    //draw to screen buffer
    else{
        [REDisplay.main active];
    }


    for (REEntity *entity in self.cullingEntities) {
        if (entity.active) {
            [entity render];
        }
    }
    [self postRender];
    DebugLogGLGroupEnd();
}
- (void)preRender{
    glClearColor(self.backgroundColor.x, self.backgroundColor.y, self.backgroundColor.z, self.backgroundColor.w);
}
- (void)postRender{
    glClearColor(0,0,0,0);
}
@end
