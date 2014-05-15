#extension GL_EXT_shader_framebuffer_fetch : require
varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform mediump float alpha;

void main ( )
{
    mediump vec4 srcColor = texture2D(texture, oTexcoord0);
    srcColor.rgb *= alpha;
    mediump float srcAlpha = srcColor.a * alpha;
//    gl_FragColor.rgb = srcColor.rgb * gl_LastFragData[0].rgb * srcAlpha + gl_LastFragData[0].rgb * (1.0 - srcAlpha);
//    gl_FragColor.a = srcAlpha + (1.0 - srcAlpha) * gl_LastFragData[0].a;
    
    //disable blend
    gl_FragColor.rgb = srcColor.rgb * gl_LastFragData[0].rgb + gl_LastFragData[0].rgb * (1.0 - srcAlpha);
//    gl_FragColor.a = srcAlpha + (1.0 - srcAlpha) * gl_LastFragData[0].a;
    gl_FragColor.a = 1.0;

}


//gl_FragColor.rgb = srcColor.rgb + (destColor.rgb) * (1 - srcColor.a);//normal mode
//gl_FragColor.rgb = srcColor.rgb * layerAlpha + (destColor.rgb) * (1 - srcColor.a * layerAlpha);//normal mode with layer alpha