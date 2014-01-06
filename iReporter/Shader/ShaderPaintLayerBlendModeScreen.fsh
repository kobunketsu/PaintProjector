#extension GL_EXT_shader_framebuffer_fetch : require
varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform mediump float alpha;

void main ( )
{
    mediump vec4 srcColor = texture2D(texture, oTexcoord0);
    mediump float srcAlpha = srcColor.a * alpha;
    mediump vec3 targetColor = 1.0 - (1.0 - srcColor.rgb) * ( 1.0 - gl_LastFragData[0].rgb);
    gl_FragColor.rgb = targetColor.rgb * srcAlpha + gl_LastFragData[0].rgb * (1.0 - srcAlpha);
    gl_FragColor.a = srcAlpha + (1.0 - srcAlpha) * gl_LastFragData[0].a;
}


