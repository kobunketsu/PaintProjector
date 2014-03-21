//
//  TextureManager.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "Ultility.h"

@class TextureManager;

static TextureManager *texMgr;
//一个texMgr管理一个context下创建的资源
@interface TextureManager : NSObject{
}
//+(id)sharedInstance;

@property(retain, nonatomic) NSMutableDictionary* textureCache;
@property(retain, nonatomic) NSMutableDictionary* textureUIImageCache;

+ (GLKTextureInfo *)textureInfoFromImageName:(NSString*)imageName reload:(BOOL)reload;
+ (GLKTextureInfo *)textureInfoFromImagePath:(NSString*)imagePath reload:(BOOL)reload;
+ (GLKTextureInfo *)textureInfoFromFileInDocument:(NSString*)filePathInDoc reload:(BOOL)reload;
+ (GLKTextureInfo *)textureInfoFromUIImage:(UIImage*)uiImage;
+ (GLKTextureInfo *)textureInfoFromCGImage:(CGImageRef)image;
+ (GLKTextureInfo *)textureInfoFromData:(NSData*)data;

+ (void)destroy;
+ (void)destroyTextures;
+ (void)deleteTexture:(GLuint)texture;
@end
