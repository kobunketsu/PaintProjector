//
//  PaintSaveDoc.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADPaintDoc.h"
#import "ADPaintData.h"
#import "ADPaintDocManager.h"
#import "ADUltility.h"
#import "ADPaintLayer.h"

#define kTitleKey            @"Title"
#define kDataKey            @"Data"
#define kUserInputParamsKey @"UserInputParams"
#define kDataFile           @"data.plist"
#define kThumbImageFile     @"thumbImage.png"

@implementation ADPaintDoc

+ (NSString*)currentVersion{
    return DocVersion;
}
- (void)dealloc{
    DebugLogSystem(@"dealloc docPath %@", self.docPath);
}

- (id)initWithDocPath:(NSString *)docPath{
    DebugLogSystem(@"initWithDocPath %@", docPath);
    if ((self = [super init])) {
        _docPath = docPath;
        _infoPath = [[self.docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"inf"];
        _thumbImagePath = [[self.docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"png"];
        _defaultSize = CGSizeMake(DefaultScreenWidth, DefaultScreenHeight);
        [self openInfo];
    }
    return self;
}
- (ADCylinderProjectUserInputParams *)openInfo{
    if (!self.userInputParams) {
        NSString *infoPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.infoPath];
        NSData *codedData = [[NSData alloc] initWithContentsOfFile:infoPath];
        //解压磁盘上的paintData
        if (codedData != nil){
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
            self.title = [unarchiver decodeObjectForKey:kTitleKey];
            self.userInputParams = [unarchiver decodeObjectForKey:kUserInputParamsKey];//data should be released somewhere
            [unarchiver finishDecoding];
        }
        else{
            self.title = nil;
            self.userInputParams = [[ADCylinderProjectUserInputParams alloc]init];
        }
    }
    
    return self.userInputParams;
}


//创建数据目录
#pragma mark-
- (ADPaintData *)openData {
    if (!self.data) {
        NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
        NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
        //解压磁盘上的paintData
        if (codedData != nil){
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
            self.data = [unarchiver decodeObjectForKey:kDataKey];//data should be released somewhere
            [unarchiver finishDecoding];
        }
        //创建默认paintData
        else{
            [self newData];
        }
    }

    return self.data;
}

//释放Data
-(void)closeData{
    [self setData:nil];
    [self setReverseData:nil];
}

#pragma mark-
- (ADPaintData *)newData {
    self.data = [[ADPaintData alloc]init];
    self.data.version = [ADPaintDoc currentVersion];
    self.data.title = @"newData";
    ADPaintLayer* paintLayer = [ADPaintLayer createBlankLayerWithSize:self.defaultSize transparent:true];
    self.data.layers = [[NSMutableArray alloc]initWithObjects:paintLayer, nil];
    self.data.backgroundLayer = [[ADBackgroundLayer alloc]init];
    
    return self.data;
}
- (void)newSaveThumbImage{
    size_t width = self.defaultSize.width;
    size_t height = self.defaultSize.height;
    
    NSInteger myDataLength = width * height * 4;
    
    // allocate array and fill pixels into it.
    GLubyte *buffer = (GLubyte *) malloc(myDataLength);
    
    for(int y = 0; y < height; y++)
    {
        for(int x = 0; x < width; x++)
        {
            buffer[y * width * 4 + x * 4] = 255;
            buffer[y * width * 4 + x * 4 + 1] = 255;
            buffer[y * width * 4 + x * 4 + 2] = 255;
            buffer[y * width * 4 + x * 4 + 3] = 255;
        }
    }
    
    // make data provider with data.
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer, myDataLength, NULL);
    
    // prep the ingredients
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 * width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrderDefault;
    //    CGBitmapInfo bitmapInfo = kCGBitmapAlphaInfoMask;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    // make the cgimage
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    //save to disk
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    
    [self saveThumbImage:image];
    
    // Clean up
    free(buffer);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRelease(imageRef);
    
}
#pragma mark-
//将data.plist压缩到archiver，并将archiver保存到系统分配的文件夹中
- (void)saveInfo{
    DebugLogFuncStart(@"saveUserInputParams");
    NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.infoPath];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //save title
    [archiver encodeObject:self.title forKey:kTitleKey];
    if (self.userInputParams){
        [archiver encodeObject:self.userInputParams forKey:kUserInputParamsKey];
        [archiver finishEncoding];
        if ([data writeToFile:dataPath atomically:YES]) {
            DebugLogWriteSuccess(@"writeToFile %@ success!", dataPath);
        }
        else{
            DebugLogError(@"writeToFile %@ failed!", dataPath);
        }
    }
    else{
        DebugLogError(@"userInputParams nil");
        [archiver finishEncoding];
    }
}

