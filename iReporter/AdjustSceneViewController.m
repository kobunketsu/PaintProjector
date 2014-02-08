//
//  AdjustSceneViewController.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-2.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "AdjustSceneViewController.h"
#import "GLWrapper.h"
//#import "CommonData.h"
float vertexData[] = 
{
    0.5f, 0, -0.5f,          1.0f, 1.0f,
    -0.5f,0, -0.5f,          0.0f, 1.0f,
    0.5f, 0, 0.5f,         1.0f, 0.0f,
    0.5f, 0, 0.5f,        1.0f, 0.0f,
    -0.5f,0, -0.5f,         0.0f, 1.0f,
    -0.5f,0, 0.5f,        0.0f, 0.0f,
};
@interface AdjustSceneViewController ()

@end

@implementation AdjustSceneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context) {
        DebugLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;    
    view.delegate = self;
    
    [self setupGL];
    _paintViewAngleX = _curViewAngleX = _lastViewAngleX = 0;
    _paintViewAngleY = _curViewAngleY = _lastViewAngleY = M_PI_4;
    _eye = GLKVector3Make(0, 1.75, 0);
    _eyeToPaintViewCenterDistanceZ = _eyeToViewCenterDistanceZ = _eye.y / tanf(_curViewAngleY);    
    _minViewAngleY = DEGREES_TO_RADIANS(HumanEyeFOV * 0.5 * 1.1);
    _kHeightScale = _kWidthScale = 1.0;
    
//    _isPaintMode = true;
    //texMgr not retained
    [TextureManager initialize];
    _floorTextureInfo = [TextureManager loadTextureInfoFromImageName:@"check.jpg" reload:false];
//    _paintTextureInfo = _floorTextureInfo;            //test
    
}

- (void)viewDidUnload
{
    [self setAdjustDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self tearDownGL];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)update{
    [self setupMVPMatrix];
}
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [EAGLContext setCurrentContext:_context]; 
    //normal rendering
    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    
    glBindVertexArrayOES(_vertexArray);
    
    // Render the object again with ES2
    glUseProgram(_program);
    
    glActiveTexture(GL_TEXTURE0); 
    glBindTexture(GL_TEXTURE_2D, _floorTextureInfo.name);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    
//    if(_paintTextureInfo!=NULL){
//        glActiveTexture(GL_TEXTURE1); 
//        glBindTexture(GL_TEXTURE_2D, _paintTextureInfo.name);        
//    }
    
    glUniform1i(_baseTextureUniform, 0);    
//    glUniform1i(_paintTextureUniform, 1);   
    glUniformMatrix4fv(_modelViewProjMatrixUniform, 1, 0, _modelViewProjectionMatrix.m);
//    glUniformMatrix4fv(_paintMVPMatrixUniform, 1, 0, _paintMVPMatrix.m);
    glUniform1f(_baseTexScaleUniform, 1.0);
//    glUniform1f(_paintTexScaleUniform, 1.0);
    
    //    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);        
    glDrawArrays(GL_TRIANGLES, 0, 6);   
}

- (void)setupGL {
    [EAGLContext setCurrentContext:_context];
    
    [self loadShaders];
    
    glEnable(GL_DEPTH_TEST);
    
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertexData), vertexData, GL_STATIC_DRAW);
    
    //    glGenBuffers(1, &_indexBuffer);
    //    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    //    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(0));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 20, BUFFER_OFFSET(12));
    
    glBindVertexArrayOES(0);
    
}
- (void)tearDownGL {
    [EAGLContext setCurrentContext:_context];
    RELEASE_BUFFER(_vertexBuffer)
    RELEASE_VERTEXARRAY(_vertexArray)
    
    if (_program) {
        glDeleteProgram(_program);
        _program = 0;
    }  
}
- (BOOL)loadShaders
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _program = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderScene" ofType:@"vsh"];
    if (![[ShaderManager sharedInstance] compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile vertex shader");
        return NO;
    }
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"Shaders/ShaderScene" ofType:@"fsh"];
    if (![[ShaderManager sharedInstance] compileShader:&fragShader type:GL_FRAGMENT_SHADER file:fragShaderPathname preDefines:nil]) {
        DebugLog(@"Failed to compile fragment shader");
        return NO;
    }
    
    // Attach vertex shader to program.
    glAttachShader(_program, vertShader);
    
    // Attach fragment shader to program.
    glAttachShader(_program, fragShader);
    
    // Bind attribute locations.
    // This needs to be done prior to linking.
    glBindAttribLocation(_program, GLKVertexAttribPosition, "position");
    glBindAttribLocation(_program, GLKVertexAttribTexCoord0, "texcoord");
    
    // Link program.
    if (![[ShaderManager sharedInstance] linkProgram:_program]) {
        DebugLog(@"Failed to link program: %d", _program);
        
        if (vertShader) {
            glDeleteShader(vertShader);
            vertShader = 0;
        }
        if (fragShader) {
            glDeleteShader(fragShader);
            fragShader = 0;
        }
        if (_program) {
            glDeleteProgram(_program);
            _program = 0;
        }
        
        return NO;
    }
    
    // Get uniform locations.
    _modelViewProjMatrixUniform = glGetUniformLocation(_program, "modelViewProjectionMatrix");
