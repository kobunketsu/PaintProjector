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
#import "ADCylinderProjectUserInputParams.h"


#define kTitleKey   @"Title"
@interface ADPaintData : NSObject <NSCoding>{
}
@property (copy) NSString *title;//标题
@property (copy) NSString *version;//版本号
@property (retain, nonatomic) NSMutableArray *layers;//绘画图层
@property (retain, nonatomic) ADBackgroundLayer *backgroundLayer;//背景层
@property (retain, nonatomic) ADCylinderProjectUserInputParams *userInputParams;//变形数据

-(id)initWithTitle:(NSString*)title layers:(NSMutableArray*)layers backgroundLayer:(ADBackgroundLayer*)backgroundLayer userInputParams:(ADCylinderProjectUserInputParams*)userInputParams version:(NSString*)version;
@end
