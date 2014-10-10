//
//  ADViewRotatePopAnimator.m
//  PaintProjector
//
//  Created by kobunketsu on 10/10/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADViewRotatePopAnimator.h"

@implementation ADViewRotatePopAnimator
- (id)initWithView:(NSArray *)views{
    self = [super initWithView:views];
    if (self) {
        [self initCustom];
    }
    return self;
}
- (void)initCustom{
    _fullAngle = M_PI_2;
    CATransform3D transform = CATransform3DIdentity;
    for (UIView *view in self.views) {
        view.layer.zPosition = 1000;
        transform = view.layer.transform;
        transform.m34 = -1.0 / 1000;
        view.layer.transform = transform;
    }
}
- (void)popByPercentage:(CGFloat)percentage{
    DebugLogFuncStart(@"popByPercentage %.1f", percentage);
    CGFloat angle = self.fullAngle * (1.0 - percentage);
    for (UIView *view in self.views) {
        [view.layer setValue:[NSNumber numberWithFloat:angle] forKeyPath:@"transform.rotation.y"];
        view.alpha = percentage;
    }
}

- (void)fadeOutByPercentage:(CGFloat)percentage{
    DebugLogFuncStart(@"fadeOutByPercentage %.1f", percentage);
    CGFloat angle = self.fullAngle * percentage;
    for (UIView *view in self.views) {
        [view.layer setValue:[NSNumber numberWithFloat:angle] forKeyPath:@"transform.rotation.y"];
        view.alpha = 1.0 - percentage;
    }
}
@end
