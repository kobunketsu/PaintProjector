//
//  PaintSaveDoc.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import "PaintDoc.h"
#import "PaintData.h"
#import "PaintDocManager.h"
#import "Ultility.h"
#import "PaintLayer.h"

#define kDataKey        @"Data"
#define kDataFile       @"data.plist"
#define kThumbImageFile @"thumbImage.png"

@implementation PaintDoc

- (id)init {
    if ((self = [super init])) {
        //TODO: define defaultSize
        _defaultSize = CGSizeMake(DefaultScreenWidth, DefaultScreenHeight);
    }
    return self;
}

- (id)initWithDocPath:(NSString *)docPath{
    if ((self = [super init])) {
//        _data = [[PaintData alloc]init];
        _docPath = docPath;
        _thumbImagePath = [[self.docPath stringByDeletingPathExtension]stringByAppendingPathExtension:@"png"];
        _defaultSize = CGSizeMake(DefaultScreenWidth, DefaultScreenHeight);
    }
    return self;
}

- (void)dealloc{
    DebugLogSystem(@"dealloc");
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
    NSString *dataPath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:self.thumbImagePath];
    [data writeToFile:dataPath atomically:YES];
    
    // Clean up
    free(buffer);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRelease(imageRef);
    
}

- (PaintData *)newData {
    PaintLayer* paintLayer = [PaintLayer createBlankLayerWithSize:self.defaultSize transparent:true];
    NSMutableArray *layers = [[NSMutableArray alloc]initWithObjects:paintLayer, nil];
    BackgroundLayer *backgroundLayer = [[BackgroundLayer alloc]init];
    self.data = [[PaintData alloc]initWithTitle:@"newDoc" layers:layers backgroundLayer:backgroundLayer version:@"1.0"];
    
    return self.data;
}

- (PaintData *)open {
    //打开已经进入内存的paintData
    if (self.data != nil) {
        return self.data;
    }
    NSString *dataPath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
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
    
    return self.data;
}


- (id)cloneWithDocPath:(NSString *)docPath{
    PaintDoc *doc = [[PaintDoc alloc]initWithDocPath:docPath];
    doc.data = [self.data copy];
    doc.defaultSize = self.defaultSize;
    
    return doc;
}


//释放Data
-(void)close{
    [self setData:nil];
}

//将data.plist压缩到archiver，并将archiver保存到系统分配的文件夹中
- (void)save {
    
    if (self.data == nil) return;
    
    NSString *dataPath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:self.docPath];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self.data forKey:kDataKey];
    [archiver finishEncoding];
    if ([data writeToFile:dataPath atomically:YES]) {
        DebugLogSuccess(@"saved to %@", dataPath);
    }
    else{
        DebugLogError(@"save to %@ failed!", dataPath);
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

- (void)saveThumbImage:(UIImage*)image{
    NSString *thumbImagePath = [[Ultility applicationDocumentDirectory] stringByAppendingPathComponent:self.thumbImagePath];
    NSData *thumbImageData = UIImagePNGRepresentation(image);
//    NSData *thumbImageData = UIImageJPEGRepresentation(image, 1);
    if([thumbImageData writeToFile:thumbImagePath atomically:YES]){
        DebugLogSuccess(@"thumbImage saved to %@", thumbImagePath);
    }
    else{
        DebugLogError(@"thumbImage save to %@ failed!", thumbImagePath);
    }
}

- (void)delete {
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:self.docPath error:&error];
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
