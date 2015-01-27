//
//  Shader.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
varying highp vec2 oTexcoord;
varying highp vec3 oNormal;

uniform sampler2D mainTexture;
uniform highp vec4 vLightPos;
uniform highp vec4 cAmbient;
void main()
{
    lowp vec4 cbase = texture2D(mainTexture, oTexcoord);
    highp vec3 vLightDir = normalize(vLightPos.xyz);
    highp float NdotL = clamp(dot(oNormal.xyz, vLightDir.xyz), 0.0, 1.0);
    gl_FragColor.rgb = cbase.rgb * NdotL + cAmbient.rgb;
    gl_FragColor.a = 1.0;
}
