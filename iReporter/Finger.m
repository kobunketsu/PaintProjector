//
//  Figure.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-25.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Finger.h"

@implementation Finger
- (id)initWithContext:(EAGLContext*)context Canvas:(UIView *)canvas{
    self = [super initWithContext:context Canvas:canvas];
    if (self !=nil) {
        [self setBrushTextureWithImage:@"airBrushRadius16.png"];
        [self setupBrushTexture];
        _iconImage = [UIImage imageNamed:@"finger.png"];
        _type = BrushType_Finger;
        _typeName = @"finger";
    }
    
    return self;
}

- (GLuint)getDebugTexture{
    return _smudgeTexture;
}

-(void) setupBrushTexture
{
    [EAGLContext setCurrentContext:_context];
    glGenTextures(1, &_smudgeTexture);
    glGenTextures(1, &_dstTexture);
}

- (void)copyDstTexture:(CGPoint)location{
    //临时的补丁做法
    location.x = location.x * UndoImageSize / _canvas.frame.size.width;
    location.y = location.y * UndoImageSize / _canvas.frame.size.height;
    
    float copyRadius = roundf(_brushState.radius);
    
    //save temp texture for next draw smudge texture
    glBindTexture(GL_TEXTURE_2D, _dstTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, copyRadius*2, copyRadius*2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    
    //need half pixel offset adjust
    int locationX = roundf(location.x - copyRadius);
    int locationY = roundf(location.y - copyRadius);

    
    //need half pixel offset adjust
    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, locationX, locationY, copyRadius*2, copyRadius*2);
    glBindTexture(GL_TEXTURE_2D, 0);
    
    //    NSLog(@"start x:%.1f y:%.1f", startLocation.x, startLocation.y);
    NSLog(@"finger copy rect x:%d y:%d", locationX, locationY);
}

- (void)copySmudgeSrcTexture:(CGPoint)location{
    //临时的补丁做法
    location.x = location.x * UndoImageSize / _canvas.frame.size.width;
    location.y = location.y * UndoImageSize / _canvas.frame.size.height;
    
    float copyRadius = roundf(_brushState.radius);
    
    //save temp texture for next draw smudge texture
    glBindTexture(GL_TEXTURE_2D, _smudgeTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);        
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); 
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, copyRadius*2, copyRadius*2, 0, GL_RGBA, GL_UNSIGNED_BYTE, 0);
    
    //need half pixel offset adjust
    int locationX = roundf(location.x - copyRadius);
    int locationY = roundf(location.y - copyRadius);
    
    //need half pixel offset adjust
    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, locationX, locationY, copyRadius*2, copyRadius*2);
    glBindTexture(GL_TEXTURE_2D, 0);

//    NSLog(@"start x:%.1f y:%.1f", startLocation.x, startLocation.y);
    NSLog(@"finger radius:%.1f", _brushState.radius);

}
- (void)startDraw:(CGPoint)startLocation{
    _lastSmudgePoint = _curDrawPoint = _lastDrawPoint = startLocation;
    
    //从屏幕接触面截取像素
    [EAGLContext setCurrentContext:_context];
    [self copySmudgeSrcTexture:startLocation];
}

- (void)prepareWithBrushState:(BrushState *)brushState{
    
    glUseProgram(_programBrush);
    
    GLfloat projectionMat[16];
    projectionMat[0] = 2.0 / _canvas.frame.size.width;
    projectionMat[1] = 0.0;
    projectionMat[2] = 0.0;
    projectionMat[3] = -1.0;
    
    projectionMat[4] = 0.0;
    projectionMat[5] = 2.0 / _canvas.frame.size.height;
    projectionMat[6] = 0.0;
    projectionMat[7] = -1.0;
    
    projectionMat[8] = 0.0;
    projectionMat[9] = 0.0;
    projectionMat[10] = -1.0;
    projectionMat[11] = 0.0;
    
    projectionMat[12] = 0.0;
    projectionMat[13] = 0.0;
    projectionMat[14] = 0.0;
    projectionMat[15] = 1.0;
    
    glUniformMatrix4fv( _projectionUniform, 1, GL_FALSE, projectionMat);    
    glUniform1f(_pointSizeUniform, _brushState.radius * 2.0);
//    CGFloat red,green,blue,alpha;
//    [_color getRed:&red green:&green blue:&blue alpha:&alpha];           
//    glUniform4f(_colorUniform, red, green, blue, alpha);
//    glUniform4f(_colorUniform, 1, 1, 1, 1);
    
    glActiveTexture(GL_TEXTURE0);    
    glBindTexture(GL_TEXTURE_2D, _strokeTexture);    
    glUniform1i(_textureUniform, 0); 
    
    glActiveTexture(GL_TEXTURE1);    
    glBindTexture(GL_TEXTURE_2D, _smudgeTexture);    
    glUniform1i(_smudgeTextureUniform, 1);
    
    //adjust alpha to use for pressure
    float pressure = _brushState.opacity * 0.7;
    glUniform1f(_smudgePressureUniform, pressure);             
    
    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ZERO);                                
}

