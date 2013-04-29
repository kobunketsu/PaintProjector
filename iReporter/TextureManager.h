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

@interface TextureManager : NSObject{
    NSMutableDictionary* _textureCache;
    NSMutableDictionary* _textureUIImageCache;
//    NSMutableDictionary* _textureDataCache;
}
+(id)sharedInstance;
- (void)deleteTexture:(GLuint)texture;
- (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName reload:(BOOL)reload;
- (GLKTextureInfo *)loadTextureInfoFromImagePath:(NSString*)imagePath reload:(BOOL)reload;
- (GLKTextureInfo *)loadTextureInfoFromFileInDocument:(NSString*)filePathInDoc;
- (GLKTextureInfo *)loadTextureInfoFromUIImage:(UIImage*)uiImage;
- (GLKTextureInfo *)loadTextureInfoFromData:(NSData*)data;
@end
