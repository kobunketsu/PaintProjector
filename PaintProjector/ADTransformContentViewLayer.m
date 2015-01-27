//
//  TransformContentViewLayer.m
//  PaintProjector
//
//  Created by 胡 文杰 on 13-12-10.
//  Copyright (c) 2013年 WenjiHu. All rights reserved.
//

#import "ADTransformContentViewLayer.h"

@implementation ADTransformContentViewLayer

-(id)initWithLayer:(id)layer{
    self = [super initWithLayer:layer];
    if (self) {
        // Initialization code
        _phase = 0;
    }
    return self;
}


+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"phase"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}
@end
