#extension GL_EXT_shader_framebuffer_fetch : require
uniform mediump vec4 color;

void main ( )
{
    //texture color is without alpha premultiplied
    gl_FragColor = color;
}