//    _paintMVPMatrixUniform = glGetUniformLocation(_program, "paintMVPMatrix");
    
    _baseTextureUniform = glGetUniformLocation(_program, "inputImageTexture");
    _baseTexScaleUniform = glGetUniformLocation(_program, "fBaseTexScale"); 
//    _paintTextureUniform = glGetUniformLocation(_program, "inputPaintTexture");     
//    _paintTexScaleUniform = glGetUniformLocation(_program, "fPaintTexScale");     
    
    // Release vertex and fragment shaders.
    if (vertShader) {
        glDetachShader(_program, vertShader);
        glDeleteShader(vertShader);
    }
    if (fragShader) {
        glDetachShader(_program, fragShader);
        glDeleteShader(fragShader);
    }
    
    return YES;
}
#pragma mark ViewControllerDelegate
- (void)setupMVPMatrix{
    float aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(HumanEyeFOV), aspect, 0.01f, 100.0f);    
    
    GLKMatrix4 scaleMatrix = GLKMatrix4MakeScale(20, 1, 30);
    GLKMatrix4 worldMatrix = scaleMatrix;
    
    //定义最远距离
    if(_curViewAngleY < _minViewAngleY){
        _curViewAngleY = _minViewAngleY;
    }
    _eyeToViewCenterDistanceZ = _eye.y / tanf(_curViewAngleY);
    float x = sinf(_curViewAngleX) * _eyeToViewCenterDistanceZ;
    float z = cosf(_curViewAngleX) * _eyeToViewCenterDistanceZ;    
    GLKVector3 viewCenter = GLKVector3Make(x, 0, -z);
    GLKMatrix4 modelViewMatrix  = GLKMatrix4MakeLookAt(_eye.x, _eye.y, _eye.z, viewCenter.x, viewCenter.y, viewCenter.z, 0, 1, 0);
    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, worldMatrix);
    
    // Compute the model view matrix for the object rendered with ES2
    _modelViewProjectionMatrix = GLKMatrix4Multiply(projectionMatrix, modelViewMatrix); 
}
- (IBAction)handlePanGRAdjustSceneView:(UIPanGestureRecognizer *)sender {
    
    switch (sender.state ) {
        case UIGestureRecognizerStateBegan:
            _lastViewAngleX = _curViewAngleX;
            _lastViewAngleY = _curViewAngleY;
            break;
        case UIGestureRecognizerStateEnded:
            
            break;            
        default:
            break;
    } 
    if (sender.numberOfTouches<2) {
        CGPoint translation = [sender translationInView:sender.view];
        _curViewAngleX = _lastViewAngleX + translation.x * 0.01;
        _curViewAngleY = _lastViewAngleY + translation.y * 0.01;
    }    

}

- (IBAction)adjustDoneButtonTapped:(UIButton *)sender {
    UIImage* uiImage = [Ultility snapshot:self.view Context:_context InViewportSize:self.view.frame.size ToOutputSize:self.view.frame.size];
    
    [self.delegate adjustSceneDone:uiImage];
    [self dismissViewControllerAnimated:true completion:^{[self.delegate adjustSceneViewControllerDismissed];}];    
}
@end
