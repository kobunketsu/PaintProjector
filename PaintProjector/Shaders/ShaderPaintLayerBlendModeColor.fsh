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

void main()
{
    mediump vec4 srcColor = texture2D(texture, oTexcoord0);
    srcColor.rgb /= srcColor.a;
    srcColor.rgb = clamp(srcColor.rgb, vec3(0,0,0), vec3(1.0, 1.0, 1.0));
    mediump float srcAlpha = srcColor.a * alpha;

    //foreground hue saturation;
    mediump float srcMax = max(max(srcColor.r, srcColor.g), srcColor.b);
    mediump float srcMin = min(min(srcColor.r, srcColor.g), srcColor.b);
    mediump float hue;
    mediump float saturation = 0.0;
    mediump float srcLumination = (srcMax + srcMin) / 2.0;
    if(srcMax != srcMin) {
        //saturation
        if(srcLumination < 0.5){
            saturation = (srcMax - srcMin) / (srcMax + srcMin);
        }
        else{
            saturation = (srcMax - srcMin) / (2.0 - srcMax - srcMin);
        }
        
        mediump float delta = srcMax - srcMin;
        
        if(srcColor.r == srcMax){
            hue = (srcColor.g - srcColor.b) / delta;
        }
        else if (srcColor.g == srcMax){
            hue = 2.0 + (srcColor.b - srcColor.r) / delta;
        }
        else{
            hue = 4.0 + (srcColor.r - srcColor.g) / delta;
        }
        hue /= 6.0;
        if(hue < 0.0) {
            hue += 1.0;
        }
    }
    
    //background lumination
    mediump vec3 destColor = gl_LastFragData[0].rgb;
    mediump float destMax = max(max(destColor.r, destColor.g), destColor.b);

    mediump float destMin = min(min(destColor.r, destColor.g), destColor.b);
    mediump float lumination = (destMax + destMin) / 2.0;

    //convert HLS to RGB
    mediump float r = lumination;
    mediump float g = lumination;
    mediump float b = lumination;
    mediump float m1 = 0.0;
    mediump float m2 = 0.0;

    m2 = lumination * (1.0 - sign(lumination - 0.5) * saturation) + (0.5 + sign(lumination - 0.5) * 0.5) * saturation;

    m1 = 2.0 * lumination - m2;
    r = hueToRgb(m1, m2, hue + (1.0 / 3.0));
    g = hueToRgb(m1, m2, hue);
    b = hueToRgb(m1, m2, hue - (1.0 / 3.0));
    
    gl_FragColor.rgb = vec3(r, g, b) * srcAlpha + destColor * (1.0 - srcAlpha);
//    gl_FragColor.rgb = vec3(1.0,0.0,0.0);
    gl_FragColor.a = 1.0;
}
