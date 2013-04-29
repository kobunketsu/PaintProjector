//
//  PaintSaveDocManager.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintDocManager.h"
#import "PaintDoc.h"
#import "Ultility.h"

@implementation PaintDocManager
static PaintDocManager* sharedInstance = nil;

+(PaintDocManager*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PaintDocManager alloc]initialize];
    });
    return sharedInstance;
}

- (id)initialize{
    if ([self init]!=NULL) {

        //在接受到内存警告的通知时clear掉本身
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memoryWarning:)   name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    else {
        return NULL;
    }
    
    return self;
}

- (NSMutableArray *)loadPaintDocsInDirectory:(NSString*)directory{
    //从App/Documents/下读取文件
    
}

- (NSMutableArray *)loadPaintDocsInDirectoryIndex:(int)dirIndex{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    

    if(dirIndex < 0 || dirIndex > [Ultility applicationDocumentSubDirectories].count - 1){
        NSLog(@"subDir at index %d not exist!", dirIndex);
        return nil;
    }

    NSArray* subDirs = [Ultility applicationDocumentSubDirectories];
    if (subDirs == nil || subDirs.count == 0) {
        return nil;
    }
    if (dirIndex > (int)subDirs.count - 1) {
        return nil;
    }
    
    NSMutableArray *paintDocs = [[NSMutableArray alloc]init];    
    NSString* dir = [subDirs objectAtIndex:dirIndex];        
    NSString* path = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:dir];
    NSDirectoryEnumerator *fileEnum = [fileManager enumeratorAtPath:path];
    NSString *file;
    while (file = [fileEnum nextObject]) {
        if ([[file pathExtension] isEqualToString: @"psf"]) {
            NSString* docPath = [dir stringByAppendingPathComponent:file];
            PaintDoc* paintDoc =[[PaintDoc alloc]initWithDocPath:docPath];
            [paintDocs addObject:paintDoc];
        }
    }

    return paintDocs;
}

- (int)directoryCount{
    return [Ultility applicationDocumentSubDirectories].count;
}

- (NSString*) directoryPath:(int)index{
    int count = [Ultility applicationDocumentSubDirectories].count;
    if(count == 0 || index > count - 1){
        NSString* newDir = [NSString stringWithFormat:@"Folder_%d", count];
        if([self createDirectory:newDir]){
            return newDir;
        }
        else{
            return nil;
        }
    }
    else{
        return [[Ultility applicationDocumentSubDirectories] objectAtIndex:index];
    }

}

- (PaintDoc*)createPaintDocInDirectory:(NSString*)dirName{
    NSString* docPath = [self nextPaintDocPathInDirectory:dirName];    //得到新的路径
    PaintDoc* paintDoc =[[PaintDoc alloc]initWithDocPath:docPath];
    return paintDoc;
}

- (NSString *)nextPaintDocPathInDirectory:(NSString*)dirName {
    
    // Get private docs dir
    NSString *docPath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:dirName];
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:docPath error:&error];
    if (files == nil) {
        NSLog(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    // Search for an available name
    int maxNumber = 0;
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"psf" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fileName = [file stringByDeletingPathExtension];
            maxNumber = MAX(maxNumber, fileName.intValue);
        }
    }
    
    // Get available name
    NSString *availableName = [NSString stringWithFormat:@"%d.psf", maxNumber+1];
    return [dirName stringByAppendingPathComponent:availableName];
    
}

//创建数据目录
- (BOOL)createDirectory:(NSString*)dirName {
    NSString* rootPath = [Ultility applicationDocumentDirectory];
    NSString* dirPath = [rootPath stringByAppendingPathComponent:dirName];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
    
}
@end
