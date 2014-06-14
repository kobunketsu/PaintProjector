//
//  UIView+VisibilityAnimation.h
//  PaintProjector
//
//  Created by 胡 文杰 on 6/13/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VisibilityAnimation)
- (void)hiddenAnimationWithDuration:(CGFloat)duration completion:(void (^)(void))completion;
- (void)unhiddenAnimationWithDuration:(CGFloat)duration completion:(void (^)(void))completion;
@end
