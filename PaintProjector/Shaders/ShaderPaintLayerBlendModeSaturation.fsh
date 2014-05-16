#extension GL_EXT_shader_framebuffer_fetch : require
varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform mediump float alpha;

mediump float hueToRgb(mediump float m1, mediump float m2, mediump float hue){
    if(hue < 0.0){
        hue += 1.0;
    }
    else if(hue > 1.0){
        hue -= 1.0;
    }
    
    if(hue * 6.0 < 1.0){
        return m1 + (m2 - m1) * hue * 6.0;
    }
    else if( 2.0 * hue < 1.0){
        return m2;
    }
    else if(3.0 * hue < 2.0){
        return m1 + (m2 - m1) * ((2.0 / 3.0 - hue) * 6.0);
    }
    else{
        return m1;
    }
}

void main ( )
{
    mediump vec4 srcColor = texture2D(texture, oTexcoord0);
    srcColor.rgb /= srcColor.a;
    srcColor.rgb = clamp(srcColor.rgb, vec3(0,0,0), vec3(1.0, 1.0, 1.0));
    mediump float srcAlpha = srcColor.a * alpha;
    
    //foreground lumination;
    mediump float srcMax = max(max(srcColor.r, srcColor.g), srcColor.b);
    mediump float srcMin = min(min(srcColor.r, srcColor.g), srcColor.b);
    mediump float saturation = 0.0;
    mediump float srcLumination = (srcMax + srcMin) / 2.0;
    if (srcMax != srcMin) {
        //saturation
        if(srcLumination < 0.5){
            saturation = (srcMax - srcMin) / (srcMax + srcMin);
        }
        else{
            saturation = (srcMax - srcMin) / (2.0 - srcMax - srcMin);
        }
    }
    
    //background saturation and hue
    mediump float destMax = max(max(gl_LastFragData[0].r, gl_LastFragData[0].g), gl_LastFragData[0].b);
    mediump float destMin = min(min(gl_LastFragData[0].r, gl_LastFragData[0].g), gl_LastFragData[0].b);
    mediump float hue;
    mediump float lumination = (destMax + destMin) / 2.0;
    if (destMax != destMin) {
        //hue
        mediump float delta = destMax - destMin;
        
        if (gl_LastFragData[0].r == destMax){
            hue = (gl_LastFragData[0].g - gl_LastFragData[0].b) / delta;
        }
        else if (gl_LastFragData[0].g == destMax){
            hue = 2.0 + (gl_LastFragData[0].b - gl_LastFragData[0].r) / delta;
        }
        else{
            hue = 4.0 + (gl_LastFragData[0].r - gl_LastFragData[0].g) / delta;
        }
        hue /= 6.0;
        if (hue < 0.0) {
            hue += 1.0;
        }
        
    }
    
    
    
    //convert HLS to RGB
    mediump float r, g, b, m1, m2;
    if (saturation == 0.0) {
        r = g = b = lumination;
    }
    else{
        if(lumination <= 0.5){
            m2 = lumination * (1.0 + saturation);
        }
        else{
            m2 = lumination + saturation - lumination * saturation;
        }
        m1 = 2.0 * lumination - m2;
        r = hueToRgb(m1, m2, hue + (1.0 / 3.0));
        g = hueToRgb(m1, m2, hue);
        b = hueToRgb(m1, m2, hue - (1.0 / 3.0));
    }
    
    
    gl_FragColor.rgb = vec3(r, g, b) * srcAlpha + gl_LastFragData[0].rgb * (1.0 - srcAlpha);
    gl_FragColor.a = 1.0;
}


