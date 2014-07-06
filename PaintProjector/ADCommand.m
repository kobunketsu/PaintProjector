//
//  Command.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-6-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADCommand.h"

@implementation ADCommand

- (id)init{
    if ((self = [super init])) {
        _isUndoBaseWrapped = false;
    }
    return self;
}

-(void)execute{
    
}

-(void)endExecute{
    //满足一定条件，例如 如果命令开销比较大，进行优化
//    [self.delegate willEndCommand];
}


@end
