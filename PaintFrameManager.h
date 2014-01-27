//
//  PaintFrameManager.h
//  PaintProjector
//
//  Created by 胡 文杰 on 1/23/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PaintFrameView;
@class PaintFrameViewGroup;
@class PaintDoc;

@interface PaintFrameManager : NSObject
@property (retain, nonatomic) PaintFrameViewGroup* curPaintFrameGroup;
@property (retain, nonatomic) PaintFrameView *curPaintFrameView;

-(void)insertNewPaintDocAtCurIndex;

-(void)insertCopyPaintDocAtCurIndex:(PaintDoc*)paintDoc;

-(void)deletePaintDocAtCurIndex;

- (void)setCurPaintFrameGroupByIndex:(int)groupIndex;

- (void)loadPaintFrameView:(PaintFrameView*)paintFrameView byIndex:(int)index;
- (void)openPaintFrameViewsWithAnimation;
@end
