//
//  Stack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Heap.h"

@implementation Heap
@synthesize delegate;
@synthesize contents = _contents;
@synthesize capacity = _capacity;
// superclass overrides

- (id)initWithCapacity:(size_t) capacity {
    if (self = [super init]) {
        _contents = [[NSMutableArray alloc] init];
        _capacity = capacity;
    }
    return self;
}

// Stack methods
- (void)push_reverse:(id)object {
    NSUInteger count = [_contents count];
    if (count < _capacity) {
        [_contents insertObject:object atIndex:0];
        //        [delegate bottomElementAdded:object];
    }
    else {
        id bottomObject = [_contents lastObject];
        [_contents removeObject:bottomObject];
        //        [delegate bottomElementRemoved:bottomObject];
        [_contents insertObject:object atIndex:0];
        //        [delegate topElementAdded:object];        
    }
    
    //    NSLog(@"push object:%@ inStack:%@", object, self);
}

- (void)push:(id)object {
    NSUInteger count = [_contents count];
    if (count < _capacity) {
        [_contents addObject:object];
//        [delegate topElementAdded:object];
    }
    else {
        id bottomObject = [_contents objectAtIndex:0];
        [_contents removeObject:bottomObject];
//        [delegate bottomElementRemoved:bottomObject];
        [_contents addObject:object];        
//        [delegate topElementAdded:object];        
    }

//    NSLog(@"push object:%@ inStack:%@", object, self);
}

- (id)pop {
    NSUInteger count = [_contents count];
    if (count > 0) {
        id returnObject = [_contents objectAtIndex:count - 1];
//        NSLog(@"pop object:%@ inStack:%@", returnObject, self);                        
        [_contents removeObject:returnObject];
//        [delegate topElementRemoved:returnObject];
        return returnObject;
    }
    else {
        return nil;
    }
}

- (id)pop_reverse{
    NSUInteger count = [_contents count];    
    if (count > 0) {
        id returnObject = [_contents objectAtIndex:0];
//        NSLog(@"pop bottom object:%@ inStack:%@", returnObject, self);                        
        [_contents removeObject:returnObject];
//        [delegate bottomElementRemoved:returnObject];

        return returnObject;
    }    
    else {
        return nil;
    }
}
-(void)clear{
    [_contents removeAllObjects];
//    [delegate allElementRemoved];
    _size = 0;

//    NSLog(@"clear objects:%@ inStack:@", self);            
}

- (size_t)size {
    return [_contents count];
}
@end