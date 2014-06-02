//
//  Stack.m
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Heap.h"

@implementation Heap

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
    if(self.capacity == 0)return;
    
    NSUInteger count = [self.contents count];
    if (count < self.capacity) {
        [self.contents insertObject:object atIndex:0];
        //        [self.delegate bottomElementAdded:object];
    }
    else {
        id bottomObject = [self.contents lastObject];
        [self.contents removeObject:bottomObject];
        //        [self.delegate bottomElementRemoved:bottomObject];
        [self.contents insertObject:object atIndex:0];
        //        [self.delegate topElementAdded:object];        
    }
    
    //    DebugLog(@"push object:%@ inStack:%@", object, self);
}

- (void)push:(id)object {  
    if(self.capacity == 0)return;
    
    NSUInteger count = [self.contents count];
    if (count < self.capacity ) {
        [self.contents addObject:object];
//        [self.delegate topElementAdded:object];
    }
    else {
        id bottomObject = [self.contents objectAtIndex:0];
        [self.contents removeObject:bottomObject];
//        [self.delegate bottomElementRemoved:bottomObject];
        [self.contents addObject:object];        
//        [self.delegate topElementAdded:object];        
    }

//    DebugLog(@"push object:%@ inStack:%@", object, self);
}

- (id)pop {
    if(self.capacity == 0)return NULL;
    
    NSUInteger count = [self.contents count];
    if (count > 0) {
        id returnObject = [self.contents objectAtIndex:count - 1];
//        DebugLog(@"pop object:%@ inStack:%@", returnObject, self);                        
        [self.contents removeObject:returnObject];
//        [self.delegate topElementRemoved:returnObject];
        return returnObject;
    }
    else {
        return nil;
    }
}

- (id)pop_reverse{
    if(self.capacity == 0)return NULL;
    
    NSUInteger count = [self.contents count];    
    if (count > 0) {
        id returnObject = [self.contents objectAtIndex:0];
//        DebugLog(@"pop bottom object:%@ inStack:%@", returnObject, self);
        [self.contents removeObject:returnObject];
//        [self.delegate bottomElementRemoved:returnObject];


        return returnObject;
    }    
    else {
        return nil;
    }
}
-(void)clear{
    [self.contents removeAllObjects];
//    [self.delegate allElementRemoved];

//    DebugLog(@"clear objects:%@ inStack:@", self);            
}

- (size_t)size {
    return [self.contents count];
}
@end