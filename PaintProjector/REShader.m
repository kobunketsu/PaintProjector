//
//  Shader.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REShader.h"
#import "REResources.h"
#import "REGLWrapper.h"

@implementation REShader
- (id)initWithPredefines:(NSArray *)predefines{
    self = [super init];
    if (self) {
        _preDefines = predefines;
        self.uniformPropertyDic = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (void)setUniformForKey:(NSString*)key{
    GLuint uniform = glGetUniformLocation(self.program, [key UTF8String]);
    [self.uniformPropertyDic setObject:[NSNumber numberWithInt:uniform] forKey:key];
}

- (void)setBlendMode{
    [[REGLWrapper current]blendFunc:BlendFuncOpaque];
}

- (void)destroy{
    [super destroy];
    
    [self.uniformPropertyDic removeAllObjects];
    self.uniformPropertyDic = nil;
    
    [[REGLWrapper current] deleteProgram:self.program];
}

- (void)compileShaderCompleted{
    NSString *key = NSStringFromClass([self class]);
    if(_preDefines){
        key = [NSString stringWithFormat:@"%@_%@", key, [self.preDefines componentsJoinedByString:@"_"]];
    }
    
    DebugLogGLLabel(GL_PROGRAM_OBJECT_EXT, self.program, 0, [key UTF8String]);
}
@end
