//
//  Ultility.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-21.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <GLKit/GLKit.h>
#import <QuartzCore/QuartzCore.h>
#include <mach/mach.h>

@interface Ultility : NSObject
+(id)sharedInstance;
+ (NSString*)applicationDirectory;
+ (NSString*)applicationDocumentDirectory;
+ (NSArray *)applicationDocumentSubDirectories;
    
+ (NSString*)getPathInApp:(NSString*)relativeFilePath;
+ (NSString*)getPathInBundle:(NSString*)relativeFilePath;
+ (NSString*)getPathInDocuments:(NSString*)relativeFilePath;

+ (void)deletePNGInDocument:(NSString*) filePathInDoc;
+ (void)saveUIImage:(UIImage*)uiImage ToPNGInDocument:(NSString*) filePathInDoc;
+ (void)saveUIImage:(UIImage*)uiImage ToJPGInDocument:(NSString*) filePathInDoc;
+ (UIImage*)loadUIImageFromPNGInDocument:(NSString*) filePathInDoc;

+ (GLubyte*)loadTextureDataFromFile:(NSString*)filePath;
+ (GLubyte*)loadTextureDataFromFileInDocument:(NSString*)filePathInDoc;
//+ (GLubyte*)loadTextureDataFromImageNamed:(NSString*)imageName;
+ (GLubyte*)loadTextureDataFromCGImage:(CGImageRef)image;
+ (GLubyte*)loadTextureDataFromUIImage:(UIImage*)uiImage;
//+ (void)reloadTexture:(GLuint)texture FromFile:(NSString*)filePath;


+ (UIImage*)glToUIImage:(UIView*)view;
+ (UIImage*)snapshot:(UIView*)eaglview Context:(EAGLContext *)context InViewportSize:(CGSize)viewportSize ToOutputSize:(CGSize)outputSize;
+ (void)CGImageWriteToFile:(CGImageRef)image :(NSString *)path;
//创建带遮罩图像
+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage;
//BOOL memoryInfo(vm_statistics_data_t *vmStats);
//void logMemoryInfo();

+ (GLKMatrix4)MatrixLerpFrom:(GLKMatrix4)fromMatrix to:(GLKMatrix4)toMatrix blend:(float)blend;
@end
/*
;
*/