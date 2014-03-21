//
//  CylinderProjcetVCNotUsedCode.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/6/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CylinderProjcetVCNotUsedCode : NSObject
//@property (assign, nonatomic) GLuint programProject;
//@property (assign, nonatomic) GLuint vertexBuffer;
//@property (assign, nonatomic) GLuint vertexArray;
//@property (assign, nonatomic) GLuint indexBuffer;

@property (assign, nonatomic) GLuint wvpMatrixUniform;
@property (assign, nonatomic) GLuint viewProjMatrixUniform;
@property (assign, nonatomic) GLuint worldMatrixUniform;
@property (assign, nonatomic) GLuint paintTextureUniform;
@property (assign, nonatomic) GLuint radiusUniform;
@property (assign, nonatomic) GLuint eyeUniform;
@property (assign, nonatomic) GLuint morphBlendUniform;
@property (assign, nonatomic) GLuint alphaBlendUniform;
#pragma mark- project internal param
@property (assign, nonatomic) GLKMatrix4 worldMatrix;  //绘制quad时的矩阵
@property (assign, nonatomic) GLKMatrix4 viewProjMatrix;  //绘制quad时的矩阵
@property (assign, nonatomic) GLKMatrix4 viewProjOrthoMatrix;  //绘制quad时的矩阵(正交，用于顶视图)
@property (assign, nonatomic) GLKMatrix4 reflViewProjMatrix;  //绘制反射texture时的矩阵

//@property (assign, nonatomic) int meshRow;//投影模型网格参数
//@property (assign, nonatomic) int meshColumn;//投影模型网格参数

//@property (assign, nonatomic) float projSrcAspect;//投影长宽比
//@property (assign, nonatomic) float viewAspect;//投影长宽比
//@property (assign, nonatomic) float projHeight;//实际地面投影长度
//@property (assign, nonatomic) float projWidth;//实际地面投影宽度
//@property (assign, nonatomic) GLKVector3 projFar;//实际地面远点
//@property (assign, nonatomic) GLKVector3 projNear;//实际地面远点
//@property (assign, nonatomic) GLKVector3 projCenter;//实际地面中心位置
//@property (assign, nonatomic) GLKVector3 eyeZoomInTop;

@end
