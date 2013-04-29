//
//  Brush.m
//  iReporter
//
//  Created by 文杰 胡 on 12-10-28.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Brush.h"
@class BrushState;
@implementation BrushState
@synthesize color = _color;
@synthesize radius = _radius;
@synthesize opacity = _opacity;
@synthesize brushId = _brushId;
@end

@class Brush;
@implementation Brush
//@synthesize radius;
//@synthesize brushId;
@synthesize position;
//@synthesize opacity = _opacity;
@synthesize isDrawing;
@synthesize brushType;
@synthesize lastDrawPoint = _lastDrawPoint;
@synthesize curDrawPoint = _curDrawPoint;
@synthesize strokeTexture = _strokeTexture;
@synthesize context = _context;
@synthesize delegate;
@synthesize iconImage = _iconImage;
@synthesize typeName = _typeName;
@synthesize brushState = _brushState;
// first define the pattern width and height
const float kPatternWidth = 44;
const float kPatternHeight = 44;

//绘制笔刷

- (id)initWithContext:(EAGLContext*)context Canvas:(UIView*)canvas{
    self = [super init];
    if (self !=nil) {
        _brushState = [[BrushState alloc]init];
        _brushState.opacity = 1;
        _brushState.radius = 10;        
        [self setColor: [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        
        _context = context;
        _canvas = canvas;



        brushType = BrushType_Pencil;        
        _lastDrawPoint = CGPointZero;
        _vertexMax = 64;
        _vertexBuffer = NULL;        
        
        [self loadShader];      
        
        glGenVertexArraysOES(1, &_vertexArray);
        glBindVertexArrayOES(_vertexArray);
        
        [self setupVertexBufferObjects];
        
        glEnableVertexAttribArray(GLKVertexAttribPosition);    
        glVertexAttribPointer(GLKVertexAttribPosition, 4, GL_FLOAT, GL_FALSE, sizeof(BrushVertex), 0);
        glEnableVertexAttribArray(GLKVertexAttribColor);    
        glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(BrushVertex), BUFFER_OFFSET(16));  
        glBindVertexArrayOES(0);        
    }

    return self;
}

- (void)setBlendMode{
    glEnable(GL_BLEND);    
    glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);    
}

- (GLuint)getDebugTexture{
    return _strokeTexture;
}

- (CGFloat)radius {
    return _brushState.radius;
}

- (void)setRadius:(CGFloat)newValue {
    _brushState.radius = newValue;
}

- (void)startDraw:(CGPoint)startLocation{
    _curDrawPoint = _lastDrawPoint = startLocation;
}

- (void)prepareWithBrushState:(BrushState*)brushState{
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
    glUniform1f(_pointSizeUniform, brushState.radius * 2.0);
    UIColor* color = brushState.color;
    CGFloat red,green,blue,alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    glUniform4f(_colorUniform, red, green, blue, 1);    
    
    glActiveTexture(GL_TEXTURE0);    
    glBindTexture(GL_TEXTURE_2D, _strokeTexture);    
    glUniform1i(_textureUniform, 0); 
    glBlendFuncSeparate(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);                            
}
- (void)prepare{
    [self prepareWithBrushState:_brushState];
}

-(void) setBrushTextureWithImage: (NSString*)brushName
{
    CGImageRef      brushImage;
    CGContextRef    brushContext;
    GLubyte         *brushData;
    size_t          width, height;
    
    //initialize brush image
    brushImage = [UIImage imageNamed:brushName].CGImage;
    
    // Get the width and height of the image
    width = CGImageGetWidth(brushImage);
    height = CGImageGetHeight(brushImage);

    //make the brush texture and context
    if(brushImage) {
        // Allocate  memory needed for the bitmap context
//        brushData = (GLubyte *) calloc(width * height, sizeof(GLubyte));
        brushData = (GLubyte *) calloc(width * height, sizeof(GLubyte));        
        // We are going to use brushData1 to make the final texture
        //        brushData1 = (GLubyte *) calloc(width * height *4, sizeof(GLubyte));
        // Use  the bitmatp creation function provided by the Core Graphics framework. 
        
        CGColorSpaceRef brushColorSpace = CGColorSpaceCreateDeviceGray();
        brushContext = CGBitmapContextCreate(brushData, width, height, 8, width , brushColorSpace, kCGImageAlphaOnly);
        
        
        CGColorSpaceRelease(brushColorSpace);
        // After you create the context, you can draw the  image to the context.
        CGContextDrawImage(brushContext, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), brushImage);
        // You don't need the context at this point, so you need to release it to avoid memory leaks.
        CGContextRelease(brushContext);
        
        [EAGLContext setCurrentContext:_context];
        
        // Use OpenGL ES to generate a name for the texture.
        glGenTextures(1, &_strokeTexture);
        NSLog(@"load _strokeTexture: %d brushName: %@", _strokeTexture, brushName);
        // Bind the texture name. 
        glBindTexture(GL_TEXTURE_2D, _strokeTexture);
        // Set the texture parameters to use a minifying filter and a linear filer (weighted average)
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);        
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);                
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);        
        // Specify a 2D texture image, providing the a pointer to the image data in memory
        glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, width, height, 0, GL_ALPHA, GL_UNSIGNED_BYTE, brushData);
        // Release  the image data; it's no longer needed
//        glBindTexture(GL_TEXTURE_2D, 0);
        free(brushData);
    }
}

