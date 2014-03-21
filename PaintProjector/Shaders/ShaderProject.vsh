//
//  Shader.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

attribute vec4 position;
attribute vec2 texcoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 paintMVPMatrix;

varying highp vec2 textureCoordinate;
varying highp vec4 screenProj;
void main()
{

    gl_Position = modelViewProjectionMatrix * position;
    textureCoordinate = texcoord;
    
    vec4 hPos = paintMVPMatrix * position;    
    screenProj = hPos;
    screenProj.xy = (hPos.xy * vec2(1,-1) + hPos.ww) * 0.5;    


}
