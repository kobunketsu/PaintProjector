//
//  CommandManager.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandStack.h"
@protocol CommandManagerDelegate
- (void) willBeginUndo;
- (void) willFinishUndo;
- (void) willBeginRedo;
- (void) willFinishRedo;
- (void) willEnableRedo:(BOOL)enable;
- (void) willEnableUndo:(BOOL)enable;
- (void) willEndWrapUndoBaseCommand;
- (void) willBeginWrapUndoBaseCommand;
@end
@interface CommandManager : NSObject
{
    
}
@property(nonatomic, assign) id delegate;
@property(nonatomic, retain) CommandStack *undoStack;
@property(nonatomic, retain) CommandStack *redoStack;

- (void)addCommand:(Command *)cmd;

//- (void)endCommand;

- (void)undo;

- (void)redo;

- (void)wrapCommand:(Command*)cmd;

- (void)clearAllCommands;
@end
