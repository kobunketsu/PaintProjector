//
//  PaintOperationStack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "PaintOperationStack.h"

@implementation PaintOperationStack
- (void)push:(PaintOperation*)op {
    [super push: op];
}

- (PaintOperation*)pop {
    return [super pop];
}
- (PaintOperation*)firstUndoPaintOperation{
    NSUInteger count = [_contents count];
    if (count > 0) {
        PaintOperation* returnObject = [_contents objectAtIndex:0];
        return returnObject;
    }
    return nil;    
}
- (PaintOperation*)lastUndoPaintOperation{
    NSUInteger count = [_contents count];
    if (count > 0) {
        PaintOperation* returnObject = [_contents objectAtIndex:count - 1];
        return returnObject;
    }
    return nil;
}

- (NSMutableArray *)allPaintOperations{
    return _contents;
}
@end
