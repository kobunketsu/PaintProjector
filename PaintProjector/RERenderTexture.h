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

+ (id)textureWithName:(NSString *)name size:(CGFloat)size mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode;
+ (id)textureWithName:(NSString *)name width:(CGFloat)width height:(CGFloat)height mipmap:(InterpolationType)interpolationType wrapMode:(WrapMode)wrapMode;
- (void)destroy;
- (void)active;
- (UIImage*)snapshotImageToViewportSize:(CGSize)viewportSize;
@end
