//
//  PaintCommand.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "PaintCommand.h"

@implementation PaintCommand

- (PaintCommand*)initWithBrushState:(BrushState*)brushState{
    self = [super init];
    if (self!=nil) {
        _brushState = [brushState copy];
//        DebugLog(@"_brushState.seed: %d", _brushState.seed);
        _paintPaths = [[NSMutableArray alloc]init];
        _curSegmentOffset = 0;
        _isTapDraw = false;
    }
    else{
        CLSLog(@"PaintCommand initWithBrushState return nil");
    }

    return self;
}
-(void)dealloc{
//    DebugLogSystem(@"[ dealloc ]");
    
    [self setBrushState:nil];
    [self.paintPaths removeAllObjects];
    [self setPaintPaths:nil];
    
}

- (void)addPathPointStart:(CGPoint)startPoint End:(CGPoint)endPoint{
//    DebugLog(@"addPathPointStart startPoint %@ endPoint %@", NSStringFromCGPoint(startPoint), NSStringFromCGPoint(endPoint));
    
    if ([self.paintPaths count]==0) {
        [self.paintPaths addObject:[NSValue valueWithCGPoint:startPoint]];
        [self.paintPaths addObject:[NSValue valueWithCGPoint:endPoint]];
    }
    else {
        //通过判断startPoint和endPoint之间的距离来确定是否加到paintPath中
//        CGPoint lastPoint = [[self.paintPaths lastObject] CGPointValue];
//        
//        if (fabs(lastPoint.x - startPoint.x) > PaintPixelOffsetThresold ||
//            fabs(lastPoint.y - startPoint.y) > PaintPixelOffsetThresold ){
//            [self.paintPaths addObject:[NSValue valueWithCGPoint:startPoint]];
//            [self.paintPaths addObject:[NSValue valueWithCGPoint:endPoint]];
//        }
//        else{
            [self.paintPaths addObject:[NSValue valueWithCGPoint:endPoint]];
//        }
    }
}
-(void)prewarm{
    DebugLogFuncStart(@"prewarm");

#if DEBUG
    glPushGroupMarkerEXT(0, "PaintCommand execute");
#endif
    //有可能造成transform时候出现错误像素
    CGPoint startPoint = CGPointMake(DefaultScreenWidth * 0.5, DefaultScreenHeight * 0.5);
    CGPoint endPoint = CGPointMake(DefaultScreenWidth, DefaultScreenHeight);

    [self addPathPointStart:startPoint End:endPoint];

//    [self.delegate willAllocUndoVertexBufferWithPaintCommand:self];
    
    [self.delegate willStartDrawBrushState:self.brushState FromPoint:startPoint isUndoBaseWrapped:false];
    
    
    [self.delegate willBeforeDrawBrushState:self.brushState isUndoBaseWrapped:false isImmediate:false];
    

    [self.delegate willFillDataFromPoint:startPoint
                            toPoint:endPoint
                        WithBrushId:self.brushState.classId
                      segmentOffset:0
                         brushState:self.brushState
                          isTapDraw:true
                        isImmediate:false];
    
    [self.delegate willRenderDataWithBrushId:self.brushState.classId isImmediate:false];

    
    [super endExecute];
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}
-(void)execute{
//    DebugLog(@"[ execute]");
#if DEBUG
    glPushGroupMarkerEXT(0, "PaintCommand execute");
#endif
    
    if ([self.paintPaths count]==0) {
        return;
    }

    [self.delegate willAllocUndoVertexBufferWithPaintCommand:self];
    
    self.curSegmentOffset = 0;
    CGPoint startPoint = [[self.paintPaths objectAtIndex:0] CGPointValue];
    [self.delegate willStartDrawBrushState:self.brushState FromPoint:startPoint isUndoBaseWrapped:self.isUndoBaseWrapped];
    
    //beforeDraw
    //FIXME:beforeDraw中只做了一次mapBuffer, 如果wet>0 每次willRenderDataWithBrushId都会unmapBuffer导致问题
    if (self.brushState.wet == 0) {
        [self.delegate willBeforeDrawBrushState:self.brushState isUndoBaseWrapped:self.isUndoBaseWrapped isImmediate:false];
    }
 
    //fillDatas 将command中记录的数据map到显存
    for (int i = 0; i < [self.paintPaths count]-1; ++i) {
        if (self.brushState.wet > 0) {
            [self.delegate willBeforeDrawBrushState:self.brushState isUndoBaseWrapped:self.isUndoBaseWrapped isImmediate:false];
        }
        
        //重置随机数字Seed
        srandom(self.brushState.seed + self.curSegmentOffset);
        //        DebugLog(@"srandom %d", self.brushState.seed + self.curSegmentOffset);
        
        NSUInteger endIndex = (self.paintPaths.count == 1 ? i : (i+1));
        CGPoint startPoint = [[self.paintPaths objectAtIndex:i] CGPointValue];
        CGPoint endPoint = [[self.paintPaths objectAtIndex:endIndex] CGPointValue];

        [self.delegate willFillDataFromPoint:startPoint
                                toPoint:endPoint
                            WithBrushId:self.brushState.classId
                          segmentOffset:self.curSegmentOffset
                             brushState:self.brushState
                              isTapDraw:self.isTapDraw
                            isImmediate:false];

        if(self.brushState.wet > 0) {
            //需要更新smudge纹理的每段paintPath进行更新
            [self.delegate willRenderDataWithBrushId:self.brushState.classId isImmediate:false];
        }
        
        //在draw之后进行！
        self.curSegmentOffset ++;
    }
    
    if (self.brushState.wet == 0) {
        //只需要更新brushState的再填充好data后一次描画
        [self.delegate willRenderDataWithBrushId:self.brushState.classId isImmediate:false];
    }
    
    //afterDraw
    [self.delegate willAfterDraw:self.brushState refresh:false retainBacking:!self.isUndoBaseWrapped];
    //    DebugLog(@"draw %d paths", self.paintPaths.count);

    [self.delegate willEndDraw:self.brushState isUndoWrapped:self.isUndoBaseWrapped];

    
    [super endExecute];
#if DEBUG
    glPopGroupMarkerEXT();
#endif
}



