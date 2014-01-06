//
//  PaintFrameGroup.h
//  iReporter
//
//  Created by 文杰 胡 on 13-2-18.
//  Copyright (c) 2013年 Marin Todorov. All rights reserved.
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
@property(nonatomic, copy) NSString* dirPath;   //记录磁盘上对应的目录名
@property(nonatomic, copy) NSString* name;//画框组名
@property(nonatomic, retain) NSMutableArray* paintDocs;//记录该目录下所有的文件数据
@property(nonatomic, retain) Heap* paintFrameHeap;//画框组列队
@property(nonatomic, weak) PaintFrameView* curPaintFrame;//当前画框
@property(nonatomic, assign) int lastPaintIndex;//上一个画框号
@property(nonatomic, assign) int curPaintIndex;//当前画框号
- (id) initWithCapacity:(int)capacity;
- (void)movePaintIndexByStep:(int)movedCount;
-(void)push:(PaintFrameView*)pf;
-(void)push_reverse:(PaintFrameView*)pf;
@end
