//
//  PaintFrameManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADPaintFrameManager.h"

#define PaintFrameViewWidth 210
#define PaintFrameViewHeight 280

@implementation ADPaintFrameManager
+ (void)initDataByGroupIndex:(int)index{
    DebugLogFuncStart(@"initDataByGroupIndex");
    [super initialize];
    if(!curGroup){
        curGroup = [[ADPaintFrameViewGroup alloc]initWithCapacity:1];
        curGroup.name = [NSString stringWithFormat:@"PaintFrameGroup_%d", index];
        curGroup.dirPath = [[ADPaintDocManager sharedInstance]directoryPath:index];
        curGroup.index = index;
        
        //加载指定子目录下的PaintDoc
        [self loadPaintDocs];
        
        //设置当前画框源
        //如果paintFrameGroup下的数据源paintDocs为空，
        if (curGroup.paintDocs.count == 0) {
            curGroup.curPaintIndex = curGroup.lastPaintIndex = -1;
        }
        else{
            curGroup.curPaintIndex = curGroup.lastPaintIndex = 0;
        }
    }
    else{
        
    }
}

//载入资源
+ (void)loadPaintDocs{
    DebugLogFuncStart(@"initPaintDocs");
    curGroup.paintDocs = [[ADPaintDocManager sharedInstance]loadPaintDocsInDirectoryIndex:curGroup.index];
}

//卸载资源
+ (void)unloadPaintDocs{
    DebugLogFuncStart(@"destroyPaintDocs");
    //释放资源
    curGroup.paintDocs = nil;
}

+ (void)destroy{
    curGroup = nil;
}

+ (ADPaintFrameViewGroup*)curGroup{
    return curGroup;
}

#pragma mark- 从磁盘载入文件
+(ADPaintDoc*)insertPaintDoc:(ADPaintDoc*)paintDoc atIndex:(NSInteger)index{
    DebugLogFuncStart(@"insertPaintDoc atIndex %d", index);
    NSInteger count = curGroup.paintDocs.count;
    if (index > count) {
        DebugLogError(@"index %d over count %d", index, count);
        return nil;
    }
    
    if (index < 0) {
        DebugLogWarn(@"Can't insert paintDoc at negative index, insert at index 0");
        [curGroup.paintDocs insertObject:paintDoc atIndex:0];

        curGroup.curPaintIndex = 0;
        DebugLog(@"curGroup.paintDocs insertObject atIndex 0");
    }
    else{
        [curGroup.paintDocs insertObject:paintDoc atIndex:index];

//        if (index <= curGroup.curPaintIndex) {
//            curPaintFrameGroup.curPaintIndex ++;
            curGroup.curPaintIndex = index;
//        }
        DebugLog(@"curGroup.paintDocs insertObject atIndex:%d", index);
    }
    
    DebugLog(@"curPaintIndex %d", curGroup.curPaintIndex);
    return paintDoc;
}

+(ADPaintDoc*)insertPaintDocAtCurIndex:(ADPaintDoc*)paintDoc{
    DebugLogFuncStart(@"insertPaintDocAtCurIndex");
    return [self insertPaintDoc:paintDoc atIndex:curGroup.curPaintIndex + 1];//insert after
}

+(void)insertNewPaintDocAtCurIndex{
    DebugLogFuncStart(@"insertNewPaintDocAtCurIndex");
    ADPaintDoc *paintDoc = [[ADPaintDocManager sharedInstance] createPaintDocInDirectory:curGroup.dirPath];
    [self insertPaintDocAtCurIndex:paintDoc];
}

+(void)insertNewPaintDocAtIndex:(NSInteger)index{
    DebugLogFuncStart(@"insertNewPaintDocAtIndex %d", index);
    ADPaintDoc *paintDoc = [[ADPaintDocManager sharedInstance] createPaintDocInDirectory:curGroup.dirPath];
    [self insertPaintDoc:paintDoc atIndex:index];
}

+(void)insertCopyPaintDocAtCurIndex:(ADPaintDoc*)paintDoc{
    DebugLogFuncStart(@"insertCopyPaintDocAtCurIndex");
    ADPaintDoc *newPaintDoc = [[ADPaintDocManager sharedInstance] clonePaintDoc:paintDoc];
    [self insertPaintDocAtCurIndex:newPaintDoc];
}

