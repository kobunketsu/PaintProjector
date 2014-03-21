varying highp vec2 oTexcoord0;
uniform sampler2D texture;
uniform lowp float alpha;

void main ( )
{
    lowp vec4 sampColor = texture2D(texture, oTexcoord0);
    gl_FragColor = sampColor;
    gl_FragColor.a *= alpha;
}

