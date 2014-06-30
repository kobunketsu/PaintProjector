//
//  GLWrapper.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

//用来优化OpenGLES指令效率的包裹器
#import "GLWrapper.h"
#import "Shader.h"

@implementation GLWrapper
+(GLWrapper*)current{
    if (!glWrapper) {
        glWrapper = [[GLWrapper alloc]init];
    }
    return glWrapper;
}

+(void)initialize{
    [super initialize];
    
    if (!glWrapper) {
        glWrapper = [[GLWrapper alloc]init];
    }
}

+(void)destroy{
    if (glWrapper) {
        glWrapper = nil;
    }
}

+(void)setCurrent:(GLWrapper*)current{
    glWrapper = current;
}

- (id)init{
    DebugLogSystem(@"init");
    if ((self = [super init])) {
        _shaderCaches = [[NSMutableDictionary alloc]init];
        _activeSlotTex = [[NSMutableDictionary alloc]init];
        _context = [self createBestEAGLContext];
        [EAGLContext setCurrentContext:_context];
    }
    return self;
}

- (void)dealloc{
    DebugLogSystem(@"dealloc");
    _shaderCaches = nil;
    _activeSlotTex = nil;
    [EAGLContext setCurrentContext:nil];
    self.context = nil;

}

-(EAGLContext *)createBestEAGLContext{
    DebugLogFuncStart(@"createBestEAGLContext");
//    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
//    if (context == nil) {
//    }
    
    EAGLContext * context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    if(context == nil){
        DebugLogError(@"Failed to create ES context");
    }
    else{
        DebugLogSuccess(@"create kEAGLRenderingAPIOpenGLES2 context success");
    }
    return context;
}

-(void)deleteRenderbufferOES:(GLuint)RBO{
    RELEASE_RENDERBUFFER(RBO);
}

-(void)bindFramebufferOES:(GLuint)FBO discardHint:(BOOL)discardHint clear:(BOOL)clear{
    if(FBO!=self.lastFramebuffer){
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, FBO);
        self.lastFramebuffer=FBO;
    }
    
    if (discardHint) {
        const GLenum discards[] = {GL_COLOR_ATTACHMENT0};
        glDiscardFramebufferEXT(GL_FRAMEBUFFER, 1, discards);
    }
    if (clear) {
        glClear(GL_COLOR_BUFFER_BIT);
    }
}

-(void)deleteFramebufferOES:(GLuint)FBO{
    if (self.lastFramebuffer == FBO) {
        self.lastFramebuffer = 0;
    }
    RELEASE_FRAMEBUFFER(FBO);
}

-(void)bindBuffer:(GLuint)buffer{
    if(buffer != self.lastVBO){
        glBindBuffer(GL_ARRAY_BUFFER,buffer);
        self.lastVBO = buffer;
    }
}

-(void)deleteBuffer:(GLuint)buffer{
    if (self.lastVBO == buffer) {
        self.lastVBO = 0;
    }
    RELEASE_BUFFER(buffer);
}

-(void)bindElementBuffer:(GLuint)buffer{
    if(buffer != self.lastVEBO){
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,buffer);
        self.lastVEBO = buffer;
    }
}

-(void)deleteElementBuffer:(GLuint)buffer{
    if (self.lastVEBO == buffer) {
        self.lastVEBO = 0;
    }
    RELEASE_BUFFER(buffer);
}

-(void)bindVertexArrayOES:(GLuint)VAO{
    if(VAO != self.lastVAO){
        glBindVertexArrayOES(VAO);
        self.lastVAO = VAO;
    }
}

-(void)deleteVertexArrayOES:(GLuint)VAO{
    if (self.lastVAO == VAO) {
        self.lastVAO = 0;
    }
    RELEASE_VERTEXARRAY(VAO);
}

-(void)bindTexture:(GLuint)tex{
    if(tex != self.lastTexture){
        glBindTexture(GL_TEXTURE_2D,tex);
        self.lastTexture = tex;
    }
}

-(void)activeTexture:(GLuint)tex{
    if(tex != self.lastActiveTexSlot){
        glActiveTexture(tex);
        self.lastActiveTexSlot = tex;
    }
}

-(void)activeTexSlot:(GLuint)activeTex bindTexture:(GLuint)bindTex{
    if(activeTex != self.lastActiveTexSlot){
        glActiveTexture(activeTex);
    }

    if(bindTex != self.lastTexture ||
       (bindTex == self.lastTexture && activeTex != self.lastActiveTexSlot)){
        glBindTexture(GL_TEXTURE_2D,bindTex);
    }
    
    self.lastActiveTexSlot = activeTex;
    
    self.lastTexture = bindTex;
}

-(void)deleteTexture:(GLuint)tex{
    if (self.lastTexture == tex) {
        self.lastTexture = 0;
    }
    RELEASE_TEXTURE(tex);
}

-(Shader*)createShader:(NSString*)name{
    Shader *shader = (Shader *)[self.shaderCaches valueForKey:name];
    if(shader){
        return shader;
    }
    else{
        Shader *shader = [[NSClassFromString(name) alloc] init];
        if (!shader) {
            DebugLogError(@"createShader %@ failed", name);
            return nil;
        }

        [self.shaderCaches setValue:shader forKey:name];
        
        return shader;
    }
}

