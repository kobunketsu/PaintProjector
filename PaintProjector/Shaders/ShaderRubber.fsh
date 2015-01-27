uniform sampler2D texture;
varying lowp vec4 DestinationColor; 
void main ( )
{
    lowp vec4 color = texture2D(texture, gl_PointCoord);
//   gl_FragColor = texture2D(texture, gl_PointCoord);
    gl_FragColor = color * DestinationColor;
}