- (void)saveData{
    DebugLogFuncStart(@"save");

    NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    //save data
    if (self.data){
        [archiver encodeObject:self.data forKey:kDataKey];
        [archiver finishEncoding];
        if ([data writeToFile:dataPath atomically:YES]) {
            DebugLogWriteSuccess(@"writeToFile %@ success!", dataPath);
            [ADUltility addBackupAttributeToItemAtPath:dataPath];
        }
        else{
            DebugLogError(@"writeToFile %@ failed!", dataPath);
        }
    }
    else{
        DebugLogError(@"data nil");
    }
    
//    [self saveUserInputParams];
}

- (void)saveThumbImage:(UIImage*)image{
    DebugLogFuncStart(@"saveThumbImage");
    NSData *thumbImageData = UIImagePNGRepresentation(image);
    NSString *thumbImagePath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.thumbImagePath];
    //    NSData *thumbImageData = UIImageJPEGRepresentation(image, 1);
    if (thumbImageData) {
        if([thumbImageData writeToFile:thumbImagePath atomically:YES]){
            DebugLogWriteSuccess(@"thumbImage saved to %@", thumbImagePath);
        }
        else{
            DebugLogError(@"thumbImage save to %@ failed!", thumbImagePath);
        }
    }
    else{
        DebugLogError(@"thumbImageData nil");
    }

}


#pragma mark-
- (void)delete {
    DebugLogFuncStart(@"delete");
    [self deleteInfo];
    
    [self deleteData];

    [self deleteThumbImage];
}
- (void)deleteInfo {
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.infoPath];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (!success) {
        DebugLogError(@"Error removing document path: %@", error.localizedDescription);
    }
}

- (void)deleteData {
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (!success) {
        DebugLogError(@"Error removing document path: %@", error.localizedDescription);
    }
}

- (void)deleteThumbImage {
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.thumbImagePath];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (!success) {
        DebugLogError(@"Error removing document path: %@", error.localizedDescription);
    }
}
#pragma mark-
- (id)cloneWithDocPath:(NSString *)docPath{
    ADPaintDoc *doc = [[ADPaintDoc alloc]initWithDocPath:docPath];
    doc.data = [self.data copy];
    doc.defaultSize = self.defaultSize;
    doc.userInputParams = [self.userInputParams copy];
    doc.title = self.title;
    return doc;
}
- (void)rename:(NSString*)name{
    
}
//从磁盘或者内存得到缩略图
- (UIImage *)thumbImage {
    //
    //    if (_thumbImage != nil) return _thumbImage;
    //
    //    NSString *thumbImagePath = [self.docPath stringByAppendingPathComponent:kThumbImageFile];
    //    return [UIImage imageWithContentsOfFile:thumbImagePath];
    //
    return nil;
}
#pragma mark- 导出
- (BOOL)createDataPath {
    
    if (self.docPath == nil) {
        //        self.docPath = [PaintDocManager nextPaintDocPath];
    }
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:self.docPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        DebugLogError(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
    
}
- (NSString *)getExportFileName {
    NSString *fileName = self.data.title;
    NSString *zippedName = [fileName stringByAppendingString:@".psf"];
    return zippedName;
}


- (NSData *)exportToNSData {
//    NSError *error;
//    NSURL *url = [NSURL fileURLWithPath:self.docPath];
//    NSFileWrapper *dirWrapper = [[NSFileWrapper alloc] initWithURL:url options:0 error:&error];
//    if (dirWrapper == nil) {
//        DebugLog(@"Error creating directory wrapper: %@", error.localizedDescription);
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
        DebugLogError(@"Error creating dir wrapper from unzipped data");
        return FALSE;
    }
    
    // Calculate desired name
    NSString *dirPath = @"";//[[PaintDocManager sharedInstance] nextPaintDocPath];
    NSURL *dirUrl = [NSURL fileURLWithPath:dirPath];
    NSError *error;
    BOOL success = [dirWrapper writeToURL:dirUrl options:NSFileWrapperWritingAtomic originalContentsURL:nil error:&error];
    if (!success) {
        DebugLogError(@"Error importing file: %@", error.localizedDescription);
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
