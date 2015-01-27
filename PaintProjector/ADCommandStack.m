//
//  PaintCommandStack.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import "ADCommandStack.h"

@implementation ADCommandStack
- (void)push:(ADCommand*)cmd {
    [super push: cmd];
}

- (ADCommand*)pop {
    return [super pop];
}
- (ADCommand*)firstCommand{
    NSUInteger count = [self.contents count];
    if (count > 0) {
        ADCommand* returnObject = [self.contents objectAtIndex:0];
        return returnObject;
    }
    return nil;    
}
- (ADCommand*)lastCommand{
    NSUInteger count = [self.contents count];
    if (count > 0) {
        ADCommand* returnObject = [self.contents objectAtIndex:count - 1];
        return returnObject;
    }
    return nil;
}

- (NSMutableArray *)allCommands{
    return self.contents;
}
@end
