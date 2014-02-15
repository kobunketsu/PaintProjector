//
//  Stack.h
//  iReporter
//
//  Created by 文杰 胡 on 12-11-7.
//  Copyright (c) 2012年 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
    NSMutableArray *contents;
    size_t _size;
    size_t _capacity;
}
- (void)push:(id)object;
- (id)pop;
- (size_t)size;

@end
