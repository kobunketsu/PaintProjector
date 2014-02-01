//
//  Shader.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShaderManager.h"

@interface Shader : NSObject
@property (assign, nonatomic) GLuint program;
@property (retain, nonatomic) NSMutableDictionary* uniformPropertyDic;
@end
