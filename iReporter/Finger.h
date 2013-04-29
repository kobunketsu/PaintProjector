//
//  Figure.h
//  iReporter
//
//  Created by 文杰 胡 on 13-1-25.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "Brush.h"

@interface Finger : Brush
{
    GLuint _smudgeTexture;
    GLuint _dstTexture;     //当前位置画布上的截取纹理
    GLuint _smudgeTextureUniform;
    GLuint _dstTextureUniform;
    GLuint _smudgePressureUniform;            
    CGPoint _lastSmudgePoint;
}
@end
