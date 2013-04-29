//
//  PaintOperationStack.h
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Heap.h"
#import "PaintOperation.h"
@interface PaintOperationStack : Heap
- (void)push:(PaintOperation*)image;
- (PaintOperation*)pop;
- (PaintOperation*)firstUndoPaintOperation;
- (PaintOperation*)lastUndoPaintOperation;
- (NSMutableArray *)allPaintOperations;
@end
