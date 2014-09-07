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

#define kDataKey            @"Data"
#define kUserInputParamsKey @"UserInputParams"
#define kDataFile           @"data.plist"
#define kThumbImageFile     @"thumbImage.png"

@implementation ADPaintDoc
+ (NSString*)currentVersion{
    return DocVersion;
}
- (id)init {
    if ((self = [super init])) {
        //TODO: define defaultSize
        _defaultSize = CGSizeMake(DefaultScreenWidth, DefaultScreenHeight);
    }
    return self;
}

- (id)initWithDocPath:(NSString *)docPath{
    DebugLogSystem(@"initWithDocPath %@", docPath);
    if ((self = [super init])) {
//        _data = [[PaintData alloc]init];
        _docPath = docPath;
        _thumbImagePath = [[self.docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"png"];
        _defaultSize = CGSizeMake(DefaultScreenWidth, DefaultScreenHeight);
    }
    return self;
}

- (void)dealloc{
    DebugLogSystem(@"dealloc docPath %@", self.docPath);
}
//创建数据目录
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

- (void)newAndSaveThumbImage{
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
    NSData *data = UIImagePNGRepresentation(image);
    NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.thumbImagePath];
    [data writeToFile:dataPath atomically:YES];
    
    // Clean up
    free(buffer);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRelease(imageRef);
    
}

- (ADPaintData *)newData {
    self.data = [[ADPaintData alloc]init];
    self.data.version = [ADPaintDoc currentVersion];
    self.data.title = @"newData";
    ADPaintLayer* paintLayer = [ADPaintLayer createBlankLayerWithSize:self.defaultSize transparent:true];
    self.data.layers = [[NSMutableArray alloc]initWithObjects:paintLayer, nil];
    self.data.backgroundLayer = [[ADBackgroundLayer alloc]init];

    return self.data;
}

- (ADPaintData *)open {
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

- (ADCylinderProjectUserInputParams *)openUserInputParams{
    if (!self.userInputParams) {
        NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
        dataPath = [dataPath stringByReplacingOccurrencesOfString:@"psf" withString:@"inf"];
        NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
        //解压磁盘上的paintData
        if (codedData != nil){
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
            self.userInputParams = [unarchiver decodeObjectForKey:kUserInputParamsKey];//data should be released somewhere
            [unarchiver finishDecoding];
        }
        else{
            self.userInputParams = [[ADCylinderProjectUserInputParams alloc]init];
        }
    }
    
    return self.userInputParams;
}

- (id)cloneWithDocPath:(NSString *)docPath{
    ADPaintDoc *doc = [[ADPaintDoc alloc]initWithDocPath:docPath];
    doc.data = [self.data copy];
    doc.defaultSize = self.defaultSize;
    doc.userInputParams = [self.userInputParams copy];
    
    return doc;
}


//释放Data
-(void)close{
    [self setData:nil];
    [self setReverseData:nil];
}

//将data.plist压缩到archiver，并将archiver保存到系统分配的文件夹中
- (void)save{
    DebugLogFuncStart(@"save");

    NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    if (self.data){
        [archiver encodeObject:self.data forKey:kDataKey];
        [archiver finishEncoding];
        if ([data writeToFile:dataPath atomically:YES]) {
            DebugLogWriteSuccess(@"writeToFile %@ success!", dataPath);
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

- (void)saveUserInputParams{
    DebugLogFuncStart(@"saveUserInputParams");
    NSString *dataPath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    dataPath = [dataPath stringByReplacingOccurrencesOfString:@"psf" withString:@"inf"];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
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

- (void)saveThumbImage:(UIImage*)image{
    DebugLogFuncStart(@"saveThumbImage");
    NSString *thumbImagePath = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.thumbImagePath];
    NSData *thumbImageData = UIImagePNGRepresentation(image);
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



- (void)delete {
    DebugLogFuncStart(@"delete");
    [self deleteData];
    
    [self deleteUserInputParams];
    
    [self deleteThumbImage];
}

- (void)deleteData {
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (!success) {
        DebugLogError(@"Error removing document path: %@", error.localizedDescription);
    }
}
- (void)deleteUserInputParams {
    NSString* path = [[ADUltility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    path = [path stringByReplacingOccurrencesOfString:@".psf" withString:@".inf"];
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
#pragma mark- 导出
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
