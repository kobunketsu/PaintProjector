uniform sampler2D texture;
varying lowp vec4 DestinationColor; 
varying mediump float oBrushParam; 
//uniform mediump float angle;
void main ( )
{
    highp vec2 texcoord = vec2(0,0);
    highp vec2 pointCoordOffset = gl_PointCoord - vec2(0.5, 0.5);
    texcoord.x = pointCoordOffset.x * cos(oBrushParam) +  pointCoordOffset.y * sin(oBrushParam);
    texcoord.y = pointCoordOffset.y * cos(oBrushParam) -  pointCoordOffset.x * sin(oBrushParam);    
    texcoord += vec2(0.5, 0.5);
    lowp vec4 color = texture2D(texture, texcoord);
    gl_FragColor = vec4(DestinationColor.rgb, color.w);

}

