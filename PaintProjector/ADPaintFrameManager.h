//
//  PaintFrameManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPaintDocManager.h"
#import "ADPaintFrameViewGroup.h"
#import "ADPaintFrameView.h"

static ADPaintFrameViewGroup *curGroup = nil;

@interface ADPaintFrameManager : NSObject
//@property (retain, nonatomic) PaintFrameViewGroup* curPaintFrameGroup;

+ (ADPaintFrameViewGroup*)curGroup;
+ (void)initDataByGroupIndex:(int)groupIndex;

+ (void)destroy;

+ (void)loadPaintDocs;

+ (void)unloadPaintDocs;

+(void)insertNewPaintDocAtCurIndex;

+(void)insertNewPaintDocAtIndex:(NSInteger)index;

+(void)insertCopyPaintDocAtCurIndex:(ADPaintDoc*)paintDoc;

+(void)insertCopyPaintDocAtIndices:(NSArray *)indices;

+(void)deletePaintDocAtCurIndex;

+(void)deletePaintDocAtIndices:(NSArray *)indices;

+ (void)loadPaintFrameView:(ADPaintFrameView*)paintFrameView byIndex:(int)index;
+ (void)unloadPaintFrameView:(ADPaintFrameView*)paintFrameView;

@end
