//
//  PaintFrameManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintFrameManager.h"
#import "PaintDocManager.h"
#import "PaintFrameViewGroup.h"
#import "PaintFrameView.h"

#define PaintFrameViewWidth 210
#define PaintFrameViewHeight 280

@implementation PaintFrameManager
#pragma mark- 从磁盘载入文件
-(PaintDoc*)insertPaintDoc:(PaintDoc*)paintDoc atIndex:(NSInteger)index{
    DebugLog(@"insertPaintDoc atIndex %d", index);
    NSInteger count = self.curPaintFrameGroup.paintDocs.count;
    if (index > count) {
        DebugLog(@"index %d over count %d", index, count);
        return nil;
    }
    
    if (index < 0) {
        DebugLog(@"Can't insert paintDoc at negative index, insert at index 0");
        [self.curPaintFrameGroup.paintDocs insertObject:paintDoc atIndex:0];

        self.curPaintFrameGroup.curPaintIndex = 0;
    }
    else{
        [self.curPaintFrameGroup.paintDocs insertObject:paintDoc atIndex:index];
        
        if (index <= self.curPaintFrameGroup.curPaintIndex) {
//            self.curPaintFrameGroup.curPaintIndex ++;
            self.curPaintFrameGroup.curPaintIndex = index;
        }
    }
    
    DebugLog(@"curPaintIndex %d", self.curPaintFrameGroup.curPaintIndex);
    return paintDoc;
}

-(PaintDoc*)insertPaintDocAtCurIndex:(PaintDoc*)paintDoc{
    return [self insertPaintDoc:paintDoc atIndex:self.curPaintFrameGroup.curPaintIndex];
}

-(void)insertNewPaintDocAtCurIndex{
    PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:self.curPaintFrameGroup.dirPath];
    [self insertPaintDocAtCurIndex:paintDoc];
}

-(void)insertNewPaintDocAtIndex:(NSInteger)index{
    PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:self.curPaintFrameGroup.dirPath];
    [self insertPaintDoc:paintDoc atIndex:index];
}

-(void)insertCopyPaintDocAtCurIndex:(PaintDoc*)paintDoc{
    PaintDoc *newPaintDoc = [[PaintDocManager sharedInstance] clonePaintDoc:paintDoc];
    [self insertPaintDocAtCurIndex:newPaintDoc];
}

-(void)insertCopyPaintDocAtIndices:(NSArray *)indices{
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
        PaintDoc *paintDoc = self.curPaintFrameGroup.paintDocs[targetIndex];
        PaintDoc *newPaintDoc = [[PaintDocManager sharedInstance] clonePaintDoc:paintDoc];
        [self insertPaintDoc:newPaintDoc atIndex:targetIndex];
        indexOffset ++;
    }
    sortedIndices = nil;
}

-(void)deletePaintDocAtCurIndex{
    if (self.curPaintFrameGroup.curPaintIndex < 0) {
        DebugLog(@"Nothing to delete");
        return;
    }
    if (self.curPaintFrameGroup.curPaintIndex >= self.curPaintFrameGroup.paintDocs.count) {
        DebugLog(@"curPaintIndex over count");
        return;
    }
    
    //从内存和磁盘删除
    PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:self.curPaintFrameGroup.curPaintIndex];
    [[PaintDocManager sharedInstance] deletePaintDoc:paintDoc];
    [self.curPaintFrameGroup.paintDocs removeObjectAtIndex:self.curPaintFrameGroup.curPaintIndex];
    
    //更改当前索引号
    if (self.curPaintFrameGroup.paintDocs.count > 0) {
        while (self.curPaintFrameGroup.curPaintIndex >= self.curPaintFrameGroup.paintDocs.count) {
            self.curPaintFrameGroup.curPaintIndex--;
        }
    }
    else{
        self.curPaintFrameGroup.curPaintIndex = -1;
    }
}

