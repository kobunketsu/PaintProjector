//
//  Ultility.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-21.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADUltility.h"

@implementation ADUltility
static ADUltility* sharedInstance = nil;

+(ADUltility*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ADUltility alloc]init];
    });
    return sharedInstance;
}
#pragma mark- 文件访问
+ (NSString *)applicationDirectory {
    //    Returns the path to the application's documents directory.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}
+ (NSString *)applicationDocumentDirectory {
    //    Returns the path to the application's documents directory.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

+ (NSArray *)applicationDocumentSubDirectories{
    NSFileManager *fileManager = [NSFileManager defaultManager];    
    NSString* docsDir = [self applicationDocumentDirectory];
    NSError *error = nil;
    NSArray *fileList  = [fileManager contentsOfDirectoryAtPath:docsDir error:&error];
    NSMutableArray *dirArray = [[NSMutableArray alloc] init];
    BOOL isDir = NO;
    for (NSString *file in fileList) {
        NSString *path = [docsDir stringByAppendingPathComponent:file];
        [fileManager fileExistsAtPath:path isDirectory:(&isDir)];
        if (isDir) {
            [dirArray addObject:file];
        }
        isDir = NO;
    }
//    DebugLog(@"All folders:%@",dirArray);
    return dirArray;
}

+ (NSString*)getPathInApp:(NSString*)relativeFilePath{
    NSString* filePath = [ADUltility getPathInDocuments:relativeFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:false]) {
        //        DebugLog(@"_bgImageName not in Documents!");
        filePath = [ADUltility getPathInBundle:relativeFilePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:false]) {
            //        DebugLog(@"_bgImageName not in Bundle!");
            filePath = nil;
        }
    }
    return filePath;
}
+ (NSString*)getPathInDocuments:(NSString*)relativeFilePath{
    return [[self applicationDocumentDirectory] stringByAppendingPathComponent:relativeFilePath];
}

+ (NSString*)getPathInBundle:(NSString*)relativeFilePath{
    NSArray* nameSplit = [relativeFilePath componentsSeparatedByString:@"/"];
    NSString* bgImageFullName = [nameSplit lastObject];
    NSString* dir = [relativeFilePath stringByDeletingLastPathComponent];
    NSArray* bgImageNameExt = [bgImageFullName componentsSeparatedByString:@"."];
    NSString* bgImageName = [bgImageNameExt objectAtIndex:0];
    NSString* bgImageType = [bgImageNameExt lastObject];
    
    NSString* bgImagePath = [[NSBundle mainBundle]pathForResource:bgImageName ofType:bgImageType inDirectory:dir];
    return bgImagePath;
}

#pragma mark- 图片处理
+ (void)deletePNGInDocument:(NSString*) filePathInDoc{
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];
    BOOL ok = [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
    if (!ok) {
        DebugLog(@"Error deleting file %@", path);    
    }
}

+ (void)saveUIImage:(UIImage*)uiImage ToPNGInDocument:(NSString*) filePathInDoc{
    NSString* document = [self applicationDocumentDirectory];
    NSString* path = [document stringByAppendingPathComponent:filePathInDoc];

    BOOL ok = [[NSFileManager defaultManager] createFileAtPath:path 
                                                      contents:nil attributes:nil];
    
    if (!ok) {
        DebugLog(@"Error creating file %@", path);
    } else {
        NSFileHandle* myFileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [myFileHandle writeData:UIImagePNGRepresentation(uiImage)];
        [myFileHandle closeFile];
        DebugLog(@"Saved to image:%@", path);            
    }    
}
+ (void)saveUIImage:(UIImage*)uiImage ToJPGInDocument:(NSString*) filePathInDoc{
    NSString* document = [self applicationDocumentDirectory];
    NSString* path = [document stringByAppendingPathComponent:filePathInDoc];
    
    BOOL ok = [[NSFileManager defaultManager] createFileAtPath:path 
                                                      contents:nil attributes:nil];
    
    if (!ok) {
        DebugLog(@"Error creating file %@", path);
    } else {
        NSFileHandle* myFileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [myFileHandle writeData:UIImageJPEGRepresentation(uiImage, 1.0)];
        [myFileHandle closeFile];
        DebugLog(@"Saved to image:%@", path);            
    }    
}
+ (UIImage*)loadUIImageFromPNGInDocument:(NSString*) filePathInDoc{
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc]; 
    NSFileHandle* myFileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    
    if(myFileHandle == nil){
        DebugLog(@"Error loading file %@", path);        
        return nil;
    }
    DebugLog(@"Load image:%@", path);
    return [UIImage imageWithData:[myFileHandle readDataToEndOfFile]];    
}


+(GLubyte*)loadTextureDataFromFileInDocument:(NSString*)filePathInDoc{
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];     
    
    return [self loadTextureDataFromFile:path];
}

//+ (void)reloadTexture:(GLuint)texture FromFile:(NSString*)filePath{
//    
//    GLubyte* data = [self loadTextureDataFromFile:filePath];
//    //make sure data width height align with UndoImageSize
//    glBindTexture(GL_TEXTURE_2D, texture);    
//    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA,  UndoImageSize, UndoImageSize, 0, GL_RGBA, GL_UNSIGNED_BYTE, data); 
//    glBindTexture(GL_TEXTURE_2D,0);     
//	if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
//	{
//		DebugLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
//	}       
//}

