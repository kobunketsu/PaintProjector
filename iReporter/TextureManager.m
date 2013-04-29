//
//  TextureManager.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "TextureManager.h"

@implementation TextureManager
static TextureManager* sharedInstance = nil;

+(TextureManager*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TextureManager alloc]initialize];
    });
    return sharedInstance;
}
- (void)memoryWarning:(NSNotification*)note {
    [_textureCache removeAllObjects];
    [_textureUIImageCache removeAllObjects];
//    [_textureDataCache removeAllObjects];
}
- (id)initialize{
    if ([self init]!=NULL) {
        _textureCache = [[NSMutableDictionary alloc]init];
        _textureUIImageCache = [[NSMutableDictionary alloc]init];
//        _textureDataCache = [[NSMutableDictionary alloc]init];
        //在接受到内存警告的通知时clear掉本身
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWarning:)   name:UIApplicationDidReceiveMemoryWarningNotification object:nil];        
    }
    else {
        return NULL;
    }
   
    return self;    
}

- (void)deleteTexture:(GLuint)texture{
    glDeleteTextures(1, &texture);

    id deleteTexKey = 0;
    for (id key in _textureCache) {
        GLKTextureInfo* texInfo = [_textureCache objectForKey:key];
        if (texInfo.name == texture) {
            deleteTexKey = key;
            break;
        }
    }
    
    [_textureCache removeObjectForKey:deleteTexKey];    
    texture = 0;        
}
- (GLKTextureInfo *)loadTextureInfoFromImagePath:(NSString*)imagePath reload:(BOOL)reload{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    

    if(reload){
        if ([_textureCache objectForKey:imagePath] != NULL) {
            [_textureCache removeObjectForKey:imagePath];
        }
    }
    
    GLKTextureInfo* texInfo = [_textureCache objectForKey:imagePath];
    if (texInfo != NULL) {
        return texInfo;
    } 
    else {
        NSError * error;         
        texInfo = [GLKTextureLoader textureWithContentsOfFile:imagePath options:options error:&error];     
        if (texInfo == nil) {
            NSLog(@"Error loading texInfo: %@", [error localizedDescription]);
        }
        else {
            [_textureCache setObject:texInfo forKey:imagePath];
            NSLog(@"load texInfo: %d forKey %@", texInfo.name, imagePath);
        }
        return texInfo;
    }

}

- (GLKTextureInfo *)loadTextureInfoFromFileInDocument:(NSString*)filePathInDoc{
    NSString* path = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];            
    return [self loadTextureInfoFromImagePath:path reload:false];
}

- (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName reload:(BOOL)reload{
    NSString *path = [Ultility getPathInApp:imageName];
    if (path!=nil) {    
        return [self loadTextureInfoFromImagePath:path reload:reload];
    }
    else{
        return nil;
    }
}
- (GLKTextureInfo *)loadTextureInfoFromUIImage:(UIImage*)uiImage{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    
    GLKTextureInfo* texInfo = [_textureUIImageCache objectForKey:uiImage];
    if (texInfo != NULL) {
        return texInfo;
    } 
    else {
        NSError * error;         
        texInfo = [GLKTextureLoader textureWithCGImage:uiImage.CGImage options:options error:&error];     
        if (texInfo == nil) {
            NSLog(@"Error loading file: %@", [error localizedDescription]);
        }
        else {
            [_textureUIImageCache setObject:texInfo forKey:[uiImage copy]];
        }
        return texInfo;
    }    
}


- (GLKTextureInfo *)loadTextureInfoFromData:(NSData*)data{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft,
                              nil];
    GLKTextureInfo* texInfo;
//    GLKTextureInfo* texInfo = [_textureDataCache objectForKey:(id)data];
//
//    if (texInfo != NULL) {
//        NSLog(@"textureDataCache contain Key(NSData):%@", (id)data);
//        return texInfo;
//    }
//    else {
        NSError * error;
        texInfo = [GLKTextureLoader textureWithContentsOfData:data options:options error:&error];
        if (texInfo == nil) {
            NSLog(@"Error loading file: %@", [error localizedDescription]);
        }
//        else {
//            [_textureDataCache setObject:texInfo forKey:(id)data];
//            NSLog(@"textureDataCache set Key(NSData):%@ for Object(GLKTextureInfo):%@", (id)data, texInfo);
//        }
        return texInfo;
//    }
}
@end
