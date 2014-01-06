//
//  PaintOperation.h
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brush.h"
#import "Command.h"

@class PaintOperation;

@protocol PaintOperationDelegate
- (void) prepareBrushState:(BrushState*)brushState FromPoint:(CGPoint)startPoint;
- (void) drawFromPoint:(CGPoint)start toPoint:(CGPoint)end WithBrushId:(NSInteger)brushId;
- (void) endDrawPaintOperation;
@end
@interface PaintOperation : Command
{
//    Brush* _brush;    
    NSMutableArray* _paintPaths;    
}
//@property (nonatomic, retain) Brush* brush;
@property (nonatomic, retain) BrushState* brushState;
@property(nonatomic, assign) id delegate;
- (PaintOperation*)initWithBrush:(Brush*)theBrush;
- (void)addPathPointStart:(CGPoint)startPoint End:(CGPoint)endPoint;
//- (void)playback;
- (void)draw;
//- (void)prepareDraw;
//- (void)openPaintFrame;
@end
