//
//  GPUImage3DViewFilter.h
//  GPUImage
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Brad Larson. All rights reserved.
//

#import "GPUImageFilter.h"

@interface GPUImage3DViewFilter : GPUImageFilter
{
    GLint _angleUniform;    
    GLint _eyeUniform;        
}

- (void)setAngle:(GLfloat)angle;
- (void)setEyeRelativeX:(GLfloat)x Y:(GLfloat)y Z:(GLfloat)z;
@end
