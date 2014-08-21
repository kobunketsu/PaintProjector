//
//  Texture.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RETexture.h"
#import "REResources.h"
#import "RETextureManager.h"

@implementation RETexture
- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}

+(id)textureFromImagePath:(NSString*)imagePath reload:(BOOL)reload{
    RETexture *texture = [[RETexture alloc]init];
    GLKTextureInfo *texInfo = [RETextureManager textureInfoFromImagePath:imagePath reload:reload];
    texture.name = [[imagePath lastPathComponent] stringByDeletingPathExtension];
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, texture.texID, 0, [texture.name UTF8String]);
#endif
    texture.texID = texInfo.name;
    texture.width = texInfo.width;
    texture.height = texInfo.height;
    return texture;
}

+(id)textureFromImageName:(NSString*)imageName reload:(BOOL)reload{
    RETexture *texture = [[RETexture alloc]init];
    GLKTextureInfo *texInfo = [RETextureManager textureInfoFromImageName:imageName reload:reload];
    texture.name = imageName;
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, texture.texID, 0, [texture.name UTF8String]);
#endif
    texture.texID = texInfo.name;
    texture.width = texInfo.width;
    texture.height = texInfo.height;

    return texture;
}

+(id)textureFromData:(NSData*)data name:(NSString*)name{

    RETexture *texture = [[RETexture alloc]init];
    GLKTextureInfo *texInfo = [RETextureManager textureInfoFromData:data];
    texture.name = name;
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, texture.texID, 0, [texture.name UTF8String]);
#endif
    texture.texID = texInfo.name;
    texture.width = texInfo.width;
    texture.height = texInfo.height;

    return texture;
}

+(id)textureFromUIImage:(UIImage*)image name:(NSString*)name{
    RETexture *texture = [[RETexture alloc]init];
    GLKTextureInfo *texInfo = [RETextureManager textureInfoFromUIImage:image];
    texture.name = name;
#if DEBUG
    glLabelObjectEXT(GL_TEXTURE, texture.texID, 0, [texture.name UTF8String]);
#endif
    texture.texID = texInfo.name;
    texture.width = texInfo.width;
    texture.height = texInfo.height;

    return texture;
}

- (void)destroy{
   
    [RETextureManager deleteTexture:self.texID];
    
    [super destroy];
//    DebugLogWarn(@"self.layerTextures removeObject %d", numTex.intValue);
}
@end
