//
//  OpenCommand.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Command.h"

@interface OpenCommand : Command
@property (assign, nonatomic)GLuint texture;
@property (assign, nonatomic) id delegate;
- (OpenCommand*)initWithTexture:(GLuint)texture;
@end

@protocol OpenCommandDelegate
- (void) willExecuteOpenCommand:(OpenCommand*)openCommand;
@end