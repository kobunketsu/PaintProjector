//
//  PNGImageStack.m
//  iReporter
//
//  Created by 文杰 胡 on 12-12-21.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import "PNGImageStack.h"

@implementation PNGImageStack
- (void)push:(NSString*)imageName{
    [super push: imageName];
}

- (NSString*)pop {
    return (NSString*)[super pop];
}

- (NSString*)lastUndoImage{
    NSUInteger count = [self.contents count];
    if (count > 0) {
        NSString* returnObject = (NSString*)[self.contents objectAtIndex:count - 1];
        return returnObject;
    }
    return nil;
}
@end
