//
//  Shader.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

attribute vec4 position;
attribute vec2 texcoord;
attribute vec3 normal;

uniform mat4 viewProjMatrix;
uniform mat4 worldMatrix;

varying highp vec2 oTexcoord;
varying highp vec3 oNormal;

void main()
{
    highp vec4 worldPos = worldMatrix * position;
    gl_Position = viewProjMatrix * worldPos;
    oTexcoord = texcoord;
    oNormal = normal;
}
