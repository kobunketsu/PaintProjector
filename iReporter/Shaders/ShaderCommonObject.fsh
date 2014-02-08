//
//  Shader.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
varying highp vec2 oTexcoord;
varying highp vec4 oColor;
uniform sampler2D mainTexture;

void main()
{
    lowp vec4 cbase = texture2D(mainTexture, oTexcoord);
    gl_FragColor.rgb = cbase.rgb * oColor.rgb;
    gl_FragColor.a = oColor.a;
}
