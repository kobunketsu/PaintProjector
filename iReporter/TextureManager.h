//
//  TextureManager.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "Ultility.h"

//一个texMgr管理一个context下创建的资源
@interface TextureManager : NSObject{
    NSMutableDictionary* _textureCache;
    NSMutableDictionary* _textureUIImageCache;
//    NSMutableDictionary* _textureDataCache;
}
//+(id)sharedInstance;

- (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName reload:(BOOL)reload;
- (GLKTextureInfo *)loadTextureInfoFromImagePath:(NSString*)imagePath reload:(BOOL)reload;
- (GLKTextureInfo *)loadTextureInfoFromFileInDocument:(NSString*)filePathInDoc reload:(BOOL)reload;
- (GLKTextureInfo *)loadTextureInfoFromUIImage:(UIImage*)uiImage;
- (GLKTextureInfo *)loadTextureInfoFromCGImage:(CGImageRef)image;
- (GLKTextureInfo *)loadTextureInfoFromData:(NSData*)data;

- (void)destroyTextures;
- (void)deleteTexture:(GLuint)texture;
@end
