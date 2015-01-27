//
//  Shader.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

attribute vec3 position;
attribute vec2 texcoord;
attribute vec3 norm;
//attribute vec4 color;

uniform mat4 projMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 worldMatrix;

varying highp vec2 texcoord0;
varying highp vec4 worldPos;
varying highp vec3 normal;
//varying lowp vec4 color0;
void main()
{
    worldPos = worldMatrix * vec4(position, 1);
    highp vec3 vNormal = norm;
    //highp vec3 vNormal = vec3(position.x, normal.y, position.z);
//    highp vec3 vNormal = vec3(position.x, 0, position.z);
    //省略worldMatrix
    normal = normalize(vNormal);
    texcoord0 = texcoord.xy;
    highp vec4 modelViewPos = modelViewMatrix * worldPos;
//    color0 = color;
    
    gl_Position = projMatrix * modelViewPos;
}
