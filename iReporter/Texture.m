//
//  Texture.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Texture.h"
#import "Resources.h"
#import "TextureManager.h"

@implementation Texture
- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}

@synthesize texID = _texID;

+(id)textureFromImagePath:(NSString*)imagePath reload:(BOOL)reload{
    Texture *texture = [[Texture alloc]init];
    texture.texID = [TextureManager textureInfoFromImagePath:imagePath reload:reload].name;
    return texture;
}

- (void)destroy{
    [super destroy];
    
    [TextureManager deleteTexture:self.texID];
}
@end
