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
@property (nonatomic, weak) GLWrapper* glWrapper;
@property (nonatomic, retain) GLKTextureInfo *texInfoCylinderCap;//贴图
@property (nonatomic, retain) GLKTextureInfo *texInfoCylinderMain;//贴图
@property (nonatomic, retain) GLKTextureInfo *texInfoCylinderShadow;//贴图
@property (nonatomic, assign) GLuint reflectionTex;//render to target
@property (nonatomic, assign) float radius;//半径
@property (nonatomic, assign) int sides;//段数
@property (nonatomic, assign) float height;//高度
@property (strong, nonatomic) GLKBaseEffect *effect;
@property(nonatomic, assign) GLKVector3 eye;
@property(nonatomic, assign) GLKVector4 reflectionTexUVSpace;
@property(nonatomic, assign) GLKMatrix4 viewMatrix;
@property(nonatomic, assign) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵
@property(nonatomic, assign) GLKMatrix4 projectionMatrix;
@property(nonatomic, assign) GLKMatrix4 projectionOrthoMatrix;
@property(nonatomic, assign) float perspectiveToOrthoBlend;
@property(nonatomic, assign) GLuint programCylinder;
@property(nonatomic, assign) GLuint worldMatrixUniform;
@property(nonatomic, assign) GLuint modelViewMatrixUniform;
@property(nonatomic, assign) GLuint projMatrixUniform;
@property(nonatomic, assign) GLuint eyeUniform;
@property(nonatomic, assign) GLuint texture0Unifrom;
@property(nonatomic, assign) GLuint reflectionTextureUniform;
@property(nonatomic, assign) GLuint reflectionTexUVSpaceUniform;

- (void)setupGLWrapper:(GLWrapper*)wrapper texMgr:(TextureManager*)texMgr reflectionTex:(GLuint)reflectionTex;
- (void)tearDownGL;
- (void)draw;
- (void)updateMatrixView:(GLKMatrix4)viewMatrix projection:(GLKMatrix4)projectionMatrix projectionOrtho:(GLKMatrix4)projectionOrthoMatrix perspectiveOrthoBlend:(float)perspectiveOrthoBlend eye:(GLKVector3)eye reflectionTexUVSpace:(GLKVector4)reflectionTexUVSpace;
@end
