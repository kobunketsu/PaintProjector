//
//  Shader.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
varying highp vec2 textureCoordinate;
//uniform sampler2D backgroundTex;
uniform sampler2D paintTex;
//uniform lowp float paintTexScale;
void main()
{
//    lowp vec4 cbase = texture2D(backgroundTex, textureCoordinate);
//    lowp vec4 cPaint = texture2D(paintTex, textureCoordinate)*paintTexScale;
//    gl_FragColor.rgb = cbase.rgb * (1.0 - cPaint.a) + cPaint.rgb * cPaint.a;
//    gl_FragColor.a = 1.0;
    
    gl_FragColor = texture2D(paintTex, textureCoordinate);
}
