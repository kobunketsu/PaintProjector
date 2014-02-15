//
//  Shader.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

attribute vec4 position;
attribute vec2 texcoord;

uniform mat4 viewProjectionMatrix;
uniform mat4 worldMatrix;
varying highp vec2 textureCoordinate;
void main()
{
    highp vec4 worldPos = worldMatrix * position;
    gl_Position = viewProjectionMatrix * worldPos;
    textureCoordinate = texcoord;
}
