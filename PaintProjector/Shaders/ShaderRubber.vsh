attribute vec4 Position; //z radius, w angle 
attribute vec4 SourceColor;

uniform mat4 Projection;

uniform float PointSize;
varying vec4 DestinationColor;
void main(void) { 
    DestinationColor = SourceColor;     
    gl_Position =  vec4(Position.xy,0,1) * Projection;
    gl_PointSize = PointSize;
}
