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
    NSString *_docPath;
    NSString *_thumbImagePath;
    
    PaintData *_data;
    UIImage *_thumbImage;

}

@property (nonatomic, retain) PaintData *data;
@property (nonatomic, copy) NSString *docPath;
@property (nonatomic, copy) NSString *thumbImagePath;
@property (nonatomic, retain) UIImage *thumbImage;


- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (PaintData *)loadData;
- (void)saveData;
- (void)saveThumbImage:(UIImage*)image;
- (void)deleteDoc;
- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;

@end
