//
//  RenderSettings.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RERenderSettings.h"

@implementation RERenderSettings
+ (void)initialize{
    [super initialize];
    if(!renderSettings){
        renderSettings = [[RERenderSettings alloc]init];
    }
}

+ (void)destroy{
    if (renderSettings) {
        renderSettings = nil;
    }
}

- (id)init{
    self = [super init];
    if (self) {
        self.Ambient = GLKVector4Make(0.3, 0.3, 0.3, 0);
    }
    return self;
}
@end