-(void)deletePaintDocAtIndices:(NSArray *)indices{
    NSMutableArray *paintDocsToRemove = [[NSMutableArray alloc]init];
    
    for (NSNumber *num in indices) {
        NSInteger index = num.intValue;
        if (index < 0) {
            DebugLog(@"Nothing to delete");
            continue;
        }
        if (index >= self.curPaintFrameGroup.paintDocs.count) {
            DebugLog(@"Index %d over count %d", index, self.curPaintFrameGroup.paintDocs.count);
            continue;
        }
        //更改当前索引号
        if (self.curPaintFrameGroup.curPaintIndex > index) {
            self.curPaintFrameGroup.curPaintIndex --;
        }
        //加入删除列表
        [paintDocsToRemove addObject:self.curPaintFrameGroup.paintDocs[index]];
    }
    
    //从内存和磁盘删除
    for (PaintDoc *paintDoc in paintDocsToRemove) {
        [[PaintDocManager sharedInstance] deletePaintDoc:paintDoc];
        [self.curPaintFrameGroup.paintDocs removeObject:paintDoc];
    }
    
    paintDocsToRemove = nil;
    
    //修正当前索引号
    if (self.curPaintFrameGroup.paintDocs.count > 0) {
        while (self.curPaintFrameGroup.curPaintIndex >= self.curPaintFrameGroup.paintDocs.count) {
            self.curPaintFrameGroup.curPaintIndex--;
        }
    }
    else{
        self.curPaintFrameGroup.curPaintIndex = -1;
    }
    DebugLog(@"curPaintIndex %d", self.curPaintFrameGroup.curPaintIndex);
    
}

//设置当前用于显示的组(Document下的子目录)
- (void)setCurPaintFrameGroupByIndex:(int)groupIndex{
    PaintFrameViewGroup* paintFrameGroup = [[PaintFrameViewGroup alloc]initWithCapacity:1];
    paintFrameGroup.name = [NSString stringWithFormat:@"PaintFrameGroup_%d", groupIndex];
    paintFrameGroup.dirPath = [[PaintDocManager sharedInstance]directoryPath:groupIndex];
    //加载指定子目录下的PaintDoc
    paintFrameGroup.paintDocs = [[PaintDocManager sharedInstance]loadPaintDocsInDirectoryIndex:groupIndex];
    //设置当前画框源
    //如果paintFrameGroup下的数据源paintDocs为空，
    if (paintFrameGroup.paintDocs.count == 0) {
        paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = -1;
    }
    else{
        //        paintFrameGroup.curPaintFrame = self.curPaintFrameView;
        paintFrameGroup.curPaintIndex = paintFrameGroup.lastPaintIndex = 0;
    }
    self.curPaintFrameGroup = paintFrameGroup;
}

//显示的图片
- (void)loadPaintFrameView:(PaintFrameView*)paintFrameView byIndex:(int)index{
    PaintDoc *paintDoc = [self.curPaintFrameGroup.paintDocs objectAtIndex:index];
    [paintFrameView setPaintDoc:paintDoc];
    [paintFrameView loadForDisplay];
}

- (void)openPaintFrameViewsWithAnimation{
    /*
     self.paintFrameTableView.hidden = false;
     [self.paintFrameTableView reloadData];
     
     //    DebugLog(@"openPaintFrameViewsWithAnimation visibleCells count %d", self.paintFrameTableView.visibleCells.count);
     for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
     //        DebugLog(@"openPaintFrameViewsWithAnimation PaintFrameTableView Cell %@", cell);
     UIView *view = [cell.contentView.subviews objectAtIndex:0];
     view.bounds = CGRectMake(0, 0, 0, PaintFrameViewHeight);
     }
     
     [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
     self.paintFrameTableView.alpha = 1;
     for (UITableViewCell *cell in self.paintFrameTableView.visibleCells) {
     //            DebugLog(@"openPaintFrameViewsWithAnimation PaintFrameTableView Cell After Anim %@", cell);
     UIView *view = [cell.contentView.subviews objectAtIndex:0];
     view.bounds = CGRectMake(0, 0, PaintFrameViewWidth, PaintFrameViewHeight);
     }
     
     }completion:^(BOOL finished){
     
     }];
     */
}
@end
