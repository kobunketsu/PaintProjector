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
    texture.texID = texInfo.name;
    texture.width = texInfo.width;
    texture.height = texInfo.height;
    return texture;
}

+(id)textureFromImageName:(NSString*)imageName reload:(BOOL)reload{
    RETexture *texture = [[RETexture alloc]init];
    texture.texID = [RETextureManager textureInfoFromImageName:imageName reload:reload].name;
    return texture;
}

- (void)destroy{
    [super destroy];
    
    [RETextureManager deleteTexture:self.texID];
}
@end
