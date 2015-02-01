//
//  Shader.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REObject.h"
#import "REGLWrapper.h"

@interface REShader : REObject
@property (assign, nonatomic) GLuint program;
@property (retain, nonatomic) NSMutableDictionary* uniformPropertyDic;
@property (retain, nonatomic) NSArray *preDefines;
- (void)setUniformForKey:(NSString*)key;
- (void)setBlendMode;
- (id)initWithPredefines:(NSArray *)predefines;
- (void)compileShaderCompleted;
@end
