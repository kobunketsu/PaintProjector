//
//  PaintFrameViewGroup.m
//  PaintProjector
//
//  Created by 文杰 胡 on 13-2-18.
//  Copyright (c) 2013年 Hu Wenjie. All rights reserved.
//

#import "ADPaintFrameViewGroup.h"

@implementation ADPaintFrameViewGroup

-(id) initWithCapacity:(int)capacity{
    self = [super init];
    if(self!=NULL){
        _paintDocs = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)movePaintIndexByStep:(int)step{
    self.curPaintIndex = self.lastPaintIndex + step;
    if (self.curPaintIndex<0) {
        self.curPaintIndex = self.paintDocs.count + self.curPaintIndex;
    }
    else if(self.curPaintIndex > self.paintDocs.count-1){
        self.curPaintIndex = self.curPaintIndex - self.paintDocs.count;
    }
    
    self.lastPaintIndex = self.curPaintIndex;
    DebugLog(@"_curPaintFrameIndex:%d", self.curPaintIndex);    
}

- (ADPaintDoc*)curPaintDoc{
    DebugLogWarn(@"curPaintDoc index %d", self.curPaintIndex);
    if (!self.paintDocs) {
        return nil;
    }
    
    if (self.curPaintIndex < 0) {
        return nil;
    }
    
    if (self.curPaintIndex >= self.paintDocs.count) {
        return nil;
    }
    
    ADPaintDoc *paintDoc = self.paintDocs[self.curPaintIndex];
    [[NSUserDefaults standardUserDefaults] setValue:paintDoc.docPath forKey:@"RecentDoc"];;
    
    return paintDoc;
}

- (ADPaintDoc*)lastPaintDoc{
    if (!self.paintDocs) {
        return nil;
    }
    
    if (self.curPaintIndex <= 0) {
        return nil;
    }
    
    if (self.curPaintIndex >= self.paintDocs.count) {
        return nil;
    }

    ADPaintDoc *paintDoc = self.paintDocs[self.curPaintIndex - 1];
    [[NSUserDefaults standardUserDefaults] setValue:paintDoc.docPath forKey:@"RecentDoc"];;
    
    return paintDoc;
}

- (ADPaintDoc*)nextPaintDoc{
    if (!self.paintDocs) {
        return nil;
    }
    
    if (self.curPaintIndex < 0) {
        return nil;
    }
    
    if (self.curPaintIndex >= self.paintDocs.count - 1) {
        return nil;
    }
    
    ADPaintDoc *paintDoc = self.paintDocs[self.curPaintIndex + 1];
    [[NSUserDefaults standardUserDefaults] setValue:paintDoc.docPath forKey:@"RecentDoc"];
    
    return paintDoc;
}

@end
