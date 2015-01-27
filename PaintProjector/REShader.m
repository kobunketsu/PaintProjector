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
- (id)init{
    self = [super init];
    if (self) {
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
    
    [[REGLWrapper current] deleteProgram:_program];
}
@end
