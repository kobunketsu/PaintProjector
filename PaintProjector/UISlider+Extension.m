//
//  UISlider+Extension.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/18/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UISlider+Extension.h"

@implementation UISlider (Extension)
- (CGRect)thumbRect{
    CGRect trackRect = [self trackRectForBounds:self.bounds];
    CGRect thumbRect = [self thumbRectForBounds:self.bounds trackRect:trackRect value:self.value];
    return thumbRect;
}
@end