- (BOOL)loadShader
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programBrush = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderFinger" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    } 
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderFinger" ofType:@"fsh"];
    if (![ShaderUltility compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname]) {
        NSLog(@"Failed to compile fragment shader");
        return NO;
    }  
    
    // Attach vertex shader to program.
    glAttachShader(_programBrush, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programBrush, fragShader);    
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programBrush, GLKVertexAttribPosition, "Position");
//    glBindAttribLocation(_programBrush, GLKVertexAttribColor, "SourceColor");    
    
    // Link program.
    if (![ShaderUltility linkProgram:_programBrush]) {
        NSLog(@"Failed to link program: %d", _programBrush);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programBrush) {
            glDeleteProgram(_programBrush);
            _programBrush = 0;
        }
        
        return NO;
    }  
    
    // Get uniform locations.        
    _textureUniform = glGetUniformLocation(_programBrush, "maskTexture");        
    _smudgeTextureUniform = glGetUniformLocation(_programBrush, "smudgeTexture");
    _dstTextureUniform = glGetUniformLocation(_programBrush, "dstTexture");
    _smudgePressureUniform = glGetUniformLocation(_programBrush, "smudgePressure");
    _pointSizeUniform = glGetUniformLocation(_programBrush, "PointSize");        
    _projectionUniform = glGetUniformLocation(_programBrush, "Projection");
//    _colorUniform = glGetUniformLocation(_programBrush, "ColorUnifom");
    //    _angleUniform = glGetUniformLocation(_programBrush, "angle");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programBrush, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programBrush, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;    
}

-(void)drawBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(int) count{
    //初始化，不填入数据    
    [self createVertexBufferObject];
    //顶点数据
    if(_vertexBuffer==NULL){
        _vertexBuffer = malloc(_vertexMax * sizeof(BrushVertex));
    }
    if(count >= _vertexMax) {
        while (count >= _vertexMax) {
            _vertexMax *= 2;
        }
        _vertexBuffer = realloc(_vertexBuffer, _vertexMax * sizeof(BrushVertex));
        [self destroyVertexBufferObject];
        [self createVertexBufferObject];
    }    


    //计算vertex data
    float x, y;
    float t = 0.0;
    for(int i = 0; i < count; i++)
    {
        //switch to viewframebuffer
        //save temp texture for next draw smudge texture 拷贝吸取位置的贴图
        [self copySmudgeSrcTexture:_lastSmudgePoint];
        
        //switch to brushframebuffer
        x = pow(1 - t, 2) * origin.x + 2.0 * (1 - t) * t * control.x + t * t * destination.x;
        y = pow(1 - t, 2) * origin.y + 2.0 * (1 - t) * t * control.y + t * t * destination.y;
        _vertexBuffer[0].Position[0] = x;
        _vertexBuffer[0].Position[1] = y;
        _vertexBuffer[0].Position[2] = 1.0f;   
        _vertexBuffer[0].Position[3] = 0; 
        
        
        // Set the brush color using premultiplied alpha values
        //rgb上不做premultiplied，在最后的合成做
//        _vertexBuffer[0].Color[0] = 1;
//        _vertexBuffer[0].Color[1] = 1;
//        _vertexBuffer[0].Color[2] = 1;    
//        _vertexBuffer[0].Color[3] = 1;            
        
        t += 1.0 / (count);
        //        NSLog(@"draw point:%.1f %.1f %.1f", _vertexBuffer[i].Position[0], _vertexBuffer[i].Position[1], _vertexBuffer[i].Position[2]);
        
        [self copyDstTexture:CGPointMake(x, y)];
        
        glBindVertexArrayOES(_vertexArray);
        glBindBuffer(GL_ARRAY_BUFFER, _drawingVBO);
        glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(BrushVertex), &_vertexBuffer[0]);

        glActiveTexture(GL_TEXTURE0);    
        glBindTexture(GL_TEXTURE_2D, _strokeTexture);    
        glUniform1i(_textureUniform, 0); 
        
        glActiveTexture(GL_TEXTURE1);
        glBindTexture(GL_TEXTURE_2D, _smudgeTexture);    
        glUniform1i(_smudgeTextureUniform, 1);
        
        glActiveTexture(GL_TEXTURE2);
        glBindTexture(GL_TEXTURE_2D, _dstTexture);
        glUniform1i(_dstTextureUniform, 2);
        
        glDrawArrays(GL_POINTS, 0, 1);
//        NSLog(@"draw x:%.1f y:%.1f", x, y);        

        _lastSmudgePoint = CGPointMake(x, y);

    }
    
     
}

@end
