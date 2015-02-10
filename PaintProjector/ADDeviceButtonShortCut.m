//
//  ADDeviceButtonShortCut.m
//  PaintProjector
//
//  Created by 文杰 胡 on 2/9/15.
//  Copyright (c) 2015 WenjiHu. All rights reserved.
//

#import "ADDeviceButtonShortCut.h"

@implementation ADDeviceButtonShortCut
- (instancetype)initWithDescriptiveText:(NSString *)descriptiveText key:(NSString *)key target:(id)target selector:(SEL)selector{
    self = [super init];
    if (self) {
        _descriptiveText = descriptiveText;
        _key = key;
        _target = target;
        _selector = selector;
    }
    return self;
}
@end
