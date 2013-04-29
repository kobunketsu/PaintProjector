//
//  Stack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Stack.h"

@implementation Stack

// superclass overrides

- (id)initWithCapacity:(size_t) capacity {
    if (self = [super init]) {
        contents = [[NSMutableArray alloc] init];
        _capacity = capacity;
    }
    return self;
}

// Stack methods
- (void)push:(id)object {
    NSUInteger count = [contents count];
    if (count < _capacity) {
        [contents addObject:object];
    }
    else {
        [contents removeObjectAtIndex:0];
        [contents addObject:object];        
    }
}

- (id)pop {
    NSUInteger count = [contents count];
    if (count > 0) {
        id returnObject = [contents objectAtIndex:count - 1];
        [contents removeLastObject];
        return returnObject;
    }
    else {
        return nil;
    }
}

- (size_t)size {
    return [contents count];
}
@end