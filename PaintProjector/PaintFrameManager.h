//
//  PaintFrameManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaintDocManager.h"
#import "PaintFrameViewGroup.h"
#import "PaintFrameView.h"

static PaintFrameViewGroup *curGroup = nil;

@interface PaintFrameManager : NSObject
//@property (retain, nonatomic) PaintFrameViewGroup* curPaintFrameGroup;

+ (PaintFrameViewGroup*)curGroup;
+ (void)initDataByGroupIndex:(int)groupIndex;

+ (void)destroy;

+ (void)loadPaintDocs;

+ (void)unloadPaintDocs;

+(void)insertNewPaintDocAtCurIndex;

+(void)insertNewPaintDocAtIndex:(NSInteger)index;

+(void)insertCopyPaintDocAtCurIndex:(PaintDoc*)paintDoc;

+(void)insertCopyPaintDocAtIndices:(NSArray *)indices;

+(void)deletePaintDocAtCurIndex;

+(void)deletePaintDocAtIndices:(NSArray *)indices;

+ (void)loadPaintFrameView:(PaintFrameView*)paintFrameView byIndex:(int)index;
+ (void)unloadPaintFrameView:(PaintFrameView*)paintFrameView;
+ (void)openPaintFrameViewsWithAnimation;
@end
