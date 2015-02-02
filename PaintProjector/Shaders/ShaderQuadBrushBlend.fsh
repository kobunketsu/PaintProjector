#extension GL_EXT_shader_framebuffer_fetch : require
precision mediump float;
precision highp sampler2D;
varying highp vec2 oTexcoord0;
uniform sampler2D texture0;
//uniform lowp float alpha;//brushState opacity
uniform lowp vec4 color;

//draw buffer texture

void main ( )
{
    //can lock transparency
#ifdef WaterColorBlend
    lowp vec4 maskValue = texture2D(texture0, oTexcoord0);
    float darkenAfterCopyMaskAlpha = min(maskValue.r, maskValue.g);
    float xFormedMask = darkenAfterCopyMaskAlpha;
    
    gl_FragColor.rgb = color.rgb;
    
    float finalAlpha = 0.0;
    if (color.a < 0.0) {
        finalAlpha = - color.a;
        gl_FragColor.rgb *= gl_LastFragData[0].a;
    }
    else{
        finalAlpha = color.a;
    }
    
    gl_FragColor.a = xFormedMask * finalAlpha;
#else
    lowp vec4 sampColor = texture2D(texture0, oTexcoord0);
    
    
    float brushAlpha = 0.0;
    if (color.a < 0.0) {
        //locked
        brushAlpha = - color.a;
        
        gl_FragColor.rgb = sampColor.rgb * gl_LastFragData[0].a;
//        gl_FragColor.rgb = vec3(1,0,0);
        gl_FragColor.a = sampColor.a * brushAlpha;
    }
    else{
        brushAlpha = color.a;
        gl_FragColor.rgb = sampColor.rgb;
        gl_FragColor.a = sampColor.a * brushAlpha;
    }

#endif
}

