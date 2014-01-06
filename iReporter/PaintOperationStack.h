//
//  PaintOperationStack.h
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "Heap.h"
#import "PaintCommand.h"
@interface PaintOperationStack : Heap
- (void)push:(PaintCommand*)image;
- (PaintCommand*)pop;
- (PaintCommand*)firstUndoPaintOperation;
- (PaintCommand*)lastUndoPaintOperation;
- (NSMutableArray *)allPaintOperations;
@end
