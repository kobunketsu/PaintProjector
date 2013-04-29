varying highp vec2 oTexcoord0;
uniform sampler2D srcTex;
uniform sampler2D dstTex;

void main ( )
{
    lowp vec4 srcColor = texture2D(srcTex, oTexcoord0);
    lowp vec4 dstColor = texture2D(dstTex, oTexcoord0);
    gl_FragColor.rgb = srcColor.rgb * dstColor.rgb;
    gl_FragColor.a = srcColor.a + (1.0 - srcColor.a) * dstColor.a;
}

