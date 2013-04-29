//
//  Stack.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol HeapDelegate
- (void) topElementAdded:(id)object;
- (void) topElementRemoved:(id)object;
- (void) bottomElementRemoved:(id)object;
- (void) allElementRemoved;
@end

@interface Heap : NSObject {
    NSMutableArray *_contents;
    size_t _size;
    size_t _capacity;
}
@property(nonatomic, retain) NSMutableArray *contents;//use with attention
@property(nonatomic, assign) id delegate;
@property(nonatomic, assign) size_t capacity;
- (id)initWithCapacity:(size_t) capacity;
- (void)push:(id)object;
- (void)push_reverse:(id)object;
- (id)pop;
- (id)pop_reverse;
- (size_t)size;
- (void)clear;
@end
