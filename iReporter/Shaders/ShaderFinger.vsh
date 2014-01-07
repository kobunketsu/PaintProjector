attribute vec4 Position; //z radius, w angle 
//attribute vec4 SourceColor;
uniform mat4 Projection;

uniform float PointSize;

void main(void) { 
    gl_Position =  vec4(Position.xy,0,1) * Projection;
    gl_PointSize = PointSize;    
}
