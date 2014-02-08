//
//  TextureManager.m
//  iReporter
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "TextureManager.h"

@implementation TextureManager
//static TextureManager* sharedInstance = nil;
//
//+(TextureManager*)sharedInstance{
//    if(sharedInstance != nil){
//        return sharedInstance;
//    }
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[TextureManager alloc]initialize];
//    });
//    return sharedInstance;
//}

+ (void)initialize{
    [super initialize];
    if(!texMgr){
        texMgr = [[TextureManager alloc]init];
    }
}

+ (void)destroy{
    if (texMgr) {
        texMgr = nil;
    }
}

- (id)init{
    if ([super init]!=NULL) {
        _textureCache = [[NSMutableDictionary alloc]init];
        _textureUIImageCache = [[NSMutableDictionary alloc]init];
        //在接受到内存警告的通知时clear掉本身
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWarning:)   name:UIApplicationDidReceiveMemoryWarningNotification object:nil];        
    }
    else {
        return NULL;
    }
   
    return self;    
}

-(void)memoryWarning:(NSNotification*)note {
    DebugLog(@"removeTextureCache");
    [_textureCache removeAllObjects];
    DebugLog(@"removeTextureUIImageCache");
    [_textureUIImageCache removeAllObjects];
    //    [_textureDataCache removeAllObjects];
}

+ (void)destroyTextures{
    DebugLog(@"[ destroyTextures ]");
    for (GLKTextureInfo *texInfo in [texMgr.textureCache allValues]) {
        GLuint tex = texInfo.name;
        glDeleteTextures(1, &tex);
    }
    [texMgr.textureCache removeAllObjects];
}

+ (void)deleteTexture:(GLuint)texture{
    id deleteTexKey = 0;
    for (id key in texMgr.textureCache) {
        GLKTextureInfo* texInfo = [texMgr.textureCache objectForKey:key];
        if (texInfo.name == texture) {
            deleteTexKey = key;
            break;
        }
    }
    
    if (deleteTexKey != 0) {
        [texMgr.textureCache removeObjectForKey:deleteTexKey];
        glDeleteTextures(1, &texture);
        texture = 0;
    }

}

+ (GLKTextureInfo *)loadTextureInfoFromImagePath:(NSString*)imagePath reload:(BOOL)reload{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    

    if(reload){
        if ([texMgr.textureCache objectForKey:imagePath] != NULL) {
            [texMgr.textureCache removeObjectForKey:imagePath];
        }
    }
    
    GLKTextureInfo* texInfo = [texMgr.textureCache objectForKey:imagePath];
    if (texInfo != NULL) {
        return texInfo;
    } 
    else {
        NSError * error;         
        texInfo = [GLKTextureLoader textureWithContentsOfFile:imagePath options:options error:&error];     
        if (texInfo == nil) {
            DebugLog(@"Error loading texInfo: %@", [error localizedDescription]);
        }
        else {
            [texMgr.textureCache setObject:texInfo forKey:imagePath];
            DebugLog(@"load texInfo: %d forKey %@", texInfo.name, imagePath);
        }
        return texInfo;
    }

//    NSError * error;
//    GLKTextureInfo* texInfo = [GLKTextureLoader textureWithContentsOfFile:imagePath options:options error:&error];
//    if (texInfo == nil) {
//        DebugLog(@"Error loading file: %@", [error localizedDescription]);
//    }
//    return texInfo;
}

+ (GLKTextureInfo *)loadTextureInfoFromFileInDocument:(NSString*)filePathInDoc reload:(BOOL)reload{
    NSString* path = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];            
    return [self loadTextureInfoFromImagePath:path reload:reload];
}

+ (GLKTextureInfo *)loadTextureInfoFromImageName:(NSString*)imageName reload:(BOOL)reload{
    NSString *path = [Ultility getPathInApp:imageName];
    if (path!=nil) {    
        return [self loadTextureInfoFromImagePath:path reload:reload];
    }
    else{
        return nil;
    }
}

+ (GLKTextureInfo *)loadTextureInfoFromCGImage:(CGImageRef)image{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft,
                              nil];

    NSError * error;
    GLKTextureInfo *texInfo = [GLKTextureLoader textureWithCGImage:image options:options error:&error];
    if (texInfo == nil) {
        DebugLog(@"Error loading file: %@", [error localizedDescription]);
        return NULL;
    }
    
    return texInfo;
    
    
//    NSError * error;
//    GLKTextureInfo* texInfo = [GLKTextureLoader textureWithCGImage:image options:options error:&error];
//    if (texInfo == nil) {
//        DebugLog(@"Error loading file: %@", [error localizedDescription]);
//    }
//    return texInfo;
}

+ (GLKTextureInfo *)loadTextureInfoFromUIImage:(UIImage*)uiImage{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    
    GLKTextureInfo* texInfo = [texMgr.textureUIImageCache objectForKey:uiImage];
    if (texInfo != NULL) {
        return texInfo;
    } 
    else {
        NSError * error;         
        texInfo = [GLKTextureLoader textureWithCGImage:uiImage.CGImage options:options error:&error];     
        if (texInfo == nil) {
            DebugLog(@"Error loading file: %@", [error localizedDescription]);
        }
        else {
            [texMgr.textureUIImageCache setObject:texInfo forKey:[uiImage copy]];
        }
        return texInfo;
    }
//    NSError * error;
//    GLKTextureInfo* texInfo = [GLKTextureLoader textureWithCGImage:uiImage.CGImage options:options error:&error];
//    if (texInfo == nil) {
//        DebugLog(@"Error loading file: %@", [error localizedDescription]);
//    }
//    return texInfo;
}


+ (GLKTextureInfo *)loadTextureInfoFromData:(NSData*)data{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft,
                              nil];
    GLKTextureInfo* texInfo;

    NSError * error;
    texInfo = [GLKTextureLoader textureWithContentsOfData:data options:options error:&error];
    if (texInfo == nil) {
        DebugLog(@"Error loading file: %@", [error localizedDescription]);
    }
    
    return texInfo;
}
@end
