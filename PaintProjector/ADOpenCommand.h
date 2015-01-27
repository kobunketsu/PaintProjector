//
//  OpenCommand.h
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCommand.h"

@interface ADOpenCommand : ADCommand
@property (assign, nonatomic)GLuint texture;
@property (assign, nonatomic) id delegate;
- (ADOpenCommand*)initWithTexture:(GLuint)texture;
@end

@protocol ADOpenCommandDelegate
- (void) willExecuteOpenCommand:(ADOpenCommand*)openCommand;
@end