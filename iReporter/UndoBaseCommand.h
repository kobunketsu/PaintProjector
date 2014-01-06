//
//  UndoBaseCommand.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-12.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Command.h"

@interface UndoBaseCommand : Command
@property(nonatomic, assign)GLuint texture;
@property(nonatomic, assign) id delegate;
- (UndoBaseCommand*)initWithTexture:(GLuint)texture;
@end

@protocol UndoBaseCommandDelegate
- (void) willExecuteUndoBaseCommand:(UndoBaseCommand*)command;
@end
