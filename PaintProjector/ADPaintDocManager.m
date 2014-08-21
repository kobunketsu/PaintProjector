
//  PaintSaveDocManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADPaintDocManager.h"
#import "ADPaintDoc.h"
#import "ADUltility.h"

@implementation ADPaintDocManager
static ADPaintDocManager* sharedInstance = nil;

+(ADPaintDocManager*)sharedInstance{
    if(sharedInstance != nil){
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ADPaintDocManager alloc]initialize];
    });
    return sharedInstance;
}
- (void)memoryWarning:(NSNotification*)note {
    DebugLogWarn(@"memoryWarning");
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

- (void)dealloc{
    DebugLogSystem(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableArray *)loadPaintDocsInDirectory:(NSString*)directory{
    //从App/Documents/下读取文件
    return nil;
}

- (NSMutableArray *)loadPaintDocsInDirectoryIndex:(int)dirIndex{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    

    if(dirIndex < 0 || dirIndex > [ADUltility applicationDocumentSubDirectories].count - 1){
        DebugLogError(@"subDir at index %d not exist!", dirIndex);
        return nil;
    }

    NSArray* subDirs = [ADUltility applicationDocumentSubDirectories];
    if (subDirs == nil || subDirs.count == 0) {
        return nil;
    }
    if (dirIndex > (int)subDirs.count - 1) {
        return nil;
    }
    
    NSMutableArray *paintDocs = [[NSMutableArray alloc]init];    
    NSString* dir = [subDirs objectAtIndex:dirIndex];        
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:dir];
    NSDirectoryEnumerator *fileEnum = [fileManager enumeratorAtPath:path];
    NSString *file;
    while (file = [fileEnum nextObject]) {
        if ([[file pathExtension] isEqualToString: @"psf"]) {
            NSString* docPath = [dir stringByAppendingPathComponent:file];
            //获得文件属性
//            NSError *error = nil;
//            NSString *fullDocPath = [[ADUltility applicationDocumentDirectory]stringByAppendingPathComponent:docPath];
//            NSDictionary *dic = [[NSFileManager defaultManager]attributesOfItemAtPath:fullDocPath error:&error];
//            NSDate *date = [dic fileCreationDate];
//            DebugLog(@"paintDoc date %@", date);
            
            ADPaintDoc* paintDoc =[[ADPaintDoc alloc]initWithDocPath:docPath];
            [paintDocs addObject:paintDoc];
        }
    }
    
    //对paintDocs按照时间进行排序
//    NSArray *sortedPaintDocs = [paintDocs sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id obj1, id obj2) {
//        NSError *error = nil;
//        PaintDoc *doc1 = (PaintDoc *)obj1;
//        NSString *path = [[Ultility applicationDocumentDirectory]stringByAppendingPathComponent:doc1.docPath];
//        NSDictionary *dic = [[NSFileManager defaultManager]attributesOfItemAtPath:path error:&error];
//        NSDate *date1 = [dic fileCreationDate];
//        
//        PaintDoc *doc2 = (PaintDoc *)obj2;
//        path = [[Ultility applicationDocumentDirectory]stringByAppendingPathComponent:doc2.docPath];
//        dic = [[NSFileManager defaultManager]attributesOfItemAtPath:path error:&error];
//        NSDate *date2 = [dic fileCreationDate];
//        
//        return [date1 compare:date2];
//    }];

    NSArray *sortedPaintDocs = [paintDocs sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id obj1, id obj2) {
        ADPaintDoc *doc1 = (ADPaintDoc *)obj1;
        ADPaintDoc *doc2 = (ADPaintDoc *)obj2;
        
        return [doc1.docPath compare:doc2.docPath];
    }];
    
    return [NSMutableArray arrayWithArray:sortedPaintDocs];
}

- (int)directoryCount{
    return [ADUltility applicationDocumentSubDirectories].count;
}

- (NSString*) directoryPath:(int)index{
    int count = [ADUltility applicationDocumentSubDirectories].count;
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
        return [[ADUltility applicationDocumentSubDirectories] objectAtIndex:index];
    }

}

- (ADPaintDoc*)createPaintDocInDirectory:(NSString*)dirName{
    NSString* docPath = [self nextPaintDocPathInDirectory:dirName];    //得到新的路径
    ADPaintDoc* paintDoc =[[ADPaintDoc alloc]initWithDocPath:docPath];
    //创建数据
    [paintDoc newData];

    //保存到磁盘
    [paintDoc save];
    
    //创建图标
    [paintDoc newAndSaveThumbImage];
    
    return paintDoc;
}

- (NSString *)nextPaintDocPathInDirectory:(NSString*)dirName {
    
    // Get private docs dir
    NSString *docPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:dirName];
    
    // Get contents of documents directory
    NSError *error;
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:docPath error:&error];
    if (files == nil) {
        DebugLogError(@"Error reading contents of documents directory: %@", [error localizedDescription]);
        return nil;
    }
    
    // Search for an available name
    int maxNumber = 0;
    for (NSString *file in files) {
        if ([file.pathExtension compare:@"psf" options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            NSString *fileName = [file stringByDeletingPathExtension];
            maxNumber = MAX(maxNumber, fileName.intValue);
            if (maxNumber > 1000) {
                maxNumber -= 1000;
            }

        }
    }
    
    // Get available name
    //图片命名规则100x的形式，首字母以1开头, 0留给系统教程图片使用(保证教程的图片可以始终排在最前)
    NSString *availableName = [NSString stringWithFormat:@"1%03d.psf", maxNumber+1];
    return [dirName stringByAppendingPathComponent:availableName];
}

- (void)deletePaintDoc:(ADPaintDoc*)paintDoc{
    [paintDoc delete];
}

- (ADPaintDoc*)clonePaintDoc:(ADPaintDoc*)paintDoc{
    NSString *dirPath = [paintDoc.docPath stringByDeletingLastPathComponent];
    NSString* docPath = [self nextPaintDocPathInDirectory:dirPath];
    NSString* docThumbPath = [[docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"png"];

    //TODO:如果已经有xx_copy文件存在，会报错
//    NSString* docPath = [[paintDoc.docPath stringByDeletingPathExtension]stringByAppendingString:@"_copy.psf"];    //得到新的路径
//    NSString* docThumbPath = [[paintDoc.thumbImagePath stringByDeletingPathExtension]stringByAppendingString:@"_copy.png"];    //得到新的路径
    
    //TODO:从磁盘拷贝文件
    NSString* srcFullPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:paintDoc.docPath];
    NSString* copyFullPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:docPath];
    
    NSError *error;
    if (![[NSFileManager defaultManager]copyItemAtPath:srcFullPath toPath:copyFullPath error:&error]) {
        DebugLogError(@"Error clonePaintDoc: %@", [error localizedDescription]);
        return nil;
    }
    
    NSString* srcThumbFullPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:paintDoc.thumbImagePath];
    NSString* copyThumbFullPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:docThumbPath];

    if (![[NSFileManager defaultManager]copyItemAtPath:srcThumbFullPath toPath:copyThumbFullPath error:&error]) {
        DebugLogError(@"Error clonePaintDoc Thumb: %@", [error localizedDescription]);
        return nil;
    }
    
    ADPaintDoc* clonePaintDoc = [[ADPaintDoc alloc]initWithDocPath:docPath];
    return clonePaintDoc;
}

//创建数据目录
- (BOOL)createDirectory:(NSString*)dirName {
    NSString* rootPath = [ADUltility applicationDocumentDirectory];
    NSString* dirPath = [rootPath stringByAppendingPathComponent:dirName];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        DebugLogError(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
    
}
@end
