//
//  TextureManager.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-23.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "RETextureManager.h"
#import "REGLWrapper.h"

@implementation RETextureManager
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
    DebugLogFuncStart(@"initialize");
    [super initialize];
    if(!texMgr){
        texMgr = [[RETextureManager alloc]init];
    }
}

+ (void)destroy{
    DebugLogFuncStart(@"destroy");
    if (texMgr) {
        texMgr = nil;
    }
}

+ (RETextureManager*)current{
    return texMgr;
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
- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)memoryWarning:(NSNotification*)note {
    DebugLogFuncStart(@"memoryWarning");
    
    DebugLog(@"removeTextureCache");
    [_textureCache removeAllObjects];
    DebugLog(@"removeTextureUIImageCache");
    [_textureUIImageCache removeAllObjects];
    //    [_textureDataCache removeAllObjects];
}

+ (void)destroyTextures{
    DebugLogFuncStart(@"destroyTextures");
    for (GLKTextureInfo *texInfo in [texMgr.textureCache allValues]) {
        GLuint tex = texInfo.name;
        [[REGLWrapper current]deleteTexture:tex];
    }
    [texMgr.textureCache removeAllObjects];
    DebugLogSuccess(@"all textures deleted from cache and gl");
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
        [[REGLWrapper current]deleteTexture:texture];
        DebugLogSuccess(@"texture %@ deleted from cache and gl", deleteTexKey);
    }

}

+ (GLKTextureInfo *)textureInfoFromImagePath:(NSString*)imagePath reload:(BOOL)reload{
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
        if (!texInfo) {
            DebugLogError(@"Error loading texInfo: %@", [error localizedDescription]);
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

+ (GLKTextureInfo *)textureInfoFromFileInDocument:(NSString*)filePathInDoc reload:(BOOL)reload{
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:filePathInDoc];            
    return [self textureInfoFromImagePath:path reload:reload];
}

+ (GLKTextureInfo *)textureInfoFromImageName:(NSString*)imageName reload:(BOOL)reload{
    NSString *path = [ADUltility getPathInApp:imageName];
    if (path!=nil) {    
        return [self textureInfoFromImagePath:path reload:reload];
    }
    else{
        return nil;
    }
}

+ (GLKTextureInfo *)textureInfoFromCGImage:(CGImageRef)image{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft,
                              nil];

    NSError * error;
    GLKTextureInfo *texInfo = [GLKTextureLoader textureWithCGImage:image options:options error:&error];
    if (!texInfo) {
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

+ (GLKTextureInfo *)textureInfoFromUIImage:(UIImage*)uiImage{
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft, 
                              nil];    
    
    GLKTextureInfo* texInfo = [texMgr.textureCache objectForKey:[NSNumber numberWithInteger:uiImage.hash]];
    if (texInfo != NULL) {
        return texInfo;
    } 
    else {
        NSError * error;         
        texInfo = [GLKTextureLoader textureWithCGImage:uiImage.CGImage options:options error:&error];     
        if (!texInfo) {
            DebugLog(@"Error loading texInfo: %@", [error localizedDescription]);
        }
        else {
            [texMgr.textureCache setObject:texInfo forKey:[NSNumber numberWithInteger:uiImage.hash]];
            DebugLogSuccess(@"loaded texInfo: %d forKey %@", texInfo.name, [NSNumber numberWithInteger:uiImage.hash]);
        }
        return texInfo;
    }
}


+ (GLKTextureInfo *)textureInfoFromData:(NSData*)data{

    GLKTextureInfo* texInfo = [texMgr.textureCache objectForKey:[NSNumber numberWithInteger:data.hash]];
    if (texInfo != NULL) {
        return texInfo;
    }
    else {
        NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithBool:YES],
                                  GLKTextureLoaderOriginBottomLeft,
                                  nil];
        NSError * error;
        texInfo = [GLKTextureLoader textureWithContentsOfData:data options:options error:&error];
        if (!texInfo) {
            DebugLog(@"Error loading texInfo: %@", [error localizedDescription]);
        }
        else {
            [texMgr.textureCache setObject:texInfo forKey:[NSNumber numberWithInteger:data.hash]];
            DebugLogSuccess(@"loaded texInfo: %d forKey %@", texInfo.name, [NSNumber numberWithInteger:data.hash]);
        }
        return texInfo;
    }
    
    return texInfo;
}
@end
