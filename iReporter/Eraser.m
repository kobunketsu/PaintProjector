//
//  Eraser.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-13.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Eraser.h"

@implementation Eraser
- (id)initWithContext:(EAGLContext*)context Canvas:(UIView *)canvas{
    self = [super initWithContext:context Canvas:canvas];
    if (self !=nil) {
        [self setBrushTextureWithImage:@"airBrushRadius16.png"];
        _iconImage = [UIImage imageNamed:@"rubber.png"];
        _type = BrushType_Eraser;
        _typeName = @"rubber";        
    }
    
    return self;
}

- (void)setBlendMode{
    glEnable(GL_BLEND); 
    glBlendFuncSeparate(GL_ZERO, GL_ONE_MINUS_SRC_ALPHA, GL_ZERO, GL_ONE_MINUS_SRC_ALPHA);
}
-(void)prepare{
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
    CGFloat red,green,blue,alpha;
    [_brushState.color getRed:&red green:&green blue:&blue alpha:&alpha];           
    glUniform4f(_colorUniform, 1.0, 1.0, 1.0, 1.0);    
//    glUniform4f(_colorUniform, 0.0, 0.0, 0.0, 1.0);
    
    glActiveTexture(GL_TEXTURE0);    
    glBindTexture(GL_TEXTURE_2D , _strokeTexture);    
    glUniform1i(_textureUniform, 0); 
//    glBlendFuncSeparate(GL_ONE, GL_ONE, GL_ONE, GL_ONE);
    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);                            
    
    
}
/*
- (BOOL)loadShader
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programBrush = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderEraser" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    } 
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderEraser" ofType:@"fsh"];
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
    glBindAttribLocation(_programBrush, GLKVertexAttribColor, "SourceColor");    
    
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
    _textureUniform = glGetUniformLocation(_programBrush, "texture");        
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
 */
@end
