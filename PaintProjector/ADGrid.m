//
//  Grid.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-27.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADGrid.h"
#import "REGLWrapper.h"

@implementation ADGrid

- (id)initWithRow:(int)row column:(int)column{
    self = [super init];
    if (self!=NULL) {
        _rowCount = row;
        _columnCount = column;
        self.measureScale = 1.0;
        return self;
    }
    return nil;
}

- (BOOL)loadVertexData{
    
    if (!glIsVertexArrayOES(_vertexLineArray)) {
        glGenVertexArraysOES(1, &_vertexLineArray);
    }
    glBindVertexArrayOES(_vertexLineArray);
    DebugLogGLLabel(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexLineArray, 0, "vertexLineArray");
    if (!glIsBuffer(_vertexLineBuffer)) {
        glGenBuffers(1, &_vertexLineBuffer);
    }
    glBindBuffer(GL_ARRAY_BUFFER, _vertexLineBuffer);
    DebugLogGLLabel(GL_BUFFER_OBJECT_EXT, _vertexLineBuffer, 0, "vertexLineBuffer");
    _lineWidthCount = self.rowCount + 1;
    _lineHeightCount = self.columnCount + 1;
    //    DebugLog(@"_widthCount:%d  _lineHeightCount:%d", _widthCount, _lineHeightCount);
    _lineVertexCount = (_lineWidthCount + _lineHeightCount)*2;
    
    if (_vertexLineData != NULL) {
        free(_vertexLineData);
    }
    
    _vertexLineData = malloc(_lineVertexCount * sizeof(LineVertex));
    //横线
    for (int i = 0; i < _lineHeightCount; ++i) {
        _vertexLineData[i*2].Position[0] = -_lineWidthCount * 0.5;
        _vertexLineData[i*2].Position[1] = 0;
//        _vertexLineData[i*2].Position[2] = _projNear.z - i * self.measureScale;
        _vertexLineData[i*2].Position[2] = -_lineHeightCount * 0.5 - i * self.measureScale;        
        
        _vertexLineData[i*2+1].Position[0] = _lineWidthCount * 0.5;
        _vertexLineData[i*2+1].Position[1] = 0;
//        _vertexLineData[i*2+1].Position[2] = _projNear.z - i * self.measureScale;
        _vertexLineData[i*2+1].Position[2] = -_lineHeightCount * 0.5 - i * self.measureScale;
    }
    //纵线
    for (int i = 0; i < _lineWidthCount; ++i) {
        _vertexLineData[_lineHeightCount*2 + i*2].Position[0] = (i - floorf(_lineWidthCount* 0.5)) * self.measureScale;
        _vertexLineData[_lineHeightCount*2 + i*2].Position[1] = 0;
        _vertexLineData[_lineHeightCount*2 + i*2].Position[2] = -_lineHeightCount * 0.5; //_projNear.z;
        
        _vertexLineData[_lineHeightCount*2 + i*2+1].Position[0] = (i - floorf(_lineWidthCount* 0.5)) * self.measureScale;
        _vertexLineData[_lineHeightCount*2 + i*2+1].Position[1] = 0;
        _vertexLineData[_lineHeightCount*2 + i*2+1].Position[2] = _lineHeightCount * 0.5;//_projFar.z;
    }
    
    glBufferData(GL_ARRAY_BUFFER, sizeof(LineVertex)*_lineVertexCount, _vertexLineData, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(LineVertex), BUFFER_OFFSET(0));

    glBindVertexArrayOES(0);

    if (_vertexLineData != NULL) {
        free(_vertexLineData);
    }
    
    return YES;
}

- (BOOL)loadShader
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programLine = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderLine" ofType:@"vsh"];
    if (![[REGLWrapper current] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderLine" ofType:@"fsh"];
    if (![[REGLWrapper current] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programLine, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programLine, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programLine, GLKVertexAttribPosition, "position");
    
    // Link program.
    if (![[REGLWrapper current] linkProgram:_programLine]) {
        DebugLog(@"Failed to link program: %d", _programLine);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programLine) {
            glDeleteProgram(_programLine);
            _programLine = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _modelViewProjMatrixUniform = glGetUniformLocation(_programLine, "modelViewProjectionMatrix");
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programLine, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programLine, fragShader);
        glDeleteShader(fragShader);
    }
    DebugLogGLLabel(GL_PROGRAM_OBJECT_EXT, _programLine, 0, [@"programLine" UTF8String]);
    return YES;
}

- (void)updateEffectParams{
    
    //计算绘制矩阵
    GLKMatrix4 worldMatrix = GLKMatrix4Identity;
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(self.viewMatrix, worldMatrix);
    
    self.effect.transform.modelviewMatrix = modelViewMatrix;
    //改为正交矩阵
    self.effect.transform.projectionMatrix = self.projectionMatrix;
}

- (void)updateMatrixView:(GLKMatrix4)viewMatrix projection:(GLKMatrix4)projectionMatrix{
    self.viewMatrix = viewMatrix;
    self.projectionMatrix = projectionMatrix;
    
    //计算网格参数
    [self updateEffectParams];
}

- (void)draw{
    [self.effect prepareToDraw];
    
    glBindVertexArrayOES(_vertexLineArray);

    //    glUniformMatrix4fv(_modelViewProjMatrixUniform, 1, 0, _lineMVPMatrix.m);
    
    //    glDrawArrays(GL_LINES, 0, 4);
    glDrawArrays(GL_LINES, 0, _lineVertexCount);
    
}

- (void)setupGL {
    self.effect = [[GLKBaseEffect alloc] init];
//    [self loadLineShaders];
    
    [self loadVertexData];
}
- (void)tearDownGL {
    self.effect = nil;
    
    [[REGLWrapper current] deleteBuffer:_vertexLineBuffer];
    
    [[REGLWrapper current] deleteVertexArrayOES:_vertexLineArray];
}
@end
