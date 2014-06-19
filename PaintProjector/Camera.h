//
//  Camera.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-9.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

//名称:
//描述:
//功能:

#import <GLKit/GLKit.h>
#import "Component.h"
#import "RenderTexture.h"
#import "Display.h"

typedef NS_ENUM(NSInteger, LayerMask) {
    Layer_Default       = 1 <<  0,
    Layer_Reflection    = 1 <<  1,
};

typedef NS_ENUM(NSInteger, CullingMask) {
    Culling_Nothing       = 0,
    Culling_Everything    = 0xFF,
    Culling_Default       = 1 <<  0,
    Culling_Reflection    = 1 <<  1,
};

@class Camera;

static Camera *mainCamera;
static Camera *current;
static NSMutableArray *allCameras;

@interface Camera : Component{
    
}
@property (assign, nonatomic)GLKVector3 focus;
@property (assign, nonatomic)GLKVector3 position;
@property (assign, nonatomic)GLKVector3 dir;
@property (assign, nonatomic)GLKVector3 up;
@property (assign, nonatomic)GLKVector3 right;
@property (assign, nonatomic)float aspect;
@property (assign, nonatomic)float fov;
@property (assign, nonatomic, getter = isOrtho)BOOL orthor;
@property (assign, nonatomic)float orthoWidth;
@property (assign, nonatomic)float orthoHeight;
@property (assign, nonatomic)float nearClip;
@property (assign, nonatomic)float farClip;
@property (assign, nonatomic)GLKMatrix4 viewMatrix;
@property (assign, nonatomic)GLKMatrix4 projMatrix;
@property (assign, nonatomic)GLKMatrix4 viewProjMatrix;
@property (assign, nonatomic)GLKVector4 backgroundColor;
@property (assign, nonatomic)CullingMask cullingMask;
@property (retain, nonatomic)NSMutableArray *cullingEntities;
@property (weak, nonatomic)RenderTexture *targetTexture;


+ (Camera*)mainCamera;
+ (void)setMainCamera:(Camera*)camera;
+ (Camera*)current;
+ (void)setCurrent:(Camera*)camera;

-(id)initPerspectiveWithPosition:(GLKVector3)position focus:(GLKVector3)focus up:(GLKVector3)up fov:(float)fov aspect:(float)aspect nearClip:(float)nearClip farClip:(float)farClip;
    
-(id)initOrthorWithPosition:(GLKVector3)position focus:(GLKVector3)focus up:(GLKVector3)up orthoWidth:(float)orthoWidth orthoHeight:(float)orthoHeight nearClip:(float)nearClip farClip:(float)farClip;

- (void)updateViewMatrix;
- (void)updateProjMatrix;

//set a custom proj matrix
- (void)setProjMatrix:(GLKMatrix4)projMatrix;
//reset to normal proj matrix from custom
- (void)resetProjMatrix;

//- (void)preRender;
- (void)render;
//- (void)postRender;
@end
