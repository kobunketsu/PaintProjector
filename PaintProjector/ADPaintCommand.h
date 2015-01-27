//
//  PaintCommand.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADBrush.h"
#import "ADCommand.h"

@class ADPaintCommand;

@protocol ADPaintCommandDelegate

- (void) willStartDrawBrushState:(ADBrushState*)brushState FromPoint:(CGPoint)startPoint isUndoBaseWrapped:(BOOL)isUndoBaseWrapped;

- (void) willBeforeDrawBrushState:(ADBrushState*)brushState isUndoBaseWrapped:(BOOL)isUndoBaseWrapped isImmediate:(BOOL)isImmediate;

//为在Undo过程中的描绘分配顶点描画的内存
- (void) willAllocUndoVertexBufferWithPaintCommand:(ADPaintCommand*)cmd;

- (void) willFillDataFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId segmentOffset:(int)segmentOffset brushState:(ADBrushState*)brushState isTapDraw:(BOOL)isTapDraw isImmediate:(BOOL)isImmediate;

- (void)willRenderDataWithBrushId:(NSInteger)brushId isImmediate:(BOOL)isImmediate;

- (void)willAfterDraw:(ADBrushState*)brushState refresh:(BOOL)refresh retainBacking:(BOOL)retainBacking;

- (void)willEndDraw:(ADBrushState*)brushState isUndoWrapped:(BOOL)isUndoWrapped;
//- (void) willExecutePaintCommand:(PaintCommand*)paintCommand;
@end
@interface ADPaintCommand : ADCommand
{
}
//@property (retain, nonatomic) Brush* brush;
@property (retain, nonatomic) NSMutableArray* paintPaths;//记录了一次完整绘制的路径
@property (retain, nonatomic) ADBrushState* brushState;
@property (assign, nonatomic) int curSegmentOffset;//当前笔触操作的第index段
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) BOOL isTapDraw;

- (ADPaintCommand*)initWithBrushState:(ADBrushState*)brushState;
- (void)addPathPoint:(CGPoint)point;
- (void)addPathPointStart:(CGPoint)startPoint End:(CGPoint)endPoint;

- (void)drawImmediateStart:(CGPoint)startPoint;

- (void)drawImmediateFrom:(CGPoint)startPoint to:(CGPoint)endPoint;

- (void)drawImmediateEnd;

- (void)prewarm;//用来prewarm shader
@end
