//
//  Cylinder.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "TextureManager.h"
#import "ShaderManager.h"
#import "GLWrapper.h"
//@class GLWrapper;

typedef struct {
    float Position[3];
    float Texcoord[2];
} SimpleVertex;

@interface Cylinder : NSObject
{
    //参考线
    GLuint _vertexArrayCap;
    GLuint _vertexBufferCap;
    GLuint _vertexArrayMain;
    GLuint _vertexBufferMain;
    GLuint _vertexArrayShadow;
    GLuint _vertexBufferShadow;
//    SimpleVertex*  _vertexData;
//    GLuint _program;
//    GLuint _wvpMatrixUniform;
}
@property (weak, nonatomic) GLWrapper* glWrapper;
@property (retain, nonatomic) GLKTextureInfo *texInfoCylinderCap;//贴图
@property (retain, nonatomic) GLKTextureInfo *texInfoCylinderMain;//贴图
@property (retain, nonatomic) GLKTextureInfo *texInfoCylinderShadow;//贴图
@property (assign, nonatomic) GLuint reflectionTex;//render to target
@property (assign, nonatomic) float radius;//半径
@property (assign, nonatomic) int sides;//段数
@property (assign, nonatomic) float height;//高度
@property (strong, nonatomic) GLKBaseEffect *effect;
@property (assign, nonatomic) GLKVector3 eye;
@property (assign, nonatomic) GLKVector4 reflectionTexUVSpace;
@property (assign, nonatomic) GLKMatrix4 viewMatrix;
@property (assign, nonatomic) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵
@property (assign, nonatomic) GLKMatrix4 projectionMatrix;
@property (assign, nonatomic) GLuint programCylinder;
@property (assign, nonatomic) GLuint worldMatrixUniform;
@property (assign, nonatomic) GLuint modelViewMatrixUniform;
@property (assign, nonatomic) GLuint projMatrixUniform;
@property (assign, nonatomic) GLuint eyeUniform;
@property (assign, nonatomic) GLuint texture0Unifrom;
@property (assign, nonatomic) GLuint reflectionTextureUniform;
@property (assign, nonatomic) GLuint reflectionTexUVSpaceUniform;

- (void)setupGLWrapper:(GLWrapper*)wrapper texMgr:(TextureManager*)texMgr reflectionTex:(GLuint)reflectionTex;
- (void)tearDownGL;
- (void)draw;
- (void)updateMatrixView:(GLKMatrix4)viewMatrix projection:(GLKMatrix4)projectionMatrix projectionOrtho:(GLKMatrix4)projectionOrthoMatrix perspectiveOrthoBlend:(float)perspectiveOrthoBlend eye:(GLKVector3)eye reflectionTexUVSpace:(GLKVector4)reflectionTexUVSpace;
@end
