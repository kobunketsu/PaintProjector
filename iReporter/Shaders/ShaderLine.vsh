//
//  Shader.vsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

attribute vec3 position;
uniform mat4 modelViewProjectionMatrix;
void main()
{
    gl_Position = modelViewProjectionMatrix * vec4(position,1.0);
}