+(GLubyte*)loadTextureDataFromFile:(NSString*)filePath{
    UIImage* uiImage = [UIImage imageWithContentsOfFile:filePath];
    if(uiImage == NULL){
        return NULL;
    }
    return [self loadTextureDataFromUIImage:uiImage];
}


+(GLubyte*)loadTextureDataFromUIImage:(UIImage*)uiImage{    // Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
    size_t width = CGImageGetWidth(uiImage.CGImage);
    size_t height = CGImageGetHeight(uiImage.CGImage);
    
    size_t srcSize = MAX(width, height);
    size_t destSize = 1;
    while (srcSize > destSize) {
        destSize *= 2;
    }
    
    if(width!=destSize || height != destSize){
        uiImage = [uiImage resizeImage:CGSizeMake(destSize, destSize)];
    }
    
    // Make sure the image exists
    return [self loadTextureDataFromCGImage:uiImage.CGImage];
}

+(GLubyte*)loadTextureDataFromCGImage:(CGImageRef)image{
    // Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
    // you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
    
    // Make sure the image exists
    if (!image)
    {
        DebugLog(@"Failed to load CGImage");
        exit(1);
    }
    
    // Get the width and height of the image
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    
    // Allocate  memory needed for the bitmap context
    GLubyte	*data = (GLubyte *) calloc(width * height * 4, sizeof(GLubyte));
    // Use  the bitmatp creation function provided by the Core Graphics framework.
    CGContextRef context = CGBitmapContextCreate(data, width, height, 8, width * 4, CGImageGetColorSpace(image), kCGImageAlphaPremultipliedLast);
    
    //flip uiImage for opengl
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1, -1);
    
    // After you create the context, you can draw the  image to the context.
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), image);
    // You don't need the context at this point, so you need to release it to avoid memory leaks.
    CGContextRelease(context);
    // Use OpenGL ES to generate a name for the texture.
    return data;
}



+ (void)CGImageWriteToFile:(CGImageRef)image :(NSString *)path{
    CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:path];
    CGImageDestinationRef destination = CGImageDestinationCreateWithURL(url, kUTTypePNG, 1, NULL);
    CGImageDestinationAddImage(destination, image, nil);
    
    if (!CGImageDestinationFinalize(destination)) {
        DebugLog(@"Failed to write image to %@", path);
    }
    
    CFRelease(destination);
}
#pragma mark UIImage Tools

+ (UIImage*)snapshot:(UIView*)eaglview Context:(EAGLContext *)context InViewportSize:(CGSize)viewportSize ToOutputSize:(CGSize)outputSize{
	[EAGLContext setCurrentContext:context];//之前有丢失context的现象出现

//	GLint _backingWidth;GLint _backingHeight;    
//	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &_backingWidth);
//	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &_backingHeight);
//    
    //取Bindbuffer的对应texture的尺寸，读取texturebuffer的内容
    NSInteger width = viewportSize.width;NSInteger height = viewportSize.height;
    NSInteger x = 0, y = 0;
    NSInteger dataLength = width * height * 4;
    GLubyte *data = (GLubyte*)malloc(dataLength * sizeof(GLubyte));
    glViewport(0, 0, viewportSize.width, viewportSize.height);
    // Read pixel data from the framebuffer
    glPixelStorei(GL_PACK_ALIGNMENT, 4);

    glReadPixels(x, y, width, height, GL_RGBA, GL_UNSIGNED_BYTE, data);

    // Create a CGImage with the pixel data
    // If your OpenGL ES content is opaque, use kCGImageAlphaNoneSkipLast to ignore the alpha channel
    // otherwise, use kCGImageAlphaPremultipliedLast
    CGDataProviderRef ref = CGDataProviderCreateWithData(NULL, data, dataLength, NULL);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGImageRef iref = CGImageCreate(width, height, 8, 32, width * 4, colorspace, kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast,
                                    ref, NULL, true, kCGRenderingIntentDefault);
    
    // OpenGL ES measures data in PIXELS
    // Create a graphics context with the target size measured in POINTS
//    NSInteger widthInPoints, heightInPoints;
    if (NULL != UIGraphicsBeginImageContextWithOptions) {
        // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
        // Set the scale parameter to your OpenGL ES view's contentScaleFactor
        // so that you get a high-resolution snapshot when its value is greater than 1.0
        CGFloat scale = 1.0;
        if (eaglview) {
            scale = eaglview.contentScaleFactor;
        }

//        widthInPoints = width / scale;
//        heightInPoints = height / scale;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(outputSize.width, outputSize.height), NO, scale);
    }
    else {
        // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
//        widthInPoints = width;
//        heightInPoints = height;
        UIGraphicsBeginImageContext(CGSizeMake(outputSize.width, outputSize.height));
    }
    
    CGContextRef cgcontext = UIGraphicsGetCurrentContext();
    
    // UIKit coordinate system is upside down to GL/Quartz coordinate system
    // Flip the CGImage by rendering it to the flipped bitmap context
    // The size of the destination area is measured in POINTS
    CGContextSetBlendMode(cgcontext, kCGBlendModeCopy);
    CGContextDrawImage(cgcontext, CGRectMake(0.0, 0.0, outputSize.width, outputSize.height), iref);
    
    // Retrieve the UIImage from the current context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Clean up
    free(data);
    CFRelease(ref);
    CFRelease(colorspace);
    CGImageRelease(iref);
    
    return image;
}


