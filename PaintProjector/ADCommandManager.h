//
//  CommandManager.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADCommandStack.h"
@protocol ADCommandManagerDelegate
- (void) willBeginUndo;
- (void) willFinishUndo;
- (void) willBeginRedo;
- (void) willFinishRedo;
- (void) willEnableRedo:(BOOL)enable;
- (void) willEnableUndo:(BOOL)enable;
- (void) willEndWrapUndoBaseCommand;
- (void) willBeginWrapUndoBaseCommand;
@end
@interface ADCommandManager : NSObject
{
    
}
@property (assign, nonatomic) id delegate;
@property (retain, nonatomic) ADCommandStack *undoStack;
@property (retain, nonatomic) ADCommandStack *redoStack;

- (void)addCommand:(ADCommand *)cmd;

//- (void)endCommand;

- (void)undo;

- (void)redo;

- (void)wrapCommand:(ADCommand*)cmd;

- (void)clearAllCommands;
@end
