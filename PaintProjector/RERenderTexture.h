//
//  RenderTexture.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RETexture.h"
#import "REGLWrapper.h"

@interface RERenderTexture : RETexture

@property(assign, nonatomic)GLuint frameBuffer;
@property(assign, nonatomic)GLuint depthBuffer;

+ (id)textureWithSize:(CGFloat)size mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode;
+ (id)textureWithWidth:(CGFloat)width height:(CGFloat)height mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode;
- (void)destroy;
- (void)active;

@end
