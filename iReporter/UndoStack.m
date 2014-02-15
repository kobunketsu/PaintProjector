//
//  UndoStack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "UndoStack.h"

@implementation UndoStack
- (void)push:(CGImageRef)image {
    [self push: image];
}

- (CGImageRef)pop {
    return (CGImageRef)[self pop];
}
-(CGImageRef)lastUndoImage{
    NSUInteger count = [contents count];
    if (count > 0) {
        CGImageRef returnObject = (__bridge CGImageRef)[contents objectAtIndex:count - 1];
        return returnObject;
    }
}

@end
