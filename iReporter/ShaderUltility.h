//
//  ShaderUltility.h
//  iReporter
//
//  Created by 文杰 胡 on 13-1-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface ShaderUltility : NSObject
+ (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file;
+ (BOOL)linkProgram:(GLuint)prog;
+ (BOOL)validateProgram:(GLuint)prog;
+ (GLuint)setupTexture:(NSString *)fileName;
+ (BOOL)createTexturebuffer:(GLuint*)texture Width:(int)width Height:(int)height;
@end