+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    UIImage* newImage = [UIImage imageWithCGImage:masked];
    CGImageRelease(masked);
    CGImageRelease(mask);
    return newImage;
    
}
#pragma mark - Math
+ (GLKMatrix4)MatrixLerpFrom:(GLKMatrix4)fromMatrix to:(GLKMatrix4)toMatrix blend:(float)blend
{
    return GLKMatrix4Make(
                          fromMatrix.m00 * (1.0 - blend) + toMatrix.m00 * blend,
                          fromMatrix.m01 * (1.0 - blend) + toMatrix.m01 * blend,
                          fromMatrix.m02 * (1.0 - blend) + toMatrix.m02 * blend,
                          fromMatrix.m03 * (1.0 - blend) + toMatrix.m03 * blend,
                          fromMatrix.m10 * (1.0 - blend) + toMatrix.m10 * blend,
                          fromMatrix.m11 * (1.0 - blend) + toMatrix.m11 * blend,
                          fromMatrix.m12 * (1.0 - blend) + toMatrix.m12 * blend,
                          fromMatrix.m13 * (1.0 - blend) + toMatrix.m13 * blend,
                          fromMatrix.m20 * (1.0 - blend) + toMatrix.m20 * blend,
                          fromMatrix.m21 * (1.0 - blend) + toMatrix.m21 * blend,
                          fromMatrix.m22 * (1.0 - blend) + toMatrix.m22 * blend,
                          fromMatrix.m23 * (1.0 - blend) + toMatrix.m23 * blend,
                          fromMatrix.m30 * (1.0 - blend) + toMatrix.m30 * blend,
                          fromMatrix.m31 * (1.0 - blend) + toMatrix.m31 * blend,
                          fromMatrix.m32 * (1.0 - blend) + toMatrix.m32 * blend,
                          fromMatrix.m33 * (1.0 - blend) + toMatrix.m33 * blend);
}

#pragma mark - Convert GL image to UIImage`
+ (UIImage*)glToUIImage:(UIView*)view
{
//	[EAGLContext setCurrentContext:_context];//之前有丢失context的现象出现
    
    size_t width = view.bounds.size.width;
    size_t height = view.bounds.size.height;          
    
    //    DebugLog(@"width:%d height%d", width, height);
    
    NSInteger myDataLength = width * height * 4;
    
    // allocate array and read pixels into it.
    GLubyte *buffer = (GLubyte *) malloc(myDataLength);
    
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
    
    // gl renders "upside down" so swap top to bottom into new array.
    // there's gotta be a better way, but this works.
    //    GLubyte *buffer2 = (GLubyte *) malloc(myDataLength);
    //    for(int y = 0; y < height; y++)
    //    {
    //        for(int x = 0; x < width * 4; x++)
    //        {
    ////            buffer2[((height - 1) - y) * width * 4 + x] = buffer[y * 4 * width + x];
    //            buffer2[y * width * 4 + x] = buffer[y * 4 * width + x];            
    //        }
    //    }
    
    // make data provider with data.
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer, myDataLength, NULL);
    
    // prep the ingredients
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 * width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    // make the cgimage
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    // Clean up
    free(buffer);
    //    free(buffer2);    
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);
    
    // then make the uiimage from that
    UIImage *myImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return myImage;
}
#pragma mark Misc Tools

#pragma mark Memory Tools

//
//BOOL memoryInfo(vm_statistics_data_t *vmStats) {
//    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
//    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)vmStats, &infoCount);
//    
//    return kernReturn == KERN_SUCCESS;
//}
//
//void logMemoryInfo() {
//    vm_statistics_data_t vmStats;
//    
//    if (memoryInfo(&vmStats)) {
//        DebugLog(@"free: %u\nactive: %u\ninactive: %u\nwire: %u\nzero fill: %u\nreactivations: %u\npageins: %u\npageouts: %u\nfaults: %u\ncow_faults: %u\nlookups: %u\nhits: %u",
//              vmStats.free_count * vm_page_size,
//              vmStats.active_count * vm_page_size,
//              vmStats.inactive_count * vm_page_size,
//              vmStats.wire_count * vm_page_size,
//              vmStats.zero_fill_count * vm_page_size,
//              vmStats.reactivations * vm_page_size,
//              vmStats.pageins * vm_page_size,
//              vmStats.pageouts * vm_page_size,
//              vmStats.faults,
//              vmStats.cow_faults,
//              vmStats.lookups,
//              vmStats.hits
//              );
//    }
//}
@end
/*

*/