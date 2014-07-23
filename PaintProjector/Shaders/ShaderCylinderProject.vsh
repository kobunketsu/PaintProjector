//
//  Shader.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

attribute vec4 position;
attribute vec4 texcoord;
attribute vec4 color;

uniform mat4 viewProjMatrix;
uniform mat4 viewProjOrthoMatrix;
uniform highp float perspectiveToOrthoBlend;
uniform mat4 worldMatrix;
uniform vec4 eye;
uniform highp float radius;
uniform highp float morphBlend;
uniform highp float alphaBlend;
varying highp vec2 texcoord0;
varying lowp vec4 color0;

void main()
{
    highp vec4 worldPos = worldMatrix * position;

    //clip world position out of the cylinder space on x, make projected circle edge smooth
    float radiusBiased = radius - 0.001;
    worldPos.x = clamp(worldPos.x, -radiusBiased, radiusBiased);
    
    highp vec3 pointOnImage = worldPos.xyz;
    pointOnImage.x = worldPos.x * morphBlend;
    
    //5.find pixel point projected on the surface
    highp vec3 vEyeToPointOnImage = pointOnImage - eye.xyz;
    vEyeToPointOnImage = normalize(vEyeToPointOnImage);
    
    highp vec3 e = eye.xyz;
    highp vec3 v = vEyeToPointOnImage;
    highp float a = v.x * v.x + v.z * v.z;
    highp float b = 2.0 * (e.x * v.x + e.z * v.z);
    highp float c = e.x * e.x + e.z * e.z - radius * radius;
    
    //quatic equation
//    highp float t1 = (sqrt(b*b - 4.0*a*c) - b) / (2.0*a);
    highp float t2 = (-sqrt(b*b - 4.0*a*c) - b) / (2.0*a);
    
    //利用t1 t2差值判断是否接近边缘，在一个接近边缘的阈值处切
//    sqrt(b*b-4.0*a*c) = 0.001*a;
//    highp float delta = (t1 - t2) / t2;
//    if (delta < 0.02) {
//        t2 = (- 0.02*a - b) / (2.0*a);
//    }
    
    highp vec3 pointOnSurface = eye.xyz + vEyeToPointOnImage * t2;
    
    pointOnSurface.y = max(-0.0001, pointOnSurface.y);
    
    //6. find reflected point on the ground
    highp vec3 normOnSurface = vec3(pointOnSurface.x, 0, pointOnSurface.z);
    normOnSurface = normalize(normOnSurface);
    
    highp vec3 vecReflect = reflect(vEyeToPointOnImage, normOnSurface);
    vecReflect = normalize(vecReflect);
    
    highp float t = -  pointOnSurface.y /  vecReflect.y;

    highp vec3 pointOnFloor =  pointOnSurface + vecReflect * t;
    
    highp vec3 finalWorlPos = worldPos.xyz * (1.0 - morphBlend) + pointOnFloor.xyz * morphBlend;
//    highp vec3 finalWorlPos = pointOnFloor.xyz;
//    highp vec3 finalWorlPos = worldPos.xyz;
    
    gl_Position = viewProjMatrix * vec4(finalWorlPos.xyz, 1);
    
    texcoord0 = texcoord.xy;
    texcoord0.y = 1.0 - texcoord0.y;

    color0 = color;
    color0.a = alphaBlend;
    
    //debug
//    color0.x = abs(t1 - t2) * 100.0;
}
