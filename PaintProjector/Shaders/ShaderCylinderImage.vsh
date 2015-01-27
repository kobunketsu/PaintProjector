//
//  ShaderCylinderImage.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
attribute vec3 position;
attribute vec2 texcoord;
//attribute vec2 color;

uniform highp mat4 worldMatrix;

//varying highp vec2 oTexcoord0;
varying highp vec4 worldPos;

void main(void) {
    worldPos = worldMatrix * vec4(position, 1);
    gl_Position =  vec4(position.x*2.0, position.z*2.0, 0, 1);
//    oTexcoord0 = texcoord;
}
