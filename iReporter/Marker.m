//
//  Marker.m
//  ProjectPaint
//
//  Created by 胡 文杰 on 13-5-11.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "Marker.h"

@implementation Marker
- (id)initWithContext:(EAGLContext*)context Canvas:(UIView *)canvas{
    self = [super initWithContext:context Canvas:canvas];
    if (self !=nil) {
//        [self setBrushTextureWithImage:@"airBrushRadius16.png"];
//        _iconImage = [UIImage imageNamed:@"eraser.png"];
        _type = BrushType_Marker;
        _typeName = @"marker";
    }
    
    return self;
}

@end
