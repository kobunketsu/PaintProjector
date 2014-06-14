//
//  UIView+VisibilityAnimation.m
//  PaintProjector
//
//  Created by 胡 文杰 on 6/13/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "UIView+VisibilityAnimation.h"

@implementation UIView (VisibilityAnimation)
- (void)hiddenAnimationWithDuration:(CGFloat)duration completion:(void (^)(void))completion{
    self.alpha = 1;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = true;
        if (completion) {
            completion();
        }
    }];
}

- (void)unhiddenAnimationWithDuration:(CGFloat)duration completion:(void (^)(void))completion{
    self.hidden = false;
    self.alpha = 0;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}
@end
