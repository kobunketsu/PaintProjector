//
//  Shader.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
varying highp vec2 textureCoordinate;
uniform sampler2D inputImageTexture;
uniform lowp float fBaseTexScale;
void main()
{
    lowp vec4 cbase = texture2D(inputImageTexture, textureCoordinate) * fBaseTexScale;
    gl_FragColor.rgb = cbase.rgb;
    gl_FragColor.a = 1.0;
}
