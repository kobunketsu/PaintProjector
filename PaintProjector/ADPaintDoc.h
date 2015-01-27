//
//  PaintSaveDoc.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPaintData.h"
#import "ADCylinderProjectUserInputParams.h"

@interface ADPaintDoc : NSObject{
}

@property (retain, nonatomic) ADPaintData *data;//存储绘图数据
@property (retain, nonatomic) ADPaintData *reverseData;//反向绘图数据
@property (retain, nonatomic) ADCylinderProjectUserInputParams *userInputParams;//存储变形数据

//!copy属性保证只从initWithDocPath付值
@property (copy, nonatomic) NSString *docPath;
@property (copy, nonatomic) NSString *thumbImagePath;
@property (copy, nonatomic) NSString *infoPath;

@property (retain, nonatomic) UIImage *thumbImage;
@property (assign, nonatomic) CGSize defaultSize;

@property (copy, nonatomic) NSString *title;
+ (NSString*)currentVersion;
- (id)initWithDocPath:(NSString *)docPath;
- (id)cloneWithDocPath:(NSString *)docPath;
//- (void)setTitle:(NSString *)title;
//- (NSString*)title;
- (ADPaintData *)newData;
- (ADPaintData *)openData;//从文件磁盘载入
- (ADCylinderProjectUserInputParams *)openInfo;
- (void)closeData;
- (void)saveData;
- (void)saveInfo;
- (void)newSaveThumbImage;
- (void)saveThumbImage:(UIImage*)image;

- (void)delete;
- (void)rename:(NSString*)name;
- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;

@end
