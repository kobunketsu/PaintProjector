//
//  Shader.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
varying highp vec2 texcoord0;
varying highp vec4 worldPos;
varying highp vec3 normal;
varying lowp vec4 color0;

uniform sampler2D texture0;
uniform sampler2D reflectionTex;
uniform highp vec4 reflectionTexUVSpace;//x: left y:bottom z:width w:height
uniform highp vec4 eye;


void main()
{
    highp vec3 vEyeVector =  worldPos.xyz - eye.xyz;
    vEyeVector = normalize(vEyeVector);
    
    highp vec3 vRefl = reflect(vEyeVector, normal);
    vRefl = normalize(vRefl);
    
    highp float t = -  worldPos.y /  vRefl.y;
    highp vec3 pointOnFloor =  worldPos.xyz + vRefl.xyz * t;
    
    highp float u = clamp((pointOnFloor.x - reflectionTexUVSpace.x) / reflectionTexUVSpace.z, 0.0, 1.0);
    highp float v = clamp((pointOnFloor.z - reflectionTexUVSpace.y) / reflectionTexUVSpace.w, 0.0, 1.0);
    u = 1.0 - u;
    
    lowp vec4 cBase = texture2D(texture0, texcoord0);
    
    lowp vec4 cRefl = texture2D(reflectionTex, vec2(u, v));
    if (cRefl.x + cRefl.y + cRefl.z < 0.01) {
        gl_FragColor.rgb = cBase.rgb;
    }
    else
    {
        gl_FragColor.rgb = cBase.rgb * 0.5 + cRefl.rgb;
    }
//    lowp vec4 cRefl = texture2D(reflectionTex, texcoord0);
//    gl_FragColor.rgb = cBase.rgb + cRefl.rgb;

    gl_FragColor.rgb *= color0.rgb;
    gl_FragColor.a = 1.0;
}
