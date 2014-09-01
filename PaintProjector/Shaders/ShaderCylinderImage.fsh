//
//  ShaderCylinderImage.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
//varying highp vec2 texcoord0;
varying highp vec4 worldPos;

uniform highp float radius;
uniform highp vec4 reflectionTexUVSpace;//x: left y:bottom z:width w:height
uniform highp vec4 eye;
uniform sampler2D reflectionTex;

void main()
{
//    float radiusBiased = radius - 0.001;
//    worldPos.x = clamp(worldPos.x, -radiusBiased, radiusBiased);
    
    highp vec3 pointOnImage = worldPos.xyz;
    
    //5.find pixel point projected on the surface
    highp vec3 vEyeToPointOnImage = pointOnImage - eye.xyz;
    vEyeToPointOnImage = normalize(vEyeToPointOnImage);
    
    highp vec3 e = eye.xyz;
    highp vec3 d = vEyeToPointOnImage;
    highp float a = d.x * d.x + d.z * d.z;
    highp float b = 2.0 * (e.x * d.x + e.z * d.z);
    highp float c = e.x * e.x + e.z * e.z - radius * radius;
    
    //quatic equation
    //    highp float t1 = (sqrt(b*b - 4.0*a*c) - b) / (2.0*a);
    highp float t2 = (-sqrt(b*b - 4.0*a*c) - b) / (2.0*a);
    
    highp vec3 pointOnSurface = eye.xyz + vEyeToPointOnImage * t2;

    highp vec3 normOnSurface = normalize(vec3(pointOnSurface.x, 0, pointOnSurface.z));
    
    
    highp vec3 vRefl = reflect(vEyeToPointOnImage, normOnSurface);
    vRefl = normalize(vRefl);
    
    highp float t = -  pointOnSurface.y /  vRefl.y;
    highp vec3 pointOnFloor =  pointOnSurface.xyz + vRefl.xyz * t;
    
    //calculate uv coord to sample from reflect texture
    highp float u = clamp((pointOnFloor.x - reflectionTexUVSpace.x) / reflectionTexUVSpace.z, 0.0, 1.0);
    highp float v = clamp((pointOnFloor.z - reflectionTexUVSpace.y) / reflectionTexUVSpace.w, 0.0, 1.0);
    u = 1.0 - u;
    
    //uv range out of (0,1) clamp to border color in code
    lowp vec4 cRefl = texture2D(reflectionTex, vec2(u, v));

    gl_FragColor.rgb = cRefl.rgb;
    //debug
    gl_FragColor.a = cRefl.a;
}
