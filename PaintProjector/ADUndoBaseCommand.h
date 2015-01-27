//
//  UndoBaseCommand.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-12.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCommand.h"

@interface ADUndoBaseCommand : ADCommand
@property (assign, nonatomic)GLuint texture;
@property (assign, nonatomic) id delegate;
- (ADUndoBaseCommand*)initWithTexture:(GLuint)texture;
@end

@protocol ADUndoBaseCommandDelegate
- (void) willExecuteUndoBaseCommand:(ADUndoBaseCommand*)command;
@end