+(void)insertCopyPaintDocAtIndices:(NSArray *)indices{
    DebugLogFuncStart(@"insertCopyPaintDocAtIndices");
    //对indices进行从小到大的排序
    NSArray *sortedIndices = [indices sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSNumber *p1 = (NSNumber *)obj1;
        NSNumber *p2 = (NSNumber *)obj2;
        return [p1 compare:p2];
    }];
    
    NSInteger indexOffset = 0;
    for (NSNumber *num in sortedIndices) {
        NSInteger index = num.intValue;
        //插入导致数组变大后的目标插入位置
        NSInteger targetIndex = index + indexOffset;
        ADPaintDoc *paintDoc = curGroup.paintDocs[targetIndex];
        ADPaintDoc *newPaintDoc = [[ADPaintDocManager sharedInstance] clonePaintDoc:paintDoc];
        [self insertPaintDoc:newPaintDoc atIndex:targetIndex];
        indexOffset ++;
    }
    sortedIndices = nil;
}

+(void)deletePaintDocAtCurIndex{
    DebugLogFuncStart(@"deletePaintDocAtCurIndex");
    if (curGroup.curPaintIndex < 0) {
        DebugLogError(@"Nothing to delete");
        return;
    }
    if (curGroup.curPaintIndex >= curGroup.paintDocs.count) {
        DebugLogError(@"curPaintIndex over count");
        return;
    }
    
    //从内存和磁盘删除
    ADPaintDoc *paintDoc = [curGroup.paintDocs objectAtIndex:curGroup.curPaintIndex];
    [[ADPaintDocManager sharedInstance] deletePaintDoc:paintDoc];
    [curGroup.paintDocs removeObjectAtIndex:curGroup.curPaintIndex];
    
    //更改当前索引号
    if (curGroup.paintDocs.count > 0) {
        while (curGroup.curPaintIndex >= curGroup.paintDocs.count) {
            curGroup.curPaintIndex--;
        }
    }
    else{
        curGroup.curPaintIndex = -1;
    }
}

+(void)deletePaintDocAtIndices:(NSArray *)indices{
    DebugLogFuncStart(@"deletePaintDocAtIndices");
    NSMutableArray *paintDocsToRemove = [[NSMutableArray alloc]init];
    
    for (NSNumber *num in indices) {
        NSInteger index = num.intValue;
        if (index < 0) {
            DebugLogError(@"Nothing to delete");
            continue;
        }
        if (index >= curGroup.paintDocs.count) {
            DebugLogError(@"Index %d over count %d", index, curGroup.paintDocs.count);
            continue;
        }
        //更改当前索引号
        if (curGroup.curPaintIndex > index) {
            curGroup.curPaintIndex --;
        }
        //加入删除列表
        [paintDocsToRemove addObject:curGroup.paintDocs[index]];
    }
    
    //从内存和磁盘删除
    for (ADPaintDoc *paintDoc in paintDocsToRemove) {
        [[ADPaintDocManager sharedInstance] deletePaintDoc:paintDoc];
        [curGroup.paintDocs removeObject:paintDoc];
    }
    
    paintDocsToRemove = nil;
    
    //修正当前索引号
    if (curGroup.paintDocs.count > 0) {
        while (curGroup.curPaintIndex >= curGroup.paintDocs.count) {
            curGroup.curPaintIndex--;
        }
    }
    else{
        curGroup.curPaintIndex = -1;
    }
    DebugLog(@"curPaintIndex %d", curGroup.curPaintIndex);
    
}



//显示的图片
+ (void)loadPaintFrameView:(ADPaintFrameView*)paintFrameView byIndex:(int)index{
    DebugLogFuncStart(@"loadPaintFrameView index:%d", index);
    ADPaintDoc *paintDoc = [curGroup.paintDocs objectAtIndex:index];
    [paintFrameView setPaintDoc:paintDoc];
    [paintFrameView loadForDisplay];
}

+ (void)unloadPaintFrameView:(ADPaintFrameView*)paintFrameView{
    DebugLogFuncStart(@"unloadPaintFrameView");
    [paintFrameView setPaintDoc:nil];
    [paintFrameView unloadForDisplay];
}
@end