-(void)useProgram:(GLuint)program uniformBlock:(void (^) (void))block1{
    if(program != self.lastProgram){
        glUseProgram(program);
        self.lastProgram = program;
    }
    else{
    }
    if (block1 != NULL) {
        block1();
    }
}

-(void)deleteProgram:(GLuint)program{
    if (self.lastProgram == program) {
        self.lastProgram = 0;
    }
    RELEASE_PROGRAM(program);
}

-(void)blendFunc:(BlendFuncType)blendFuncType{
    if (self.lastBlendFuncType == blendFuncType ) {
        return;
    }
    switch (blendFuncType) {
        case BlendFuncAdditive:
            glBlendFuncSeparateOES(GL_ONE, GL_ONE, GL_ZERO, GL_ONE);
            break;
        case BlendFuncOpaque:
            glBlendFuncSeparateOES(GL_ONE, GL_ZERO, GL_ONE, GL_ZERO);
            break;
        case BlendFuncOpaqueAlphaBlend:
            glBlendFuncSeparateOES(GL_ONE, GL_ZERO, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
        case BlendFuncAlphaBlend:
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
        case BlendFuncAlphaBlendPremultiplied:
            glBlendFuncSeparate(GL_ONE, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
            break;
        case BlendFuncErase:
            glBlendFuncSeparate(GL_ZERO, GL_ONE_MINUS_SRC_ALPHA, GL_ZERO, GL_ONE_MINUS_SRC_ALPHA);
            break;
        default:
            break;
    }
    self.lastBlendFuncType = blendFuncType;
}

-(void)setImageInterpolationFinished{
    //退回到默认采样状态
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
}

-(void)setImageInterpolation:(InterpolationType)type{
    switch (type) {
        case Interpolation_Nearest:{
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
            break;
        }
        case Interpolation_Linear:{
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            break;
        }
        default:
            break;
    }

}

- (void)setImageWrapMode:(WrapMode)wrapMode{
    switch (wrapMode) {
        case WrapMode_Clamp:{
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
            break;
        }
        case WrapMode_Repeat:{
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
            break;
        }
        default:
            break;
    }
}

#pragma mark- compile shader
- (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file preDefines:(NSString*)preDefines
{
    //    NSString *shaderKey;
    //    if (preDefines!=NULL) {
    //        shaderKey = [file stringByAppendingString:preDefines];
    //    }
    //    else{
    //        shaderKey = file;
    //    }
    //    if (self.shaderCaches == NULL) {
    //        _shaderCaches = [[NSMutableDictionary alloc]init];
    //    }
    //    NSNumber *shaderNum = [self.shaderCaches objectForKey:shaderKey];
    //
    //    if (shaderNum != NULL) {
    //        *shader = shaderNum.intValue;
    //        DebugLog(@"use compiled shader %d %@",shaderNum.intValue, shaderKey);
    //        return YES;
    //    }
    
    GLint status;
    const GLchar *source;
    
    //add preprocessor define
    NSString *fileStr = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    NSString* sourceStr = [[NSString alloc]init];
    if(preDefines !=NULL ){
        NSArray* aPreDefines = [preDefines componentsSeparatedByString:@"|"];
        for (NSString* define in aPreDefines) {
            if ([define isEqualToString:@""]) {
                continue;
            }
            sourceStr = [sourceStr stringByAppendingFormat:[NSString stringWithFormat:@"#define %@ 1\n", define], nil];
        }
    }
    
    sourceStr = [sourceStr stringByAppendingString:fileStr];
    source = (GLchar *)[sourceStr UTF8String];
    
    if (!source) {
        DebugLog(@"Failed to load vertex shader");
        return NO;
    }
    
    *shader = glCreateShader(type);
    glShaderSource(*shader, 1, &source, NULL);
    glCompileShader(*shader);
    
#if defined(DEBUG)
    GLint logLength;
    glGetShaderiv(*shader, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetShaderInfoLog(*shader, logLength, &logLength, log);
        DebugLog(@"Shader %@ compile log:\n%s", file, log);
        free(log);
    }
#endif
    
    glGetShaderiv(*shader, GL_COMPILE_STATUS, &status);
    if (status == 0) {
        glDeleteShader(*shader);
        return NO;
    }
    
    
    //    shaderNum = [NSNumber numberWithInt:*shader];
    //    DebugLog(@"compiled new shader %d %@", shaderNum.intValue, shaderKey);
    //    [self.shaderCaches setObject:shaderNum forKey:shaderKey];
    return YES;
}

- (BOOL)linkProgram:(GLuint)prog
{
    GLint status;
    glLinkProgram(prog);
    
#if defined(DEBUG)
    GLint logLength;
    glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetProgramInfoLog(prog, logLength, &logLength, log);
        DebugLog(@"Program link log:\n%s", log);
        free(log);
    }
#endif
    
    glGetProgramiv(prog, GL_LINK_STATUS, &status);
    if (status == 0) {
        return NO;
    }
    
    return YES;
}

- (BOOL)validateProgram:(GLuint)prog
{
    
    GLint logLength, status;
#if defined(DEBUG)
    glValidateProgram(prog);
    glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetProgramInfoLog(prog, logLength, &logLength, log);
        DebugLog(@"Program validate log:\n%s", log);
        free(log);
    }
#endif
    glGetProgramiv(prog, GL_VALIDATE_STATUS, &status);
    if (status == 0) {
        return NO;
    }
    
    return YES;
}
@end
