//
//  PaintUIKitAnimation.m
//  PaintProjector
//
//  Created by 胡 文杰 on 1/22/14.
//  Copyright (c) 2014 WenjiHu. All rights reserved.
//

#import "PaintUIKitAnimation.h"

@implementation PaintUIKitAnimation

+ (void)view:(UIView*)view switchDownToolBarFromView:(UIView*)fromView completion: (void (^) (void))block1 toView:(UIView*)toView completion: (void (^) (void)) block2{
    [UIView animateWithDuration:0.3 animations:^{
        if (fromView != NULL) {
            fromView.center = CGPointMake(fromView.center.x, view.bounds.size.height + fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        if (fromView) {
            fromView.hidden = true;
        }
        if (block1 != NULL) {
            block1();
        }
        [UIView animateWithDuration:0.3 animations:^{
            if (toView != NULL) {
                toView.hidden = false;
                toView.center = CGPointMake(toView.center.x, view.bounds.size.height - toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            if (block2 != NULL) {
                block2();
            }
        }];
    }];
}

+ (void)view:(UIView*)view switchTopToolBarFromView:(UIView*)fromView completion: (void (^) (void))block1 to:(UIView*)toView completion: (void (^) (void)) block2{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (fromView != NULL) {
            fromView.center = CGPointMake(fromView.center.x, -fromView.bounds.size.height * 0.5);
        }
    }completion:^(BOOL finished){//显示TransformBar
        if (fromView) {
            fromView.hidden = true;
        }
        if (block1 != NULL) {
            block1();
        }
//        [toView removeFuzzyTransparent];
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            if (toView != NULL) {
                toView.hidden = false;
                toView.center = CGPointMake(toView.center.x, toView.bounds.size.height * 0.5);
            }
        }completion:^(BOOL finished){
            if (block2 != NULL) {
                block2();
            }
//            [toView setFuzzyTransparentSourceView:self.rootCanvasView];
        }];
        
    }];
}

@end
