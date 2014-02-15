//
//  GPUImage3DViewFilter.m
//  GPUImage
//
//  Created by 文杰 胡 on 12-11-24.
//  Copyright (c) 2012年 Brad Larson. All rights reserved.
//

#import "GPUImage3DViewFilter.h"

NSString *const kGPUImage3DViewFragmentShaderString = SHADER_STRING
(
 
 precision highp float;
 
 uniform sampler2D inputImageTexture;
 uniform float angle;
 uniform vec3 deviceBottomToEye;
 varying vec2 textureCoordinate;
 
 vec2 getCoordFromCoord(vec2 textureCoordinate)
{
    //float viewHeight = CGImageGetHeight(sourceImage);
    //float viewWidth = CGImageGetWidth(sourceImage);    
    //coordinate is defined on the device near edge plane perpendicular to eye vertical vector
    
    float h = deviceBottomToEye.y;//eye to device height
    vec3 eye = vec3(0.0, h, 0.0); 
    float dN = abs(deviceBottomToEye.x);//eye to device distance
    float dL = 0.2412;//device length (ipad2)
    float dW = 0.1857;
    
    vec3 bottomCenter = vec3(dN, 0.0, 0.0);
    vec3 topCenter = vec3(cos(angle)*dL + dN, sin(angle)*dL, 0.0);
    
    //tangent of eye to device far edge center on xy plane
    float tanFar = (topCenter.y - eye.y) / (topCenter.x - eye.x);
    vec3 fakeTopCenter;    
    fakeTopCenter.x = sqrt((dN*dN + h*h)/(1.0 + tanFar*tanFar));
    fakeTopCenter.y = tanFar * fakeTopCenter.x + h;
    fakeTopCenter.z = 0.0;
    
    float fakeDeviceLength = length(fakeTopCenter - bottomCenter);
    float ratio = fakeDeviceLength / dL;    
    float fakeDeviceWidth = dW * ratio;    
    
    //定义假象平面坐标系
    vec3 fakePlaneUp = vec3(fakeTopCenter.x - bottomCenter.x, fakeTopCenter.y - bottomCenter.y, 0.0);
    fakePlaneUp = normalize(fakePlaneUp);
    vec3 fakePlaneRight = vec3(0.0, 0.0, 1.0);
    vec3 fakePlaneNormal = cross(fakePlaneRight, fakePlaneUp);
    fakePlaneNormal = normalize(fakePlaneNormal);      
    
    //定义真实平面坐标系
    vec3 realPlaneUp = vec3(topCenter.x - bottomCenter.x, topCenter.y - bottomCenter.y, 0.0);
    realPlaneUp = normalize(realPlaneUp);
    vec3 realPlaneRight = vec3(0.0, 0.0, 1.0);    
    vec3 realPlaneNormal = cross(realPlaneRight, realPlaneUp); 
    realPlaneNormal = normalize(realPlaneNormal);
    
    //定义真实平面上的点
    vec3 realPointOffsetX = realPlaneRight * (textureCoordinate.x - 0.5) * dW;
    vec3 realPointOffsetY = realPlaneUp * (textureCoordinate.y) * dL;    
    vec3 realPoint = topCenter + realPointOffsetX - realPointOffsetY;
    
    //定义射线
    vec3 eyeToRealPoint = realPoint - eye;
    eyeToRealPoint = normalize(eyeToRealPoint);    
    
    vec2 texCoord;
    //找到真实平面点和视点构成的射线和假象平面的交点    
    //fakeTopCenter and fakePlaneNormal define fake Plane 
    //n dot (p - p0) = 0 --> fakePlaneNormal dot (point - fakeTopCenter) = 0
    
    //eye to realPoint define ray
    //p = p0 + t * u --> p = eye + t * eyeToRealPoint
    
    //t = (n dot p1 - n dot p0) / (n dot u)   (p1 is fakeTopCenter, p0 is eye)    
    float t = (dot(fakePlaneNormal, fakeTopCenter) - dot(fakePlaneNormal, eye)) / dot(fakePlaneNormal, eyeToRealPoint);  
    
    //assert t >= 0
    vec3 fakePoint = eye + (eyeToRealPoint * t);
    
    //转换到真实平面的坐标系中
    //convert to real plane coordinate
    mat4 fakePlaneCoordinate = mat4(
                                    vec4(fakePlaneRight.x, fakePlaneUp.x, fakePlaneNormal.x, 0.0), 
                                    vec4(fakePlaneRight.y, fakePlaneUp.y, fakePlaneNormal.y, 0.0), 
                                    vec4(fakePlaneRight.z, fakePlaneUp.z, fakePlaneNormal.z, 0.0), 
                                    vec4(-dot(fakePlaneRight, fakeTopCenter), -dot(fakePlaneUp, fakeTopCenter), -dot(fakePlaneNormal, fakeTopCenter), 1.0));
    
    vec3 pointInPlaneCoord = vec3(fakePlaneCoordinate * vec4(fakePoint, 1.0));
    texCoord.x = (pointInPlaneCoord.x + fakeDeviceWidth * 0.5) / fakeDeviceWidth;
    texCoord.y = (- pointInPlaneCoord.y / fakeDeviceLength);

    return texCoord;
}
 
 void main(void) {
     vec2 coord = getCoordFromCoord(textureCoordinate);
     coord.y = 1.0 - coord.y;
     vec4 color = texture2D(inputImageTexture, coord);

     gl_FragColor = color;	
 }

 );

@implementation GPUImage3DViewFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImage3DViewFragmentShaderString]))
    {
		return nil;
    }
    
    _angleUniform = [filterProgram uniformIndex:@"angle"];
    _eyeUniform = [filterProgram uniformIndex:@"deviceBottomToEye"];
    return self;
}

- (void)setAngle:(GLfloat)angle{
    glUniform1f(_angleUniform, angle);
}

- (void)setEyeRelativeX:(GLfloat)x Y:(GLfloat)y Z:(GLfloat)z{
    glUniform3f(_eyeUniform, x, y, z);
}
@end
