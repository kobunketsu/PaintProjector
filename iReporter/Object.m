//
//  Object.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Object.h"

#import "Resources.h"

@implementation Object
+(void)destroy:(Object*)object{
    [object destroy];
}

-(id)init{
    self = [super init];
    if (self) {
        [Resources addObject:self];
    }
    return self;
}
-(void)destroy{
//    [NSException raise:NSInternalInconsistencyException
//                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}
@end
