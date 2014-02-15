//
//  ShaderUltility.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "ShaderUltility.h"

@implementation ShaderUltility
+ (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file preDefines:(NSArray*)preDefines
{
    GLint status;
    const GLchar *source;

    //add preprocessor define
    NSString *fileStr = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    NSString* sourceStr = [[NSString alloc]init];
    if(preDefines !=NULL ){
        for (NSString* define in preDefines) {
            sourceStr = [sourceStr stringByAppendingFormat:[NSString stringWithFormat:@"#define %@ 1\n", define], nil];
        }
    }

    sourceStr = [sourceStr stringByAppendingString:fileStr];
    source = (GLchar *)[sourceStr UTF8String];
    
    if (!source) {
        NSLog(@"Failed to load vertex shader");
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
        NSLog(@"Shader compile log:\n%s", log);
        free(log);
    }
#endif
    
    glGetShaderiv(*shader, GL_COMPILE_STATUS, &status);
    if (status == 0) {
        glDeleteShader(*shader);
        return NO;
    }
    
    return YES;
}

+ (BOOL)linkProgram:(GLuint)prog
{
    GLint status;
    glLinkProgram(prog);
    
#if defined(DEBUG)
    GLint logLength;
    glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetProgramInfoLog(prog, logLength, &logLength, log);
        NSLog(@"Program link log:\n%s", log);
        free(log);
    }
#endif
    
    glGetProgramiv(prog, GL_LINK_STATUS, &status);
    if (status == 0) {
        return NO;
    }
    
    return YES;
}

+ (BOOL)validateProgram:(GLuint)prog
{
    GLint logLength, status;
    
    glValidateProgram(prog);
    glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &logLength);
    if (logLength > 0) {
        GLchar *log = (GLchar *)malloc(logLength);
        glGetProgramInfoLog(prog, logLength, &logLength, log);
        NSLog(@"Program validate log:\n%s", log);
        free(log);
    }
    
    glGetProgramiv(prog, GL_VALIDATE_STATUS, &status);
    if (status == 0) {
        return NO;
    }
    
    return YES;
}




@end
