//
//  PaintCommandStack.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "CommandStack.h"

@implementation CommandStack
- (void)push:(Command*)cmd {
    [super push: cmd];
}

- (Command*)pop {
    return [super pop];
}
- (Command*)firstCommand{
    NSUInteger count = [self.contents count];
    if (count > 0) {
        Command* returnObject = [self.contents objectAtIndex:0];
        return returnObject;
    }
    return nil;    
}
- (Command*)lastCommand{
    NSUInteger count = [self.contents count];
    if (count > 0) {
        Command* returnObject = [self.contents objectAtIndex:count - 1];
        return returnObject;
    }
    return nil;
}

- (NSMutableArray *)allCommands{
    return self.contents;
}
@end
