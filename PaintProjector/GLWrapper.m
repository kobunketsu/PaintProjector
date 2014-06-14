//
//  GLWrapper.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-5.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

//用来优化OpenGLES指令效率的包裹器
#import "GLWrapper.h"


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

@end
