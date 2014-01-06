//
//  PaintSaveDoc.h
//  iReporter
//
//  Created by 胡 文杰 on 13-3-27.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaintData.h"

@interface PaintDoc : NSObject{
}

@property (nonatomic, retain) PaintData *data;

//!copy属性保证只从initWithDocPath付值
@property (nonatomic, copy) NSString *docPath;
@property (nonatomic, copy) NSString *thumbImagePath;

@property (nonatomic, retain) UIImage *thumbImage;
@property (nonatomic, assign) CGSize defaultSize;

- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (id)cloneWithDocPath:(NSString *)docPath;
- (PaintData *)open;
- (void)close;
- (void)save;
- (void)saveThumbImage:(UIImage*)image;
- (void)delete;
- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;

@end