- (void)drawImmediateStart:(CGPoint)startPoint{
    [self.delegate willStartDrawBrushState:self.brushState FromPoint:startPoint isUndoBaseWrapped:false];
    
}

- (void)drawImmediateFrom:(CGPoint)startPoint to:(CGPoint)endPoint{
    //调用PaintCommandDelegate的片段代码
    [self.delegate willBeforeDrawBrushState:self.brushState isUndoBaseWrapped:false isImmediate:true];
    
    //笔刷属性 移动到选择ui交互上
#if DEBUG
    glPushGroupMarkerEXT(0, "Draw");
#endif
    //重置随机数字Seed
    srandom(self.brushState.seed + self.curSegmentOffset);
    //    DebugLog(@"srandom %d", self.brush.brushState.seed + self.curPaintCommand.curSegmentOffset);
    
    //渲染笔触到brushFramebuffer上
    [self.delegate willFillDataFromPoint: startPoint toPoint:endPoint WithBrushId:self.brushState.classId segmentOffset:self.curSegmentOffset brushState:self.brushState isTapDraw:self.isTapDraw isImmediate:true];

    [self.delegate willRenderDataWithBrushId:self.brushState.classId isImmediate:true];
    
    //在draw之后进行随机数字Seed偏移
    self.curSegmentOffset ++;
#if DEBUG
    glPopGroupMarkerEXT();
#endif
    //合成finalFramebuffer结果
    [self.delegate willAfterDraw:self.brushState refresh:true retainBacking:true];
}

- (void)drawImmediateEnd{                            
    [self.delegate willEndDraw:self.brushState isUndoWrapped:false];
}











































//- (void)startDraw{
//    self.curSegmentOffset = 0;
//    CGPoint startPoint = [[self.paintPaths objectAtIndex:0] CGPointValue];
//    [self.delegate willStartDrawBrushState:self.brushState FromPoint:startPoint];
//}
//
//-(void)beforeDraw{
//    [self.delegate willBeforeDraw:self.isUndoBaseWrapped isContinuous:false];
//}
//- (void)draw{
//    if ([self.paintPaths count]==0) {
//        return;
//    }
//    
//    //将command中记录的数据进行绘制
//    [self.delegate willPrepareBrushState:self.brushState];
//
//    for (int i = 0; i < [self.paintPaths count]-1; ++i) {
//        //重置随机数字Seed
//        srandom(self.brushState.seed + self.curSegmentOffset);
////        DebugLog(@"srandom %d", self.brushState.seed + self.curSegmentOffset);
//        
//        CGPoint startPoint = [[self.paintPaths objectAtIndex:i] CGPointValue];
//        CGPoint endPoint = [[self.paintPaths objectAtIndex:(i+1)] CGPointValue];
//        
//        [self.delegate willRenderLineFromPoint: startPoint toPoint:endPoint WithBrushId:self.brushState.classId segmentOffset:self.curSegmentOffset brushState:self.brushState isTapDraw:self.isTapDraw];
//        
//        //在draw之后进行！
//        self.curSegmentOffset ++;
//        
//        //TODO: no after draw?
//    }
////    DebugLog(@"draw %d paths", self.paintPaths.count);
//}
//-(void)afterDraw{
//    [self.delegate willAfterDraw:self.brushState];
//}
//
//-(void)endDraw{
//    [self.delegate willEndDraw];
//}

@end