-(void)dealloc{
	if (_strokeTexture)
	{
		glDeleteTextures(1, &_strokeTexture);
		_strokeTexture = 0;
	}    
}

- (UIColor *)color {
    return _brushState.color;
}

- (void)setColor:(UIColor *)newValue {
    _brushState.color = newValue;
    [delegate brushColorChanged:_brushState.color];
}

- (void) renderLineFromPoint:(CGPoint)start toPoint:(CGPoint)end
{
    NSLog(@"renderLineFromPoint start x:%.2f y:%.2f  end x:%.2f y:%.2f", start.x, start.y, end.x, end.y);
	// Convert locations from Points to Pixels
	CGFloat scale = 1.0;    
//	CGFloat scale = self.contentScaleFactor;
	start.x *= scale;
	start.y *= scale;
	end.x *= scale;
	end.y *= scale;

	//当前描画点
    _curDrawPoint = CGPointMake((start.x + end.x)*0.5, (start.y + end.y)*0.5);            
	//绘图频率
    float paintDistance = GLKVector2Length(GLKVector2Subtract(GLKVector2Make(_curDrawPoint.x, _curDrawPoint.y), GLKVector2Make(_lastDrawPoint.x, _lastDrawPoint.y)));
    NSUInteger count = MAX(ceilf(paintDistance / (_brushState.radius * 0.25)), 1);
    NSLog(@"radius:%.1f paintDistance:%.2f count:%d", _brushState.radius, paintDistance, count);
    [self drawBezierOrigin:_lastDrawPoint Control:start Destination:_curDrawPoint Count:count];
    
    _lastDrawPoint = _curDrawPoint;        
}

- (void)setupVertexBufferObjects {
    
    if (!_drawingVBO) {
        glGenBuffers(1, &_drawingVBO);
    }

    [self initializeVertexBufferObject];
}

- (void) destroyVertexBufferObject
{
    glDeleteBuffers(1, &_drawingVBO);
}

- (void) initializeVertexBufferObject
{
    glBindBuffer(GL_ARRAY_BUFFER, _drawingVBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(BrushVertex) * _vertexMax, NULL, GL_STREAM_DRAW);

}

-(void)drawBezierOrigin:(CGPoint) origin Control:(CGPoint) control Destination:(CGPoint) destination Count:(int) count
{
    //初始化，不填入数据    
//    [self setupVertexBufferObjects];
    //顶点数据
    if(_vertexBuffer==NULL){
        _vertexBuffer = malloc(_vertexMax * sizeof(BrushVertex));
    }
    if(count >= _vertexMax) {
        while (count >= _vertexMax) {
            _vertexMax *= 2;
            NSLog(@"new _vertexMax:%d", _vertexMax);            
        }
        _vertexBuffer = realloc(_vertexBuffer, _vertexMax * sizeof(BrushVertex));
        NSLog(@"realloc _vertexBuffer! _vertexMax:%d", _vertexMax);
        [self destroyVertexBufferObject];
        [self setupVertexBufferObjects];
    }    

   
    //计算vertex data
    float x, y;
    float t = 0.0;
    for(int i = 0; i < count; i++)
    {
        x = pow(1 - t, 2) * origin.x + 2.0 * (1 - t) * t * control.x + t * t * destination.x;
        y = pow(1 - t, 2) * origin.y + 2.0 * (1 - t) * t * control.y + t * t * destination.y;
        _vertexBuffer[i].Position[0] = x;
        _vertexBuffer[i].Position[1] = y;
        _vertexBuffer[i].Position[2] = 1.0f;   
        _vertexBuffer[i].Position[3] = 0; 
        
        
        // Set the brush color using premultiplied alpha values
        //rgb上不做premultiplied，在最后的合成做
        _vertexBuffer[i].Color[0] = 1;
        _vertexBuffer[i].Color[1] = 1;
        _vertexBuffer[i].Color[2] = 1;    
        _vertexBuffer[i].Color[3] = 1;            
        
        t += 1.0 / (count);
        NSLog(@"draw point index:%d x:%.1f y:%.1f", i, _vertexBuffer[i].Position[0], _vertexBuffer[i].Position[1]);
    }
    
    glBindVertexArrayOES(_vertexArray);
    glBindBuffer(GL_ARRAY_BUFFER, _drawingVBO);
    glBufferSubData(GL_ARRAY_BUFFER, 0, sizeof(BrushVertex) * count, _vertexBuffer);
    
    //速度快了是否会导致来不及绘制
    glDrawArrays(GL_POINTS, 0, count);
}

- (BOOL)loadShader
{
    GLuint vertShader, fragShader;
    NSString *vertShaderPathname, *fragShaderPathname;
    
    // Create shader program.
    _programBrush = glCreateProgram();
    
    // Create and compile vertex shader.
    vertShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderBrush" ofType:@"vsh"];
    if (![ShaderUltility compileShader:&vertShader type:GL_VERTEX_SHADER file:vertShaderPathname]) {
        NSLog(@"Failed to compile vertex shader");
        return NO;
    } 
    
    // Create and compile fragment shader.
    fragShaderPathname = [[NSBundle mainBundle] pathForResource:@"ShaderBrush" ofType:@"fsh"];
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
    _colorUniform = glGetUniformLocation(_programBrush, "ColorUnifom");
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


@end
