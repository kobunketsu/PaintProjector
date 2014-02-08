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
        self.morphBlend = 1;
        self.alphaBlend = 1;
        self.projectAnimDuration = 1.0;
        self.curProjectAnimationTime = 0;
        self.unprojectAnimDuration = 0.3;
        self.curUnprojectAnimationTime = 0;
    }
    return self;
}

- (void) updateProjectFinished:(float)timeDelta completion: (void (^)(void))completion{
    self.curProjectAnimationTime += timeDelta;
    //    self.morphBlend = self.curProjectAnimationTime / self.projectAnimDuration;
    //    self.morphBlend = MIN(1, self.morphBlend);
    //    self.morphBlend = sinf(self.morphBlend * M_PI_2);//ease in out
    
    self.alphaBlend = self.curProjectAnimationTime / self.projectAnimDuration;
    self.alphaBlend = MIN(1, self.alphaBlend);
    self.alphaBlend = sinf(self.alphaBlend * M_PI_2);//ease in out
    
    self.morphBlend = 1;
    //    self.alphaBlend = 1.0;
    if(self.alphaBlend >= 1.0){
        self.curProjectAnimationTime = 0;
        completion();
    }
}

- (void) updateUnprojectFinished:(float)timeDelta completion: (void (^)(void))completion{
    self.curUnprojectAnimationTime += timeDelta;
    //    self.alphaBlend = 1.0 - self.curUnprojectAnimationTime / self.unprojectAnimDuration;
    //    self.alphaBlend = MAX(0, self.alphaBlend);
    //    self.alphaBlend = sinf(self.alphaBlend * M_PI_2);//ease in out
    
    self.alphaBlend = 0;
    self.morphBlend = 1.0;
    if(self.alphaBlend <= 0.0){
        self.curUnprojectAnimationTime = 0;
        completion();
    }
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
    
    //test
    //    rotateMatrix = GLKMatrix4RotateWithVector3(rotateMatrix, self.rotationImageAxisY, vUp);
//    translateMatrix = GLKMatrix4Translate(translateMatrix, self.translateImageX, 0, 0);
    
    self.transform.worldMatrix = GLKMatrix4Multiply(translateMatrix, GLKMatrix4Multiply(rotateMatrix, GLKMatrix4Multiply(rotateAxisYMatrix, scaleMatrix)));
}

-(void)willRenderSubMeshAtIndex:(int)index{
    [super willRenderSubMeshAtIndex:index];
    
    [self.renderer.material setMatrix:Camera.current.viewProjMatrix forPropertyName:@"viewProjMatrix"];
    [self.renderer.material setMatrix:self.transform.worldMatrix forPropertyName:@"worldMatrix"];
    [self.renderer.material setVector:GLKVector4MakeWithVector3(self.eye, 0) forPropertyName:@"eye"];
    [self.renderer.material setFloat:self.radius forPropertyName:@"radius"];
    [self.renderer.material setFloat:self.morphBlend forPropertyName:@"morphBlend"];
    [self.renderer.material setFloat:self.alphaBlend forPropertyName:@"alphaBlend"];
}
@end
