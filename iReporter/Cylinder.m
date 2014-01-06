
//
//  Cylinder.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-7-28.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Cylinder.h"
#import "Ultility.h"


@implementation Cylinder

- (void)updateEffectParams{
    
    //计算绘制矩阵
    self.worldMatrix = GLKMatrix4Identity;
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(self.viewMatrix, self.worldMatrix);
    
    self.effect.transform.modelviewMatrix = modelViewMatrix;
    //改为正交矩阵
    self.effect.transform.projectionMatrix = self.projectionMatrix;
   
}

- (void)updateMatrixView:(GLKMatrix4)viewMatrix projection:(GLKMatrix4)projectionMatrix projectionOrtho:(GLKMatrix4)projectionOrthoMatrix perspectiveOrthoBlend:(float)perspectiveOrthoBlend eye:(GLKVector3)eye reflectionTexUVSpace:(GLKVector4)reflectionTexUVSpace{
    self.viewMatrix = viewMatrix;
    self.projectionMatrix = projectionMatrix;
    self.eye = eye;
    self.reflectionTexUVSpace = reflectionTexUVSpace;
    self.projectionOrthoMatrix = projectionOrthoMatrix;
    self.perspectiveToOrthoBlend = perspectiveOrthoBlend;
    self.projectionMatrix = [Ultility MatrixLerpFrom:self.projectionMatrix to:self.projectionOrthoMatrix blend:self.perspectiveToOrthoBlend];
    //计算网格参数
    [self updateEffectParams];
}

- (void)draw{

    //绘制圆柱底部
//    glEnable(GL_BLEND);
//    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
//    self.effect.texture2d0.name = self.texInfoCylinderShadow.name;
//    
//    [self.effect prepareToDraw];
//    glBindVertexArrayOES(_vertexArrayShadow);
//    
//    glDrawArrays(GL_TRIANGLE_FAN, 0, self.sides+2);
//    glDisable(GL_BLEND);

    //绘制圆柱侧面
#if DEBUG
    glPushGroupMarkerEXT(0, "Cylinder Main");
#endif
    glUseProgram(_programCylinder);
    
    GLKMatrix4 modelViewMatrix = GLKMatrix4Multiply(self.viewMatrix, self.worldMatrix);
    glUniformMatrix4fv(_modelViewMatrixUniform, 1, 0, modelViewMatrix.m);    
    glUniformMatrix4fv(_worldMatrixUniform, 1, 0, self.worldMatrix.m);
    glUniformMatrix4fv(_projMatrixUniform, 1, 0, self.projectionMatrix.m);
    glUniform3f(_eyeUniform, self.eye.x, self.eye.y, self.eye.z);
    
    glUniform4f(_reflectionTexUVSpaceUniform, self.reflectionTexUVSpace.x, self.reflectionTexUVSpace.y, self.reflectionTexUVSpace.z, self.reflectionTexUVSpace.w);
    glUniform1i(_texture0Unifrom, 0);
    glUniform1i(_reflectionTextureUniform, 1);
    
    [self.glWrapper activeTexSlot:GL_TEXTURE0 bindTexture:self.texInfoCylinderMain.name];

    [self.glWrapper activeTexSlot:GL_TEXTURE1 bindTexture:_reflectionTex];
    
    [self.glWrapper bindVertexArrayOES:_vertexArrayMain];

    glDrawArrays(GL_TRIANGLE_STRIP, 0, self.sides*2);
#if DEBUG
    glPopGroupMarkerEXT();
#endif
    
    
    //绘制圆柱顶部
#if DEBUG
    glPushGroupMarkerEXT(0, "Cylinder Cap");
#endif
    self.effect.texture2d0.name = self.texInfoCylinderCap.name;
    
    [self.effect prepareToDraw];
    
    [self.glWrapper bindVertexArrayOES:_vertexArrayCap];
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, self.sides+2);
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}

