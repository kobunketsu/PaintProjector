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

@implementation PaintFrameManager


#pragma mark- 从磁盘载入文件
-(void)insertNewPaintDocAtCurIndex{
    PaintDoc *paintDoc = [[PaintDocManager sharedInstance] createPaintDocInDirectory:self.curPaintFrameGroup.dirPath];
    [self insertPaintDocAtCurIndex:paintDoc];
}

-(void)insertCopyPaintDocAtCurIndex:(PaintDoc*)paintDoc{
    PaintDoc *newPaintDoc = [[PaintDocManager sharedInstance] clonePaintDoc:paintDoc];
    [self insertPaintDocAtCurIndex:newPaintDoc];
}

-(PaintDoc*)insertPaintDocAtCurIndex:(PaintDoc*)paintDoc{
    self.curPaintFrameGroup.curPaintIndex ++;
    [self.curPaintFrameGroup.paintDocs insertObject:paintDoc atIndex:self.curPaintFrameGroup.curPaintIndex];
    return paintDoc;
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
