//
//  Object.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/3/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "REObject.h"

#import "REResources.h"

@implementation REObject
+(void)destroy:(REObject*)object{
    [object destroy];
}

-(id)init{
    self = [super init];
    if (self) {
        [REResources addObject:self];
    }
    return self;
}
-(void)destroy{
//    DebugLogFuncStart(@"destroy %@", self.name);
//    [NSException raise:NSInternalInconsistencyException
//                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (id)copyWithZone:(NSZone *)zone{
    REObject *object = [[[self class] alloc]init];
    object.name = self.name;
    return object;
}
@end
