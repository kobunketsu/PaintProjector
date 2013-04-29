//
//  PaintSaveData.h
//  iReporter
//
//  Created by 胡 文杰 on 13-3-26.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
//

//名称:保存文件
//描述:用于保存的文件格式
//功能:

#import <Foundation/Foundation.h>
#define kTitleKey   @"Title"
@interface PaintData : NSObject <NSCoding>{
    NSMutableArray* _layers;    //图层
    
}
@property (copy) NSString *title;
@property (copy) NSString *version;
@property (nonatomic, retain) NSMutableArray *layers;

- (id)initWithTitle:(NSString*)title;
- (id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers Version:(NSString*)version;
@end
