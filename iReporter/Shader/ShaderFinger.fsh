uniform sampler2D maskTexture;
uniform sampler2D smudgeTexture;
uniform sampler2D dstTexture;
uniform lowp float smudgePressure;
void main ( )
{
    lowp vec4 maskColor = texture2D(maskTexture, gl_PointCoord);
    
    mediump vec2 texcoord = vec2(gl_PointCoord.x, 1.0 - gl_PointCoord.y);
    lowp vec4 smudgeColor = texture2D(smudgeTexture, texcoord);
    lowp vec4 dstColor = texture2D(dstTexture, texcoord);    
    lowp float pressure = smudgePressure * maskColor.w;

    lowp float blendAlpha = smudgeColor.w * pressure + (1.0 - pressure) * dstColor.w;

    lowp vec3 blendColor = smudgeColor.xyz * pressure + (1.0 - pressure) * dstColor.xyz;
        
    gl_FragColor = vec4(blendColor, blendAlpha);
}

