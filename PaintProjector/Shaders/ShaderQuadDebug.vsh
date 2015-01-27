attribute vec3 Position; 
attribute vec2 Texcoord; 


varying highp vec2 oTexcoord0;
void main(void) { 
    gl_Position =  vec4(Position,1);
    oTexcoord0 = Texcoord;
}
