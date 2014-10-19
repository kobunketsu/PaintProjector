#extension GL_EXT_shader_framebuffer_fetch : require
varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform lowp float alpha;//brushState opacity

//draw buffer texture

void main ( )
{
    //can lock transparency
    lowp vec4 sampColor = texture2D(texture, oTexcoord0);
    gl_FragColor.rgb = sampColor.rgb;
    lowp float finalAlpha = 0.0;
    if (alpha < 0.0) {
        finalAlpha = - alpha;
        gl_FragColor.rgb *= gl_LastFragData[0].a;
    }
    else{
        finalAlpha = alpha;
    }
    gl_FragColor.a = sampColor.a * finalAlpha;
}

