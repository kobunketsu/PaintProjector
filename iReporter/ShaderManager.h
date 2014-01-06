//
//  ShaderUltility.h
//  iReporter
//
//  Created by 文杰 胡 on 13-1-16.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface ShaderManager : NSObject{
    NSMutableDictionary *_shaderCaches;
}
@property (nonatomic, retain)NSMutableDictionary *shaderCaches;
+ (id)sharedInstance;
- (BOOL)compileShader:(GLuint *)shader type:(GLenum)type file:(NSString *)file preDefines:(NSString*)preDefines;
- (BOOL)linkProgram:(GLuint)prog;
- (BOOL)validateProgram:(GLuint)prog;
@end
