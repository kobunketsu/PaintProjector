//
//  UIView+Tag.m
//  PaintProjector
//
//  Created by 胡 文杰 on 2/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UIView+Tag.h"

@implementation UIView (Tag)
-(UIView*)subViewWithTag:(NSInteger)tag{
    for (UIView *view in self.subviews) {
        if (view.tag == tag) {
            return view;
        }
    }
    return nil;
}
@end
