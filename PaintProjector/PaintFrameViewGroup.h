//
//  PaintFrameViewGroup.h
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-18.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

//名称: 画框组
//描述: 用于显示一组画集
//功能:

#import <Foundation/Foundation.h>
#import "Heap.h"
#import "PaintFrameView.h"

@interface PaintFrameViewGroup : NSObject
{
}
@property (copy, nonatomic) NSString* dirPath;   //记录磁盘上对应的目录名
@property (copy, nonatomic) NSString* name;//画框组名
@property (assign, nonatomic) int index;//画框组索引
@property (retain, nonatomic) NSMutableArray* paintDocs;//记录该目录下所有的文件数据
@property (assign, nonatomic) int lastPaintIndex;//上一个画框号
@property (assign, nonatomic) int curPaintIndex;//当前画框号

- (id) initWithCapacity:(int)capacity;
- (PaintDoc*)curPaintDoc;
- (PaintDoc*)lastPaintDoc;
- (PaintDoc*)nextPaintDoc;
- (void)movePaintIndexByStep:(int)movedCount;
@end
