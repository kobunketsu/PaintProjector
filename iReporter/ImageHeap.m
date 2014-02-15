//
//  UndoStack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "ImageHeap.h"

@implementation ImageHeap
- (void)push:(CGImageRef)image {
    [super push: (__bridge id)image];
}

- (CGImageRef)pop {
    return (__bridge CGImageRef)[super pop];
}

- (CGImageRef)lastUndoImage{
    NSUInteger count = [contents count];
    if (count > 0) {
        CGImageRef returnObject = (__bridge CGImageRef)[contents objectAtIndex:count - 1];
        return returnObject;
    }
    return nil;
}

@end
