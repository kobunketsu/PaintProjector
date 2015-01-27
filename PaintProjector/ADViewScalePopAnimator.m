//
//  ADTextPeelPopAnimator.m
//  PaintProjector
//
//  Created by kobunketsu on 10/9/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "ADViewScalePopAnimator.h"

#define FADEOUTSCALE 1
@implementation ADViewScalePopAnimator

- (void)popByPercentage:(CGFloat)percentage{
    DebugLogFuncStart(@"popByPercentage %.1f", percentage);
    for (UIView *view in self.views) {
        [view.layer setValue:[NSNumber numberWithFloat:percentage] forKeyPath:@"transform.scale"];
        view.alpha = percentage;
    }
}

- (void)fadeOutByPercentage:(CGFloat)percentage{
    DebugLogFuncStart(@"fadeOutByPercentage %.1f", percentage);
    for (UIView *view in self.views) {
        [view.layer setValue:[NSNumber numberWithFloat:percentage*FADEOUTSCALE+1] forKeyPath:@"transform.scale"];
        view.alpha = 1.0 - percentage;
    }
}
@end
