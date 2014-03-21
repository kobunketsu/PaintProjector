//
//  RenderTexture.h
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Texture.h"
#import "GLWrapper.h"

@interface RenderTexture : Texture

@property(assign, nonatomic)size_t width;
@property(assign, nonatomic)size_t height;
@property(assign, nonatomic)GLuint colorBuffer;
@property(assign, nonatomic)GLuint depthBuffer;

-(id)initWithWidth:(size_t)width height:(size_t)height;
- (BOOL)create;
- (void)destroy;
- (void)active;
@end