- (BOOL)loadVertexDataMain{
    
    if (!glIsVertexArrayOES(_vertexArrayMain)) {
        glGenVertexArraysOES(1, &_vertexArrayMain);
    }
    [self.glWrapper bindVertexArrayOES:_vertexArrayMain];
#if DEBUG
    glLabelObjectEXT(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexArrayMain, 0, "cylinderMain");
#endif
    
    SimpleVertex* vertexData = malloc((self.sides) * 2 * sizeof(SimpleVertex));
    //fill vertex data
    float anglePerSide = M_PI * 2 / (self.sides);
    for (int i = 0; i < self.sides; ++i) {
        float angle = anglePerSide * i;
        vertexData[2*i].Position[0] = cosf(angle) * self.radius;
        vertexData[2*i].Position[1] = self.height;
        vertexData[2*i].Position[2] = sinf(angle) * self.radius;
        vertexData[2*i].Texcoord[0] = (float)i / (float)self.sides;
        vertexData[2*i].Texcoord[1] = 1;
        
        vertexData[2*i+1].Position[0] = cosf(angle) * self.radius;
        vertexData[2*i+1].Position[1] = 0;
        vertexData[2*i+1].Position[2] = sinf(angle) * self.radius;
        vertexData[2*i+1].Texcoord[0] = (float)i / (float)self.sides;
        vertexData[2*i+1].Texcoord[1] = 0.0;
        
//        DebugLog(@"Position x:%.1f y:%.1f", cosf(angle), sinf(angle));
        
    }
    //缺最后一块
    
    glGenBuffers(1, &_vertexBufferMain);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBufferMain);
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _vertexBufferMain, 0, "vertexBufferMain");
#endif
    glBufferData(GL_ARRAY_BUFFER, sizeof(SimpleVertex) * (self.sides*2), vertexData, GL_STATIC_DRAW);

    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(SimpleVertex), BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(SimpleVertex), BUFFER_OFFSET(12));
    [self.glWrapper bindVertexArrayOES:0];
    
    if (vertexData != NULL) {
        free(vertexData);
    }

    return YES;
}

- (BOOL)loadVertexDataShadow{

    float radiusScale = 1.5;
    if (!glIsVertexArrayOES(_vertexArrayShadow)) {
        glGenVertexArraysOES(1, &_vertexArrayShadow);
    }
    [self.glWrapper bindVertexArrayOES:_vertexArrayShadow];
#if DEBUG
    glLabelObjectEXT(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexArrayShadow, 0, "shadow");
#endif
    if (!glIsBuffer(_vertexBufferShadow)) {
        glGenBuffers(1, &_vertexBufferShadow);
    }
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBufferShadow);
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _vertexBufferShadow, 0, "vertexBufferShadow");
#endif
    SimpleVertex* vertexData = malloc((self.sides+2) * sizeof(SimpleVertex));
    
    if (vertexData != NULL) {
        //fill vertex data
        vertexData[0].Position[0] = 0;
        vertexData[0].Position[1] = 0;
        vertexData[0].Position[2] = 0;
        vertexData[0].Texcoord[0] = 0.5;
        vertexData[0].Texcoord[1] = 0.5;
        
        float anglePerSide = M_PI * 2 / (self.sides);
        for (int i = 0; i < self.sides; ++i) {
            float angle = anglePerSide * i;
            vertexData[i+1].Position[0] = cosf(angle) * self.radius * radiusScale;
            vertexData[i+1].Position[1] = 0;
            vertexData[i+1].Position[2] = sinf(angle) * self.radius * radiusScale;
            vertexData[i+1].Texcoord[0] = cosf(angle) * 0.5 + 0.5;
            vertexData[i+1].Texcoord[1] = sinf(angle) * 0.5 + 0.5;
        }
        
        vertexData[self.sides+1].Position[0] = vertexData[1].Position[0];
        vertexData[self.sides+1].Position[1] = vertexData[1].Position[1];
        vertexData[self.sides+1].Position[2] = vertexData[1].Position[2];
        vertexData[self.sides+1].Texcoord[0] = vertexData[1].Texcoord[0];
        vertexData[self.sides+1].Texcoord[1] = vertexData[1].Texcoord[1];
        
        glBufferData(GL_ARRAY_BUFFER, sizeof(SimpleVertex) * (self.sides+2), vertexData, GL_STATIC_DRAW);
        
        glEnableVertexAttribArray(GLKVertexAttribPosition);
        glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(SimpleVertex), BUFFER_OFFSET(0));
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(SimpleVertex), BUFFER_OFFSET(12));
        [self.glWrapper bindVertexArrayOES:0];
        
        if (vertexData != NULL) {
            free(vertexData);
        }
        
        return YES;
    }
    return NO;
}

- (BOOL)loadVertexDataCap{
    
    if (!glIsVertexArrayOES(_vertexArrayCap)) {
        glGenVertexArraysOES(1, &_vertexArrayCap);
    }
    [self.glWrapper bindVertexArrayOES:_vertexArrayCap];
#if DEBUG
    glLabelObjectEXT(GL_VERTEX_ARRAY_OBJECT_EXT, _vertexArrayCap, 0, "cylinderCap");
#endif
    if (!glIsBuffer(_vertexBufferCap)) {
        glGenBuffers(1, &_vertexBufferCap);
    }
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBufferCap);
#if DEBUG
    glLabelObjectEXT(GL_BUFFER_OBJECT_EXT, _vertexBufferCap, 0, "vertexBufferCap");
