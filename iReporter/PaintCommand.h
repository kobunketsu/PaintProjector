//
//  PaintCommand.h
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brush.h"
#import "Command.h"

@class PaintCommand;

@protocol PaintCommandDelegate

- (void) willStartDrawBrushState:(BrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped;

- (void) willBeforeDrawBrushState:(BrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isImmediate;

- (void) willAllocUndoVertexBufferWithPaintCommand:(PaintCommand*)cmd;

- (void) willFillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId segmentOffset:(int)segmentOffset brushState:(BrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate;

- (void)willRenderDataWithBrushId:(NSInteger)brushId isImmediate:(BOOL)isImmediate;

- (void)willAfterDraw:(BrushState*)brushState refresh:(BOOL)refresh retainBacking:(BOOL)retainBacking;

- (void)willEndDraw:(BrushState*)brushState isUndoWrapped:(BOOL)isUndoWrapped;
//- (void) willExecutePaintCommand:(PaintCommand*)paintCommand;
@end
@interface PaintCommand : Command
{
}
//@property (nonatomic, retain) Brush* brush;
@property (nonatomic, retain) NSMutableArray* paintPaths;//记录了一次完整绘制的路径
@property (nonatomic, retain) BrushState* brushState;
@property (nonatomic, assign) int curSegmentOffset;//当前笔触操作的第index段
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) BOOL isTapDraw;

- (PaintCommand*)initWithBrushState:(BrushState*)brushState;

- (void)addPathPointStart:(CGPoint)startPoint End:(CGPoint)endPoint;

- (void)drawImmediateStart:(CGPoint)startPoint;

- (void)drawImmediateFrom:(CGPoint)startPoint to:(CGPoint)endPoint;

- (void)drawImmediateEnd;

- (void)prewarm;//用来prewarm shader
@end
