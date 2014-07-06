//
//  PaintSaveData.h
//  PaintProjector
//
//  Created by 胡 文杰 on 13-3-26.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

//名称:保存文件
//描述:用于保存的文件格式
//功能:

#import <Foundation/Foundation.h>
#import "ADBackgroundLayer.h"
#import "ADPaintLayer.h"

#define kTitleKey   @"Title"
@interface ADPaintData : NSObject <NSCoding>{
}
@property (copy) NSString *title;
@property (copy) NSString *version;
@property (retain, nonatomic) NSMutableArray *layers;
@property (retain, nonatomic) ADBackgroundLayer *backgroundLayer;

- (id)initWithTitle:(NSString*)title;
-(id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers backgroundLayer:(ADBackgroundLayer*)backgroundLayer version:(NSString*)version;
@end
