//
//  RenderSettings.m
//  PaintProjector
//
//  Created by 胡 文杰 on 5/7/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "RenderSettings.h"

@implementation RenderSettings
+ (void)initialize{
    [super initialize];
    if(!renderSettings){
        renderSettings = [[RenderSettings alloc]init];
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
