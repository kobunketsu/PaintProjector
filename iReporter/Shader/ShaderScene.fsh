//
//  Shader.fsh
//  TestOpenGL
//
//  Created by 文杰 胡 on 12-12-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
varying highp vec2 textureCoordinate;
//varying highp vec4 screenProj;
uniform sampler2D inputImageTexture;
//uniform sampler2D inputPaintTexture;
uniform lowp float fBaseTexScale;
//uniform lowp float fPaintTexScale;
void main()
{
//    //sample paint texture
//    highp vec2 uv = screenProj.xy / screenProj.w;
//    lowp vec4 cPaint = texture2D(inputPaintTexture, uv) * fPaintTexScale;
//    //sample base texture
    lowp vec4 cbase = texture2D(inputImageTexture, textureCoordinate) * fBaseTexScale;
    gl_FragColor.rgb = cbase.rgb;
//    gl_FragColor.rgb = cbase.rgb * (1.0 - cPaint.a);
//    gl_FragColor.rgb += cPaint.rgb;
    gl_FragColor.a = 1.0;
}
