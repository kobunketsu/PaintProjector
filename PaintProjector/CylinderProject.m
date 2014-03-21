//
//  CylinderProject.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "CylinderProject.h"

@interface CylinderProject()
@property (assign, nonatomic) float imageHeight;//圆柱体中图片的高
@property (assign, nonatomic) GLKVector3 imageCenterOnSurf;//圆柱体中图片中心位置
@end

@implementation CylinderProject
-(id)init{
    self = [super init];
    if (self) {
        _morphBlend = 1;
        _alphaBlend = 0;
    }
    return self;
}

- (void)update{
    [super update];
    
    [self updateImageInCylinder];
}

- (void)updateImageInCylinder{
    
    //限制眼睛取值范围
    GLKVector3 eye = self.eye;
    float eyeZ = MIN(eye.z, -self.radius);
    self.eye = GLKVector3Make(eye.x, eye.y, eyeZ);
    
    float dist = sqrtf( eye.x * eye.x + eye.z * eye.z);
    float cosEyeXZ =  eye.x / dist;
    
    //setup image width and image height
    self.imageWidth = MAX(0, MIN(self.imageWidth, self.radius * 2));
    self.imageHeight = self.imageWidth * self.imageRatio;
    
    //cylinder  x*x + z*z = r*r; --> x*x + pow((x*tan), 2)
    float rayOnSurfX = cosEyeXZ * self.radius;
    float rayOnSurfZ = - sinf(acosf(cosEyeXZ)) * self.radius;
    
    //1.find image center on the cylinder surface
    self.imageCenterOnSurf = GLKVector3Make(rayOnSurfX, self.imageCenterOnSurfHeight, rayOnSurfZ);
    
    //2.find image center on the flow in the cylinder y axis
    GLKVector3 vEyeToImageCenter = GLKVector3Subtract(self.imageCenterOnSurf, eye);
    GLKVector3 vEyeToImageCenterNormalized = GLKVector3Normalize(vEyeToImageCenter);
    float imageCenterY = (self.radius * eye.y + eye.z * self.imageCenterOnSurf.y) / (eye.z + self.radius);
    GLKVector3 imageCenter = GLKVector3Make(0, imageCenterY, 0);
    imageCenter = GLKVector3Make(self.transform.translate.x + imageCenter.x,
                                 self.transform.translate.y + imageCenter.y,
                                 self.transform.translate.z + imageCenter.z);

    //3.find four corners for image
    GLKVector3 vRight = GLKVector3Make(vEyeToImageCenterNormalized.z, 0, -vEyeToImageCenterNormalized.x);
    vRight = GLKVector3Normalize(vRight);
    GLKVector3 vUp = GLKVector3CrossProduct(vEyeToImageCenterNormalized, vRight);
    
    //adjust
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(self.imageWidth, 0, self.imageHeight);
    
    float radian =  acosf(GLKVector3DotProduct(GLKVector3Make(0, 1, 0), GLKVector3MultiplyScalar( vEyeToImageCenterNormalized, -1.0f)));
    GLKMatrix4 rotateMatrix = GLKMatrix4MakeRotation(radian, 1, 0, 0);
    GLKMatrix4 rotateAxisYMatrix = GLKMatrix4MakeRotation(-M_PI, vUp.x, vUp.y, vUp.z);
    
    GLKMatrix4 translateMatrix = GLKMatrix4MakeTranslation(imageCenter.x, imageCenter.y, imageCenter.z);
    
    self.transform.worldMatrix = GLKMatrix4Multiply(translateMatrix, GLKMatrix4Multiply(rotateMatrix, GLKMatrix4Multiply(rotateAxisYMatrix, scaleMatrix)));
}

-(void)willRenderSubMeshAtIndex:(int)index{
    [super willRenderSubMeshAtIndex:index];
    Material *material = self.renderer.material;
    if (!material) {
        material = self.renderer.sharedMaterial;
    }
    
    [material setMatrix:Camera.current.viewProjMatrix forPropertyName:@"viewProjMatrix"];
    [material setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
    [material setVector:GLKVector4MakeWithVector3(self.eye, 0) forPropertyName:@"eye"];
    [material setFloat:self.radius forPropertyName:@"radius"];
    [material setFloat:self.morphBlend forPropertyName:@"morphBlend"];
    [material setFloat:self.alphaBlend forPropertyName:@"alphaBlend"];
}


- (id)copyWithZone:(NSZone *)zone{
    CylinderProject *cylinderProject = (CylinderProject *)[super copyWithZone:zone];
    cylinderProject.eye = self.eye;
    cylinderProject.radius = self.radius;
    cylinderProject.imageWidth = self.imageWidth;
    cylinderProject.imageHeight = self.imageHeight;
    cylinderProject.imageCenterOnSurf = self.imageCenterOnSurf;
    cylinderProject.imageCenterOnSurfHeight = self.imageCenterOnSurfHeight;
    cylinderProject.imageRatio = self.imageRatio;
    cylinderProject.alphaBlend = self.alphaBlend;
    cylinderProject.morphBlend = self.morphBlend;
    cylinderProject.renderer.delegate = cylinderProject;
    
    return cylinderProject;
}

@end
