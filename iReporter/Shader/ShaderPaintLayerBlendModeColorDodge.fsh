varying highp vec2 oTexcoord0;
uniform sampler2D srcTex;
uniform sampler2D dstTex;

void main ( )
{
    lowp vec4 srcColor = texture2D(srcTex, oTexcoord0);
    lowp vec4 dstColor = texture2D(dstTex, oTexcoord0);
    
    if(dot(srcColor.rgb, vec3(1.0, 1.0, 1.0)) >= 3.0)
    {
        gl_FragColor.rgb = vec3(1.0, 1.0, 1.0);
    }
    else
    {
        gl_FragColor.rgb = dstColor.rgb / (vec3(1.0, 1.0, 1.0) - srcColor.rgb);
        gl_FragColor.rgb = clamp(gl_FragColor.rgb, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
    }

    gl_FragColor.a = srcColor.a + (1.0 - srcColor.a) * dstColor.a;
}

