//
//  Ultiliy.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-21.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Ultiliy.h"

@implementation Ultiliy
+ (NSString *)applicationDocumentDirectory {
    //    Returns the path to the application's documents directory.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}
+ (void)deletePNGInDocument:(NSString*) filePathInDoc{
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];
    BOOL ok = [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
    if (!ok) {
        NSLog(@"Error deleting file %@", path);    
    }
}
+ (void)saveUIImage:(UIImage*)uiImage ToPNGInDocument:(NSString*) filePathInDoc{
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];

    BOOL ok = [[NSFileManager defaultManager] createFileAtPath:path 
                                                      contents:nil attributes:nil];
    
    if (!ok) {
        NSLog(@"Error creating file %@", path);
    } else {
        NSFileHandle* myFileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [myFileHandle writeData:UIImagePNGRepresentation(uiImage)];
        [myFileHandle closeFile];
        NSLog(@"Saved to image:%@", path);            
    }    
}
+ (UIImage*)loadUIImageFromPNGInDocument:(NSString*) filePathInDoc{
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc]; 
    NSFileHandle* myFileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    
    if(myFileHandle == nil){
        NSLog(@"Error loading file %@", path);        
        return nil;
    }
    NSLog(@"Load image:%@", path);
    return [UIImage imageWithData:[myFileHandle readDataToEndOfFile]];    
}

+ (GLKTextureInfo *)loadTextureInfoFromFileInDocument:(NSString*)filePathInDoc{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error; 
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];        
    GLKTextureInfo * texInfo = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];     
    if (texInfo == nil) {
        NSLog(@"Error loading file: %@", [error localizedDescription]);
    }
    return texInfo;
}



+ (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error; 
    NSString *path = [[NSBundle mainBundle] pathForResource:[imageName stringByDeletingPathExtension] ofType:@"png"];
    GLKTextureInfo * texInfo = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];     
    if (texInfo == nil) {
        NSLog(@"Error loading file: %@", [error localizedDescription]);
    }
    return texInfo;
}
+ (GLKTextureInfo *)loadTextureInfoFromCGImageRef:(CGImageRef)cgImage{
    //use CGImage directly casue crash, try to use png file to transfer CGImage-->UIImage-->CGImage
    UIImage* image = [UIImage imageWithData:UIImagePNGRepresentation([UIImage imageWithCGImage:cgImage])];
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error; 
    GLKTextureInfo * texInfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:options error:&error];     
    if (texInfo == nil) {
        NSLog(@"Error loading file: %@", [error localizedDescription]);
    }
    return texInfo;
    
}

+(GLubyte*)loadTextureDataFromFileInDocument:(NSString*)filePathInDoc{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error; 
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];     
    
    return [self loadTextureDataFromFile:path];
}

+(GLubyte*)loadTextureDataFromFile:(NSString*)filePath{
    CGImageRef image = [UIImage imageWithContentsOfFile:filePath].CGImage;
    // Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
    // you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
    
    // Make sure the image exists
    if (!image) 
    {
        NSLog(@"Failed to load image %@", filePath);
        exit(1);
    }  

    // Get the width and height of the image
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);


    // Allocate  memory needed for the bitmap context
    GLubyte	*data = (GLubyte *) calloc(width * height * 4, sizeof(GLubyte));
    // Use  the bitmatp creation function provided by the Core Graphics framework. 
    CGContextRef context = CGBitmapContextCreate(data, width, height, 8, width * 4, CGImageGetColorSpace(image), kCGImageAlphaPremultipliedLast);
    
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // After you create the context, you can draw the  image to the context.
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), image);
    // You don't need the context at this point, so you need to release it to avoid memory leaks.
    CGContextRelease(context);
    // Use OpenGL ES to generate a name for the texture.
    return data;        
}

+(GLubyte*)loadTextureDataFromImageNamed:(NSString*)imageName{
    CGImageRef image = [UIImage imageNamed:imageName].CGImage;
    // Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
    // you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
    
    // Make sure the image exists
    if (!image) 
    {
        NSLog(@"Failed to load image %@", imageName);
        exit(1);
    }  
    
    // Get the width and height of the image
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    
    // Allocate  memory needed for the bitmap context
    GLubyte	*data = (GLubyte *) calloc(width * height * 4, sizeof(GLubyte));
    // Use  the bitmatp creation function provided by the Core Graphics framework. 
    CGContextRef context = CGBitmapContextCreate(data, width, height, 8, width * 4, CGImageGetColorSpace(image), kCGImageAlphaPremultipliedLast);
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
        NSLog(@"Failed to write image to %@", path);
    }
    
    CFRelease(destination);
}

@end
/*

*/