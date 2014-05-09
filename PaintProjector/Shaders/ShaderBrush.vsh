attribute vec4 Position; //z 大小, w 角度
attribute vec4 SourceColor;//颜色

uniform mat4 Projection;
uniform vec4 Params; //x: y:硬度 z:圆度 w:涂抹强度

varying lowp vec4 DestinationColor;//颜色
varying highp vec4 oBrushParam; //x:角度 y:硬度 z:圆度 w:涂抹强度
varying highp vec4 oBrushParam2;//x:大小

void main(void) {
    gl_Position =  vec4(Position.xy,0,1) * Projection;
    highp float scale = 1.0 + (1.0 - Params.y) * 0.25 * (1.0 - Params.x);
    gl_PointSize = Position.z * scale;

    
    DestinationColor = SourceColor;
    oBrushParam = vec4(0,0,0,0);
    oBrushParam.x = Position.w;//角度
    oBrushParam.y = Params.y;//硬度
    oBrushParam.z = Params.z;//圆度
    oBrushParam.w = Params.w;//涂抹强度
    oBrushParam2.x = gl_PointSize;

}