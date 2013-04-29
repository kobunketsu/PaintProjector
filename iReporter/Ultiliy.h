//
//  Ultiliy.h
//  iReporter
//
//  Created by 文杰 胡 on 12-12-21.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <GLKit/GLKit.h>
@interface Ultiliy : NSObject
+ (NSString *)applicationDocumentDirectory;
+ (void)deletePNGInDocument:(NSString*) filePathInDoc;
+ (void)saveUIImage:(UIImage*)uiImage ToPNGInDocument:(NSString*) filePathInDoc;
+ (UIImage*)loadUIImageFromPNGInDocument:(NSString*) filePathInDoc;
+ (GLKTextureInfo *)loadTextureInfoFromFileInDocument:(NSString*)filePathInDoc;
+ (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName;
+ (GLKTextureInfo *)loadTextureInfoFromCGImageRef:(CGImageRef)cgImage;

+ (GLubyte*)loadTextureDataFromFile:(NSString*)filePath;
+ (GLubyte*)loadTextureDataFromFileInDocument:(NSString*)filePathInDoc;
+ (GLubyte*)loadTextureDataFromImageNamed:(NSString*)imageName;

+ (void)CGImageWriteToFile:(CGImageRef)image :(NSString *)path;
@end
/*
;
*/