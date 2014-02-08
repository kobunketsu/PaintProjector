//
//  Shader.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Object.h"
#import "ShaderManager.h"

@interface Shader : Object
@property (assign, nonatomic) GLuint program;
@property (retain, nonatomic) NSMutableDictionary* uniformPropertyDic;

- (void)setUniformForKey:(NSString*)key;
@end
