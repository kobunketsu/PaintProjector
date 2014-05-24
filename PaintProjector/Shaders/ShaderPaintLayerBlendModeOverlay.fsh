#extension GL_EXT_shader_framebuffer_fetch : require
varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform mediump float alpha;

void main ( )
{
    mediump vec4 srcColor = texture2D(texture, oTexcoord0);
    srcColor.rgb /= srcColor.a;
    srcColor.rgb = clamp(srcColor.rgb, vec3(0,0,0), vec3(1.0, 1.0, 1.0));
    
    mediump float srcAlpha = srcColor.a * alpha;
    
    mediump float targetR;
    mediump float targetG;
    mediump float targetB;
    
    if(gl_LastFragData[0].r < 0.5){
        targetR = 2.0 * srcColor.r * gl_LastFragData[0].r;
    }
    else{
        targetR = 1.0 - 2.0 * (1.0 - srcColor.r) * (1.0 - gl_LastFragData[0].r);
    }
    
    if(gl_LastFragData[0].g < 0.5){
        targetG = 2.0 * srcColor.g * gl_LastFragData[0].g;
    }
    else{
        targetG = 1.0 - 2.0 * (1.0 - srcColor.g) * (1.0 - gl_LastFragData[0].g);
    }
    
    if(gl_LastFragData[0].b < 0.5){
        targetB = 2.0 * srcColor.b * gl_LastFragData[0].b;
    }
    else{
        targetB = 1.0 - 2.0 * (1.0 - srcColor.b) * (1.0 - gl_LastFragData[0].b);
    }
    
    gl_FragColor.rgb = vec3(targetR, targetG, targetB) * srcAlpha + gl_LastFragData[0].rgb * (1.0 - srcAlpha);
    gl_FragColor.a = srcAlpha;
}


