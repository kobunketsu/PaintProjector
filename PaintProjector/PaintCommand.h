//
//  PaintCommand.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brush.h"
#import "Command.h"

@class PaintCommand;

@protocol PaintCommandDelegate

- (void) willStartDrawBrushState:(BrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped;

- (void) willBeforeDrawBrushState:(BrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isImmediate;

//为在Undo过程中的描绘分配顶点描画的内存
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
//@property (retain, nonatomic) Brush* brush;
@property (retain, nonatomic) NSMutableArray* paintPaths;//记录了一次完整绘制的路径
@property (retain, nonatomic) BrushState* brushState;
@property (assign, nonatomic) int curSegmentOffset;//当前笔触操作的第index段
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) BOOL isTapDraw;

- (PaintCommand*)initWithBrushState:(BrushState*)brushState;

- (void)addPathPointStart:(CGPoint)startPoint End:(CGPoint)endPoint;

- (void)drawImmediateStart:(CGPoint)startPoint;

- (void)drawImmediateFrom:(CGPoint)startPoint to:(CGPoint)endPoint;

- (void)drawImmediateEnd;

- (void)prewarm;//用来prewarm shader
@end