#endif
    SimpleVertex* vertexData = malloc((self.sides+2) * sizeof(SimpleVertex));
    
    if (vertexData !=NULL) {
        //fill vertex data
        vertexData[0].Position[0] = 0;
        vertexData[0].Position[1] = self.height;
        vertexData[0].Position[2] = 0;
        vertexData[0].Texcoord[0] = 0.5;
        vertexData[0].Texcoord[1] = 0.5;
        
        float anglePerSide = M_PI * 2 / (self.sides);
        for (int i = 0; i < self.sides; ++i) {
            float angle = anglePerSide * i;
            vertexData[i+1].Position[0] = cosf(angle) * self.radius;
            vertexData[i+1].Position[1] = self.height;
            vertexData[i+1].Position[2] = sinf(angle) * self.radius;
            vertexData[i+1].Texcoord[0] = cosf(angle) * 0.5 + 0.5;
            vertexData[i+1].Texcoord[1] = sinf(angle) * 0.5 + 0.5;
        }
        
        vertexData[self.sides+1].Position[0] = vertexData[1].Position[0];
        vertexData[self.sides+1].Position[1] = vertexData[1].Position[1];
        vertexData[self.sides+1].Position[2] = vertexData[1].Position[2];
        vertexData[self.sides+1].Texcoord[0] = vertexData[1].Texcoord[0];
        vertexData[self.sides+1].Texcoord[1] = vertexData[1].Texcoord[1];
        
        glBufferData(GL_ARRAY_BUFFER, sizeof(SimpleVertex) * (self.sides+2), vertexData, GL_STATIC_DRAW);
        
        glEnableVertexAttribArray(GLKVertexAttribPosition);
        glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(SimpleVertex), BUFFER_OFFSET(0));
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(SimpleVertex), BUFFER_OFFSET(12));
        [self.glWrapper bindVertexArrayOES:0];
        
        if (vertexData != NULL) {
            free(vertexData);
        }
        
        return YES;
    }

    return NO;
}

- (void)setupGLWrapper:(GLWrapper*)wrapper texMgr:(TextureManager*)texMgr reflectionTex:(GLuint)reflectionTex{
    self.glWrapper = wrapper;
    
    //cap
    self.effect = [[GLKBaseEffect alloc] init];
    
    self.texInfoCylinderCap = [texMgr loadTextureInfoFromImageName:@"cylinderCap.png" reload:false];

    [self loadVertexDataCap];
    
    //main
    [self loadShaderCylinder];
    
    self.texInfoCylinderMain = [texMgr loadTextureInfoFromImageName:@"cylinderMain.png" reload:false];
    
    [self loadVertexDataMain];
    
    self.reflectionTex = reflectionTex;
    
    //shadow
    self.texInfoCylinderShadow = [texMgr loadTextureInfoFromImageName:@"cylinderShadow.png" reload:false];
    
    [self loadVertexDataShadow];
}

- (void)tearDownGL {
    self.effect = nil;
    
    //cap
    RELEASE_BUFFER(_vertexBufferCap);

    RELEASE_VERTEXARRAY(_vertexArrayCap);
    
    //main
    RELEASE_BUFFER(_vertexBufferMain);
    
    RELEASE_VERTEXARRAY(_vertexArrayMain);
    
    //shadow
    RELEASE_BUFFER(_vertexBufferShadow);
    
    RELEASE_VERTEXARRAY(_vertexArrayShadow);
    
    //deleteshaders
    
}

- (BOOL)loadShaderCylinder
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programCylinder = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderCylinder" ofType:@"vsh"];
    if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderCylinder" ofType:@"fsh"];
    if (![[ShaderManager sharedInstance] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_programCylinder, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_programCylinder, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_programCylinder, GLKVertexAttribPosition, "position");
    glBindAttribLocation(_programCylinder, GLKVertexAttribTexCoord0, "texcoord");


    // Link program.
    if (![[ShaderManager sharedInstance] linkProgram:_programCylinder]) {
        DebugLog(@"Failed to link program: %d", _programCylinder);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_programCylinder) {
            glDeleteProgram(_programCylinder);
            _programCylinder = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _modelViewMatrixUniform = glGetUniformLocation(_programCylinder, "modelViewMatrix");
    _worldMatrixUniform = glGetUniformLocation(_programCylinder, "worldMatrix");
    _projMatrixUniform = glGetUniformLocation(_programCylinder, "projMatrix");

    _eyeUniform = glGetUniformLocation(_programCylinder, "eye");
    _reflectionTextureUniform = glGetUniformLocation(_programCylinder, "reflectionTex");
    _reflectionTexUVSpaceUniform = glGetUniformLocation(_programCylinder, "reflectionTexUVSpace");
    _texture0Unifrom = glGetUniformLocation(_programCylinder, "texture0");

    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_programCylinder, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_programCylinder, fragShader);
        glDeleteShader(fragShader);
    }
#if DEBUG
    glLabelObjectEXT(GL_PROGRAM_OBJECT_EXT, _programCylinder, 0, [@"programCylinder" UTF8String]);
#endif
    return YES;
}
@end
