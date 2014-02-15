//
//  ShaderUltility.m
//  iReporter
//
//  Created by 文杰 胡 on 13-1-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "ShaderManager.h"

@implementation ShaderManager
static ShaderManager* sharedInstance = nil;

+(ShaderManager*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ShaderManager alloc]init];
    });
    return sharedInstance;
}

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
