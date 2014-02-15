//
//  PaintOperationStack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-25.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "PaintOperationStack.h"

@implementation PaintOperationStack
- (void)push:(PaintCommand*)op {
    [super push: op];
}

- (PaintCommand*)pop {
    return [super pop];
}
- (PaintCommand*)firstUndoPaintOperation{
    NSUInteger count = [_contents count];
    if (count > 0) {
        PaintCommand* returnObject = [_contents objectAtIndex:0];
        return returnObject;
    }
    return nil;    
}
- (PaintCommand*)lastUndoPaintOperation{
    NSUInteger count = [_contents count];
    if (count > 0) {
        PaintCommand* returnObject = [_contents objectAtIndex:count - 1];
        return returnObject;
    }
    return nil;
}

- (NSMutableArray *)allPaintOperations{
    return _contents;
}
@end
