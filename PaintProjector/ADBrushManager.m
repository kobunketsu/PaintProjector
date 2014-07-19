//
//  ADBrushManager.m
//  PaintProjector
//
//  Created by 胡 文杰 on 7/16/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADBrushManager.h"

@implementation ADBrushManager

+(ADBrushManager*)current{
    if (!brushManager) {
        DebugLog(@"brushManager alloc init");
        brushManager = [[ADBrushManager alloc]init];
    }
    return brushManager;
}

+(void)initialize{
    [super initialize];
    
    if (!brushManager) {
        brushManager = [[ADBrushManager alloc]init];
    }
}

+(void)destroy{
    if (brushManager) {
        brushManager = nil;
    }
}

+(void)setCurrent:(ADBrushManager*)current{
    brushManager = current;
}


- (id)init{
    DebugLogSystem(@"init");
    if ((self = [super init])) {
    }
    return self;
}

- (void)dealloc{
    DebugLogSystem(@"dealloc");
}

#pragma mark-
@end
