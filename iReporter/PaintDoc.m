//
//  PaintSaveDoc.m
//  iReporter
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintDoc.h"
#import "PaintData.h"
#import "PaintDocManager.h"
#import "Ultility.h"

#define kDataKey        @"Data"
#define kDataFile       @"data.plist"
#define kThumbImageFile @"thumbImage.png"

@implementation PaintDoc
@synthesize data = _data;
@synthesize thumbImagePath = _thumbImagePath;
@synthesize thumbImage = _thumbImage;
@synthesize docPath = _docPath;

- (id)init {
    if ((self = [super init])) {
    }
    return self;
}

- (id)initWithDocPath:(NSString *)docPath{
    if ((self = [super init])) {
//        _data = [[PaintData alloc]init];        
        _docPath = [docPath copy];
        _thumbImagePath = [[_docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"png"];

    }
    return self;
}

//创建数据目录
- (BOOL)createDataPath {
    
    if (_docPath == nil) {
//        self.docPath = [PaintDocManager nextPaintDocPath];
    }
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:_docPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
    
}

//unarchiver 磁盘文件得到data
- (PaintData *)loadData {
    
    if (_data != nil) return _data;
    NSString *dataPath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:_docPath];
    NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
    if (codedData == nil) return nil;
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    _data = [unarchiver decodeObjectForKey:kDataKey];
    [unarchiver finishDecoding];
    codedData = nil;//测试
    
    return _data;
}
//将data.plist压缩到archiver，并将archiver保存到系统分配的文件夹中
- (void)saveData {
    
    if (_data == nil) return;
    
    NSString *dataPath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:_docPath];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_data forKey:kDataKey];
    [archiver finishEncoding];
    if ([data writeToFile:dataPath atomically:YES]) {
        NSLog(@"PaintDoc saved to %@", dataPath);
    }
    else{
        NSLog(@"PaintDoc save to %@ failed!", dataPath);
    }

    
}
//从磁盘或者内存得到缩略图
- (UIImage *)thumbImage {
//    
//    if (_thumbImage != nil) return _thumbImage;
//    
//    NSString *thumbImagePath = [_docPath stringByAppendingPathComponent:kThumbImageFile];
//    return [UIImage imageWithContentsOfFile:thumbImagePath];
//
    return nil;
}

- (void)saveThumbImage:(UIImage*)image{
    
    NSString *thumbImagePath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:
                                [[_docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"png"]];
    NSData *thumbImageData = UIImagePNGRepresentation(image);
    [thumbImageData writeToFile:thumbImagePath atomically:YES];
}

- (void)deleteDoc {
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:_docPath error:&error];
    if (!success) {
        NSLog(@"Error removing document path: %@", error.localizedDescription);
    }
    
}

#pragma mark- 导出
- (NSString *)getExportFileName {
    NSString *fileName = _data.title;
    NSString *zippedName = [fileName stringByAppendingString:@".psf"];
    return zippedName;
}


- (NSData *)exportToNSData {
//    NSError *error;
//    NSURL *url = [NSURL fileURLWithPath:_docPath];
//    NSFileWrapper *dirWrapper = [[NSFileWrapper alloc] initWithURL:url options:0 error:&error];
//    if (dirWrapper == nil) {
//        NSLog(@"Error creating directory wrapper: %@", error.localizedDescription);
//        return nil;
//    }
//    
//    NSData *dirData = [dirWrapper serializedRepresentation];
////    NSData *gzData = [dirData gzipDeflate];
////    return gzData;
    return nil;
}

- (BOOL)exportToDiskWithForce:(BOOL)force {
    
    [self createDataPath];
    
    // Figure out destination name (in public docs dir)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *zippedName = [self getExportFileName];
    NSString *zippedPath = [documentsDirectory stringByAppendingPathComponent:zippedName];
    
    // Check if file already exists (unless we force the write)
    if (!force && [[NSFileManager defaultManager] fileExistsAtPath:zippedPath]) {
        return FALSE;
    }
    
    // Export to data buffer
    NSData *gzData = [self exportToNSData];
    if (gzData == nil) return FALSE;
    
    // Write to disk
    [gzData writeToFile:zippedPath atomically:YES];
    return TRUE;
    
}

#pragma mark- 导入
- (BOOL)importData:(NSData *)zippedData {
    
    // Read data into a dir Wrapper
    NSData *unzippedData = nil;
//    NSData *unzippedData = [zippedData gzipInflate];
    NSFileWrapper *dirWrapper = [[NSFileWrapper alloc] initWithSerializedRepresentation:unzippedData];
    if (dirWrapper == nil) {
        NSLog(@"Error creating dir wrapper from unzipped data");
        return FALSE;
    }
    
    // Calculate desired name
    NSString *dirPath = @"";//[[PaintDocManager sharedInstance] nextPaintDocPath];
    NSURL *dirUrl = [NSURL fileURLWithPath:dirPath];
    NSError *error;
    BOOL success = [dirWrapper writeToURL:dirUrl options:NSFileWrapperWritingAtomic originalContentsURL:nil error:&error];
    if (!success) {
        NSLog(@"Error importing file: %@", error.localizedDescription);
        return FALSE;
    }
    
    // Success!
    self.docPath = dirPath;
    return TRUE;
    
}

- (BOOL)importFromPath:(NSString *)importPath {
    
    // Read data into a dir Wrapper
    NSData *zippedData = [NSData dataWithContentsOfFile:importPath];
    return [self importData:zippedData];
    
}
@end
