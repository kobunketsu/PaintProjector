//
//  Stack.h
//  PaintProjector
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Hu Wenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
//@protocol ADHeapDelegate
//- (void) topElementAdded:(id)object;
//- (void) topElementRemoved:(id)object;
//- (void) bottomElementRemoved:(id)object;
//- (void) allElementRemoved;
//@end

@interface ADHeap : NSObject {
}
@property (retain, nonatomic) NSMutableArray *contents;//use with attention
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) size_t capacity;
- (id)initWithCapacity:(size_t) capacity;
- (void)push:(id)object;
- (void)push_reverse:(id)object;
- (id)pop;
- (id)pop_reverse;
- (size_t)size;
- (void)clear;
@end
