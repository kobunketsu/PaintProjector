//
//  CommandManager.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "CommandManager.h"
#import "Command.h"
#import "PaintCommand.h"
#import "OpenCommand.h"
#import "UndoBaseCommand.h"

@implementation CommandManager

- (id)init{
    if ((self = [super init])) {
        self.undoStack = [[CommandStack alloc]initWithCapacity:UndoMaxCount*2];
        self.redoStack = [[CommandStack alloc]initWithCapacity:UndoMaxCount*2];
    }
    return self;
}

- (void)wrapCommand:(Command*)cmd{
    [self.undoStack push_reverse:cmd];
}
- (void)clearAllCommands{
    [self.undoStack clear];
    [self.redoStack clear];
    
    [self.delegate willEnableUndo:false];
    [self.delegate willEnableRedo:false];
}
- (void)addCommand:(Command *)cmd{
    [self.redoStack clear];
    [self.delegate willEnableRedo:false];
    
//    if ([self.undoStack size] == 1) {
        [self.delegate willEnableUndo:true];
//    }

    if ([cmd isKindOfClass:[UndoBaseCommand class]]) {
        [self.undoStack clear];
        [self.delegate willEnableUndo:false];
    }
    else{
        //todo: 根据Command的不同类型对Stack进行处理
        if (self.undoStack.size == UndoMaxCount * 2) {
            //更新记录点
            DebugLog(@"Update UndoBaseTexture");
            
            //1.得到绘制历史的临时层，使用curPaintedLayer作为临时层，从undoBasebuffer取得初始数据
            glFinish();
            [self.delegate willBeginWrapUndoBaseCommand];
            
            //2.在curPaintedLayer上绘制历史记录
            for (int i = 0; i < UndoMaxCount+1; ++i) {
                glFlush();
                Command *wrapCmd = [self.undoStack pop_reverse];
                wrapCmd.isUndoBaseWrapped = true;
                //afterDraw中self copyCurLayerToCurPaintedLayer -> do nothing
                [wrapCmd execute];
            }
            
            //3.将curPaintLayerbuffer画到undobase buffer
            //完成更新undoBasebuffer后从curLayerFramebuffer得到当前绘制数据
            [self.delegate willEndWrapUndoBaseCommand];
            glFinish();
        }
    }

    [self.undoStack push:cmd];
 
}

- (void)undo{
//    DebugLog(@"[ Undo ]");
    if ([self.undoStack size] <=1) {//初始化中保留一个初始image
        return;
    }
    //把undoStack的顶层的内容推到redoStack中
    [self.redoStack push:[self.undoStack pop]];
    
    if ([self.redoStack size] == 1) {
        [self.delegate willEnableRedo:true];
    }
    
    //以_undoBaseTexture为基准，从stack头取出所有Operation playback renderLineFromPoint
    [self.delegate willBeginUndo];
    
    //考虑使用多线程fill所有undo的renderData,等同步所有填充数据结束之后，一起描画？
    for (Command *cmd in [self.undoStack allCommands]) {
        [cmd execute];
    }
    
    [self.delegate willFinishUndo];
    
    //禁止Undo
    if([self.undoStack size] <=1){
        [self.delegate willEnableUndo:false];
    }
    
    if ([self.redoStack size] == UndoMaxCount) {
        [self.delegate willEnableUndo:false];
    }
}

- (void)redo{
//    DebugLog(@"[ Redo ]");    
    if ([self.redoStack size] == 0) {
        return;
    }
    
    Command* cmd = [self.redoStack pop];
    
    if (cmd!=nil) {
        [self.undoStack push:cmd];
    }
    
    //禁止redo功能
    if ([self.redoStack size]==0) {
        [self.delegate willEnableRedo:false];
    }
    
    [self.delegate willBeginRedo];
    
    [cmd execute];
    
    [self.delegate willFinishRedo];
    
    [self.delegate willEnableUndo:true];
}

//#pragma mark Command
@end
