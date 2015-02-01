#extension GL_EXT_shader_framebuffer_fetch : require
precision highp float;

varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform mediump float alpha;

lowp float vectorAlpha(const lowp vec2 coord, const lowp float alpha);

lowp vec4 blendNormal(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendMultiply(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendScreen(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendAdd(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendLighten(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendExclusion(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendDifference(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendSubtract(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendLinearBurn(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendColorDodge(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendColorBurn(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendOverlay(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendHardLight(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendColor(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendLuminosity(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendSoftLight(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendHue(const lowp vec4 base, const lowp vec4 blend);
lowp vec4 blendSaturation(const lowp vec4 base, const lowp vec4 blend);

lowp vec4 mixer(const lowp vec4 base, const lowp vec4 blend, const lowp vec3 mix);
lowp vec3 clip(lowp vec3 color);
lowp vec3 overlay(const lowp vec3 base, const lowp vec3 blend);
lowp vec3 softlight(const lowp vec3 base, const lowp vec3 blend);

mediump vec3 unpremultiply(const mediump vec4 color);
lowp float getSaturation(const lowp vec3 color);
lowp vec3 setSaturation(const lowp vec3 base, const lowp vec3 blend);
lowp float getLuminosity(const lowp vec3 color);
lowp vec3 setLuminosity(const lowp vec3 base, const lowp vec3 blend);


lowp vec4 kBlend(const lowp vec4 dst, const lowp vec4 src)
{
    lowp vec4 result = vec4(0,0,0,1);
    
    #ifdef Normal
    result = blendNormal(dst, src);
    #endif
    #ifdef Multiply
    result = blendMultiply(dst, src);
    #endif
    #ifdef Screen
    result = blendScreen(dst, src);
    #endif
    #ifdef Add
    result = blendAdd(dst, src);
    #endif
    #ifdef Lighten
    result = blendLighten(dst, src);
    #endif
    #ifdef Exclusion
    result = blendExclusion(dst, src);
    #endif
    #ifdef Difference
    result = blendDifference(dst, src);
    #endif
    #ifdef Subtract
    result = blendSubtract(dst, src);
    #endif
    #ifdef LinearBurn
    result = blendLinearBurn(dst, src);
    #endif
    #ifdef ColorDodge
    result = blendColorDodge(dst, src);
    #endif
    #ifdef ColorBurn
    result = blendColorBurn(dst, src);
    #endif
    #ifdef Overlay
    result = blendOverlay(dst, src);
    #endif
    #ifdef HardLight
    result = blendHardLight(dst, src);
    #endif
    #ifdef Color
    result = blendColor(dst, src);
    #endif
    #ifdef Luminosity
    result = blendLuminosity(dst, src);
    #endif
    #ifdef SoftLight
    result = blendSoftLight(dst, src);
    #endif
    #ifdef Hue
    result = blendHue(dst, src);
    #endif
    #ifdef Saturation
    result = blendSaturation(dst, src);
    #endif
    
    return result;
}
void main()
{
	gl_FragColor = kBlend(gl_LastFragData[0], texture2D(texture, oTexcoord0) * alpha);
}


lowp vec4 blendNormal(const lowp vec4 base, const lowp vec4 blend)
{
	return (base * (1.0 - blend.a)) + blend;
}
lowp vec4 blendMultiply(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, unpremultiply(blend) * unpremultiply(base));
}
lowp vec4 blendScreen(const lowp vec4 base, const lowp vec4 blend)
{
	return vec4(((1.0 - base.rgb) * blend.rgb) + base.rgb, blend.a + ((1.0 - blend.a) * base.a));
}
lowp vec4 blendAdd(const lowp vec4 base, const lowp vec4 blend)
{
	return min(base + blend, vec4(1.0));
}
lowp vec4 blendLighten(const lowp vec4 base, const lowp vec4 blend)
{
	return max(base, blend);
}
lowp vec4 blendExclusion(const lowp vec4 base, const lowp vec4 blend)
{
	return clamp(vec4((base.rgb * (1.0 - blend.rgb)) + (blend.rgb * (1.0 - base.rgb)), base.a + blend.a), 0.0, 1.0);
}
lowp vec4 blendDifference(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, abs(unpremultiply(blend) - unpremultiply(base)));
}
lowp vec4 blendSubtract(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, unpremultiply(base) - unpremultiply(blend));
}
lowp vec4 blendLinearBurn(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, max((unpremultiply(base) + unpremultiply(blend) - 1.0), 0.0));
}
lowp vec4 blendColorDodge(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, clamp((unpremultiply(base) / (1.0 - unpremultiply(blend))), 0.0, 1.0));
}
lowp vec4 blendColorBurn(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, (1.0 - clamp((1.0 - unpremultiply(base)) / unpremultiply(blend), 0.0, 1.0)));
}
lowp vec4 blendOverlay(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, overlay(unpremultiply(base), unpremultiply(blend)));
}
lowp vec4 blendHardLight(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, overlay(unpremultiply(blend), unpremultiply(base)));
}
lowp vec4 blendHue(const lowp vec4 base, const lowp vec4 blend)
{
	lowp vec3 ubase = unpremultiply(base);
	lowp vec3 ublend = unpremultiply(blend);
	return mixer(base, blend, setLuminosity(ubase, setSaturation(ublend, ubase)));
}
lowp vec4 blendSaturation(const lowp vec4 base, const lowp vec4 blend)
{
	lowp vec3 ubase = unpremultiply(base);
	lowp vec3 ublend = unpremultiply(blend);
	return mixer(base, blend, setLuminosity(ubase, setSaturation(ubase, ublend)));
}
lowp vec4 blendColor(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, setLuminosity(unpremultiply(base), unpremultiply(blend)));
}
lowp vec4 blendLuminosity(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, setLuminosity(unpremultiply(blend), unpremultiply(base)));
}
lowp vec4 blendSoftLight(const lowp vec4 base, const lowp vec4 blend)
{
	return mixer(base, blend, softlight(unpremultiply(base), unpremultiply(blend)));
}

lowp vec4 mixer(const lowp vec4 base, const lowp vec4 blend, const lowp vec3 mix)
{
	return (base * (1.0 - blend.a)) + vec4(mix(blend.rgb, mix * blend.a, base.a), blend.a);
}
lowp vec3 clip(lowp vec3 color)
{
	lowp float l = getLuminosity(color);
	lowp float n = min(color.r, min(color.g, color.b));
	lowp float x = max(color.r, max(color.g, color.b));
    
	if (n < 0.0) {
		color = l + (((color - l) * l) / (l - n));
	}
	if (x > 1.0) {
		color = l + (((color - l) * (1.0 - l)) / (x - l));
	}
    
	return clamp(color, 0.0, 1.0);
}

lowp vec3 overlay(const lowp vec3 base, const lowp vec3 blend)
{
	lowp vec3 multiply = (2.0 * base * blend);
	lowp vec3 screen = 1.0 - (2.0 * (1.0 - base) * (1.0 - blend));
	lowp vec3 flip = floor(base + 0.5);
    
	return mix(multiply, screen, flip);
}
lowp vec3 softlight(const lowp vec3 base, const lowp vec3 blend)
{
	lowp vec3 flip = floor(blend + 0.5);
	lowp vec3 multiply = 2.0 * base * blend + (base * base) * (1.0 - 2.0 * blend);
	lowp vec3 screen = sqrt(base) * (2.0 * blend - 1.0) + (2.0 * base) * (1.0 - blend);
	return mix(multiply, screen, flip);
}

mediump vec3 unpremultiply(const mediump vec4 color)
{
	return clamp(color.rgb / color.a, 0.0, 1.0);
}

lowp float getSaturation(const lowp vec3 color)
{
	return max(color.r, max(color.g, color.b)) - min(color.r, min(color.g, color.b));
}
lowp vec3 setSaturation(const lowp vec3 base, const lowp vec3 blend)
{
	lowp float p = sqrt(getLuminosity(base));
	return p + (base - p) * min(getSaturation(blend) / getSaturation(base), 1.0);
}
lowp float getLuminosity(const lowp vec3 color)
{
	return dot(color, vec3(0.3, 0.59, 0.11));
}
lowp vec3 setLuminosity(const lowp vec3 base, const lowp vec3 blend)
{
	return clip(blend + vec3(getLuminosity(base) - getLuminosity(blend)));
}

lowp float vectorAlpha(const lowp vec2 coord, const lowp float alpha)
{
	return alpha * float(all(bvec4(greaterThanEqual(coord, vec2(0.0)), lessThan(coord, vec2(1.0)))));
}