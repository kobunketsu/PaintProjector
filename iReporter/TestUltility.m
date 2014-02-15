//
//  TestUltility.m
//  iReporter
//
//  Created by 文杰 胡 on 13-3-2.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "TestUltility.h"

@implementation TestUltility
- (NSString *)applicationDocumentDirectory {
    //    Returns the path to the application's documents directory.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

-(GLubyte*)loadTextureDataFromFileInDocument:(NSString*)filePathInDoc{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    NSError * error; 
    NSString* path = [[self applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];     
    
    return [self loadTextureDataFromFile:path];
}


-(GLubyte*)loadTextureDataFromFile:(NSString*)filePath{
    
    //CGImage create with UIImage cause zombie object!
    CFDataRef cfData = (__bridge CFDataRef)[NSData dataWithContentsOfFile:filePath];
    if(cfData==NULL){
        NSLog(@"File:%@ not exists!", filePath);
        return nil;
    }
    CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData(cfData);
    CGImageRef image;
    NSString* ext = [filePath pathExtension];
    
    if ([ext isEqualToString:@"jpg"]) {
        image = CGImageCreateWithJPEGDataProvider(dataProvider, NULL, NO, kCGRenderingIntentDefault);
    }
    else if ([ext isEqualToString:@"png"]) {
        image = CGImageCreateWithPNGDataProvider(dataProvider, NULL, NO, kCGRenderingIntentDefault);
    }
    
    CGDataProviderRelease(dataProvider);
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
    
    // 耗时的操作  
    // After you create the context, you can draw the  image to the context.
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), image);
    // You don't need the context at this point, so you need to release it to avoid memory leaks.
    CGContextRelease(context); 
    CGImageRelease(image);
    
    // Use OpenGL ES to generate a name for the texture.
    return data;        
}
@end
