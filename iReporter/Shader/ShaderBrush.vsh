attribute vec4 Position; //z radius, w angle 
//attribute vec4 SourceColor;
uniform mat4 Projection;

uniform float PointSize;
uniform lowp vec4 ColorUnifom;
varying vec4 DestinationColor; 
varying float oBrushParam; 
void main(void) { 
    gl_Position =  vec4(Position.xy,0,1) * Projection;
    gl_PointSize = PointSize * Position.z;
//    DestinationColor = SourceColor * ColorUnifom;     
    DestinationColor = ColorUnifom;
    oBrushParam = Position.w;
}
