//
//  Renderer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/1/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "Renderer.h"
#import "Resources.h"

@implementation Renderer
- (id)init{
    self = [super init];
    if (self) {
        _materials = [[NSMutableArray alloc]init];

    }
    return self;
}

- (void)setMaterial:(Material *)material{
    _material = material;
    
    if (self.materials.count == 0) {
        [self.materials addObject:material];
    }
    else{
        [self.materials replaceObjectAtIndex:0 withObject:material];
    }
}

- (void)render{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void)destroy{
    [super destroy];
    [self.materials removeAllObjects];
}

//- (void)create{
//    [NSException raise:NSInternalInconsistencyException
//                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
//}
//
//- (void)destroy{
//    [NSException raise:NSInternalInconsistencyException
//                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
//}
//
//-(void)bindVAO{
//    [NSException raise:NSInternalInconsistencyException
//                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
//}
//
//-(void)draw{
//    [NSException raise:NSInternalInconsistencyException
//                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
//}
@end
