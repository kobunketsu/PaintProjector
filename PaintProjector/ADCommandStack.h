//
//  PaintCommandStack.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADHeap.h"
#import "ADCommand.h"
@interface ADCommandStack : ADHeap
- (void)push:(ADCommand*)image;
- (ADCommand*)pop;
- (ADCommand*)firstCommand;
- (ADCommand*)lastCommand;
- (NSMutableArray *)allCommands;
@end
